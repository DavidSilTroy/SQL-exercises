CREATE SCHEMA IF NOT EXISTS projects;
USE projects;

drop table if exists worksfor;
drop table if exists project;
drop table if exists employee;
drop table if exists department;


create table if not exists department(
departmentID int primary key not null auto_increment,
departmentName varchar(45) not null,
numberOfEmployees int
);

create table if not exists employee(
employeeID int primary key not null auto_increment,
firstName varchar(45) not null,
lastName varchar(45) not null
);

create table if not exists project(
projectID int not null auto_increment,
projectName varchar(45) not null,
departmentID int,
constraint projectID 
	primary key(projectID),
constraint projectToDepartment 
	foreign key(departmentID) 
	references department(departmentID)
);


create table if not exists worksfor(
projectID int,
employeeID int,
assigment varchar(45),
constraint worksforToProject 
	foreign key(projectID) 
	references project(projectID),
constraint worksforToEmployee
	foreign key(employeeID) 
	references employee(employeeID)
);