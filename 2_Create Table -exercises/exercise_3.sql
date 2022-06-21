CREATE SCHEMA IF NOT EXISTS projects;
USE projects;

select * from department;
select * from employee;
select * from project;
select * from worksfor;

update project set projectName = "Write CSS/html" where projectID = 3;