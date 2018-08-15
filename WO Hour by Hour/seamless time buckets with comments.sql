


select
case when datediff(second,st,stp) <=10 then '1:<10' 
	when datediff(second,st,stp) >10 and datediff(second,st,stp) <=30 then '2:11-30'
	when datediff(second,st,stp) >30 and datediff(second,st,stp) <=60 then '3:31-60'
	when datediff(second,st,stp) >60 and datediff(second,st,stp) <=120 then '4:1-2'
	when datediff(second,st,stp) >120 and datediff(second,st,stp) <=300 then '5:2-5'
	when datediff(second,st,stp) >300 and datediff(second,st,stp) <=600 then '6:5-10'
	else '7:>10'
	end as TimeFrame,
reason,
comment
from vSeamless
order by 1
