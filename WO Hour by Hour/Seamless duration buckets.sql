select timeframe, sum(sdur)/60.0/60.0 as secs
from
(
select 

case when datediff(second,st,stp) <=10 then '10 or less' 
	when datediff(second,st,stp) >10 and datediff(second,st,stp) <=30 then '11 sec to 30 sec'
	when datediff(second,st,stp) >30 and datediff(second,st,stp) <=60 then '31 sec to 60 sec'
	when datediff(second,st,stp) >60 and datediff(second,st,stp) <=120 then '1 min to 2 min'
	when datediff(second,st,stp) >120 and datediff(second,st,stp) <=300 then '2 min to 5 min'
	when datediff(second,st,stp) >300 and datediff(second,st,stp) <=600 then '5 min to 10 min'
	else '10 min or greater'	
	end as TimeFrame,
	sdur,
	hdur


	from vSeamless) x
	group by timeframe