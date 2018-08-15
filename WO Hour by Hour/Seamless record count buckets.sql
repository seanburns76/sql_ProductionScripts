select TimeFrame,sum(totalduration) as td from (
select 
case when datediff(second,st,stp) <=10 then '10 or less' 
	when datediff(second,st,stp) >10 and datediff(second,st,stp) <=30 then '11 sec to 30 sec'
	when datediff(second,st,stp) >30 and datediff(second,st,stp) <=60 then '31 sec to 60 sec'
	when datediff(second,st,stp) >60 and datediff(second,st,stp) <=120 then '1 min to 2 min'
	when datediff(second,st,stp) >120 and datediff(second,st,stp) <=300 then '2 min to 5 min'
	when datediff(second,st,stp) >300 and datediff(second,st,stp) <=600 then '5 min to 10 min'
	else '10 min or greater'
	end as TimeFrame,
	--count(*) as Frequency,
	case when datediff(second,st,stp) <=10 then sum( datediff(second,st,stp))
	when datediff(second,st,stp) >10 and datediff(second,st,stp) <=30 then sum( datediff(second,st,stp))
	when datediff(second,st,stp) >30 and datediff(second,st,stp) <=60 then sum( datediff(second,st,stp))
	when datediff(second,st,stp) >60 and datediff(second,st,stp) <=120 then sum( datediff(second,st,stp))
	when datediff(second,st,stp) >120 and datediff(second,st,stp) <=300 then sum( datediff(second,st,stp))
	when datediff(second,st,stp) >300 and datediff(second,st,stp) <=600 then sum( datediff(second,st,stp))
	end as TotalDuration

	
from vSeamless

group by
case when datediff(second,st,stp) <=10 then '10 or less' 
	when datediff(second,st,stp) >10 and datediff(second,st,stp) <=30 then '11 sec to 30 sec'
	when datediff(second,st,stp) >30 and datediff(second,st,stp) <=60 then '31 sec to 60 sec'
	when datediff(second,st,stp) >60 and datediff(second,st,stp) <=120 then '1 min to 2 min'
	when datediff(second,st,stp) >120 and datediff(second,st,stp) <=300 then '2 min to 5 min'
	when datediff(second,st,stp) >300 and datediff(second,st,stp) <=600 then '5 min to 10 min'
	else '10 min or greater'	
	end,
	DATEDIFF(second,st,stp)) x where x.TotalDuration is not null group by TimeFrame