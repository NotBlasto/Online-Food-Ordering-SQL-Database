#Creating the Database itself
CREATE DATABASE FOODORDERINGONLINE;
USE FOODORDERINGONLINE;

#Creating Tables
CREATE TABLE RESTARAUNT(r_id INT AUTO_INCREMENT PRIMARY KEY,
r_name VARCHAR(40),
r_address VARCHAR(40),
r_city VARCHAR(50),
r_rating FLOAT,
r_phone VARCHAR(10),
r_pin INT);

CREATE TABLE CUSTOMER (c_id INT AUTO_INCREMENT PRIMARY KEY,
c_name VARCHAR(40),
c_address VARCHAR(40),
c_city VARCHAR(40),
c_phone VARCHAR(10),
c_pin INT,
c_email VARCHAR(40));

CREATE TABLE MENUITEM (m_id INT AUTO_INCREMENT PRIMARY KEY,
m_item VARCHAR(30),
m_itemdescription VARCHAR(100),
m_price FLOAT,
m_cost FLOAT);

CREATE TABLE DEPARTMENT(d_id INT PRIMARY KEY,
d_name VARCHAR(30),
d_location VARCHAR(30),
d_head VARCHAR(30));

CREATE TABLE EMPLOYEE (e_id INT AUTO_INCREMENT PRIMARY KEY,
e_gender VARCHAR(15),
e_salary INT,
e_annualsalary INT,
d_id INT,
FOREIGN KEY (d_id) REFERENCES DEPARTMENT(d_id));

CREATE TABLE ORDERINFO (o_id INT AUTO_INCREMENT PRIMARY KEY,
o_online BOOLEAN,
o_delivery BOOLEAN,
o_tax FLOAT,
o_tip FLOAT,
o_totalprice FLOAT,
o_deliverytime VARCHAR(15),
r_id INT,
c_id INT,
m_id INT,
FOREIGN KEY (c_id) REFERENCES CUSTOMER(c_id),
FOREIGN KEY  (r_id) REFERENCES RESTARAUNT(r_id),
FOREIGN KEY (m_id) REFERENCES MENUITEM(m_id));

CREATE TABLE tbl_employee_audit(id INT AUTO_INCREMENT PRIMARY KEY,
emp_id INT, 
Inserted BOOLEAN, 
Deleted BOOLEAN, 
audit_data VARCHAR(100));

#CREATING TRIGGERS
CREATE TRIGGER `insert` 
AFTER INSERT ON `employee` FOR EACH ROW 
INSERT INTO tbl_employee_audit(emp_id, Inserted, Deleted, audit_data) SELECT e_id, TRUE, FALSE, now() FROM employee;

CREATE TRIGGER `delete` 
BEFORE DELETE ON `employee` FOR EACH ROW 
INSERT INTO tbl_employee_audit(emp_id, Inserted, Deleted, audit_data) SELECT e_id, FALSE, TRUE, now() FROM employee;




