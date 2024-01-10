import re

def adjust_level(level, percentage):
    return int(round(level * (1 + percentage / 100)))

def process_file(file_path, output_path):
    # Define level ranges and their corresponding adjustment percentages
    level_ranges = [
        (1, 2, 85),   # Level 01 to 02 increase value by rounded 85%
        (3, 3, 55),
        (4, 6, 5), 
        (7, 10, 10),
        (11, 15, 12),
        (16, 20, 15),
        (21, 25, 18),
        (26, 30, 21),
        (31, 35, 24),
        (36, 40, 20),
    ]

    with open(file_path, 'r') as file:
        lines = file.readlines()

    modified_lines = []

    for line in lines:
        match_level_data = re.match(r'\s*db\s+(\d+),', line)
        if match_level_data:
            current_level = int(match_level_data.group(1))

            percentage = next((p for start, end, p in level_ranges if start <= current_level <= end), 0)

            modified_level = adjust_level(current_level, percentage)
            space = " " if current_level < 10 else " "
            line = re.sub(r'\s*db\s+(\d+),', f'\tdb{space}{modified_level},', line)

        modified_lines.append(line)

    with open(output_path, 'w') as output_file:
        output_file.writelines(modified_lines)

if __name__ == "__main__":
    input_file_path = "input.asm"
    output_file_path = "output.asm"

    process_file(input_file_path, output_file_path)
    print("Processing completed.")

