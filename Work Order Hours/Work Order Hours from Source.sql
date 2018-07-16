



SELECT 
X.OPSDATE,
X.ORDERNUMBER,
X.BUSINESSUNIT,
X.WORKCENTER,
X.WORKCENTER_DESC AS WORKCENTERDESC,
X.ITEM,
X.PARTNUMBER,
X.OPSEQ,
IFNULL(X.TIMEBASE,'') AS TIMEBASE,
X.PLANNED_MACHINE + X.PLANNED_LABOR AS WO_HRS,
X.ACTUAL_MACHINE + X.ACTUAL_LABOR AS ACT_HRS,
IFNULL (X.RUNMACH,0) AS RUNMACH,
IFNULL (X.RUNLAB,0) AS RUNLAB,
IFNULL (X.SETUP,0) AS SETUP,
IFNULL ((X.RUNMACH + X.RUNLAB)*X.REQQTY *


(CASE
	WHEN X.TIMEBASE = 'U' THEN 1
	WHEN X.TIMEBASE = '1' THEN .1
	WHEN X.TIMEBASE = '2' THEN .01
	WHEN X.TIMEBASE = '3' THEN .001
	WHEN X.TIMEBASE = '4' THEN .0001 END),0) AS STANDARD_HRS,


IFNULL ((X.RUNMACH + X.RUNLAB)*X.SHIPQTY *


(CASE
	WHEN X.TIMEBASE = 'U' THEN 1
	WHEN X.TIMEBASE = '1' THEN .1
	WHEN X.TIMEBASE = '2' THEN .01
	WHEN X.TIMEBASE = '3' THEN .001
	WHEN X.TIMEBASE = '4' THEN .0001 END),0) AS STDCOM_HRS,
	
CURRENT_DATE  AS LoadDate,	

x.SRP1,
X.SRP4,
X.PRP4


FROM
(
SELECT

QGPL.CD(WLSTRX) AS OPSDATE,
WLDOCO AS ORDERNUMBER,
WLMMCU AS BUSINESSUNIT,
TRIM(WLMCU) AS WORKCENTER,
WLDSC1 AS WORKCENTER_DESC,
WLKIT AS ITEM,
WLKITL AS PARTNUMBER,
WLOPSQ/100 AS OPSEQ,
IRTIMB AS TIMEBASE,
WLLABA *.01 AS ACTUAL_LABOR,
WLMACA *.01 AS ACTUAL_MACHINE,
WLRUNL *.01 AS PLANNED_LABOR,
WLRUNM *.01 AS PLANNED_MACHINE,
IRRUNM *.01 AS RUNMACH,
IRRUNL *.01 AS RUNLAB,
IRSETL*.01 AS SETUP,
WLSETC*.01 AS CREWSIZE,
WLSOCN AS SCRAP,
WLSOQS AS SHIPQTY,
WLUORG AS REQQTY,
IMSRP1 AS SRP1,
IMSRP4 AS SRP4,
IMPRP4 AS PRP4



FROM F3112LA 
	LEFT JOIN F3003LC 
		ON WLMMCU = IRMMCU
			AND WLMCU = IRMCU
				AND WLKIT = IRKIT
					AND WLOPSQ = IROPSQ
						--AND WLTIMB = IRTIMB
							AND WLTRT = IRTRT
	LEFT JOIN 	F4101 
		ON IMITM = WLKIT
			AND IMLITM = WLKITL 
WHERE 							
WLSTRX >= 
( 
	(substr(year(current date - 6 DAYS),2,1)+1) || 
	substr(year(current date - 6 DAYS),3,2) || 
	(CASE 	WHEN dayofyear(current date - 6 DAYS) > 99 THEN ('' || dayofyear(current date - 6 DAYS))
	 	WHEN dayofyear(current date - 6 DAYS) > '9'   THEN ('0' || dayofyear(current date - 6 DAYS))
		ELSE ('00' || dayofyear(current date - 6 DAYS))
	END )
)							

AND 	 TRIM( wlmcu ) IN ( '20101',
'43077',
'51101',
'52003',
'52003C',
'52004',
'52004C',
'52005',
'52005C',
'53001',
'53001C',
'53002',
'53003',
'53004',
'54012',
'54013',
'54014',
'54017A',
'54017B',
'54017C',
'54018A',
'54018B',
'54018C',
'54020',
'54022',
'54024',
'54025',
'54027',
'55001',
'55002',
'55003',
'55004',
'55007',
'55008',
'55502',
'55503',
'55505',
'55506',
'55511',
'56001',
'56002',
'56003',
'56003A',
'56004',
'56005',
'56006',
'56007',
'56577',
'56579',
'57001',
'57002',
'57003',
'57005',
'57006',
'57007',
'57301',
'57302',
'57303',
'57304',
'57305',
'57306',
'57401',
'57601',
'57602',
'57603',
'57606',
'57607',
'58001',
'58002',
'58003',
'58004',
'58006',
'58011',
'58012',
'58090',
'58091',
'58092',
'58094',
'58095',
'58096',
'58099',
'59501',
'59502',
'59503',
'59505',
'59506',
'59511',
'67577',
'67777',
'97602',
'97607',
'42077',
'56009',
'57308',
'58089',
'59504',
'67377',
'67477',
'53002C'
 ) ) X
                             