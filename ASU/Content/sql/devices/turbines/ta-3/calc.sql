{срезы минутные}
/*ReportName="ТА-3" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(S3_VOIR0003, 3) as "Расход СВ перед конд. линия 1 [S3_VOIR0003]",
	ROUND(S3_VOIR0004, 3) as "Расход СВ перед конд. линия 2 [S3_VOIR0004]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_VOIR0003, S3_VOIR0004
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="ТА-3" (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(S3_VOIR0003, 3) as "Расход СВ перед конд. линия 1 [S3_VOIR0003]",
	ROUND(S3_VOIR0004, 3) as "Расход СВ перед конд. линия 2 [S3_VOIR0004]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_VOIR0003, S3_VOIR0004
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные почасовые}
/*ReportName="ТА-3" (агрегированные почасовые)*/
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
	ROUND(AVG(S3_VOIR0003), 3) AS "Расход СВ перед конд. линия 1 [S3_VOIR0003]",
	ROUND(AVG(S3_VOIR0004), 3) AS "Расход СВ перед конд. линия 2 [S3_VOIR0004]"
FROM (
	SELECT
		DateAdd(hour, 1, DateAdd(hour, DateDiff(hour, 0, DateAdd(minute, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, S3_VOIR0003, S3_VOIR0004
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
/*ReportName="ТА-3" (агрегированные посуточные)*/
/*StartDate=01.MM.yyyy 00:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*DateFormat=d MMMM yyyy*/
/*DownQuery="агрегированные почасовые"*/
/*UpQuery="агрегированные по месяцам"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0)  AS "Дата",
	CAST(AVG(S3_VOIR0003)     as decimal(15, 2)) AS "Расход СВ перед конд. линия 1 [S3_VOIR0003]",
	CAST(AVG(S3_VOIR0004)     as decimal(15, 2)) AS "Расход СВ перед конд. линия 2 [S3_VOIR0004]"
FROM (
	SELECT
		DateTime as "DateTime",
		CASE WHEN ABS(ISNULL(S3_VOIR0003, 0)) > 1000000 THEN 0 ELSE CAST(ISNULL(S3_VOIR0003, 0) as decimal(15, 2)) END as "S3_VOIR0003",
		CASE WHEN ABS(ISNULL(S3_VOIR0004, 0)) > 1000000 THEN 0 ELSE CAST(ISNULL(S3_VOIR0004, 0) as decimal(15, 2)) END as "S3_VOIR0004"
	FROM OpenQuery(INSQL,
	"SELECT
		DateTime,
		S3_VOIR0003,
		S3_VOIR0004
	FROM
		Runtime.dbo.AnalogWideHistory
	WHERE
		wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = 60000
		AND DateTime >= '20230501 00:00:00.000'
		AND DateTime <= '20230523 11:55:08.000'
	")
) AS T
GROUP BY
	DateAdd(day, DateDiff(day, 0, DateTime), 0)
ORDER BY
	DateAdd(day, DateDiff(day, 0, DateTime), 0)