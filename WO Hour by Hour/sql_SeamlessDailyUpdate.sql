USE [master]
GO
declare @Load datetime = (select max(LoadDT) from finance.dbo.Seamless)

INSERT INTO Finance.dbo.[SeamlessStage]
           ([row_id]
           ,[workorder_id]
           ,[operation]
           ,[start]
           ,[stop]
           ,[stop_reason]
           ,[stop_comment]
           ,[quantity]
           ,[employee_id]
           ,[workcenter]
           ,[requested_quantity]
           ,[crew_size]
           ,[workorder_part]
		   ,[OpsDate]
		   ,[StartDate]
		   ,[StopDate]
		   ,[completed]
		   ,LoadDT
		   ,[RowStatus])
     
           (select 
		   a.id,
		   a.workorder_id,
		   a.operation,
		   a.start,
		   a.stop,
		   a.stop_reason,
		   left(a.stop_comment,1000) as stop_comment,
		   a.quantity,
		   a.employee_id,
		   a.workcenter,
		   a.requested_quantity,
		   a.crew_size,
		   a.workorder_part,
		   case
			when cast(a.start as time) between '00:00:00' and '03:30:00' and cast(a.stop as time) between '00:00:00' and '03:30:00' then dateadd(d,-1,cast(a.stop as date))
			when cast(a.stop as time) between '00:00:00' and '03:30:00' and cast(a.start as time) < '23:59:59.999' then dateadd(d,-1,cast(a.stop as date)) else cast(a.stop as date) 
			end as OpsDate,
			cast(a.start as date) as StartDate,
			cast(a.stop as date) as StopDate,
			completed,
			getdate() as LoadDT,
			case
				when a.stop is null and datediff(hour,a.start,getdate()) > 48 then -1
				when a.stop is null and  datediff(hour,a.start,getdate()) between 12 and 48 then 0
				when a.stop is null and datediff(hour,a.start,getdate()) < 12 then 1
				when a.stop is not null then 99 end
				 as RowStatus
		   
		   from seamless.portal.workorder.startstop a
		   where 
		    a.start > @Load or a.stop > @Load  or a.stop is null 
		   and a.id > 267479)
		   
GO