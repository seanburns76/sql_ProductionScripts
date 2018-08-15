


select
x.employee_id as emp,
b1.workcenter as wc,
b1.workorder_id as wo,
b1.OpSeq as op,
b1.crew_size as cs,
b1.quantity as q,
b1.requested_quantity as rq,
b1.workorder_part as part,
e1.workorder_id as nwo,
x.begDT,
e1.start as endDT,
datediff(second,b1.stop,e1.start)/60.0/60.0 as hDur,
b1.stop_reason as reason,
b1.stop_comment as comment
from
(
select 
b.employee_id,
b.row_id as begID,
b.stop as begDT,
(select top 1 e.row_id  from vSeamlessToHour e where e.employee_id=b.employee_id and e.start>b.stop order by start asc) as endID
from vSeamlessToHour b where b.workcenter not in (
'52005C',
'53001C',
'52004C',
'52003C',
'53002C',
'53003C')
and b.stop_reason <> 'Change Over'
) x left join vSeamlessToHour b1 on b1.row_id=x.begID
		left join vSeamlessToHour e1 on e1.row_id=x.endID
union

select 
employee_id as emp,
workcenter as wc,
workorder_id as wo,
OpSeq as op,
crew_size as cs,
quantity as q,
requested_quantity as rq,
workorder_part as part,
'' as nwo,
start as begDT,
stop as endDT,
datediff(second,start,stop)/60.0/60.0 as hDur,
stop_reason as reason,
stop_comment as comment
from vSeamlessToHour
where workcenter in (
'52005C',
'53001C',
'52004C',
'52003C',
'53002C',
'53003C')

		


