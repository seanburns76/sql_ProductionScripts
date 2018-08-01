
WITH z
AS (SELECT
  q.wc,
  q.wo,
  q.op,
  q.emp,
  DATEPART(HOUR, q.st) AS fhr,
  q.fhr AS fhd,
  DATEPART(HOUR, q.stp) AS lhr,
  q.lhr AS lhd,
  q.st,
  q.stp,

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
  
  y.wc,
  y.wo,
  y.op,
  y.emp,
  y.st,
  y.stp,
  y.sthr,
  y.stphr,
  y.diff,
  y.samehr,
  y.fhr,
  y.mhr,

  y.lhr





FROM (SELECT
  
  s.workcenter AS wc,
  s.workorder_id AS wo,
 s.stop_reason as op,
  s.employee_id AS emp,
  s.beginDown AS st,
  s.endDown AS stp,
  DATEPART(HOUR, s.beginDown) AS sthr,
  DATEPART(HOUR, s.endDown) AS stphr,
  DATEPART(HOUR, s.endDown) - DATEPART(HOUR, s.beginDown) AS diff,
  CASE
    WHEN DATEPART(HOUR, s.endDown) = DATEPART(HOUR, s.beginDown) THEN 0
    ELSE 1
  END AS samehr,

  CASE
    WHEN DATEPART(HOUR, s.endDown) = DATEPART(HOUR, s.beginDown) THEN 0
    ELSE CASE
        WHEN DATEDIFF(D, s.beginDown, s.endDown) = 1 THEN (DATEDIFF(MINUTE, s.beginDown, '23:59:59.999') + DATEDIFF(MINUTE, '00:00:00.000', s.endDown)) / 60.0
        ELSE (DATEPART(HOUR, s.endDown) - DATEPART(HOUR, DATEADD(HOUR, 1, s.beginDown))) * 60
      END
  END AS mhr,

  60 - DATEDIFF(MINUTE, TIMEFROMPARTS(DATEPART(HOUR, s.beginDown), 0, 0, 0, 0), CAST(s.beginDown AS time)) AS fhr,

  s.endDown,
  DATEDIFF(MINUTE, TIMEFROMPARTS(DATEPART(HOUR, s.endDown), 0, 0, 0, 0), CAST(s.endDown AS time)) AS lhr
FROM vWorkOrder_DownTime s) y) q)

SELECT
  *
FROM (SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.fhr AS ophr,
  z.fhd AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.lhr AS ophr,
  z.lhd AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h2 AS ophr,
  z.h2d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h3 AS ophr,
  z.h3d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h4 AS ophr,
  z.h4d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h5 AS ophr,
  z.h5d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h6 AS ophr,
  z.h6d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h7 AS ophr,
  z.h7d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h8 AS ophr,
  z.h8d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h9 AS ophr,
  z.h9d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h10 AS ophr,
  z.h10d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h11 AS ophr,
  z.h11d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h12 AS ophr,
  z.h12d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h13 AS ophr,
  z.h13d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h14 AS ophr,
  z.h14d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h15 AS ophr,
  z.h15d AS dur
FROM z
UNION
SELECT
  z.wc,
  z.wo,
  z.op,
  z.emp,
  z.st,
  z.stp,
  z.h16 AS ophr,
  z.h16d AS dur
FROM z) p

WHERE p.dur > 0 and p.wc is not null