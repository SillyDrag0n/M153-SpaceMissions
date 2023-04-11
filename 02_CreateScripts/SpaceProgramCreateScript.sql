--*********************************************************
-- SpacePrograms
--*********************************************************

-----------------------------------------------------------
-- Datenbank erstellen
-----------------------------------------------------------
use master
go
drop database if exists SpacePrograms; 
go
create database SpacePrograms;
go
use SpacePrograms;
go

-----------------------------------------------------------
-- Tabllen erstellen
-----------------------------------------------------------
create table Program (
  ProgramId int identity,
  ProgramName varchar(30),
  ProgramStartDate date,
  ProgramEndDate date NULL,
  ProgramNoOfFlights int,
  primary key (ProgramId),
);
go

create table Mission (
  MissionId int identity,
  MissionName varchar(30),
  MissionBudget decimal(16,2),
  MissionSucceeded bit NULL, 
  primary key (MissionId),
);
go

create table Destination (
  DestinationId int identity,
  DestinationDescription varchar(50),
  primary key (DestinationId),
);
go

create table LaunchSite (
  LaunchSiteId int identity,
  LaunchSiteDescription varchar(50),
  primary key (LaunchSiteId),
);
go

create table Contributed (
  ContributedId int identity,
  primary key (ContributedId),
);
go

create table Organisation (
  OrganisationId int identity,
  OrganisationName varchar(60),
  OrganisationFoundationDate date,
  primary key (OrganisationId),
);
go

create table Worked (
  WorkedId int identity,
  primary key (WorkedId),
);
go

create table Personal (
  PersonalId int identity,
  PersonalVorname varchar(20),
  PersonalNachname varchar(20),
  primary key (PersonalId),
);
go

create table Job (
  JobId int identity,
  JobDescription varchar(30),
  primary key (JobDescription),
);
go

-----------------------------------------------------------
-- Beziehungen erstellen
-----------------------------------------------------------

-- alter table Program add foreign key(fk_Id) references Ort(OrtId);

-----------------------------------------------------------
-- Daten einfuegen
-----------------------------------------------------------


--insert into Bike (Bez, Preis) values 
--  ('Travel SL', 1399),     /* Cube, Citybike */
--  ('Upstreet 5', 3899),    /* Flyer, E-Bike */
--  ('Uproc 3', 4599);       /* Flyer, E-Bike */
--go