

with data as (
SELECT
  ROW_NUMBER() OVER (PARTITION BY x.opsdate, x.employee_id, x.workcenter,x.workorder_id
  ORDER BY x.row_id asc) AS empSeq,
  x.*,
  CONCAT(x.OpsDate,x.employee_id,x.workcenter,x.workorder_id) as keys
FROM (SELECT
  s.row_id,
  CASE
    WHEN CAST(s.start AS time) BETWEEN '00:00:00.000' AND '03:29:59.999' OR
      CAST(s.stop AS time) BETWEEN '00:00:00.000' AND '03:29:59.999' THEN DATEADD(D, -1, CAST(s.start AS date))
    ELSE CAST(s.stop AS date)
  END AS OpsDate,
  s.employee_id,
  s.start,
  s.stop,
  s.workcenter,
  s.workorder_id,
  s.operation,
  s.stop_reason,
  s.stop_comment
FROM seamless s
WHERE s.workcenter NOT IN ('53001C', '53002C', '53003C', '52001C', '52002C', '52003C')
AND CONCAT(s.workcenter, s.stop_reason) NOT IN ('53001Change Over', '53002Change Over', '53003Change Over', '52001Change Over', '52002Change Over', '52003Change Over')
AND s.start < s.stop) x)


select x.*,x.DurSeconds/60.0/60.0 as DurHours from 
(
select 
b.OpsDate,
b.employee_id,
b.workcenter,
b.workorder_id,
b.stop as beginDown,
e.start as endDown,
b.stop_reason,
b.stop_comment,
  DATEDIFF(second,b.stop,e.start) as DurSeconds
from data b left join data e on e.keys = b.keys and b.empSeq + 1 = e.empSeq and b.OpsDate=e.OpsDate
where  e.start > b.stop

UNION

SELECT
  CASE
    WHEN CAST(s.start AS time) BETWEEN '00:00:00.000' AND '03:29:59.999' OR
      CAST(s.stop AS time) BETWEEN '00:00:00.000' AND '03:29:59.999' THEN DATEADD(D, -1, CAST(s.start AS date))
    ELSE CAST(s.stop AS date)
  END AS OpsDate,
  s.employee_id,
  s.workcenter,
  s.workorder_id,
  
  s.start AS beginDown,
  s.stop AS endDown,
  'Change Over' AS stop_reason,
  s.stop_comment,
  DATEDIFF(second,s.start,s.stop) as DurSeconds
FROM seamless s
WHERE s.workcenter IN ('53001C', '53002C', '53003C', '52001C', '52002C', '52003C')) x 