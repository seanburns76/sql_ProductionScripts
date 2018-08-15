


select
x.begID,
x.endID,
x.begDT,
e1.start as endDT,
datediff(second,b1.stop,e1.start)/60.0/60.0 as hDur
from
(
select 
b.employee_id,
b.row_id as begID,
b.stop as begDT,
(select top 1 e.row_id  from vSeamlessToHour e where e.employee_id=b.employee_id and e.start>b.stop and e.start < dateadd(hour,8,b.stop) order by start asc) as endID
from vSeamlessToHour b where b.workcenter not in (
'52005C',
'53001C',
'52004C',
'52003C',
'53002C',
'53003C')
and b.stop_reason not in ( 'Change Over','Shift Over')
) x left join vSeamlessToHour b1 on b1.row_id=x.begID
		left join vSeamlessToHour e1 on e1.row_id=x.endID
union

select 
row_id as begID,
1 as endID,
start as begDT,
stop as endDT,
datediff(second,start,stop)/60.0/60.0 as hDur

from vSeamlessToHour
where workcenter in (
'52005C',
'53001C',
'52004C',
'52003C',
'53002C',
'53003C')

		


