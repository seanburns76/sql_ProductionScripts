/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct
e.OpsDate,
e.Employee_ID,
case when e.stop_reason = 'Break' then count(e.Employee_ID) else 0 end as [Break],
case when e.stop_reason = 'Change Over' then count(e.Employee_ID) else 0 end as ChangeOver,
case when e.stop_reason = 'CrewSize' then count(e.Employee_ID) else 0 end as [CrewSize],
case when e.stop_reason = 'Changed Work Function' then count(e.Employee_ID) else 0 end as [Changed Work Function],
case when e.stop_reason = 'Equipment Failure' then count(e.Employee_ID) else 0 end as [Equipment Failure],
case when e.stop_reason = 'Forklift' then count(e.Employee_ID) else 0 end as [Forklift],
case when e.stop_reason = 'Material Unavailable' then count(e.Employee_ID) else 0 end as [Material Unavailable],
case when e.stop_reason = 'Meeting' then count(e.Employee_ID) else 0 end as [Meeting],
case when e.stop_reason = 'Non-conforming material' then count(e.Employee_ID) else 0 end as [Non-conforming material],
case when e.stop_reason = 'None' then count(e.Employee_ID) else 0 end as [None],
case when e.stop_reason = 'Ordered Completed' then count(e.Employee_ID) else 0 end as [Ordered Completed],
case when e.stop_reason = 'Other' then count(e.Employee_ID) else 0 end as [Other],
case when e.stop_reason = 'Shift Over' then count(e.Employee_ID) else 0 end as [Shift Over],
case when e.stop_reason not in 
(
'Break',
'Change Over' ,
'CrewSize' ,
'Changed Work Function' ,
'Equipment Failure' ,
'Forklift' ,
'Material Unavailable' ,
'Meeting' ,
'Non-conforming material' ,
'None' ,
'Ordered Completed',
'Other' ,
'Shift Over' ) then count(e.employee_id) else 0 end as NewReason



  FROM [Finance].[dbo].[vWorkOrder_DownTime] e
  group by e.OpsDate,
  e.employee_id,
  e.stop_reason