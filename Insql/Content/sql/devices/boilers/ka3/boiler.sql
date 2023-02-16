{срезы минутные}
/*ReportName="К-3 расход топлива" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_AI1PV * (1 - ROUND(K3_AI1PV / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 осн [K3_AI1PV]",
	CAST(K3_AI2PV * (1 - ROUND(K3_AI2PV / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 мал [K3_AI2PV]",
	CAST(K3_AI3PV * (1 - ROUND(K3_AI3PV / 327.67, 0, 1)) as decimal(15, 2)) as "Pг кѕа [K3_AI3PV]",
	CAST(K3_AI4PV * (1 - ROUND(K3_AI4PV / 327.67, 0, 1)) as decimal(15, 2)) as "Gм т [K3_AI4PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K3_AI1PV, K3_AI2PV, K3_AI3PV, K3_AI4PV
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="К-3 расход топлива" (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_AI1PV * (1 - ROUND(K3_AI1PV / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 осн [K3_AI1PV]",
	CAST(K3_AI2PV * (1 - ROUND(K3_AI2PV / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 мал [K3_AI2PV]",
	CAST(K3_AI3PV * (1 - ROUND(K3_AI3PV / 327.67, 0, 1)) as decimal(15, 2)) as "Pг кѕа [K3_AI3PV]",
	CAST(K3_AI4PV * (1 - ROUND(K3_AI4PV / 327.67, 0, 1)) as decimal(15, 2)) as "Gм т [K3_AI4PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K3_AI1PV, K3_AI2PV, K3_AI3PV, K3_AI4PV
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName="К-3 расход топлива" (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	null, 
	CAST(K3_AI1PV * (1 - ROUND(K3_AI1PV / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 осн [K3_AI1PV]",
	CAST(K3_AI2PV * (1 - ROUND(K3_AI2PV / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 мал [K3_AI2PV]",
	CAST(K3_AI3PV * (1 - ROUND(K3_AI3PV / 327.67, 0, 1)) as decimal(15, 2)) as "Pг кѕа [K3_AI3PV]",
	CAST(K3_AI4PV * (1 - ROUND(K3_AI4PV / 327.67, 0, 1)) as decimal(15, 2)) as "Gм т [K3_AI4PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K3_AI1PV, K3_AI2PV, K3_AI3PV, K3_AI4PV
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные почасовые}
/*ReportName="К-3 расход топлива" (агрегированные почасовые)*/
/*StartDate=dd.MM.yyyy 00:01:00.000*/
/*DeltaDate=00.00.0000 23:59:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="срезы минутные"*/
/*UpQuery="агрегированные посуточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	GroupDate as 'Дата',
	null,
	CAST(AVG(K3_AI1PV * (1 - ROUND(K3_AI1PV / 32767, 0, 1))) as decimal(15, 2)) as "Gг м3 осн [K3_AI1PV]",
	CAST(AVG(K3_AI2PV * (1 - ROUND(K3_AI2PV / 32767, 0, 1))) as decimal(15, 2)) as "Gг м3 мал [K3_AI2PV]",
	CAST(AVG(K3_AI3PV * (1 - ROUND(K3_AI3PV / 327.67, 0, 1))) as decimal(15, 2)) as "Pг кѕа [K3_AI3PV]",
	CAST(AVG(K3_AI4PV * (1 - ROUND(K3_AI4PV / 327.67, 0, 1))) as decimal(15, 2)) as "Gм т [K3_AI4PV]"
FROM (
	SELECT
		DateAdd(hour, 1, DateAdd(hour, DateDiff(hour, 0, DateAdd(minute, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, K3_AI1PV, K3_AI2PV, K3_AI3PV, K3_AI4PV
		FROM Runtime.dbo.AnalogWideHistory
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
	) AS T1
WHERE
	GroupDate <= DateAdd(hour, DateDiff(hour, 0, GetDate()), 0)
GROUP BY
	GroupDate
ORDER BY
	GroupDate


{агрегированные посуточные}
/*ReportName="К-3 расход топлива" (агрегированные посуточные)*/
/*StartDate=01.MM.yyyy 00:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*DateFormat=d MMMM yyyy*/
/*DownQuery="агрегированные почасовые"*/
/*UpQuery="агрегированные по месяцам"*/
/*Database=ptocalc*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	K3_AI1PV as "Gг м3 осн [K3_AI1PV]",
	K3_AI2PV as "Gг м3 мал [K3_AI2PV]",
	K3_AI3PV as "Pг кѕа [K3_AI3PV]",
	K3_AI4PV as "Gм т [K3_AI4PV]"
FROM
	KA_Fuel
WHERE
	DateTime >= @start
	AND DateTime <= @finish
ORDER BY
	DateTime


{агрегированные по месяцам}
/*ReportName="К-3 расход топлива" (агрегированные по месяцам)*/
/*StartDate=01.01.yyyy 00:00:00.000*/
/*DeltaDate=-01.00.0001 00:00:00.000*/
/*Step=00.00.0001 00:00:00.000*/
/*DateFormat=MMMM yyyy*/
/*DownQuery="агрегированные посуточные"*/
/*Database=ptocalc*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(month, DateDiff(month, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K3_AI1PV) as decimal(15, 2)) as "Gг м3 осн [K3_AI1PV]",
	CAST(AVG(K3_AI2PV) as decimal(15, 2)) as "Gг м3 мал [K3_AI2PV]",
	CAST(AVG(K3_AI3PV) as decimal(15, 2)) as "Pг кѕа [K3_AI3PV]",
	CAST(AVG(K3_AI4PV) as decimal(15, 2)) as "Gм т [K3_AI4PV]"
FROM
	KA_Fuel
WHERE
	DateTime >= @start
	AND DateTime <= @finish
GROUP BY
	DateAdd(month, DateDiff(month, 0, DateTime), 0)
ORDER BY
	DateAdd(month, DateDiff(month, 0, DateTime), 0)