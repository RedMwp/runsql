#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: runsql database_name file_to_run"
    exit 1
fi

# Assign command-line arguments to variables
DATABASE_NAME=$1
SQL_FILE=$2
USER="root"
PASSWORD="your password"

# Check if the SQL file exists
if [ ! -f "$SQL_FILE" ]; then
    echo "File $SQL_FILE not found!"
    exit 1
fi

# Function to run the SQL file and format output
run_sql() {
    clear  # Clear the terminal screen
    echo -e "Running SQL file $SQL_FILE on database $DATABASE_NAME"
    
    # Run the SQL query using mariadb, suppressing the deprecated warning
    OUTPUT=$(mariadb -u "$USER" -p"$PASSWORD" "$DATABASE_NAME" < "$SQL_FILE" 2>&1 | grep -v "Deprecated program name")

    # Display the output
    echo "$OUTPUT" | awk 'NR==1 {print; print "\n\n\n"; print ""; next} {print}'
    
    # Separator and spacing after the table output
    echo -e "\n\n----------------------------------------------"
}

# Initial checksum of the file to detect changes
LAST_CHECKSUM=$(md5sum "$SQL_FILE" | awk '{ print $1 }')

# Start watching the file for changes
while true; do
    # Calculate current checksum
    CURRENT_CHECKSUM=$(md5sum "$SQL_FILE" | awk '{ print $1 }')

    # Compare checksums to detect changes
    if [ "$CURRENT_CHECKSUM" != "$LAST_CHECKSUM" ]; then
        run_sql
        LAST_CHECKSUM=$CURRENT_CHECKSUM
    fi

    # Wait for 2 seconds before checking again
    sleep 2
done