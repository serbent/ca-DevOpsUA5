import os
import csv

def load_csv_file(file_path):
    """
    Load a CSV file and return its content as a list of dictionaries.
    
    :param file_path: Path to the CSV file.
    :return: List of dictionaries representing the CSV content.
    """
    
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"The file {file_path} does not exist.")
    
    with open(file_path, mode='r', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        return [row for row in reader]
    
result = load_csv_file('import.csv')

print("CSV file loaded successfully. Here are the contents:")
for row in result:
    print(row)