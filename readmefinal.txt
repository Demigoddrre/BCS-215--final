README for Patient Management System Shell Script
Program Description
The Patient Management System is a Bash shell script designed to manage a simple patient database for a hypothetical hospital. It offers a user-friendly menu-driven interface for performing various tasks related to patient records. Here's a breakdown of the script's capabilities:

Welcome Message: On start, it displays a welcome message introducing the system.
Main Menu: Provides a list of options, including listing patients, adding new patients, searching for patients, deleting patient records, and exiting the application.
List Patients: Displays all registered patients sorted alphabetically by first and last name. Information is presented in a tabular format and capitalized.
Add New Patient: Allows users to input a patient's first name, last name, and phone number. It automatically generates a unique patient ID and adds the record to the database.
Search for a Patient: Users can search for patients by entering a full or partial last name. The search is case-insensitive.
Delete a Patient: Users can delete patient records based on a full or partial last name. A backup of the database is created before deletion for safety.
Exit: Allows users to exit the program with a farewell message.
Known Issues
Phone Number Validation: Currently, the script does not validate the format of the phone number entered. Users can enter phone numbers in any format, which might lead to inconsistencies.
Case Sensitivity in Deletion: The delete function is case-insensitive, which could unintentionally delete records that partially match in different cases.
Additional Features
Backup Creation: Before deleting any patient records, the script creates a backup of the existing database. This feature adds a layer of safety, preventing accidental loss of data.
User-friendly Interface: The script uses clear and concise messages and prompts, making it easy for users to understand and navigate.
Error Handling for Invalid Menu Choices: If users input an invalid option in the main menu, the script prompts them to try again, ensuring a smooth user experience.