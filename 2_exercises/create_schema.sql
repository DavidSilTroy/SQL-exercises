CREATE SCHEMA IF NOT EXISTS dast;
USE dast;

drop table if exists Appointment;
drop table if exists Hairdresser;


create table if not exists Hairdresser(
hairdresserID int primary key,
firstName varchar(50) not null,
secondName varchar(50) not null
);

create table if not exists Appointment(
appointmentID int primary key,
place varchar(50) not null,
employeeID int,
constraint appointmentToHairdresser 
	foreign key(employeeID) 
	references Hairdresser(hairdresserID)
);

create table if not exists Appointment(
appointmentID int,
place varchar(50) not null,
employeeID int,
constraint appointmentID 
	primary key(appointmentID),
constraint appointmentToHairdresser 
	foreign key(employeeID) 
	references Hairdresser(hairdresserID)
);

insert into Hairdresser values(1,"David", "Silva");
insert into Appointment values(1,"Geel", 1);

insert into Hairdresser (hairdresserID, firstName, secondName) values(2,"Michael", "Quintana");
insert into Appointment (appointmentID, place, employeeID) values(2,"Manta", 2);

update Appointment set place = "Brussels" where place = "Manta";

#DELETE FROM Appointment WHERE place = "Brussels";
