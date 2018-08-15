
select 
LTRIM(rtrim(x.BranchCode)) as BranchCode,
LTRIM(rtrim(x.Workcenter)) as WorkCenter,
LTRIM(rtrim(x.WorkCenter2)) as WorkCenter2,
x.Department,
x.WorkCenterType,
x.PlannedCrewSize,
x.NumberOfMachines,
x.LocationDesc,
x.LocationName
from
(SELECT 
IWMMCU AS BranchCode,
IWMCU AS WorkCenter,
IWMCUW AS WorkCenter2,
IWLOCN AS Department,
iwbfpf AS WorkCenterType,
iwnoma AS NumberOfMachines,
CAST(iwsetc/10 AS int) AS PlannedCrewSize,
mcdc AS LocationDesc,
mcdl01 AS LocationName

FROM as400.s1049zkm.amsdta.f30006 left join as400.s1049zkm.amsdta.f0006 ON mcmcu=IWMCU) x 