-- Create the database
DROP DATABASE IF EXISTS university_db;
CREATE DATABASE IF NOT EXISTS university_db;
USE university_db;

-- Create universities table
CREATE TABLE universities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    founding_year INT
);

-- Create dorms table
CREATE TABLE dorms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES universities(id)
);

-- Create students table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    dorm_id INT,
    university_id INT,
    FOREIGN KEY (dorm_id) REFERENCES dorms(id),
    FOREIGN KEY (university_id) REFERENCES universities(id)
);

-- Insert universities
INSERT INTO universities (name, address, founding_year) VALUES
('Tech University', '123 Tech Ave, City A', 1965),
('Liberal Arts College', '456 Arts Blvd, City B', 1850);

-- Insert dorms
INSERT INTO dorms (name, address, university_id) VALUES
('Tech Dorm A', '1 Dorm Lane, City A', 1),
('Tech Dorm B', '2 Dorm Lane, City A', 1),
('Arts Dorm A', '9 Academy St, City B', 2);

-- Insert students
INSERT INTO students (first_name, last_name, email, dorm_id, university_id) VALUES
('Alice', 'Smith', 'alice@example.com', 1, 1),
('Bob', 'Johnson', 'bob@example.com', 2, 1),
('Clara', 'Williams', 'clara@example.com', 3, 2);
