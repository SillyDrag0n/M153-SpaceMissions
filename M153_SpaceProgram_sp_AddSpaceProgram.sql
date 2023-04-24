--****************************************************************
-- SpacePrograms
-- TODO SIMU: Line 28 - Der Argumentdatentyp date ist für das 1-Argument der isdate-Funktion ungültig.
--****************************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
------------------------------------------------------------------
use SpacePrograms
go

drop procedure if exists sp_AddSpaceProgram;
go

create procedure sp_AddSpaceProgram
    @ProgramName varchar(50), 
    @ProgramStartDate date, 
    @ProgramEndDate date, 
    @ProgramBudget decimal(16,2), 
    @ProgramNoOfFlights int
as
    if (ISNULL(@ProgramName, 0) = 0 or LEN(@ProgramName) > 50)
    begin
        raiserror('Invalid parameter: @ProgramName cannot be NULL or longer than 50', 18, 0)
        return
    end

    if (ISDATE(@ProgramStartDate) = 0)
    begin
        raiserror('Invalid parameter: @ProgramStartDate has the wrong format. Must be yyyy-mm-dd', 18, 0)
        return
    end

    if (ISNULL(@ProgramBudget, 0) = 0 or SQL_VARIANT_PROPERTY(@ProgramBudget, 'Precision') > 16 or SQL_VARIANT_PROPERTY(@ProgramBudget, 'Scale') > 2)
    begin
        raiserror('Invalid parameter: @ProgramBudget cannot be NULL or has the wrong format. Must be decimal(16, 2)', 18, 0)
        return
    end

    if (ISNULL(@ProgramNoOfFlights, 0) = 0)
    begin
        raiserror('Invalid parameter: @ProgramNoOfFlights cannot be NULL', 18, 0)
        return
    end

	print('Validation succeeded');

	begin
		insert into Program (ProgramName, ProgramStartDate, ProgramEndDate, ProgramBudget, ProgramNoOfFlights)
		values
		(
		    @ProgramName,
		    @ProgramStartDate,
		    @ProgramEndDate, 
		    @ProgramBudget, 
		    @ProgramNoOfFlights
		);
	end

------------------------------------------------------------------
-- 
-- Tests for stored procedure 'sp_AddSpaceProgram'
--
------------------------------------------------------------------