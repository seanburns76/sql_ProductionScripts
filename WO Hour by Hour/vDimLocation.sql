
with Dpt as (
select  
BranchCode,
Department as DeptCode,
concat('000',Department) as DeptID,
LocationName as DeptName
 from dimdept where left(workcenter,3) = Department and right(workcenter,2) ='DG')

 select 
 w.BranchCode,
 w.WorkCenter as WorkCenterNum,
 w.LocationName as WorkCenterName,
 d.DeptCode,
 d.DeptID,
 d.DeptName,
 w.WorkCenterType,
 w.PlannedCrewSize,
 w.NumberOfMachines
 

 from dimDept w left join dpt d on d.DeptCode=w.Department

 where right(w.WorkCenter,2) <> 'DG'
and w.BranchCode= '100'
 and d.DeptCode is not null
 and w.LocationName not like '%not%'

