WITH data
AS (SELECT
  ROW_NUMBER() OVER (PARTITION BY x.opsdate, x.employee_id
  ORDER BY x.start) AS empSeq,
  x.*
FROM (SELECT
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
FROM seamless s) x)
SELECT
  db.employee_id,
  db.workcenter AS PrevWC,
  db.workorder_id AS PrevWO,
  db.operation AS PrevOp,
  db.stop_reason,
  db.stop_comment,
  db.stop AS DownBegin,
  de.start AS DownEnd,
  de.workcenter AS PostWC,
  de.workorder_id AS PostWO,
  de.operation AS PostOp
FROM data db
LEFT JOIN data de
  ON de.employee_id = db.employee_id
  AND de.empSeq = db.empSeq + 1
  AND de.OpsDate = db.OpsDate