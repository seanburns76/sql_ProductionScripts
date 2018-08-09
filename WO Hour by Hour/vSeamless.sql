
select x.*,c.row_cnt from

(
SELECT
  ROW_NUMBER() OVER (PARTITION BY opsdate, employee_id
  ORDER BY CAST(start AS time) ASC) AS seq,
  OpsDate,
  row_id AS id,
  workcenter AS wc,
  workorder_id AS wo,
  CAST(CONVERT(numeric, operation) AS int) AS op,
  start AS st,
  CAST(start AS date) AS st_date,
  CAST(start AS time) AS st_time,
  DATEPART(HOUR, start) AS st_hour,
  stop AS stp,
  CAST(stop AS date) AS stp_date,
  CAST(stop AS time) AS stp_time,
  DATEPART(HOUR, stop) AS stp_hour,
  quantity AS qc,
  requested_quantity AS rq,
  employee_id AS emp,
  crew_size AS cr,
  stop_reason AS reason,
  stop_comment AS comment,
  DATEDIFF(DAY, start, stop) AS dd,
  DATEDIFF(HOUR, start, stop) AS hd,
  DATEDIFF(SECOND, start, stop) AS sdur,
  DATEDIFF(HOUR, start, stop) AS hdur
FROM vSeamlessToHour 


WHERE stop > start) x left join (select OpsDate,employee_id,count(*) as row_cnt from vSeamlessToHour group by OpsDate,employee_id) c 
	on c.OpsDate=x.OpsDate and c.employee_id=x.emp