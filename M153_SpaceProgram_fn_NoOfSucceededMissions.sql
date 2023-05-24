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

create function fn_NoOfSucceededMissions(@ProgramId int) returns table as 
    return
        select 
			Count(Mission.MissionSucceeded) as 'No of Succeeded Missions'
        from 
            Mission 
        where Mission.fk_ProgramId = @ProgramId and Mission.MissionSucceeded = 1;
go

------------------------------------------------------------------
-- 
-- Tests for stored Function 'fn_NoOfSucceededMissions'
--
------------------------------------------------------------------

-- Should return a set of data if a program with succeeded missions exists:

select * from [dbo].[fn_NoOfSucceededMissions] ('2')
go

------------------------------------------------------------------

-- Should return an empty set of data if there isn't a matching @ProgramId:

select * from [dbo].[fn_NoOfSucceededMissions] ('120294128')
go

------------------------------------------------------------------

-- Should return a set of data if a program with succeeded missions exists:

select * from [dbo].[fn_NoOfSucceededMissions] ('3')
go

------------------------------------------------------------------