--*********************************************************
-- SpaceProgram
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_PersonalWorkedOnMission' erstellen
-- Searches for all Personal that worked on a selected mission
------------------------------------------------------------------

-- drop function if exists fn_PersonalWorkedOnMission;
-- go
 
create function fn_PersonalWorkedOnMission (@MissionId int) returns table as 
	return 
		select 
			Mission.MissionId, 
			Mission.MissionName, 
			(Personal.PersonalFirstname + ' ' + PersonalLastname ) AS PersonalName, 
			Job.JobDescription
			from 
				Personal 
				inner join Worked on Personal.PersonalId = Worked.fk_PersonalId
				inner join Mission on Worked.fk_MissionId = Mission.MissionId
				inner join Job on Personal.fk_JobId = Job.JobId
			where 
				Mission.MissionId = @MissionId;

-- SELECT * FROM [dbo].[fn_PersonalWorkedOnMission] (1)
-- GO