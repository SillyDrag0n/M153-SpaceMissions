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
  fk_MissionId int,
);
go

create table Mission (
  MissionId int identity,
  MissionName varchar(30),
  MissionBudget decimal(16,2),
  MissionSucceeded bit NULL, 
  primary key (MissionId),
  fk_DestinationId int,
  fk_LaunchSiteId int,
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
  fk_MissionId int,
  fk_OrganisationId int,
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
  fk_PersonalId int,
  fk_MissionId int,
);
go

create table Personal (
  PersonalId int identity,
  PersonalVorname varchar(20),
  PersonalNachname varchar(20),
  primary key (PersonalId),
  fk_JobId int,
  fk_OrganisationId int,
);
go

create table Job (
  JobId int identity,
  JobDescription varchar(30),
  primary key (JobId),
);
go

-----------------------------------------------------------
-- Beziehungen erstellen
-----------------------------------------------------------

alter table Program 
  add constraint fk_MissionIdForProgram foreign key (fk_MissionId) REFERENCES Mission (MissionId);
go

alter table Mission 
  add constraint fk_DestinationIdForMission foreign key (fk_DestinationId) REFERENCES Destination (DestinationId),
      constraint fk_LaunchSiteForMission foreign key (fk_LaunchSiteId) REFERENCES LaunchSite (LaunchSiteId);
go
	  
alter table Contributed 
  add constraint fk_OrganisationIdForContributed foreign key (fk_OrganisationId) REFERENCES Organisation (OrganisationId),
      constraint fk_MissionIdForContributed foreign key (fk_MissionId) REFERENCES Mission (MissionId);
go
	  
alter table Worked 
  add constraint fk_PersonalIdForWorked foreign key (fk_PersonalId) REFERENCES Personal (PersonalId),
      constraint fk_MissionIdForWorked foreign key (fk_MissionId) REFERENCES Mission (MissionId);
go

alter table Personal 
  add constraint fk_JobIdForPersonal foreign key (fk_JobId) REFERENCES Job (JobId),
      constraint fk_OrganisationForPersonal foreign key (fk_OrganisationId) REFERENCES Organisation (OrganisationId);
go

-----------------------------------------------------------
-- Daten einfuegen
-----------------------------------------------------------


--insert into Bike (Bez, Preis) values 
--  ('Travel SL', 1399),     /* Cube, Citybike */
--  ('Upstreet 5', 3899),    /* Flyer, E-Bike */
--  ('Uproc 3', 4599);       /* Flyer, E-Bike */
--go