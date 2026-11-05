SAP ABAP – Purchase Order and Material Report

Project Overview

This project is a beginner-level SAP ABAP executable report developed to retrieve and display Purchase Order and Material details from SAP database tables.

The report uses Open SQL, internal tables, database joins, and ALV Grid Display to present data in a structured tabular format.

Project Objective

To develop an ABAP report that allows users to retrieve Purchase Order and Material information using selection-screen filters.

Technologies Used

- SAP ABAP
- SAP GUI
- Open SQL
- Internal Tables and Work Areas
- Database Table Joins
- ALV Grid Display

SAP Database Tables

Table| Description
EKPO| Purchasing Document Item
MAKT| Material Description

Features

- Purchase Order Number selection
- Material Number selection
- Purchase Order item data retrieval
- Material description retrieval
- Quantity and unit display
- Net price display
- ALV Grid report output
- Handling of empty search results

Report Output Fields

Field| Description
EBELN| Purchase Order Number
EBELP| Item Number
MATNR| Material Number
MAKTX| Material Description
MENGE| Quantity
MEINS| Unit
NETPR| Net Price

Technical Concepts Practiced

1. Executable ABAP Reports
2. Selection Screens
3. SELECT Statements
4. Database Table Joins
5. Internal Tables
6. Work Areas
7. Field Catalog
8. Function Modules
9. ALV Grid Display using "REUSE_ALV_GRID_DISPLAY"

How It Works

1. User enters a Purchase Order Number or Material Number.
2. The program retrieves matching records from EKPO and MAKT.
3. Retrieved records are stored in an internal table.
4. A field catalog defines the ALV columns.
5. The ALV Grid function module displays the report.
6. A message is displayed when no matching records are found.

Sample Output

The report displays Purchase Order Number, Item Number, Material Number, Material Description, Quantity, Unit, and Net Price.

Learning Outcomes

- Practical experience in ABAP report development.
- Understanding SAP database table retrieval.
- Working with internal tables and field catalogs.
- Creating selection screens.
- Implementing ALV Grid reports.

Developer

Sanjay Sreekumar

SAP ABAP on HANA – Fresher

GitHub: https://github.com/sanjay-sreekumar

LinkedIn: https://linkedin.com/in/sanjay-sreekumar-380466343
