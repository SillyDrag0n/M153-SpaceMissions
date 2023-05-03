--*********************************************************
-- SpacePrograms
-- TODO SIMU: Add error handling for incorrect parameters
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_UncrewedMissions' erstellen
-- Searches for all missions without any crew members registered
------------------------------------------------------------------
use SpacePrograms
go

drop function if exists fn_UncrewedMissions;
go

create function fn_UncrewedMissions () returns table as 
    return
        select 
            * 
        from 
            Mission 
        where not exists
            (select * 
                from Worked
                where Mission.MissionId = Worked.fk_MissionId
            );
go
------------------------------------------------------------------
-- 
-- Tests for stored Function 'fn_UncrewedMissions'
--
------------------------------------------------------------------

-- Should return a set of data similar to this:
-- MissionId     MissionName     MissionSucceeded   fk_ProgramId fk_DestinationId fk_LaunchSite
-- 10	         Kosmos 57	     0	                6	          19	          3
-- 11	         Voshkod 1	     1	                6	          14	          3
-- 14	         Luna Nights II	 0	                9	          13	          4
-- 15	         Luna Nights III 1	                9	          2	              4
-- 17	         Mir 1	         1	                11 	          16	          3

select * from [dbo].[fn_UncrewedMissions] ()
go

-- returns:
-- MissionId     MissionName     MissionSucceeded   fk_ProgramId fk_DestinationId fk_LaunchSite
-- 10	         Kosmos 57	     0	                6	          19	          3
-- 11	         Voshkod 1	     1	                6	          14	          3
-- 14	         Luna Nights II	 0	                9	          13	          4
-- 15	         Luna Nights III 1	                9	          2	              4
-- 17	         Mir 1	         1	                11 	          16	          3

------------------------------------------------------------------