CREATE SCHEMA IF NOT EXISTS projects;
USE projects;

insert into department values(1,"Programming",null);
insert into department values(2,"Analysis",null);
insert into department values(3,"Research",null);

insert into project (projectID, projectName, departmentID) values(1,"Creating the models", 1);
insert into project (projectID, projectName, departmentID) values(2,"Creating the controllers", 1);
insert into project (projectID, projectName, departmentID) values(3,"Creating the views", 1);
insert into project (projectID, projectName, departmentID) values(4,"Creating the Datamodel", 2);
insert into project (projectID, projectName, departmentID) values(5,"Creating the Class diagram", 2);
insert into project (projectID, projectName, departmentID) values(6,"Creating the Sequence diagrams", 2);
insert into project (projectID, projectName, departmentID) values(7,"Designing the UI", 2);
insert into project (projectID, projectName, departmentID) values(8,"Setting up DFS", 3);



insert into employee values(210, "Samuel", "Jackson");
insert into employee values(248, "Antony", "Hopkins");
insert into employee values(383, "Cameron", "Diaz");
insert into employee values(492, "Brad", "Pitt");
insert into employee values(502, "Cate", "Blanchett");
insert into employee values(749, "Johnny", "Depp");
insert into employee values(888, "Steve", "Buscemi");
insert into employee values(925, "Matt", "Damon");
insert into employee values(1319, "Quentin", "Tarantino");
insert into employee values(1386, "John", "Cleese");
insert into employee values(2017, "Geoge", "Clooney");

insert into worksfor values(1,2017,null);
insert into worksfor values(2,1386,null);
insert into worksfor values(3,925,null);
#insert into worksfor values(4,11076,null);

select * from employee;