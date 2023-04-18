--****************************************************************
-- SpacePrograms
--****************************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
------------------------------------------------------------------

------------------------------------------------------------------
-- Stored Procedure 'fn_UncrewedMissions' erstellen
-- Searches for all missions without any crew members registered
------------------------------------------------------------------

drop procedure if exists fn_UncrewedMissions;
go
 
create procedure fn_UncrewedMissions as 
begin
    select * 
    from Mission 
    where not exists
    (select * 
        from Worked
        where Mission.MissionId = Worked.fk_MissionId
    );
end;
go

------------------------------------------------------------------
-- Stored Procedure 'fn_PersonalWorkedOnMission' erstellen
-- Searches for all Personal that worked on a selected mission
------------------------------------------------------------------

drop procedure if exists fn_PersonalWorkedOnMission;
 go
 
 create procedure fn_PersonalWorkedOnMission (@MissionId int) as 
 begin
    select Mission.MissionId, Mission.MissionName, (Personal.PersonalFirstname + ' ' + PersonalLastname ) AS PersonalName, Job.JobDescription
    from Personal 
	inner join Worked on Personal.PersonalId = Worked.fk_PersonalId
	inner join Mission on Worked.fk_MissionId = Mission.MissionId
	inner join Job on Personal.fk_JobId = Job.JobId
	where Mission.MissionId = @MissionId
end;
go

------------------------------------------------------------------
-- Stored Procedures oefnen/ausfuehren
------------------------------------------------------------------

EXEC fn_UncrewedMissions;

EXEC fn_PersonalWorkedOnMission @MissionId = '1';