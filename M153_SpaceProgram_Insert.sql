--*********************************************************
-- SpacePrograms
--*********************************************************

-----------------------------------------------------------
-- Daten einfuegen
-----------------------------------------------------------

-----------------------------------------------------------
-- Tabelle Program abfuellen
-----------------------------------------------------------

insert into Program
  (ProgramName,                                   ProgramStartDate,   ProgramEndDate,   ProgramBudget,      ProgramNoOfFlights) values
  ('Project Gemini',                              '1961-02-19',       '1966-11-11',      1300000000.00,                     12),
  ('Project Mercury',                             '1958-10-07',       '1963-05-15',       277000000.00,                     26),
  ('Apollo Program',                              '1961-10-27',       '1975-12-19',     25400000000.00,                     35),
  ('Vostok programme',                            '1959-01-08',       '1965-06-19',        89200000.00,                      6),
  ('Skylab',                                      '1973-05-11',       '1974-02-20',      2200000000.00,                      5),
  ('Voshkod programme',                           '1964-10-12',       '1965-03-19',       491000000.00,                      2),
  ('Space Shuttle Program',                       '1972-01-01',       '2011-01-01',    196000000000.00,                    137),
  ('International Space Station programme',       '1993-09-03',               NULL,    150000000000.00,                    246),
  ('Touhou Space Program',                        '2007-03-19',       '2010-08-23',     69420000000.00,                      2),
  ('China Manned Space Program',                  '1992-09-21',               NULL,        10200000.00,                     25),
  ('Mir',                                         '1976-02-17',       '1996-04-23',      4920000000.00,                     39),
  ('Venus Satelite Program',                      '1997-08-28',       '2017-01-07',       127431000.00,                     12),
  ('Meteorite Mining Program',                    '2016-11-03',               NULL,       752000000.00,                      4),
  ('To infinity and beyond',                      '1981-03-23',       '1999-02-12',       500000000.00,                     17),
  ('Green Apple Program',                         '2004-06-05',       '2014-12-29',         7000000.00,                      8),
  ('Pritt Program',                               '1983-04-19',       '1987-02-11',        25600000.00,                     11),
  ('International Explorers',                     '2001-11-20',               NULL,        69500000.00,                     15),
  ('Europa Highlight Program',                    '2022-05-19',       '2023-04-14',          780000.00,                      1),
  ('Dyson Sphere Program',                        '1985-11-23',               NULL,     48050000000.00,                     59),
  ('Project M153',                                '2023-03-15',       '1996-04-23',      4920000000.00,                     39),
  ('Mir',                                         '1976-02-17',       '1996-04-23',      4920000000.00,                     39),
  ('Mir',                                         '1976-02-17',       '1996-04-23',      4920000000.00,                     39),
  ('Mir',                                         '1976-02-17',       '1996-04-23',      4920000000.00,                     39),
  ('Populate Mars',                               '2022-06-12',               NULL,      5300000000.00,                      2);
go


-----------------------------------------------------------
-- Tabelle Job abfuellen
-----------------------------------------------------------

insert into Job
  (JobDescription) values
  ('Engineer'),
  ('Scientist'),
  ('Astronaut'),
  ('Mission Control'),
  ('Manager'),
  ('Other job');
go


-----------------------------------------------------------
-- Tabelle Destination abfuellen
-----------------------------------------------------------

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
  ('Lunar Surface'),
  ('Lunar Orbit'),
  ('LEO (Low Earth Orbit)'),
  ('Spacewalk'),
  ('Spacecreaft'),
  ('Orbital flight around Earth'),
  ('Kuiper belt'),
  ('Meteoroid'),
  ('Asteorid'),
  ('Other celestial object'),
  ('Other destination');
go


-----------------------------------------------------------
-- Tabelle LaunchSite abfuellen
-----------------------------------------------------------

insert into LaunchSite
  (LaunchSiteDescription) values
  ('Cape Canaveral Space Force Station'),
  ('Kennedy Space Center'),
  ('Baikonur Cosmodrome'),
  ('Vandenberg Space Force Station'),
  ('Wallops Island Flight Facility'),
  ('Kodiak Island'),
  ('White Sands Missile Range'),
  ('Jiuquan Satellite Launch Center'),
  ('Wenchang Space Launch Site'),
  ('Migus House'),
  ('Reagan Test Site, Kwajalein Atoll'),
  ('Other launch site');
go


-----------------------------------------------------------
-- Tabelle Organisation abfuellen
-----------------------------------------------------------

insert into Organisation
  (OrganisationName,                                       OrganisationFoundationDate) values
  ('National Aeronautics and Space Administration (NASA)', 1958-07-29),
  ('Soviet Space Organisation',                            1955-04-02),
  ('Russian Federal Space Agency (Roscosmos/RFSA)',        1992-02-25),
  ('European Space Agency (ESA)',                          1975-05-30),
  ('Canadian Space Agency (CSA)',                          1989-03-01),
  ('Japanese Aerospace Exploration Agency (JAXA)',         2003-10-01),
  ('SpaceX',                                               2002-03-14),
  ('China National Space Administration (CNSA)',           1993-04-22),  
  ('Masterspark Space Administration',                     2001-04-21),
  ('Other organisation',                                   GETDATE());
go


-----------------------------------------------------------
-- Tabelle Personal abfuellen
-----------------------------------------------------------

insert into Personal
  (PersonalFirstname,             PersonalLastname,      fk_JobId,                                                           fk_OrganisationId) values
  ('Juri Alexejewitsch',          'Gagarin',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ('Neil Alden',                  'Armstrong',           (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Sergei Pavlovich',            'Korolev',             (select JobId from Job where JobDescription = 'Manager'),           (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ('Michael',                     'Collins',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Edwin Eugene',                'Aldrin Jr.',          (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Vladimir Mikhaylovich',       'Komarov',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ('Boris',                       'Yegorov',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ('Alexei Arkhipovich',          'Leonov',              (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ('Malcolm Scott',               'Carpenter',           (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Leroy Gordon',                'Cooper Jr.',          (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Miguel Angelo',               'Tomé',                (select JobId from Job where JobDescription = 'Engineer'),          (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ('Virgil Ivan',                 'Grissom',             (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Elon',                        'Musk',                (select JobId from Job where JobDescription = 'Manager'),           (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ('Walter Marty',                'Schirra Jr.',         (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ('Owen Kay',                    'Garriott',            (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
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
  ('Yang',                        'Liwei',               (select JobId from Job where JobDescription = 'Astronaut'),         (select OrganisationId from Organisation where OrganisationName = 'China National Space Administration (CNSA)')),
  ('Till Leon',                   'Strasser',            (select JobId from Job where JobDescription = 'Other job'),         (select OrganisationId from Organisation where OrganisationName = 'Other organisation'));
go


-----------------------------------------------------------
-- Tabelle Mission abfuellen
-----------------------------------------------------------

insert into Mission
  (MissionName, MissionSucceeded, fk_DestinationId, fk_LaunchSiteId, fk_ProgramId) values
  ('Apollo 11', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Lunar Surface'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kennedy Space Center'), 
    (select ProgramId from Program where ProgramName = 'Apollo Program')
  ),
  ('Apollo 13', 
    0,  
    (select DestinationId from Destination where DestinationDescription = 'Titan'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kennedy Space Center'), 
    (select ProgramId from Program where ProgramName = 'Apollo Program')
  ),
  ('Vostok 1', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Uranus'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Baikonur Cosmodrome'), 
    (select ProgramId from Program where ProgramName = 'Vostok programme')
  ),
  ('Vostok 2', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Orbital flight around Earth'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Baikonur Cosmodrome'), 
    (select ProgramId from Program where ProgramName = 'Vostok programme')
  ),
  ('MR-4', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Neptun'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Cape Canaveral Space Force Station'), 
    (select ProgramId from Program where ProgramName = 'Project Mercury')
  ),
  ('MR-6', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Saturn'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Cape Canaveral Space Force Station'), 
    (select ProgramId from Program where ProgramName = 'Project Mercury')
  ),
  ('Gemini V', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Orbital flight around Earth'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Cape Canaveral Space Force Station'), 
    (select ProgramId from Program where ProgramName = 'Project Gemini')
  ),
  ('Skylab 1 SL-1', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Orbital flight around Earth'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kennedy Space Center'), 
    (select ProgramId from Program where ProgramName = 'Skylab')
  ),
  ('Skylab 3 SL-3', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Mars'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kennedy Space Center'), 
    (select ProgramId from Program where ProgramName = 'Skylab')
  ),
  ('Kosmos 57', 
    0,  
    (select DestinationId from Destination where DestinationDescription = 'Asteorid'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Baikonur Cosmodrome'), 
    (select ProgramId from Program where ProgramName = 'Voshkod programme')
  ),
  ('Voshkod 1', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Spacewalk'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Baikonur Cosmodrome'), 
    (select ProgramId from Program where ProgramName = 'Voshkod programme')
  ),
  ('STS-51-L', 
    0,  
    (select DestinationId from Destination where DestinationDescription = 'Orbital flight around Earth'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kennedy Space Center'), 
    (select ProgramId from Program where ProgramName = 'Space Shuttle Program')
  ),
  ('Luna Nights I', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Mercury'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Migus House'), 
    (select ProgramId from Program where ProgramName = 'Touhou Space Program')
  ),
  ('Luna Nights II', 
    0,  
    (select DestinationId from Destination where DestinationDescription = 'LEO (Low Earth Orbit)'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Vandenberg Space Force Station'), 
    (select ProgramId from Program where ProgramName = 'Touhou Space Program')
  ),
  ('Luna Nights III', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Venus'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Vandenberg Space Force Station'), 
    (select ProgramId from Program where ProgramName = 'Touhou Space Program')
  ),
  ('Shenzhou 5', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Orbital flight around Earth'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Jiuquan Satellite Launch Center'), 
    (select ProgramId from Program where ProgramName = 'China Manned Space Program')
  ),
  ('Mir 1', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Orbital flight around Earth'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Baikonur Cosmodrome'), 
    (select ProgramId from Program where ProgramName = 'Mir')
  ),
  ('Mir 6', 
    0,  
    (select DestinationId from Destination where DestinationDescription = 'Kuiper belt'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Baikonur Cosmodrome'), 
    (select ProgramId from Program where ProgramName = 'Mir')
  ),
  ('Civilization Mars 1', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Mars'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Migus House'), 
    (select ProgramId from Program where ProgramName = 'Populate Mars')
  ),
  ('Civilization Mars 2', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'Mars'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kodiak Island'), 
    (select ProgramId from Program where ProgramName = 'Populate Mars')
  ),
  ('ISS Orbital Launch', 
    1,  
    (select DestinationId from Destination where DestinationDescription = 'LEO (Low Earth Orbit)'), 
    (select LaunchSiteId from LaunchSite where LaunchSiteDescription = 'Kennedy Space Center'), 
    (select ProgramId from Program where ProgramName = 'International Space Station programme')
  );
go


-----------------------------------------------------------
-- Tabelle Worked abfuellen
-----------------------------------------------------------

insert into Worked
  (fk_MissionId,                                                               fk_PersonalId) values
  ((select MissionId from Mission where MissionName = 'Luna Nights I'),        (select PersonalId from Personal where PersonalFirstname = 'Miguel Angelo' and PersonalLastname = 'Tomé')),
  ((select MissionId from Mission where MissionName = 'Luna Nights I'),        (select PersonalId from Personal where PersonalFirstname = 'Elon' and PersonalLastname = 'Musk')),
  ((select MissionId from Mission where MissionName = 'Apollo 11'),            (select PersonalId from Personal where PersonalFirstname = 'Neil Alden' and PersonalLastname = 'Armstrong')),
  ((select MissionId from Mission where MissionName = 'Apollo 11'),            (select PersonalId from Personal where PersonalFirstname = 'Edwin Eugene' and PersonalLastname = 'Aldrin Jr.')),
  ((select MissionId from Mission where MissionName = 'Apollo 11'),            (select PersonalId from Personal where PersonalFirstname = 'Michael' and PersonalLastname = 'Collins')),
  ((select MissionId from Mission where MissionName = 'Apollo 13'),            (select PersonalId from Personal where PersonalFirstname = 'Rick' and PersonalLastname = 'Sanchez')),
  ((select MissionId from Mission where MissionName = 'Vostok 1'),             (select PersonalId from Personal where PersonalFirstname = 'Juri Alexejewitsch' and PersonalLastname = 'Gagarin')),
  ((select MissionId from Mission where MissionName = 'Vostok 2'),             (select PersonalId from Personal where PersonalFirstname = 'Sergei Pavlovich' and PersonalLastname = 'Korolev')),
  ((select MissionId from Mission where MissionName = 'MR-4'),                 (select PersonalId from Personal where PersonalFirstname = 'Vladimir Mikhaylovich' and PersonalLastname = 'Komarov')),
  ((select MissionId from Mission where MissionName = 'MR-4'),                 (select PersonalId from Personal where PersonalFirstname = 'Boris' and PersonalLastname = 'Yegorov')),
  ((select MissionId from Mission where MissionName = 'MR-4'),                 (select PersonalId from Personal where PersonalFirstname = 'Alexei Arkhipovich' and PersonalLastname = 'Leonov')),
  ((select MissionId from Mission where MissionName = 'MR-6'),                 (select PersonalId from Personal where PersonalFirstname = 'Boris' and PersonalLastname = 'Yegorov')),
  ((select MissionId from Mission where MissionName = 'MR-6'),                 (select PersonalId from Personal where PersonalFirstname = 'Alexei Arkhipovich' and PersonalLastname = 'Leonov')),
  ((select MissionId from Mission where MissionName = 'MR-6'),                 (select PersonalId from Personal where PersonalFirstname = 'Virgil Ivan' and PersonalLastname = 'Grissom')),
  ((select MissionId from Mission where MissionName = 'Gemini V'),             (select PersonalId from Personal where PersonalFirstname = 'Malcolm Scott' and PersonalLastname = 'Carpenter')),
  ((select MissionId from Mission where MissionName = 'Gemini V'),             (select PersonalId from Personal where PersonalFirstname = 'Leroy Gordon' and PersonalLastname = 'Cooper Jr.')),
  ((select MissionId from Mission where MissionName = 'Skylab 1 SL-1'),        (select PersonalId from Personal where PersonalFirstname = 'Walter Marty' and PersonalLastname = 'Schirra Jr.')),
  ((select MissionId from Mission where MissionName = 'Skylab 1 SL-1'),        (select PersonalId from Personal where PersonalFirstname = 'Leroy Gordon' and PersonalLastname = 'Cooper Jr.')),
  ((select MissionId from Mission where MissionName = 'Skylab 3 SL-3'),        (select PersonalId from Personal where PersonalFirstname = 'Owen Kay' and PersonalLastname = 'Garriott')),
  ((select MissionId from Mission where MissionName = 'STS-51-L'),             (select PersonalId from Personal where PersonalFirstname = 'Pavel Ivanovich' and PersonalLastname = 'Belyayev')),
  ((select MissionId from Mission where MissionName = 'STS-51-L'),             (select PersonalId from Personal where PersonalFirstname = 'Gherman Stepanovich' and PersonalLastname = 'Titov')),
  ((select MissionId from Mission where MissionName = 'Shenzhou 5'),           (select PersonalId from Personal where PersonalFirstname = 'Yang' and PersonalLastname = 'Liwei')),
  ((select MissionId from Mission where MissionName = 'Shenzhou 5'),           (select PersonalId from Personal where PersonalFirstname = 'Vritz' and PersonalLastname = 'Stadelmann')),
  ((select MissionId from Mission where MissionName = 'Mir 6'),                (select PersonalId from Personal where PersonalFirstname = 'Rodrigo' and PersonalLastname = 'Sanchez')),
  ((select MissionId from Mission where MissionName = 'Civilization Mars 1'),  (select PersonalId from Personal where PersonalFirstname = 'Elon' and PersonalLastname = 'Musk')),
  ((select MissionId from Mission where MissionName = 'Civilization Mars 2'),  (select PersonalId from Personal where PersonalFirstname = 'Leroy Gordon' and PersonalLastname = 'Cooper Jr.')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select PersonalId from Personal where PersonalFirstname = 'Vritz' and PersonalLastname = 'Stadelmann')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select PersonalId from Personal where PersonalFirstname = 'Till Leon' and PersonalLastname = 'Strasser')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select PersonalId from Personal where PersonalFirstname = 'Leroy Gordon' and PersonalLastname = 'Cooper Jr.'));
  
go


-----------------------------------------------------------
-- Tabelle Contributed abfuellen
-----------------------------------------------------------

insert into Contributed
  (fk_MissionId,                                                               fk_OrganisationId) values
  ((select MissionId from Mission where MissionName = 'Civilization Mars 1'),  (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ((select MissionId from Mission where MissionName = 'Civilization Mars 2'),  (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ((select MissionId from Mission where MissionName = 'Apollo 11'),            (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'Apollo 13'),            (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'Vostok 1'),             (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ((select MissionId from Mission where MissionName = 'Vostok 2'),             (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ((select MissionId from Mission where MissionName = 'MR-4'),                 (select OrganisationId from Organisation where OrganisationName = 'European Space Agency (ESA)')),
  ((select MissionId from Mission where MissionName = 'MR-4'),                 (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'MR-4'),                 (select OrganisationId from Organisation where OrganisationName = 'Canadian Space Agency (CSA)')),
  ((select MissionId from Mission where MissionName = 'MR-6'),                 (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'MR-6'),                 (select OrganisationId from Organisation where OrganisationName = 'European Space Agency (ESA)')),
  ((select MissionId from Mission where MissionName = 'Gemini V'),             (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'Skylab 1 SL-1'),        (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'Skylab 1 SL-1'),        (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ((select MissionId from Mission where MissionName = 'Skylab 3 SL-3'),        (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'Skylab 3 SL-3'),        (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ((select MissionId from Mission where MissionName = 'Kosmos 57'),            (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ((select MissionId from Mission where MissionName = 'Voshkod 1'),            (select OrganisationId from Organisation where OrganisationName = 'Soviet Space Organisation')),
  ((select MissionId from Mission where MissionName = 'STS-51-L'),             (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'Luna Nights I'),        (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ((select MissionId from Mission where MissionName = 'Luna Nights I'),        (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ((select MissionId from Mission where MissionName = 'Luna Nights II'),       (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ((select MissionId from Mission where MissionName = 'Luna Nights III'),      (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ((select MissionId from Mission where MissionName = 'Shenzhou 5'),           (select OrganisationId from Organisation where OrganisationName = 'China National Space Administration (CNSA)')),
  ((select MissionId from Mission where MissionName = 'Mir 1'),                (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ((select MissionId from Mission where MissionName = 'Mir 6'),                (select OrganisationId from Organisation where OrganisationName = 'Russian Federal Space Agency (Roscosmos/RFSA)')),
  ((select MissionId from Mission where MissionName = 'Civilization Mars 1'),  (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ((select MissionId from Mission where MissionName = 'Civilization Mars 1'),  (select OrganisationId from Organisation where OrganisationName = 'Masterspark Space Administration')),
  ((select MissionId from Mission where MissionName = 'Civilization Mars 2'),  (select OrganisationId from Organisation where OrganisationName = 'SpaceX')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select OrganisationId from Organisation where OrganisationName = 'China National Space Administration (CNSA)')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select OrganisationId from Organisation where OrganisationName = 'National Aeronautics and Space Administration (NASA)')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select OrganisationId from Organisation where OrganisationName = 'European Space Agency (ESA)')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select OrganisationId from Organisation where OrganisationName = 'Japanese Aerospace Exploration Agency (JAXA)')),
  ((select MissionId from Mission where MissionName = 'ISS Orbital Launch'),   (select OrganisationId from Organisation where OrganisationName = 'Other organisation'));
go