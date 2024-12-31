# IPL_Project

## Overview
This project is designed to track player and match statistics for the Indian Premier League (IPL 2021-2023) in a SQL database. It includes tables for batting, bowling, match and player data, and it uses SQL Server to manage the data.

## Dataset

The dataset used in this project is sourced from Kaggle: [Ipl dataset](https://www.kaggle.com/datasets/sanketsett/ipl-dataset).
You can download it from the Kaggle website and use it in your local environment.


## Objectives
- Create a new database and tables.
- Insert data from an existing database.
- Modify data types and sizes of columns as required.

## Instructions
1. Download the IPL dataset from Kaggle and import it into your SQL environment.
2. Run the SQL scripts in the `scripts/` folder to set up the database and tables:
   - **create_database.sql**: Creates the `IPL2021_2023` database.
   - **create_table_batsummary.sql**: Creates the `batsummary` table for batting statistics.
   - **create_table_bowlsummary.sql**: Creates the `bowlsummary` table for bowling statistics.
   - **create_table_matchsummary.sql**: Creates the `matchsummary` table for match data.
   - **create_table_teamsummary.sql**: Creates the `teamsummary` table for team and players data.
3. After setting up database and tables, you can practice SQL queries table or SQL method wise.


## Files
- `create_database.sql`: Creates the IPL_Project database 'IPL2021_2023'.
- `create_table_batsummary.sql`: Creates the 'batsummary' table.
- `create_table_bowlsummary.sql`: Creates the 'bowlsummary' table.
- `create_table_matchsummary.sql`: Creates the 'matchsummary' table.
- `create_table_teamsummary.sql`: Creates the 'matchsummary' table.
  
## Technologies Used
- SQL Server
- SSMS
- VS Code

## Future Improvements
- Add more complex queries to analyze the statistics.
- Integrate performance tuning for large datasets.
