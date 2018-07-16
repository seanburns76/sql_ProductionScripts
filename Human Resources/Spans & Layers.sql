

with base as (
select 
base.EMPLOYEEID,
base.PERSONFULLNAME,
base.SUPERVISORID,
base.SUPERVISORFULLNAME
from eTime_Employee base)


select * 
from 
(
select 
ISNULL(l1.PERSONFULLNAME,'') as [Level 1],
ISNULL(l2.PERSONFULLNAME,'') as [Level 2],
ISNULL(l3.PERSONFULLNAME,'') as [Level 3],
ISNULL(l4.PERSONFULLNAME,'') as [Level 4],
ISNULL(l5.PERSONFULLNAME,'') as [Level 5],
ISNULL(l6.PERSONFULLNAME,'') as [Level 6],
ISNULL(l7.PERSONFULLNAME,'') as [Level 7]
from base l1 left join base l2 on l2.SUPERVISORID=l1.EMPLOYEEID
				left join base l3 on l3.SUPERVISORID=l2.EMPLOYEEID
					left join base l4 on l4.SUPERVISORID=l3.EMPLOYEEID
						left join base l5 on l5.SUPERVISORID=l4.EMPLOYEEID
							left join base l6 on l6.SUPERVISORID=l5.EMPLOYEEID
								left join base l7 on l7.SUPERVISORID=l6.EMPLOYEEID

where l1.SUPERVISORID = 0
) x
where  x.[Level 1] <> ''
and x.[Level 2] <> ''
