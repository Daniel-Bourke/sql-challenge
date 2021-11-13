DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

-- Change datestyle so that csv with dates in format m/d/yyyy can be loaded
SHOW DATESTYLE;
SET DATESTYLE = 'ISO,MDY';

-- Load in data from csv's
-- titles csv
COPY titles 
FROM 'C:\Users\Public\SQL_Challenge\data\titles.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM titles;

-- employees csv
copy employees
FROM 'C:\Users\Public\SQL_Challenge\data\employees.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM employees;

-- salaries csv
COPY salaries
FROM 'C:\Users\Public\SQL_Challenge\data\salaries.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM salaries;


--departments csv
copy departments
FROM 'C:\Users\Public\SQL_Challenge\data\departments.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM departments;

--dept_emp csv
COPY dept_emp
FROM 'C:\Users\Public\SQL_Challenge\data\dept_emp.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM dept_emp;

--dept_manager csv
COPY dept_manager
FROM 'C:\Users\Public\SQL_Challenge\data\dept_manager.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM dept_manager;
