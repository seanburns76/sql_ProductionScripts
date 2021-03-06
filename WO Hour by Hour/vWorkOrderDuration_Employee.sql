
with data as (
select 
s.OpsDate,
s.workcenter,
s.workorder_id,
s.operation,
s.start,
s.stop,
s.workorder_part,
s.employee_id


from Seamless s)

select x.*,DATEDIFF(minute,x.StartTime,x.StopTime)/60.0 as Duration
from

(select
b.OpsDate,
b.workcenter as WorkCenter,
b.workorder_id as OrderNumber,
b.operation as OpSeq,
b.employee_id as EmployeeID,
b.workorder_part as PartNumber,
cast(min(b.start) as time) as StartTime,
cast(max(e.stop) as time) as StopTime
from data b left join data e on e.OpsDate=b.OpsDate and e.operation=b.operation and e.workorder_id=b.workorder_id and b.employee_id=e.employee_id
group by 
b.OpsDate,
b.workcenter,
b.workorder_id,
b.operation,
b.employee_id,
b.workorder_part) x