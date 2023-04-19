--****************************************************************
-- SpacePrograms
--****************************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
------------------------------------------------------------------

create procedure sp_AddSpaceProgram
@ProgramName varchar(50), @ProgramStartDate date, @ProgramEndDate date, @ProgramBudget decimal(16,2), @ProgramNoOfFlights int
as begin
	insert into Program (Program.ProgramName, Program.ProgramStartDate, Program.ProgramEndDate, Program.ProgramBudget, Program.ProgramNoOfFlights)
	values (@ProgramName, @ProgramStartDate, @ProgramEndDate, @ProgramBudget, @ProgramNoOfFlights);

------------------------------------------------------------------
-- Stored Procedures oefnen/ausfuehren
------------------------------------------------------------------
