WITH data
AS (SELECT
  ROW_NUMBER() OVER (PARTITION BY x.opsdate, x.employee_id, x.workcenter, x.workorder_id
  ORDER BY x.row_id ASC) AS empSeq,
  x.*,
  CONCAT(x.OpsDate, x.employee_id, x.workcenter, x.workorder_id) AS keys
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
  s.crew_size,
  s.stop_reason,
  s.stop_comment,
  s.workorder_part
FROM seamless s
WHERE s.workcenter NOT IN ('53001C', '53002C', '53003C', '52001C', '52002C', '52003C')
AND CONCAT(s.workcenter, s.stop_reason) NOT IN ('53001Change Over', '53002Change Over', '53003Change Over',
'52001Change Over', '52002Change Over', '52003Change Over')
AND s.start < s.stop) x)
SELECT
  x.*,
  x.DurSeconds / 60.0 / 60.0 AS DurHours
  --x.dursecondsbase /60.0/60.0 as DurSecondsBase
FROM (SELECT
  b.OpsDate,
  b.employee_id,
  b.workcenter,
  b.operation,
  b.crew_size,
  b.workorder_id,
  b.stop AS beginDown,
  e.start AS endDown,
  b.stop_reason,
  b.stop_comment,
  b.workorder_part,
  --DATEDIFF(SECOND, b.stop, e.start) as DurSecondsBase,
  DATEDIFF(SECOND, b.stop, e.start)*b.crew_size AS DurSeconds

FROM data b
LEFT JOIN data e
  ON e.keys = b.keys
  AND b.empSeq + 1 = e.empSeq
  AND b.OpsDate = e.OpsDate
WHERE e.start > b.stop
UNION
SELECT
  CASE
    WHEN CAST(s.start AS time) BETWEEN '00:00:00.000' AND '03:29:59.999' OR
      CAST(s.stop AS time) BETWEEN '00:00:00.000' AND '03:29:59.999' THEN DATEADD(D, -1, CAST(s.start AS date))
    ELSE CAST(s.stop AS date)
  END AS OpsDate,
  s.employee_id,
  s.workcenter,
  s.operation,
  s.crew_size,
  s.workorder_id,
  s.start AS beginDown,
  s.stop AS endDown,
  'Change Over' AS stop_reason,
  s.stop_comment,
  s.workorder_part,
  --DATEDIFF(SECOND, s.start, s.stop) as DurSecondsBase,
  DATEDIFF(SECOND, s.start, s.stop)*s.crew_size AS DurSeconds
FROM seamless s
WHERE s.workcenter IN ('53001C', '53002C', '53003C', '52001C', '52002C', '52003C')) x