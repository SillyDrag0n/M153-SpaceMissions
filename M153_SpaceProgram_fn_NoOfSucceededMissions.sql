--*********************************************************
-- SpacePrograms
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_NoOfSucceededMissions' erstellen
-- Returns the number of succeeded missions of a specific program
------------------------------------------------------------------
use SpacePrograms
go

drop function if exists fn_NoOfSucceededMissions;
go

create function fn_NoOfSucceededMissions(@MissionId int) returns @NoOfSucceededMissions int as
begin
	declare @NoOfSucceededMissions int = null;
	
	return @NoOfSucceededMissions;
end
go

------------------------------------------------------------------
-- 
-- Tests for stored Function 'fn_NoOfSucceededMissions'
--
------------------------------------------------------------------

-- Should return a set of data similar to this:
-- Mission Id    MissionName    PersonalName    JobDescription
-- 2	         Apollo 13	    Rick Sanchez	Scientist

select * from [dbo].[fn_NoOfSucceededMissions] ('2')
go

-- returns:
-- Mission Id    MissionName    PersonalName    JobDescription
-- 2	         Apollo 13	    Rick Sanchez	Scientist

------------------------------------------------------------------