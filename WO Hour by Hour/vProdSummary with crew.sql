SELECT        x.OpsDate, x.WorkCenter, x.OpsHour, x.ProdHours*c.Crew as ProdHours, x.OpSeq, l.DepartmentCode, l.DepartmentDesc
FROM            (SELECT        OpsDate, WorkCenter, OpsHour, OpSeq, SUM(Duration) AS ProdHours
                          FROM            dbo.vHourByHour_ProdHours AS p
                          GROUP BY OpsDate, WorkCenter, OpsHour, OpSeq) AS x LEFT OUTER JOIN
                         dbo.dimLocation AS l ON l.WorkCenterNum = x.WorkCenter
						 left outer join (select workcenter,operation,AVG(s.crew_size) as Crew
											from vSeamlessToHour s group by s.workcenter,s.operation) c on c.workcenter=x.WorkCenter and c.operation = x.OpSeq
