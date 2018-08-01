WITH z
AS (SELECT
  wc,
  wo,
  op,
  emp,
  DATEPART(HOUR, st) AS fhr,
  fhr AS fhd,
  DATEPART(HOUR, stp) AS lhr,
  lhr AS lhd,
  st,
  stp,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 1 < q.stphr THEN q.sthr + 1
    ELSE 0
  END AS h2,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 2 < q.stphr THEN q.sthr + 2
    ELSE 0
  END AS h3,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 3 < q.stphr THEN q.sthr + 3
    ELSE 0
  END AS h4,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 4 < q.stphr THEN q.sthr + 4
    ELSE 0
  END AS h5,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 5 < q.stphr THEN q.sthr + 5
    ELSE 0
  END AS h6,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 6 < q.stphr THEN q.sthr + 6
    ELSE 0
  END AS h7,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 7 < q.stphr THEN q.sthr + 7
    ELSE 0
  END AS h8,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 8 < q.stphr THEN q.sthr + 8
    ELSE 0
  END AS h9,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 9 < q.stphr THEN q.sthr + 9
    ELSE 0
  END AS h10,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 10 < q.stphr THEN q.sthr + 10
    ELSE 0
  END AS h11,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 11 < q.stphr THEN q.sthr + 11
    ELSE 0
  END AS h12,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 12 < q.stphr THEN q.sthr + 12
    ELSE 0
  END AS h13,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 13 < q.stphr THEN q.sthr + 13
    ELSE 0
  END AS h14,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 14 < q.stphr THEN q.sthr + 14
    ELSE 0
  END AS h15,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 15 < q.stphr THEN q.sthr + 15
    ELSE 0
  END AS h16,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 16 < q.stphr THEN q.sthr + 16
    ELSE 0
  END AS h17,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 1 < q.stphr THEN 60
    ELSE 0
  END AS h2d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 2 < q.stphr THEN 60
    ELSE 0
  END AS h3d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 3 < q.stphr THEN 60
    ELSE 0
  END AS h4d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 4 < q.stphr THEN 60
    ELSE 0
  END AS h5d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 5 < q.stphr THEN 60
    ELSE 0
  END AS h6d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 6 < q.stphr THEN 60
    ELSE 0
  END AS h7d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 7 < q.stphr THEN 60
    ELSE 0
  END AS h8d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 8 < q.stphr THEN 60
    ELSE 0
  END AS h9d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 9 < q.stphr THEN 60
    ELSE 0
  END AS h10d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 10 < q.stphr THEN 60
    ELSE 0
  END AS h11d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 11 < q.stphr THEN 60
    ELSE 0
  END AS h12d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 12 < q.stphr THEN 60
    ELSE 0
  END AS h13d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 13 < q.stphr THEN 60
    ELSE 0
  END AS h14d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 14 < q.stphr THEN 60
    ELSE 0
  END AS h15d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 15 < q.stphr THEN 60
    ELSE 0
  END AS h16d,
  CASE
    WHEN DATEDIFF(D, q.st, q.stp) = 0 AND
      q.sthr + 16 < q.stphr THEN 60
    ELSE 0
  END AS h17d
FROM (SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  sthr,
  stphr,
  --diff,
  --samehr,
  fhr,
  --mhr,
  lhr
FROM (SELECT
  workcenter AS wc,
  workorder_id AS wo,
  operation AS op,
  employee_id AS emp,
  start AS st,
  stop AS stp,
  DATEPART(HOUR, start) AS sthr,
  DATEPART(HOUR, stop) AS stphr,
  --DATEPART(HOUR,
  --stop) - DATEPART(HOUR, start) AS diff,
  --CASE
  --  WHEN DATEPART(HOUR, s.stop) = DATEPART(HOUR, s.start) THEN 0
  --  ELSE 1
  --END AS samehr,
  --CASE
  --  WHEN DATEPART(HOUR, s.stop)
  --    = DATEPART(HOUR, s.start) THEN 0
  --  ELSE CASE
  --      WHEN DATEDIFF(D, s.start, s.stop) = 1 THEN (DATEDIFF(MINUTE, s.start, '23:59:59.999') + DATEDIFF(MINUTE, '00:00:00.000', s.stop))
  --        / 60.0
  --      ELSE (DATEPART(HOUR, s.stop) - DATEPART(HOUR, DATEADD(HOUR, 1, s.start))) * 60
  --    END
  --END AS mhr,
  case when DATEPART(hour,s.start)=DATEPART(hour,s.stop)  and cast(s.start as date) = cast(s.stop as date) then datediff(SECOND,s.start,s.stop)/60.0/60.0
		when DATEPART(hour,s.start)<>DATEPART(hour,s.stop)  and cast(s.start as date) = cast(s.stop as date) then 
  60 - (DATEDIFF(second, TIMEFROMPARTS(DATEPART(HOUR, s.start), 0, 0, 0, 0), CAST(s.start AS time))/60.0) else 0.0 end AS fhr,
  case when DATEPART(hour,s.start)=DATEPART(hour,s.stop)  and cast(s.start as date) = cast(s.stop as date) then 0
		when DATEPART(hour,s.start)<>DATEPART(hour,s.stop) and cast(s.start as date) = cast(s.stop as date) then
  DATEDIFF(second, TIMEFROMPARTS(DATEPART(HOUR, s.stop), 0, 0, 0, 0), CAST(s.stop AS time))/60.0  else 0.0 end AS lhr
FROM dbo.Seamless AS s) AS y) AS q)



SELECT --* from z
cast(st as date) as OpsDate,
  wc AS WorkCenter,
  wo AS OrderNumber,
  op AS OpSeq,
  emp AS EmployeeID,
  st AS StartDateTime,
  stp AS StopDateTime,
  ophr AS OpsHour,
  dur/60.0 AS Duration
FROM (SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  fhr AS ophr,
  fhd AS dur
FROM z AS z_17
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  lhr AS ophr,
  lhd AS dur
FROM z AS z_16
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h2 AS ophr,
  h2d AS dur
FROM z AS z_15
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h3 AS ophr,
  h3d AS dur
FROM z AS z_14
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h4 AS ophr,
  h4d AS dur
FROM z AS z_13
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h5 AS ophr,
  h5d AS dur
FROM z AS z_12
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h6 AS ophr,
  h6d AS dur
FROM z AS z_11
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h7 AS ophr,
  h7d AS dur
FROM z AS z_10
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h8 AS ophr,
  h8d AS dur
FROM z AS z_9
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h9 AS ophr,
  h9d AS dur
FROM z AS z_8
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h10 AS ophr,
  h10d AS dur
FROM z AS z_7
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h11 AS ophr,
  h11d AS dur
FROM z AS z_6
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h12 AS ophr,
  h12d AS dur
FROM z AS z_5
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h13 AS ophr,
  h13d AS dur
FROM z AS z_4
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h14 AS ophr,
  h14d AS dur
FROM z AS z_3
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h15 AS ophr,
  h15d AS dur
FROM z AS z_2
UNION
SELECT
  wc,
  wo,
  op,
  emp,
  st,
  stp,
  h16 AS ophr,
  h16d AS dur
FROM z AS z_1) AS p
WHERE (dur > 0)
AND (wc IS NOT NULL) 