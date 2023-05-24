--****************************************************************
-- SpacePrograms
--****************************************************************

------------------------------------------------------------------
-- Stored Procedures erstellen
-- Used to register a new Space Mission
------------------------------------------------------------------
use SpacePrograms
go

drop procedure if exists sp_AddMission;
go

create procedure sp_AddMission
    @MissionName varchar(50), 
    @MissionSucceeded bit = null, 
    @Fk_ProgramId int, 
    @Fk_DestinationId int, 
    @Fk_LaunchSiteId int
as begin
    if (ISNULL(@MissionName, '') = '' or LEN(@MissionName) > 50)
    begin
        raiserror('Invalid parameter: @MissionName cannot be NULL.', 16, 0)
        return
    end
    if (ISNULL(@Fk_ProgramId, 0) = 0)
    begin
        raiserror('Invalid parameter: @Fk_ProgramId cannot be NULL.', 16, 0)
        return
    end
    if (ISNULL(@Fk_DestinationId, 0) = 0)
    begin
        raiserror('Invalid parameter: @Fk_DestinationId cannot be NULL.', 16, 0)
        return
    end
    if (ISNULL(@Fk_LaunchSiteId, 0) = 0)
    begin
        raiserror('Invalid parameter: @Fk_LaunchSiteId cannot be NULL.', 16, 0)
        return
    end
    if not exists(select Program.ProgramId from Program where Program.ProgramId = @Fk_ProgramId)
    begin
        raiserror('Invalid parameter: @Fk_ProgramId could not find a matching program with the given Id.', 16, 0)
        return
    end
    if not exists(select Destination.DestinationId from Destination where Destination.DestinationId = @Fk_DestinationId)
    begin
        raiserror('Invalid parameter: @Fk_DestinationId could not find a matching destination with the given Id.', 16, 0)
        return
    end
    if not exists(select LaunchSite.LaunchSiteId from LaunchSite where LaunchSite.LaunchSiteId = @Fk_LaunchSiteId)
    begin
        raiserror('Invalid parameter: @Fk_LaunchSiteId could not find a matching launch site with the given Id.', 16, 0)
        return
    end
    
	print('Validation succeeded');
    
	begin
		insert into Mission (MissionName, MissionSucceeded, fk_ProgramId, fk_DestinationId, fk_LaunchSiteId)
		values
		(
		    @Missionname,
		    @MissionSucceeded,
		    @Fk_ProgramId, 
		    @Fk_DestinationId, 
		    @Fk_LaunchSiteId
		);
	end;
end;
go

------------------------------------------------------------------
-- 
-- Tests for stored procedure 'sp_AddMission'
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
