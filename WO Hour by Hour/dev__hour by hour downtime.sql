WITH z
AS (SELECT
 begID,
 endID,
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
begID,
endID,
  st,
  stp,
  sthr,
  stphr,
  fhr,
  lhr
FROM (SELECT
begID,
endID,
  begDT AS st,
  endDT AS stp,
  DATEPART(HOUR, begDT)
  AS sthr,
  DATEPART(HOUR, endDT) AS stphr,
  CASE
    WHEN DATEPART(HOUR, s.begDT) = DATEPART(HOUR, s.endDT) AND
      CAST(s.begDT AS date) = CAST(s.endDT AS date) THEN DATEDIFF(SECOND, s.begDT, s.endDT) / 60.0 
    WHEN DATEPART(HOUR, s.begDT) <> DATEPART(HOUR, s.endDT) AND
      CAST(s.begDT AS date)
      = CAST(s.endDT AS date) THEN 60 - (DATEDIFF(SECOND, TIMEFROMPARTS(DATEPART(HOUR, s.begDT), 0, 0, 0, 0), CAST(s.begDT AS time)) / 60.0)
    ELSE 0.0
  END AS fhr,
  CASE
    WHEN DATEPART(HOUR, s.begDT) = DATEPART(HOUR, s.endDT) AND
      CAST(s.begDT AS date) = CAST(s.endDT AS date) THEN 0
    WHEN DATEPART(HOUR, s.begDT)
      <> DATEPART(HOUR, s.endDT) AND
      CAST(s.begDT AS date) = CAST(s.endDT AS date) THEN DATEDIFF(SECOND, TIMEFROMPARTS(DATEPART(HOUR, s.endDT), 0, 0, 0, 0),
      CAST(s.endDT AS time)) / 60.0
    ELSE 0.0
  END AS lhr
FROM dbo.vDownTimeBase AS s) AS y) AS q)
SELECT
begID,
endID,
  st AS BeginDT,
  stp AS EndDT,
  ophr AS OpHour,
  dur / 60.0 AS DT_Duration

FROM (SELECT
begID,
endID,  
 
  st,
  stp,
  fhr AS ophr,
  fhd AS dur
FROM z AS z_17
UNION
SELECT
begID,
endID,
  st,
  stp,
  lhr AS ophr,
  lhd AS dur
FROM z AS z_16
UNION
SELECT
 begID,
endID,
  st,
  stp,
  h2 AS ophr,
  h2d AS dur
FROM z AS z_15
UNION
SELECT
begID,
endID,
  st,
  stp,
  h3 AS ophr,
  h3d AS dur
FROM z AS z_14
UNION
SELECT
begID,
endID,
  st,
  stp,
  h4 AS ophr,
  h4d AS dur
FROM z AS z_13
UNION
SELECT
begID,
endID,
  st,
  stp,
  h5 AS ophr,
  h5d AS dur
FROM z AS z_12
UNION
SELECT
  begID,
endID,
  st,
  stp,
  h6 AS ophr,
  h6d AS dur
FROM z AS z_11
UNION
SELECT
begID,
endID,
  st,
  stp,
  h7 AS ophr,
  h7d AS dur
FROM z AS z_10
UNION
SELECT
begID,
endID,
  st,
  stp,
  h8 AS ophr,
  h8d AS dur
FROM z AS z_9
UNION
SELECT
begID,
endID,
  st,
  stp,
  h9 AS ophr,
  h9d AS dur
FROM z AS z_8
UNION
SELECT
begID,
endID,
  st,
  stp,
  h10 AS ophr,
  h10d AS dur
FROM z AS z_7
UNION
SELECT
begID,
endID,
  st,
  stp,
  h11 AS ophr,
  h11d AS dur
FROM z AS z_6
UNION
SELECT
begID,
endID,
  st,
  stp,
  h12 AS ophr,
  h12d AS dur
FROM z AS z_5
UNION
SELECT
begID,
endID,
  st,
  stp,
  h13 AS ophr,
  h13d AS dur
FROM z AS z_4
UNION
SELECT
begID,
endID,
  st,
  stp,
  h14 AS ophr,
  h14d AS dur
FROM z AS z_3
UNION
SELECT
begID,
endID,
  st,
  stp,
  h15 AS ophr,
  h15d AS dur
FROM z AS z_2
UNION
SELECT
begID,
endID,
  st,
  stp,
  h16 AS ophr,
  h16d AS dur
FROM z AS z_1) AS p
WHERE (dur > 0)
