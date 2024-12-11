#!/bin/bash

# Clear the screen and display the welcome message
clear
echo "WELCOME TO THE PATIENT MANAGEMENT SYSTEM OF HOSPITAL X"

# Function to display the main menu
show_menu() {
    echo "PLEASE SELECT AN OPTION:"
    echo "[L] LIST PATIENTS"
    echo "[A] ADD A NEW PATIENT"
    echo "[S] SEARCH FOR A PATIENT"
    echo "[D] DELETE A PATIENT"
    echo "[E] EXIT"
    echo -n "ENTER SELECTION: "
}

# Function to list patients
list_patients() {
    echo "LIST OF REGISTERED PATIENTS:"
    echo "------------------------------------------------------------------"
    if [ -s patient.csv ]; then
        # Sort the list by first name and last name, then display all fields capitalized
        sort -t, -k2,2 -k3,3 patient.csv | awk -F, '{
            printf "%-15s %-15s %-20s %-10s\n", toupper($2), toupper($3), toupper($4), toupper($1)
        }'
    else
        echo "NO PATIENTS FOUND."
    fi
    echo "------------------------------------------------------------------"
}

# Function to add a new patient
add_patient() {
    echo "ADDING NEW PATIENT..."
    echo "ENTER FIRST NAME:"
    read firstName
    echo "ENTER LAST NAME:"
    read lastName
    echo "ENTER PHONE NUMBER (FORMAT XXX-XXX-XXXX):"
    read phoneNumber

    # Validate phone number format here if necessary

    # Generate Patient ID
    patientId="${lastName:0:4}${firstName:0:1}"
    patientId=$(echo "$patientId" | tr '[:lower:]' '[:upper:]')

    # Check for unique ID and modify if necessary
    counter=1
    originalPatientId=$patientId
    while grep -q "$patientId" patient.csv; do
        patientId="${originalPatientId}${counter}"
        ((counter++))
    done

    # Append to the file with all fields capitalized
    echo "$firstName,$lastName,$phoneNumber,$patientId" | tr '[:lower:]' '[:upper:]' >> patient.csv
    echo "PATIENT RECORD FOR $firstName $lastName ADDED SUCCESSFULLY."
}

# Function to search for patients
search_patients() {
    echo "Enter the last name or part of it to search for a patient:"
    read searchName
    echo "Searching for patients with last name like $searchName..."
   
    # Perform a case-insensitive search in patient.csv
    grep -i "$searchName" patient.csv
}

# Function to delete a patient
# Function to delete a patient
delete_patient() {
    echo "Enter the last name or part of it to delete a patient record:"
    read deleteName
    echo "Deleting patient records with last name like $deleteName..."
   
    # Create a backup of patient.csv before deletion
    cp patient.csv patient.csv.bak
   
    # Use grep to filter out the records that do not match the search term
    # and redirect the output to a temporary file
    grep -iv "$deleteName" patient.csv > patient.tmp
   
    # Overwrite the original file with the temporary file
    mv patient.tmp patient.csv
   
    echo "Patient records deleted successfully."
}


# Main loop
while true; do
    show_menu
    read -r choice
    case "$choice" in
        [Ll])
            list_patients
            ;;
        [Aa])
            add_patient
            ;;
        [Ss])
            search_patients
            ;;
        [Dd])
            delete_patient
            ;;
        [Ee])
            echo "THANK YOU FOR USING THE PATIENT MANAGEMENT SYSTEM. GOODBYE!"
            exit 0
            ;;
        *)
            echo "INVALID SELECTION, PLEASE TRY AGAIN."
            ;;
    esac
    echo "PRESS ANY KEY TO CONTINUE..."
    read -r -n 1
    clear
done
