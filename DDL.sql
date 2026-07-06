CREATE TABLE riwi_branches (
    riwi_branch_id INT AUTO_INCREMENT PRIMARY KEY,
    riwi_branch_name VARCHAR(100) NOT NULL,
    riwi_city_id INT NOT NULL,
    FOREIGN KEY (riwi_city_id) REFERENCES riwi_cities(riwi_city_id)
);

CREATE TABLE riwi_clients (
    riwi_client_id INT AUTO_INCREMENT PRIMARY KEY,
    riwi_client_name VARCHAR(150) NOT NULL
);

CREATE TABLE riwi_technicians (
    riwi_technician_id INT AUTO_INCREMENT PRIMARY KEY,
    riwi_technician_name VARCHAR(150) NOT NULL
);

CREATE TABLE riwi_equipment_categories (
    riwi_category_id INT AUTO_INCREMENT PRIMARY KEY,
    riwi_category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE riwi_equipment (
    riwi_equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    riwi_equipment_name VARCHAR(150) NOT NULL,
    riwi_category_id INT NOT NULL,
    FOREIGN KEY (riwi_category_id) REFERENCES riwi_equipment_categories(riwi_category_id)
);

CREATE TABLE riwi_service_types (
    riwi_service_type_id INT AUTO_INCREMENT PRIMARY KEY,
    riwi_service_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE work_orders (
    work_order_id VARCHAR(20) PRIMARY KEY,
    riwi_client_id INT NOT NULL,
    riwi_branch_id INT NOT NULL,
    riwi_technician_id INT NOT NULL,
    riwi_equipment_id INT NOT NULL,
    riwi_service_type_id INT NOT NULL,
    hours INT NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (riwi_client_id) REFERENCES riwi_clients(riwi_client_id),
    FOREIGN KEY (riwi_branch_id) REFERENCES riwi_branches(riwi_branch_id),
    FOREIGN KEY (riwi_technician_id) REFERENCES riwi_technicians(riwi_technician_id),
    FOREIGN KEY (riwi_equipment_id) REFERENCES riwi_equipment(riwi_equipment_id),
    FOREIGN KEY (riwi_service_type_id) REFERENCES riwi_service_types(riwi_service_type_id)
);