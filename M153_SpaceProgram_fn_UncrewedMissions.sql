--*********************************************************
-- SpaceProgram
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_UncrewedMissions' erstellen
-- Searches for all missions without any crew members registered
------------------------------------------------------------------

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

-- SELECT * FROM [dbo].[fn_UncrewedMissions] ()
-- GO