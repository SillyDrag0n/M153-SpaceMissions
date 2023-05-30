--****************************************************************
-- SpacePrograms
--****************************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
-- Used to register a new person
------------------------------------------------------------------
use SpacePrograms
go

drop procedure if exists sp_AddSpaceProgram;
go

create procedure sp_AddSpaceProgram
    @PersonalFirstname varchar(30), 
    @PersonalLastname varchar(30), 
    @Fk_JobId int, 
    @Fk_OrganisationId int
as begin

    if (ISNULL(@PersonalFirstname, '') = '' or LEN(@PersonalFirstname) > 30)
    begin
        --set raiserror severity level to 16 which indicates user errors.
        raiserror('Invalid parameter: @PersonalFirstname cannot be NULL or longer than 30', 16, 0)
        return
    end

    if (ISNULL(@PersonalLastname, '') = '' or LEN(@PersonalLastname) > 30)
    begin
        --set raiserror severity level to 16 which indicates user errors.
        raiserror('Invalid parameter: @PersonalLastname cannot be NULL or longer than 30', 16, 0)
        return
    end

    if (ISNULL(@Fk_JobId, 0) = 0)
    begin
        raiserror('Invalid parameter: @Fk_JobId cannot be NULL', 16, 0)
        return
    end

    if not exists(select Job.JobId from Job where Job.JobId = @Fk_JobId)
    begin
        raiserror('Invalid parameter: @Fk_JobId could not find a matching job with the given Id.', 16, 0)
        return
    end

    if (ISNULL(@Fk_OrganisationId, 0) = 0)
    begin
        raiserror('Invalid parameter: @Fk_OrganisationId cannot be NULL', 16, 0)
        return
    end

    if not exists(select Organisation.OrganisationId from Organisation where Organisation.OrganisationId = @Fk_OrganisationId)
    begin
        raiserror('Invalid parameter: @Fk_DestinationId could not find a matching organisation with the given Id.', 16, 0)
        return
    end

	print('Validation succeeded');

	begin
		insert into Personal (PersonalFirstname, PersonalLastname, fk_JobId, Fk_OrganisationId)
		values
		(
		    @PersonalFirstname,
		    @PersonalLastname,
		    @Fk_JobId, 
		    @Fk_OrganisationId
		);
	end;
end;
go

------------------------------------------------------------------
-- 
-- Tests for stored procedure 'sp_AddPersonal'
--
------------------------------------------------------------------

------------------------------------------------------------------
-- Test 1: 
------------------------------------------------------------------


------------------------------------------------------------------
-- Test 2:  
------------------------------------------------------------------


------------------------------------------------------------------
-- Test 3: 
------------------------------------------------------------------
