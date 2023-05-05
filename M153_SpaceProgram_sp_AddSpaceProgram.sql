--****************************************************************
-- SpacePrograms
-- TODO SIMU: Line 28 - Der Argumentdatentyp date ist für das 1-Argument der isdate-Funktion ungültig.
-- TODO SIMU: Add Tests
--****************************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
-- Used to register a new Space Program
------------------------------------------------------------------
use SpacePrograms
go

drop procedure if exists sp_AddSpaceProgram;
go

create procedure sp_AddSpaceProgram
    @ProgramName varchar(50), 
    @ProgramStartDate date, 
    @ProgramEndDate date = NULL, 
    @ProgramBudget decimal(16,2),
    @ProgramNoOfFlights int
as begin
	set dateformat YMD;
	-- yyyy/mm/dd

    if (ISNULL(@ProgramName, '') = '' or LEN(@ProgramName) > 50)
    begin
        --set raiserror severity level to 16 which indicates user errors.
        raiserror('Invalid parameter: @ProgramName cannot be NULL or longer than 50', 16, 0)
        return
    end
	
    if (ISDATE(Cast(@ProgramStartDate as varchar)) = 0)
    begin
        raiserror('Invalid parameter: @ProgramStartDate has the wrong format. Must be yyyy-mm-dd', 16, 0)
        return
    end

    if (@ProgramEndDate IS NOT NULL)
    begin
        if(ISDATE(Cast(@ProgramEndDate as varchar)) = 0)
        begin 
            raiserror('Invalid parameter: If @ProgramEndDate is declared, it must have the following format: yyyy-mm-dd', 16, 0)
            return
        end
        if(@ProgramStartDate > @ProgramEndDate)
        begin 
            raiserror('Invalid parameter: @ProgramEndDate Must be greater than @ProgramStartDate. Must be yyyy-mm-dd', 16, 0)
            return
        end
    end

    if (ISNULL(@ProgramBudget, 0) = 0 or SQL_VARIANT_PROPERTY(@ProgramBudget, 'Precision') > 16 or SQL_VARIANT_PROPERTY(@ProgramBudget, 'Scale') > 2)
    begin
        raiserror('Invalid parameter: @ProgramBudget cannot be NULL or has the wrong format. Must be decimal(16, 2)', 16, 0)
        return
    end

    if (ISNULL(@ProgramNoOfFlights, 0) = 0)
    begin
        raiserror('Invalid parameter: @ProgramNoOfFlights cannot be NULL', 16, 0)
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
	end;
end;
go
------------------------------------------------------------------
-- 
-- Tests for stored procedure 'sp_AddSpaceProgram'
--
------------------------------------------------------------------

-- Inserts a new entry into the Program table 

declare @ProgramName_l varchar(50) =       'Test Flight Program'
declare @ProgramStartDate_l date =         '2004-04-26'
declare @ProgramEndDate_l date =           '2004-04-26'
declare @ProgramBudget_l decimal(16,2) =   1050000.00
declare @ProgramNoOfFlights_l int =        9

exec sp_AddSpaceProgram @ProgramName_l, @ProgramStartDate_l, @ProgramEndDate_l, @ProgramBudget_l, @ProgramNoOfFlights_l;
go

-- Inserts a new entry into the Program table 

declare @ProgramName_l varchar(50) =       'Moon Crater Program'
declare @ProgramStartDate_l date =         '2017-08-02'
declare @ProgramEndDate_l date =            NULL
declare @ProgramBudget_l decimal(16,2) =    650000.00
declare @ProgramNoOfFlights_l int =         2

exec sp_AddSpaceProgram @ProgramName_l, @ProgramStartDate_l, @ProgramEndDate_l, @ProgramBudget_l, @ProgramNoOfFlights_l;
go

-- Returns an error because @ProgramStartDate_l can not be greater than @ProgramEndDate_l

declare @ProgramName_l varchar(50) =       'The Faulty Program'
declare @ProgramStartDate_l date =         '2023-05-05'
declare @ProgramEndDate_l date =            '1999-02-12'
declare @ProgramBudget_l decimal(16,2) =    1291.00
declare @ProgramNoOfFlights_l int =         5

exec sp_AddSpaceProgram @ProgramName_l, @ProgramStartDate_l, @ProgramEndDate_l, @ProgramBudget_l, @ProgramNoOfFlights_l;
go