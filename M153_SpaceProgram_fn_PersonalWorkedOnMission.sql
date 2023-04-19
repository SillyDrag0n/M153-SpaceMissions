--*********************************************************
-- SpacePrograms
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_PersonalWorkedOnMission' erstellen
-- Searches for all Personal that worked on a selected mission
------------------------------------------------------------------
use SpacePrograms
go

drop function if exists fn_PersonalWorkedOnMission;
go

--	if (select * from Worked where Mission.MissionId = Worked.fk_MissionId) != null 
--		return 'This seems to be either an uncrewed mission or an incorrect MissionId. Make sure you have entered the right MissionId and try again';
--	else

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
go

------------------------------------------------------------------
-- 
-- Tests for stored Function 'fn_PersonalWorkedOnMission'
--
------------------------------------------------------------------

-- Should return a set of data similar to this:
-- Mission Id    MissionName    PersonalName    JobDescription
-- 2	         Apollo 13	    Rick Sanchez	Scientist

select * from [dbo].[fn_PersonalWorkedOnMission] ('2')
go

-- returns:
-- Mission Id    MissionName    PersonalName    JobDescription
-- 2	         Apollo 13	    Rick Sanchez	Scientist

------------------------------------------------------------------