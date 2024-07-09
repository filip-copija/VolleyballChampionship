# Volleyball Championship Data Integration and Visualization

## Description
This project provides a complete pipeline for generating, integrating, and visualizing data for a volleyball championship. It includes dummy data generation scripts, SQL scripts for database setup, ETL processes using Visual Studio, and Power BI reports for data visualization.

## Project Structure
- **generate_dummy_data.py**: Script to generate dummy data in CSV format, stored in the `dummy_data` folder.
- **sql_scripts/**: Contains SQL scripts for creating the database, tables, and triggers.
- **ETLVolleyballFlow/**: Visual Studio 2022 project using Microsoft Data Tools Integration Services for ETL, loading data from `dummy_data` into the database.
- **powerBI/**: Contains a Power BI report visualizing the data loaded into the database through the ETL process.

## Features
- **Data Generation**: Easily generate dummy data for testing and development.
- **Database Setup**: SQL scripts to create a robust database structure.
- **ETL Process**: Automated data loading and transformation using Visual Studio.
- **Data Visualization**: Interactive Power BI report to analyze and visualize the championship data.

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/filip-copija/VolleyballChampionship.git
    cd VolleyballChampionship
    ```

2. Generate Dummy Data:
    ```bash
    python generate_dummy_data.py
    ```

3. Setup Database:
    - Use the SQL scripts in `sql_scripts` to create the database and tables.

4. Run ETL Process:
    - Open `ETLVolleyballFlow` project in Visual Studio 2022.
    - Execute the ETL package to load data from `dummy_data` into the database.

5. Visualize Data:
    - Open the Power BI report in `powerBI` to explore and visualize the data.

## Usage
- **Data Generation**: Generate CSV files with dummy data for development and testing.
- **Database Management**: Use the provided SQL scripts to set up and manage the database.
- **ETL Execution**: Load and transform data seamlessly with the ETL package.
- **Data Analysis**: Utilize the Power BI report to gain insights from the championship data.
