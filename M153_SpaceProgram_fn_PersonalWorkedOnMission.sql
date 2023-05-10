--*********************************************************
-- SpacePrograms
-- TODO SIMU: Add error handling for incorrect parameters
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_PersonalWorkedOnMission' erstellen
-- Searches for all Personal that worked on a selected mission
------------------------------------------------------------------
use SpacePrograms
go

drop function if exists fn_PersonalWorkedOnMission;
go

-- create function fn_Umsatzlieferanten()
-- -- returns @LieferantTable table (LieferantName varchar(100), Umsatz decimal(9,2)) as
-- returns table
-- as return 
-- (
-- 	select
-- 		Lieferant.Name, 
-- 		dbo.fn_UmsatzLieferant(LieferantId) as Umsatz 
-- 	from Lieferant
-- );
-- go
-- 
-- use SpacePrograms;
-- go
-- select * from dbo.fn_UmsatzLieferanten()
-- 
-- declare @LieferantenTab table (Name varchar(100), Umsatz decimal (9,2));
-- insert into @LieferantenTab select * from dbo.UmsatzLieferanten();
-- select * from @LieferantenTab;


create function fn_PersonalWorkedOnMission (@MissionId int) returns table as
begin
	declare @WorkedOnMissionTable = null;
	
	if exists (select 1 from Worked	 where Worked.fk_MissionId = @MissionId)
	begin
		set @WorkedOnMissionTable = (
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
			Mission.MissionId = @MissionId);
	end
	return @WorkedOnMissionTable;
end;
go;


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