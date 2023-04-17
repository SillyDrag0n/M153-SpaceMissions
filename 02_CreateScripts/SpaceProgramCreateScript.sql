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
  ProgramName varchar(50),
  ProgramStartDate date,
  ProgramEndDate date NULL,
  ProgramNoOfFlights int,
  primary key (ProgramId),
);
go

create table Mission (
  MissionId int identity,
  MissionName varchar(50),
  MissionBudget decimal(16,2),
  MissionSucceeded bit NULL, 
  primary key (MissionId),
  fk_ProgramId int,
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

alter table Mission 
  add constraint fk_DestinationIdForMission foreign key (fk_DestinationId) REFERENCES Destination (DestinationId),
      constraint fk_LaunchSiteForMission foreign key (fk_LaunchSiteId) REFERENCES LaunchSite (LaunchSiteId),
      constraint fk_ProgramIdForMission foreign key (fk_ProgramId) REFERENCES Program (ProgramId);
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

-----------------------------------------------------------
-- Tabelle Program abfuellen
-----------------------------------------------------------

insert into Program
  (ProgramName,                                      ProgramStartDate, ProgramEndDate, ProgramNoOfFlights) values
  ('Project Mercury',                                '1958-10-07',     '1963-05-15',   26),
  ('Project Gemini',                                 '1961-02-19',     '1966-11-11',   12),
  ('Apollo Program',                                 '1961-10-27',     '1975-12-19',   35),
  ('Vostok programme',                               '1959-01-08',     '1965-06-19',   6),
  ('Skylab',                                         '1973-05-11',     '1974-02-20',   5),
  ('Voshkod programme',                              '1964-10-12',     '1965-03-19',   2),
  ('Space Shuttle Program',                          '1972-01-01',     '2011-01-01',   137),
  ('International Space Station programme',          '1993-09-03',     NULL,           246),
  ('China Manned Space Program',                     '1992-09-21',     NULL,           25),
  ('Mir',                                            '1976-02-17',     '1996-04-23',   39);