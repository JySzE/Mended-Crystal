import re

def adjust_level(level, percentage):
    return int(round(level * (1 + percentage)))

def process_file(file_path, output_path, excluded_identifiers):
    # Define level ranges and their corresponding adjustment percentages
    level_ranges = [
        (1, 5, 0.10),  # Level 01 to 05 increase value by rounded 10%
        (6, 10, 0.10), # Level 06 to 10 increase value by rounded 10%
        (11, 15, 0.12),# Level 11 to 15 increase value by rounded 12%
        (16, 20, 0.15),# Level 16 to 20 increase value by rounded 15%
        (21, 25, 0.18),# Level 21 to 25 increase value by rounded 18%
        (26, 30, 0.21),# Level 26 to 30 increase value by rounded 21%
        (31, 35, 0.24),# Level 31 to 35 increase value by rounded 24%
        (36, 40, 0.27),# Level 36 to 40 increase value by rounded 27%
    ]

    with open(file_path, 'r') as file:
        lines = file.readlines()

    modified_lines = []

    exclude_trainer = True

    for line in lines:
        match_identifier = re.match(r'\s*db\s+"([^"]+)"\s*,', line)
        if match_identifier:
            identifier = match_identifier.group(1)
            exclude_trainer = identifier in excluded_identifiers

        if exclude_trainer:
            modified_lines.append(line)
            continue

        match_level_data = re.match(r'\s*db\s*(-?\d+),', line)
        if match_level_data:
            current_level = int(match_level_data.group(1))

            percentage = next((p for start, end, p in level_ranges if start <= current_level <= end), 0)

            modified_level = adjust_level(current_level, percentage)
            line = re.sub(r'\s*db\s*(-?\d+),', f'\tdb {" " if modified_level < 10 else ""}{modified_level},', line)

        modified_lines.append(line)

    with open(output_path, 'w') as output_file:
        output_file.writelines(modified_lines)

if __name__ == "__main__":
    input_file_path = "input.asm"
    output_file_path = "output.asm"
    excluded_trainers = ["FALKNER@", "BUGSY@", "WHITNEY@", "MORTY@",
                         "CHUCK@", "JASMINE@", "PRYCE@", "CLAIR@",
                         "?@", "WILL@", "CAL@","KOGA@","BRUNO@",
                         "KAREN@", "LANCE@", "BROCK@", "MISTY@",
                         "LT.SURGE@", "ERIKA@", "JANINE@", 
                         "SABRINA@", "BLAINE@", "RED@", "BLUE@"]

    process_file(input_file_path, output_file_path, excluded_trainers)
    print("Processing completed. Check output.asm for the modified data.")
