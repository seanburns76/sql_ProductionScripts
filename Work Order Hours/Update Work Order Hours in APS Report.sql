









update WorkOrderHours   --table being updated

set Department = t.DepartmentCode,
	DepartmentDesc = t.DepartmentDesc,
	CrewSize = t.PlannedCrewSize,
	WorkCenterType = t.WorkCenterType
    
       --column(s) being updated from the columns in other table that are updating

from WorkOrderHours d	 --table being updated

inner join dimLocation t on t.WorkCenterNum = d.WorkCenter --join the tables

where d.WorkCenter = t.WorkCenterNum   --and CrewSize is null  --constraints


