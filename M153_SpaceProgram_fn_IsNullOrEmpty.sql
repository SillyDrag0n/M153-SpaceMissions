--*********************************************************
-- SpacePrograms
-- TODO SIMU: Add error handling for incorrect parameters
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_IsNullOrEmpty' erstellen
-- Checks if a given Parameter is either NULL or empty 
-- returns either a 1 (true) or 0 (false)
------------------------------------------------------------------
use SpacePrograms
go

drop function if exists fn_IsNullOrEmpty;
go

create function fn_IsNullOrEmpty (@varchar varchar(60)) returns bit as
begin
	declare @bool bit = null;
	if @varchar is null and LEN(@varchar) > 0
	    set @bool = 1;
	else
		set @bool = 0;
	return @bool;
end
go

------------------------------------------------------------------
-- 
-- Tests for stored Function 'fn_IsNotNullOrEmpty'
--
------------------------------------------------------------------

-- Should return 1 (true)
select [dbo].[fn_IsNullOrEmpty] ('')
go
-- returns 1

-- Should return 0 (false)
select [dbo].[fn_IsNullOrEmpty] ('test')
go
-- returns 0