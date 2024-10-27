# AutoRunSql_mysql 

## Overview
**AutoRunSql_mysql** is a Bash script designed to automate the execution of SQL files on a specified MySQL (MariaDB) database. The script continuously monitors a specified SQL file for changes, automatically running the SQL commands contained within whenever the file is updated. It provides real-time feedback on the execution results, including any errors that may arise during the process.

## Features
- **Automatic Execution**: Continuously watches for changes to a specified SQL file and executes the SQL commands when updates are detected.
- **Error Handling**: Displays error messages and outputs from the SQL execution to help users troubleshoot issues.
- **Clear Output**: Clears the terminal screen before each execution to ensure that only the most recent output is displayed.
- **Checksum Validation**: Utilizes checksums to efficiently detect changes in the SQL file, ensuring that only modified files trigger execution.

## Requirements
- **Bash**: The script must be run in a Bash shell environment.
- **MariaDB**: Ensure that MariaDB is installed and configured on your system.
- **Access Credentials**: The script requires a valid username and password for accessing the MariaDB database.

## Prerequisites
- **Database Setup**: Make sure that the target database already exists.
- **SQL File**: The SQL file to be executed must exist in the specified path.

## Usage
To run the script, execute the following command in the terminal:

```bash
./AutoRunSql_mysql.sh <database_name> <file_to_run>