{срезы минутные}
/*ReportName="К-4 расход топлива" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_Qgas_osn * (1 - ROUND(K4_Qgas_osn / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 осн [K4_Qgas_osn]",
	CAST(K4_Qgas_pb * (1 - ROUND(K4_Qgas_pb / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 мал [K4_Qgas_pb]",
	CAST(K4_Pgas * (1 - ROUND(K4_Pgas / 327.67, 0, 1)) as decimal(15, 2)) as "Pг кѕа [K4_Pgas]",
	CAST(K4_Qmaz * (1 - ROUND(K4_Qmaz / 327.67, 0, 1)) as decimal(15, 2)) as "Gм т [K4_Qmaz]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="К-4 расход топлива" (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_Qgas_osn * (1 - ROUND(K4_Qgas_osn / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 осн [K4_Qgas_osn]",
	CAST(K4_Qgas_pb * (1 - ROUND(K4_Qgas_pb / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 мал [K4_Qgas_pb]",
	CAST(K4_Pgas * (1 - ROUND(K4_Pgas / 327.67, 0, 1)) as decimal(15, 2)) as "Pг кѕа [K4_Pgas]",
	CAST(K4_Qmaz * (1 - ROUND(K4_Qmaz / 327.67, 0, 1)) as decimal(15, 2)) as "Gм т [K4_Qmaz]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName="К-4 расход топлива" (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	CAST(K4_Qgas_osn * (1 - ROUND(K4_Qgas_osn / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 осн [K4_Qgas_osn]",
	CAST(K4_Qgas_pb * (1 - ROUND(K4_Qgas_pb / 32767, 0, 1)) as decimal(15, 2)) as "Gг м3 мал [K4_Qgas_pb]",
	CAST(K4_Pgas * (1 - ROUND(K4_Pgas / 327.67, 0, 1)) as decimal(15, 2)) as "Pг кѕа [K4_Pgas]",
	CAST(K4_Qmaz * (1 - ROUND(K4_Qmaz / 327.67, 0, 1)) as decimal(15, 2)) as "Gм т [K4_Qmaz]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные почасовые}
/*ReportName="К-4 расход топлива" (агрегированные почасовые)*/
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
	CAST(AVG(K4_Qgas_osn * (1 - ROUND(K4_Qgas_osn / 32767, 0, 1))) as decimal(15, 2)) as "Gг м3 осн [K4_Qgas_osn]",
	CAST(AVG(K4_Qgas_pb * (1 - ROUND(K4_Qgas_pb / 32767, 0, 1))) as decimal(15, 2)) as "Gг м3 мал [K4_Qgas_pb]",
	CAST(AVG(K4_Pgas * (1 - ROUND(K4_Pgas / 327.67, 0, 1))) as decimal(15, 2)) as "Pг кѕа [K4_Pgas]",
	CAST(AVG(K4_Qmaz * (1 - ROUND(K4_Qmaz / 327.67, 0, 1))) as decimal(15, 2)) as "Gм т [K4_Qmaz]"
FROM (
	SELECT
		DateAdd(hour, 1, DateAdd(hour, DateDiff(hour, 0, DateAdd(minute, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz
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
/*ReportName="К-4 расход топлива" (агрегированные посуточные)*/
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
	K4_Qgas_osn as "Gг м3 осн [K4_Qgas_osn]",
	K4_Qgas_pb as "Gг м3 мал [K4_Qgas_pb]",
	K4_Pgas as "Pг кѕа [K4_Pgas]",
	K4_Qmaz as "Gм т [K4_Qmaz]"
FROM
	KA_Fuel
WHERE
	DateTime >= @start
	AND DateTime <= @finish
ORDER BY
	DateTime


{агрегированные по месяцам}
/*ReportName="К-4 расход топлива" (агрегированные по месяцам)*/
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
	CAST(AVG(K4_Qgas_osn) as decimal(15, 2)) as "Gг м3 осн [K4_Qgas_osn]",
	CAST(AVG(K4_Qgas_pb) as decimal(15, 2)) as "Gг м3 мал [K4_Qgas_pb]",
	CAST(AVG(K4_Pgas) as decimal(15, 2)) as "Pг кѕа [K4_Pgas]",
	CAST(AVG(K4_Qmaz) as decimal(15, 2)) as "Gм т [K4_Qmaz]"
FROM
	KA_Fuel
WHERE
	DateTime >= @start
	AND DateTime <= @finish
GROUP BY
	DateAdd(month, DateDiff(month, 0, DateTime), 0)
ORDER BY
	DateAdd(month, DateDiff(month, 0, DateTime), 0)