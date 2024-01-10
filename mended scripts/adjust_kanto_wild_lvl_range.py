import re
import random

def adjust_level(level, percentage, max_value):
    adjusted_value = int(round(level * (1 + percentage / 100)))
    return min(adjusted_value, max_value)

def process_file(file_path, output_path):
    # Define level ranges and their corresponding adjustment percentages and random maximum value ranges
    level_ranges = [
        (1, 15,  9999, (36, 38)), # Level 01 to 15 increase value by rounded 9999%, random cap between 36 and 38
        (16, 20, 9999, (38, 42)), 
        (21, 25, 9999, (38, 42)),
        (26, 30, 9999, (42, 44)), 
        (31, 35, 9999, (42, 44)),  
        (36, 40, 9999, (44, 46)),
        (41, 45, 9999, (44, 46)),  
    ]

    with open(file_path, 'r') as file:
        lines = file.readlines()

    modified_lines = []

    for line in lines:
        match_level_data = re.match(r'\s*db\s+(\d+),', line)
        if match_level_data:
            current_level = int(match_level_data.group(1))

            for start, end, percentage, max_value_range in level_ranges:
                if start <= current_level <= end:
                    max_value = random.randint(*max_value_range)
                    modified_level = adjust_level(current_level, percentage, max_value)
                    space = " " if current_level < 10 else " " 
                    line = re.sub(r'\s*db\s+(\d+),', f'\tdb{space}{modified_level},', line)
                    break

        modified_lines.append(line)

    with open(output_path, 'w') as output_file:
        output_file.writelines(modified_lines)

if __name__ == "__main__":
    input_file_path = "input.asm"
    output_file_path = "output.asm"

    process_file(input_file_path, output_file_path)
    print("Processing completed.")
