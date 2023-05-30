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

declare @MissionName_l varchar(50) =    'Stell Ball Run Mission'
declare @MissionSucceeded_l bit =       1
declare @Fk_ProgramId_l int =           23
declare @Fk_DestinationId_l int =       17
declare @Fk_LaunchSiteId_l int =        12

exec sp_AddMission @MissionName_l, @MissionSucceeded_l, @Fk_ProgramId_l, @Fk_DestinationId_l, @Fk_LaunchSiteId_l;
go

------------------------------------------------------------------
-- Test 2: Returns an errormessage since there isn't a matching ProgramId
------------------------------------------------------------------

declare @MissionName_l varchar(50) =    'Jojolion'
declare @MissionSucceeded_l bit =       NULL
declare @Fk_ProgramId_l int =           089635
declare @Fk_DestinationId_l int =       17
declare @Fk_LaunchSiteId_l int =        12

exec sp_AddMission @MissionName_l, @MissionSucceeded_l, @Fk_ProgramId_l, @Fk_DestinationId_l, @Fk_LaunchSiteId_l;
go

------------------------------------------------------------------
-- Test 3: Returns an errormessage since there isn't a matching DestinationId
------------------------------------------------------------------

declare @MissionName_l varchar(50) =    'Stone Ocean Mission'
declare @MissionSucceeded_l bit =       0
declare @Fk_ProgramId_l int =           25
declare @Fk_DestinationId_l int =       4567890
declare @Fk_LaunchSiteId_l int =        15

exec sp_AddMission @MissionName_l, @MissionSucceeded_l, @Fk_ProgramId_l, @Fk_DestinationId_l, @Fk_LaunchSiteId_l;
go
------------------------------------------------------------------
-- Test 4: Returns an errormessage since there isn't a matching LaunchSiteId
------------------------------------------------------------------

declare @MissionName_l varchar(50) =    'Jojolands Mission'
declare @MissionSucceeded_l bit =       NULL
declare @Fk_ProgramId_l int =           20
declare @Fk_DestinationId_l int =       7
declare @Fk_LaunchSiteId_l int =        918128

exec sp_AddMission @MissionName_l, @MissionSucceeded_l, @Fk_ProgramId_l, @Fk_DestinationId_l, @Fk_LaunchSiteId_l;
go