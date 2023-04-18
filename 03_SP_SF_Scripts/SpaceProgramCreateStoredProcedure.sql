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

 drop function if exists fn_UncrewedMissions;
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
-- Stored Procedures oefnen/ausfuehren
------------------------------------------------------------------

EXEC fn_UncrewedMissions;