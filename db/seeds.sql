DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;
CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);
CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);
use employees_db;
INSERT INTO department
    (name)
VALUES
    ('IT'),
    ('Claims'),
    ('Underwriting'),
    ('Customer Support');
INSERT INTO role
    (title, salary, department_id)
VALUES
    ('Tech Support Agent', 60000, 1),
    ('Data Scientist', 100000, 1),
    ('Claims Processor', 70000, 2),
    ('Claims Support', 50000, 2),
    ('Senior Underwriter', 200000, 3),
    ('Junior Underwriter', 75000, 3),
    ('Customer Service Rep', 30000, 4),
    ('Senior Customer Service Rep', 50000, 4);
INSERT INTO employee
    (first_name, last_name, role_id, manager_id)
VALUES
    ('John', 'Microsoft', 1, NULL),
    ('Dayle', 'Dixon', 2, 1),
    ('Jeff', 'Dee', 3, NULL),
    ('Ashley', 'Senet', 4, 2),
    ('Rodrigo', 'Olivares', 5, NULL),
    ('Hank', 'Hill', 6, 3),
    ('Larry', 'Page', 7, NULL),
    ('Tim', 'Horton', 8, 4);