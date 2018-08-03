select 
a.workcenter,
a.workorder_id,
a.employee_id,
a.start,
a.stop
--,quantity
,a.workorder_part
 


from seamless a  
where a.row_id=(select top 1 b.row_id from seamless b 
where b.workorder_id=a.workorder_id 
order by b.start desc)


