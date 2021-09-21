-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/GleS9h
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS title;

CREATE TABLE "departments" (
    "dept_no" varchar(30)   NOT NULL,
    "dept_name" varchar(30)   NOT NULL,
	CONSTRAINT "pk_departments" PRIMARY KEY (dept_no)
);

CREATE TABLE "dept_emp" (
    "emp_no" varchar(30)   NOT NULL,
    "dept_no" varchar(30)   NOT NULL,
CONSTRAINT "pk_dept_emp" PRIMARY KEY (dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(30)   NOT NULL,
    "emp_no" varchar(30)   NOT NULL
);

CREATE TABLE "title" (
    "title_id" int NOT NULL,
    "title" varchar(30)   NOT NULL,
	CONSTRAINT "pk_title" primary key (title_id)
);

CREATE TABLE "employees" (
    "emp_no" varchar(30) NOT NULL,
    "emp_title_id" INT   NOT NULL,
    "birth_date" Date   NOT NULL,
    "first_name" varchar(30)   NOT NULL,
    "last_name" varchar(30)   NOT NULL,
    "sex" varchar(3)   NOT NULL,
    "hire_date" Date   NOT NULL,
	CONSTRAINT "pk_employees" PRIMARY KEY (emp_no),
	FOREIGN KEY(emp_title_id) REFERENCES title("title_id")
);

CREATE TABLE "salaries" (
    "emp_no" varchar(30)   NOT NULL,
    "salary" int   NOT NULL,
	constraint "pk_salaries" primary key (emp_no)
);




ALTER TABLE "departments" ADD CONSTRAINT "fk_departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "dept_emp" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "salaries" ("emp_no");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_id" FOREIGN KEY("title_id")
REFERENCES employees("emp_title_id");

