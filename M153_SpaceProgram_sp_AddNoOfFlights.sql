--*********************************************************
-- SpacePrograms
-- TODO SIMU: Add error handling for incorrect parameters
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
    if (@NoOfFlightsToAdd < 0 and (@ProgramNoOfFlights + @NoOfFlightsToAdd < 0))
    begin
        raiserror('Invalid parameter: The Field @ProgramNoOfFlights must be 0 or higher.', 16, 0)
        return
    end
end;