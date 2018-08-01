

with data as 
(
select
b.OpsDate,
b.DepartmentID,
b.StartHour,
b.EndHour,
b.StartHourInt as h1,
b.StartHourDur as h1d,
case when b.StartHourInt + 1< b.EndHourInt then b.StartHourInt + 1 else 99 end as h2,
case when b.StartHourInt + 1< b.EndHourInt then 1 else 0 end as h2d,
case when b.StartHourInt + 2< b.EndHourInt then b.StartHourInt + 2 else 99 end as h3,
case when b.StartHourInt + 2< b.EndHourInt then 1 else 0 end as h3d,
case when b.StartHourInt + 3< b.EndHourInt then b.StartHourInt + 3 else 99 end as h4,
case when b.StartHourInt + 3< b.EndHourInt then 1 else 0 end as h4d,
case when b.StartHourInt + 4< b.EndHourInt then b.StartHourInt + 4 else 99 end as h5,
case when b.StartHourInt + 4< b.EndHourInt then 1 else 0 end as h5d,
case when b.StartHourInt + 5< b.EndHourInt then b.StartHourInt + 5 else 99 end as h6,
case when b.StartHourInt + 5< b.EndHourInt then 1 else 0 end as h6d,
case when b.StartHourInt + 6< b.EndHourInt then b.StartHourInt + 6 else 99 end as h7,
case when b.StartHourInt + 6< b.EndHourInt then 1 else 0 end as h7d,
case when b.StartHourInt + 7< b.EndHourInt then b.StartHourInt + 7 else 99 end as h8,
case when b.StartHourInt + 7< b.EndHourInt then 1 else 0 end as h8d,
case when b.StartHourInt + 8< b.EndHourInt then b.StartHourInt + 8 else 99 end as h9,
case when b.StartHourInt + 8< b.EndHourInt then 1 else 0 end as h9d,
case when b.StartHourInt + 9< b.EndHourInt then b.StartHourInt + 9 else 99 end as h10,
case when b.StartHourInt + 9< b.EndHourInt then 1 else 0 end as h10d,
case when b.StartHourInt + 10< b.EndHourInt then b.StartHourInt + 10 else 99 end as h11,
case when b.StartHourInt + 10< b.EndHourInt then 1 else 0 end as h11d,
case when b.StartHourInt + 11< b.EndHourInt then b.StartHourInt + 11 else 99 end as h12,
case when b.StartHourInt + 11< b.EndHourInt then 1 else 0 end as h12d,
b.EndHourInt as eh,
b.EndHourDur as ehd


 
from 



(
select 
a.OpsDate,
a.DepartmentID,
a.EmpID,
a.EmpName,
a.[PAY CODE],
a.starthour,
a.EndHour,
a.StartHourInt,
(60 - a.StartMinInt)/60.0 as StartHourDur,
a.EndHourInt,
a.EndMinInt/60.0 as EndHourDur


from (
select 
cast(APPLYDATE as Date) as OpsDate,
Name as EmpName,
id as EmpID,
DepartmentID,
[pay code],
cast(STARTDATE as Date) as StartDate,
cast(ENDDATE as Date) as EndDate,
cast(startdate as time) as StartHour,
cast(ENDDATE as time) as EndHour,
datepart(HOUR,startdate) as StartHourInt,
datepart(MINUTE,startdate) as StartMinInt,
datepart(HOUR,ENDDATE) as EndHourInt,
DATEPART(minute,enddate) as EndMinInt
from eTimeHours
where APPLYDATE > '20180101' and [PAY CODE] in ('REG1','OT1') ) a
) b )

select * from (
select opsdate,departmentid,h1 as opsHour,sum(h1d) as Duration from data where h1d > 0 group by opsdate,departmentid,h1 union
select opsdate,departmentid,h2 as opsHour,sum(h2d) as Duration from data where h2d > 0 group by opsdate,departmentid,h2 union
select opsdate,departmentid,h3 as opsHour,sum(h3d) as Duration from data where h3d > 0 group by opsdate,departmentid,h3 union
select opsdate,departmentid,h4 as opsHour,sum(h4d) as Duration from data where h4d > 0 group by opsdate,departmentid,h4 union
select opsdate,departmentid,h5 as opsHour,sum(h5d) as Duration from data where h5d > 0 group by opsdate,departmentid,h5 union
select opsdate,departmentid,h6 as opsHour,sum(h6d) as Duration from data where h6d > 0 group by opsdate,departmentid,h6 union
select opsdate,departmentid,h7 as opsHour,sum(h7d) as Duration from data where h7d > 0 group by opsdate,departmentid,h7 union
select opsdate,departmentid,h8 as opsHour,sum(h8d) as Duration from data where h8d > 0 group by opsdate,departmentid,h8 union
select opsdate,departmentid,h9 as opsHour,sum(h9d) as Duration from data where h9d > 0 group by opsdate,departmentid,h9 union
select opsdate,departmentid,h10 as opsHour,sum(h10d) as Duration from data where h10d > 0 group by opsdate,departmentid,h10 union
select opsdate,departmentid,h11 as opsHour,sum(h11d) as Duration from data where h11d > 0 group by opsdate,departmentid,h11 union
select opsdate,departmentid,h12 as opsHour,sum(h12d) as Duration from data where h12d > 0 group by opsdate,departmentid,h12 


) x 


