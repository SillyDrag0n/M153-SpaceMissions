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
  ProgramBudget decimal(16,2),
  ProgramNoOfFlights int,
  primary key (ProgramId),
);
go

create table Mission (
  MissionId int identity,
  MissionName varchar(50),
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
  PersonalFirstname varchar(30),
  PersonalLastname varchar(30),
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
  (ProgramName,                                   ProgramStartDate,   ProgramEndDate,   ProgramBudget,      ProgramNoOfFlights) values
  ('Project Mercury',                             '1958-10-07',       '1963-05-15',     '',                                 26),
  ('Project Gemini',                              '1961-02-19',       '1966-11-11',     '',                                 12),
  ('Apollo Program',                              '1961-10-27',       '1975-12-19',     '',                                 35),
  ('Vostok programme',                            '1959-01-08',       '1965-06-19',     '',                                  6),
  ('Skylab',                                      '1973-05-11',       '1974-02-20',     '',                                  5),
  ('Voshkod programme',                           '1964-10-12',       '1965-03-19',     '',                                  2),
  ('Space Shuttle Program',                       '1972-01-01',       '2011-01-01',     '',                                137),
  ('International Space Station programme',       '1993-09-03',       NULL,             '',                                246),
  ('Touhou Space Program',                        '2007-03-19',       '2010-08-23',     '',                                  2),
  ('China Manned Space Program',                  '1992-09-21',       NULL,             '',                                 25),
  ('Mir',                                         '1976-02-17',       '1996-04-23',     '',                                 39);
go

insert into Job
  (JobDescription) values
  ('Engineer'),
  ('Scientist'),
  ('Astronaut'),
  ('Mission Control'),
  ('Manager'),
  ('Other job');
go

insert into Destination
  (DestinationDescription) values
  ('Mercury'),
  ('Venus'),
  ('Mars'),
  ('Jupiter'),
  ('Saturn'),
  ('Uranus'),
  ('Neptun'),
  ('Pluto'),
  ('Titan'),
  ('Europa'),
  ('Venus'),
  ('Lunar Surface'),
  ('Lunar Orbit'),
  ('LEO (Low Earth Orbit)'),
  ('Spacewalk'),
  ('Spacecreaft'),
  ('Edge of Space'),
  ('Kuiper belt'),
  ('Meteoroid'),
  ('Asteorid'),
  ('Other celestial object'),
  ('Other destination');
go

insert into LaunchSite
  (LaunchSiteDescription) values
  ('Cape Canaveral Space Force Station'),
  ('Kennedy Space Center'),
  ('Baikonur Cosmodrome'),
  ('Vandenberg Space Force Station'),
  ('Wallops Island Flight Facility'),
  ('Kodiak Island'),
  ('White Sands Missile Range'),
  ('Jiuqan Satellite Launch Center'),
  ('Wenchang Space Launch Site'),
  ('Migus House'),
  ('Reagan Test Site, Kwajalein Atoll'),
  ('Other launch site');
go

insert into Organisation
  (OrganisationName,                                       OrganisationFoundationDate) values
  ('National Aeronautics and Space Administration (NASA)', ''),
  ('Russian Federal Space Agency (Roscosmos/RFSA)',        ''),
  ('European Space Agency (ESA)',                          ''),
  ('Canadian Space Agency (CSA)',                          ''),
  ('Japanese Aerospace Exploration Agency (JAXA)',         ''),
  ('SpaceX',                                               ''),
  ('China National Space Administration (CNSA)',           ''),  
  ('Masterspark Space Administration',                     '2001-04-21'),
  ('Other organisation',                                   '2023-04-18');
go

insert into Personal
  (PersonalFirstname,             PersonalLastname,      fk_JobId,                                                           fk_OrganisationId) values
  ('Yuri',                        'Gargarin',            (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Neil Alden',                  'Armstrong',           (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Sergei Pavlovich',            'Korolev',             (select JobId from Job where JobDescription = 'Manager'),           (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Michael',                     'Collins',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Edwin Eugene',                'Aldrin Jr.',          (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Vladimir Mikhaylovich',       'Komarov',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Boris',                       'Yegorov',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Alexei Arkhipovich',          'Leonov',              (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Malcolm Scott',               'Carpenter',           (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Leroy Gordon',                'Cooper Jr.',          (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Miguel Angelo',               'Tomé',                (select JobId from Job where JobDescription = 'Engineer'),          (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ('Virgil Ivan',                 'Grissom',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Elon',                        'Musk',                (select JobId from Job where JobDescription = 'Manager'),           (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ('Walter Marty',                'Schirra Jr.',         (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Edward',                      'Higgins White II',    (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Elliot McKay',                'See Jr.',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Pavel Ivanovich',             'Belyayev',            (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Gherman Stepanovich',         'Titov',               (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Walter',                      'White',               (select JobId from Job where JobDescription = 'Scientist'),         (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ('Rick',                        'Sanchez',             (select JobId from Job where JobDescription = 'Scientist'),         (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ('Rodrigo',                     'Sanchez',             (select JobId from Job where JobDescription = 'Mission Control'),   (select OrganisationId from Organisation where OrganisationName = 'China National Space Administration (CNSA)')),
  ('Martinez',                    'De Loca',             (select JobId from Job where JobDescription = 'Other job'),         (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ('Some Canadian',               'Mapletree',           (select JobId from Job where JobDescription = 'Manager'),           (select OrganisationId from Organisation where OrganisationName = 'Canadian Space Agency (CSA)')),
  ('Vritz',                       'Stadelmann',          (select JobId from Job where JobDescription = 'Engineer'),          (select OrganisationId from Organisation where OrganisationName = 'European Space Agency (ESA)')),
  ('Till Leon',                   'Strasser',            (select JobId from Job where JobDescription = 'Other job'),         (select OrganisationId from Organisation where OrganisationName = 'Other organisation'));
go

--insert into Mission
--  (MissionName,             MisionBudget,          MissionSucceeded,  fk_DestinationId, fk_LaunchSiteId, fk_DestinationId) values