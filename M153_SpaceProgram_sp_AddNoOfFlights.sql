--*********************************************************
-- SpacePrograms
-- TODO SIMU: Add tests for stored procedure
--*********************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
-- Used to adjust the 'ProgramNoOfFlights' field
-- set raiserror severity level to 16 which indicates user errors.
------------------------------------------------------------------
use SpacePrograms
go

drop procedure if exists sp_AddNoOfFlights;
go

create procedure sp_AddNoOfFlights
    @ProgramId int,
    @NoOfFlightsToAdd int
as begin
    if (ISNULL(@ProgramId, 0) = 0)
    begin
        raiserror('Invalid parameter: @ProgramId cannot be NULL.', 16, 0)
        return
    end
    if (ISNULL(@NoOfFlightsToAdd, 0) = 0)
    begin
        raiserror('Invalid parameter: @NoOfFlightsToAdd cannot be NULL.', 16, 0)
        return
    end
    if not exists (select 1 from Program where Program.ProgramId = @ProgramId)
    begin
        raiserror('Invalid parameter: We could not match the given ProgramId with an existing Program.', 16, 0)
        return
    end
    if (@NoOfFlightsToAdd < 0 or ((select Program.ProgramNoOfFlights from Program where Program.ProgramId = @ProgramId) + @NoOfFlightsToAdd < 0))
    begin
        raiserror('Invalid parameter: The Field @ProgramNoOfFlights must be 0 or higher.', 16, 0)
        return
    end
    
    update Program 
        set Program.ProgramNoOfFlights += @NoOfFlightsToAdd 
        where Program.ProgramId = @ProgramId;
end;
go
-----------------------------------------------------------------------
-- 
-- Tests for stored procedure 'sp_AddNoOfFlights'
--
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- Test 1: adds the value 'NoOfFlights' of a specific data entry
-----------------------------------------------------------------------

declare @ProgramId int =        '25'
declare @NoOfFlightsToAdd int = '4'

exec sp_AddNoOfFlights @ProgramId, @NoOfFlightsToAdd;
go

-----------------------------------------------------------------------
-- Test 2: tries to add to a non existing Program and returns an errormessage
-----------------------------------------------------------------------

declare @ProgramId int =        109129
declare @NoOfFlightsToAdd int = 9

exec sp_AddNoOfFlights @ProgramId, @NoOfFlightsToAdd;
go

-----------------------------------------------------------------------
-- Test 3: tries to add a negative number and returns an errormessage
-----------------------------------------------------------------------

declare @ProgramId int =        '22'
declare @NoOfFlightsToAdd int = '-5'

exec sp_AddNoOfFlights @ProgramId, @NoOfFlightsToAdd;
go