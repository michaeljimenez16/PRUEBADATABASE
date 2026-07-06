# RiwiSupply S.A.S. - Database Normalization and Implementation

## Project Description
This project focuses on the data analysis, normalization, and relational database design for **RiwiSupply S.A.S.**, a company dedicated to the commercialization and distribution of industrial supplies. 

The main objective is to centralize transactional data previously managed in flat Excel files, resolving issues such as redundant suppliers, inconsistent descriptions, duplicate entries, and lack of data standardization.

## Technologies Used
*   **Data Analysis & Modeling**: LibreOffice Calc / Microsoft Excel
*   **Database Client**: MySQL Workbench
*   **Containerization & Deployment**: Docker & Docker Compose

## Database Engine Used
*   **MySQL 8.0** (Deployed via an isolated Docker container environment)

## Explanation of Normalization Process
The raw dataset was normalized up to the **Third Formal Form (3FN)** to guarantee data integrity and eliminate redundancies:
*   **First Normal Form (1FN)**: Ensured atomic values for all attributes and established unique primary keys for every entity.
*   **Second Normal Form (2FN)**: Removed partial dependencies by separating master catalogs (Entities like Cities, Clients, Technicians, Branches, and Equipment) from the main transactional data.
*   **Third Normal Form (3FN)**: Eliminated transitive dependencies. For instance, `city_id` was moved inside the branches table, ensuring that the main work orders table only references the branch directly, avoiding redundant city listings.

## Database Structure
All tables and attributes were successfully mapped to English using the mandatory `riwi_` prefix for system consistency:
1.  `riwi_cities`: Stores unique geographical data.
2.  `riwi_branches`: Stores infrastructure details linked to specific cities.
3.  `riwi_clients`: Contains consolidated corporate client data.
4.  `riwi_technicians`: Contains registered maintenance staff details.
5.  `riwi_equipment_categories`: Stores hardware taxonomy classifications.
6.  `riwi_equipment`: Stores technical hardware details linked to their respective categories.
7.  `riwi_service_types`: Contains standard operational service definitions.
8.  `work_orders`: The core transactional table that binds all entities using foreign keys (FK) to log hours, costs, and dates.

## Entity Relationship Model (ERM)
The conceptual model features a Star-like Schema where `work_orders` serves as the central fact table, interconnected via one-to-many (`1:N`) relationships with the 7 master dimension tables to enforce referential integrity.

## Instructions to Create the Database
1. Launch the Docker container environment:
   ```bash
   docker compose up -d
   ```
2. Open MySQL Workbench and connect to the instance using port `3406`.
3. Open a new query tab and execute the full DDL script to generate the database schema (`bd_michael_jimenez_cortissoz`) and all its underlying tables.

## Instructions to Load Data
1. Export each normalized sheet from LibreOffice Calc into independent text files using the **CSV (.csv)** format with UTF-8 encoding.
2. Inside MySQL Workbench, right-click on each created table and select **Table Data Import Wizard**.
3. Follow the mandatory execution order to prevent Foreign Key constraints violations:
   * Load `riwi_cities` first.
   * Load master catalogs (`riwi_branches`, `riwi_clients`, `riwi_technicians`, `riwi_equipment_categories`, `riwi_service_types`).
   * Load `riwi_equipment`.
   * Load the final transactional dataset into `work_orders`.

## Explanation of Each SQL Query
The implementation includes advanced relational data scripts to solve core operational requests:
*   **Query 1**: Computes real-time available stock levels grouped per product.
*   **Query 2**: Details logistical warehouse movements mapping out products and branches via internal joins.
*   **Query 3**: Aggregates purchase values to rank and audit top industrial suppliers.
*   **Query 4**: Tracks total movement events per branch to measure operational warehouse traffic.
*   **Query 5**: Pinpoints the fastest-moving industrial product based on high-volume acquisition trends.
*   **Query 6**: Financial valuation script calculating the exact monetary cost of inventory distributed across active infrastructure.

## Developer Information
*   **Full Name**: Michael Jimenez Cortissoz
*   **Clan**: (Cortissoz)
