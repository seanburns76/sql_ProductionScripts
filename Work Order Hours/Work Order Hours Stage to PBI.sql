

SET DATEFIRST 1;
with data as (select
x.[Week Start Date],
x.WorkCenter,
d.WorkCenterDesc,
d.WorkCenterType,
d.DepartmentCode as Department,
d.DepartmentDesc,
d.PlannedCrewSize,
sum(x.StandardMachine) as StandardMachine,
sum(x.StandardLabor)  as StandardLabor,
sum(x.StandardMachine) +
sum(x.StandardLabor)  as TTL_Standard,
sum(x.PlannedMachine) as PlannedMachine,
sum(x.PlannedLabor) as PlannedLabor,
sum(x.Planned_WOHrs) as Planned_WOHrs,
sum(x.SetUp) as PlannedSetup,
sum(x.ActualMachine) as ActualMachine,
sum(x.ActualLabor) as ActualLabor,
sum(x.Actual_WOHrs) as Actual_WOHrs,
sum(x.SetUp) as ActualSetup

from




(


SELECT
  DATEADD(dd, -(DATEPART(dw, w.OpsDate)) + 1, w.OpsDate) AS [Week Start Date],
  WorkCenter,
  WorkCenterDesc,
 
  case
	when RunMach=0 or srp4 = 'lbr' then 0 else StdCom_Hrs end as StandardMachine,
	case 
		when RunLab=0 or srp4 = 'lbr' then 0 else StdCom_Hrs end as StandardLabor,
		case
			when RunMach=0 or SRP4='lbr' then 0 else WO_Hrs end as PlannedMachine,
			case
				when RunLab=0 or SRP4='lbr' then 0 else WO_Hrs end as PlannedLabor,
				case
					when SRP4='lbr' then WO_Hrs else 0 end as Planned_WOHrs,
					case
						when WorkCenterType = 'Machine' and SRP4<>'lbr' then ACT_Hrs else 0 end as ActualMachine,
						case 
							when WorkCenterType = 'Labor' and SRP4<>'lbr' then ACT_Hrs else 0 end as ActualLabor,
							case
								when SRP4 ='lbr' then ACT_Hrs else 0 end as Actual_WOHrs,
								SetUp 
						


from WorkOrderHours w
  ) x left join dimLocation d on d.WorkCenterNum = x.WorkCenter

  group by 
  x.[Week Start Date],
  x.WorkCenter,
  d.WorkCenterDesc,
  d.DepartmentCode,
 d.DepartmentDesc,
  d.WorkCenterType,
  d.PlannedCrewSize)

select c.*,c.TTL_PlannedLabor+c.TTL_PlannedMachine as TTL_Planned_Hrs
from (
  select 
b.*,
case
	when b.WorkCenterType='Machine' then (b.PlannedMachine*b.PlannedCrewSize)+(b.PlannedSetup*b.PlannedCrewSize) else 0 end as TTL_PlannedMachine,
case 
	when b.WorkCenterType = 'Labor' then 
	b.Planned_WOHrs+b.PlannedLabor+b.PlannedSetup else 0 end as TTL_PlannedLabor
  from data b) c where c.Planned_WOHrs = 53