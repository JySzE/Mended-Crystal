import re

def adjust_level(level, percentage):
    return int(round(level * (1 + percentage / 100)))

def process_file(file_path, output_path):
    # Define level ranges and their corresponding adjustment percentages
    level_ranges = [
        (1, 3, 55),   # Level 01 to 05 increase value by rounded 55%
        (4, 6, 5),   # Level 01 to 05 increase value by rounded 5%
        (7, 10, 10),  # Level 06 to 10 increase value by rounded 10%
        (11, 15, 12), # Level 11 to 15 increase value by rounded 12%
        (16, 20, 15), # Level 16 to 20 increase value by rounded 15%
        (21, 25, 18), # Level 21 to 25 increase value by rounded 18%
        (26, 30, 21), # Level 26 to 30 increase value by rounded 21%
        (31, 35, 24), # Level 31 to 35 increase value by rounded 24%
        (36, 40, 20), # Level 36 to 40 increase value by rounded 20%
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
    print("Processing completed. Check output.asm for the modified data.")

