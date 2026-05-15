-- SQL Assignment 1
-- Name : Kavya SampathKumar
-- Date : 11-02-2026

/* DDL Commands : */

/* 1. Table Creation (CREATE): Write the SQL statements to create a database named “employee” and the following tables based on the provided schema:
⦿ Departments
⦿ Location
⦿ Employees */
CREATE DATABASE employee;
USE employee;
CREATE TABLE Employees (
employee_id int PRIMARY KEY,
employee_name varchar(50),
gender        enum ("M","F"),
age           int,
hire_date     date,
designation   varchar(100),
department_id int,
location_id   int,
salary        decimal(10,2) );

CREATE TABLE departments (
department_id int PRIMARY KEY,
department_name varchar(100) );

CREATE TABLE location (
location_id int PRIMARY KEY,
location varchar(30) );

select * from employees;
select * from departments;
select * from location;

/* 2. Table Alteration (ALTER): Consider the following scenarios and write the SQL statements to alter the structure of the tables accordingly: */
/* Add a new column named "email" to the Employees table to store employee email addresses. */
SELECT * FROM employees;
Alter table employees Add Column email varchar(25);
select * from employees;

/* Modify the data type of the "designation" column in the Employees table to support a wider range of values.*/
select * from employees;
alter table employees modify designation varchar(200);
select * from employees;

/* Drop the “age” column from the Employees table.*/
select * from employees;
Alter table employees drop column age;
select * from employees;

/*Rename the “hire_date” column to “date_of_joining”.*/
select * from employees;
alter table employees rename column hire_date to date_of_joining;
select * from employees;

/* 3. Table Renaming (RENAME): Rewrite the SQL statements to rename the following tables: */
/* Rename the "Departments" table to "Departments_Info". */
Show tables;
Rename table departments to departments_info;
show tables;

/*Rename the "Location" table to "Locations".*/
show tables;
rename table location to locations;
show tables;

/* 4. Table Truncation (TRUNCATE): Write an SQL statement to truncate the Employees table. */
show tables;
truncate table employees;
show tables;

/* 5. Database & Table Dropping (DROP): Write the SQL statements to drop the Employees table and then the “employee” database. */
show tables;
drop table employees;
show tables;

show databases;
drop database employee;
show databases;

/* CONSTRAINTS */
/* 1. Database Recreation:
⦿ Drop the 'employee' database if it exists and recreate it using the provided schema, */
 /*  ensuring that all tables are created with the appropriate constraints as instructed. */
 Drop database if exists employee ;
 show databases;
 create database if not exists employee;
 show databases;
 
 
 /* 2. Departments Table:
⦿ Ensure that the "department_id" uniquely identifies each department.
⦿ Set up constraints on the "department_name" to avoid duplicate and null entries. */

use  employee;
CREATE TABLE departments (
department_id int PRIMARY KEY,
department_name varchar(100) unique not null );
show tables;

/* 3. Location Table:
⦿ Establish a mechanism to automatically generate unique identifiers for each location, ensuring that they are incremented sequentially.
⦿ Implement constraints to prevent the insertion of null and duplicate locations. */

CREATE TABLE location (
location_id int auto_increment primary key ,
location varchar(30) unique not null );
show tables;

/* 4. Employees Table:
⦿ Guarantee that each employee has a distinct identifier.
⦿ Create a restriction to ensure that the employee's name is always provided.
⦿ Limit the acceptable values for the "gender" field to only 'M' or 'F'.
⦿ Enforce a condition to ensure that the employee's age is 18 or above.
⦿ Automatically assign the current date to the "hire_date" field if not specified.
⦿ Establish links between the "department_id" and "location_id" fields in the "employees" table and their respective tables.  */

CREATE TABLE Employees (
employee_id int auto_increment PRIMARY KEY,
employee_name varchar(50) not null,
gender        enum ("M","F"),
age           int check(age >=18),
hire_date     date default(current_date()),
designation   varchar(100),
department_id int,
location_id   int,
salary        decimal(10,2) ,
Foreign key (department_id) references departments(department_id),
Foreign key (location_id) references location(location_id)
);
select * from employees;
select * from departments;
select * from location;
show tables;
show databases;

-- Assignment Submitted By Kavya SampathKumar
-- Submitted Date : 11/02/2026






