
with etime_employee2 as (
select 
e.EMPLOYEEID,
e.PERSONFULLNAME,
e.SUPERVISORID,
e.SUPERVISORFULLNAME,
d.DepartmentDesc
from eTime_Employee e left join Meta_Data.dbo.DepartmentDesc d on d.DepartmentID=RIGHT(left(e.HOMELABORACCOUNT,20),6)
)




select distinct
isnull(a.DepartmentDesc,'') as lev1,
a.PERSONFULLNAME as Name1,
isnull(b.DepartmentDesc,'') as lev2,
b.PERSONFULLNAME as Name2,
isnull(c.DepartmentDesc,'') as lev3,
c.PERSONFULLNAME as Name3,
isnull(d.DepartmentDesc,'') as lev4,
d.PERSONFULLNAME as Name4,
isnull(e.DepartmentDesc,'') as lev5,
e.PERSONFULLNAME as Name5




from etime_employee2 a 
						left join eTime_Employee2 b on b.SUPERVISORID=a.EMPLOYEEID
							left join eTime_Employee2 c on c.SUPERVISORID=b.EMPLOYEEID
								left join eTime_Employee2 d on d.SUPERVISORID=c.EMPLOYEEID
									left join eTime_Employee2 e on e.SUPERVISORID= d.EMPLOYEEID
where a.PERSONFULLNAME = 'Willingham, Barry K' and b.PERSONFULLNAME = 'patrick, dennis c'
