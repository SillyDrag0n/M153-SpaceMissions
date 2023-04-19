--*********************************************************
-- SpaceProgram
--*********************************************************

------------------------------------------------------------------
-- Stored Function 'fn_IsNotNullOrEmpty' erstellen
-- Checks if a given Parameter is either NULL or empty 
-- returns either a 1 (true) or 0 (false)
------------------------------------------------------------------

drop function if exists fn_IsNotNullOrEmpty;
go

create function fn_IsNotNullOrEmpty (@varchar varchar(60)) returns bit as
begin
	declare @bool bit = null;
	if @varchar is not null and LEN(@varchar) > 0
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

-- Should return 0 (false)
select [dbo].[fn_IsNotNullOrEmpty] ('')
go
-- returns 0

-- Should return 1 (true)
select [dbo].[fn_IsNotNullOrEmpty] ('test')
go
-- returns 1