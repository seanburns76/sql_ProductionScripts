use master;
declare @load date = (select max(cast(applydate as date)) from finance.dbo.eTimeHours)
--declare @loadplus date = dateadd(d,7,@load)

insert into finance.dbo.eTimeHoursStage (
[APPLYDATE]
      ,[Name]
      ,[ID]
      ,[Account]
      ,[DepartmentID]
      ,[PAY CODE]
      ,[Hrs]
      ,[Payroll_Status]
      ,[Employee_status]
      ,[HFMCODE]
      ,[STARTDATE]
      ,[ENDDATE]
	  ,LoadDT
   
)

(select *,getdate() as LoadDT from usnewsdmartdg.etime.[dbo].[vw_ASSA_VP_OT_AMERISTAR]
where cast(applydate as date) > @load --and cast(applydate as date) <= @loadplus )

