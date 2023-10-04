{срезы минутные}
/*ReportName="К-4 газоанализаторы АКВТ" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(AKVT_1_T, 2) as "Темп. 1 [AKVT_1_T]",
	Round(AKVT_1_CO, 2) as "CO 1 [AKVT_1_CO]",
	Round(AKVT_1_O2, 2) as "O2 1 [AKVT_1_O2]",
	null,
	Round(AKVT_2_T, 2) as "Темп. 2 [AKVT_2_T]",
	Round(AKVT_2_CO, 2) as "CO 2 [AKVT_2_CO]",
	Round(AKVT_2_O2, 2) as "O2 2 [AKVT_2_O2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, AKVT_1_T, AKVT_1_CO, AKVT_1_O2, AKVT_2_T, AKVT_2_CO, AKVT_2_O2
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="К-4 газоанализаторы АКВТ" (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(AKVT_1_T, 2) as "Темп. 1 [AKVT_1_T]",
	Round(AKVT_1_CO, 2) as "CO 1 [AKVT_1_CO]",
	Round(AKVT_1_O2, 2) as "O2 1 [AKVT_1_O2]",
	null,
	Round(AKVT_2_T, 2) as "Темп. 2 [AKVT_2_T]",
	Round(AKVT_2_CO, 2) as "CO 2 [AKVT_2_CO]",
	Round(AKVT_2_O2, 2) as "O2 2 [AKVT_2_O2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, AKVT_1_T, AKVT_1_CO, AKVT_1_O2, AKVT_2_T, AKVT_2_CO, AKVT_2_O2
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName="К-4 газоанализаторы АКВТ" (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(AKVT_1_T, 2) as "Темп. 2 [AKVT_1_T]",
	Round(AKVT_1_CO, 2) as "CO 2 [AKVT_1_CO]",
	Round(AKVT_1_O2, 2) as "O2 2 [AKVT_1_O2]",
	null,
	Round(AKVT_2_T, 2) as "Темп. 2 [AKVT_2_T]",
	Round(AKVT_2_CO, 2) as "CO 2 [AKVT_2_CO]",
	Round(AKVT_2_O2, 2) as "O2 2 [AKVT_2_O2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, AKVT_1_T, AKVT_1_CO, AKVT_1_O2, AKVT_2_T, AKVT_2_CO, AKVT_2_O2
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные почасовые}
/*ReportName="К-4 газоанализаторы АКВТ" (агрегированные почасовые)*/
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
	Round(AVG(AKVT_1_T), 2) as "Темп. 1 [AKVT_1_T]",
	Round(AVG(AKVT_1_CO), 2) as "CO 1 [AKVT_1_CO]",
	Round(AVG(AKVT_1_O2), 2) as "O2 1 [AKVT_1_O2]",
	null,
	Round(AVG(AKVT_2_T), 2) as "Темп. 2 [AKVT_2_T]",
	Round(AVG(AKVT_2_CO), 2) as "CO 2 [AKVT_2_CO]",
	Round(AVG(AKVT_2_O2), 2) as "O2 2 [AKVT_2_O2]"
FROM (
	SELECT
		DateAdd(hour, 1, DateAdd(hour, DateDiff(hour, 0, DateAdd(minute, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, AKVT_1_T, AKVT_1_CO, AKVT_1_O2, AKVT_2_T, AKVT_2_CO, AKVT_2_O2
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
/*ReportName="К-4 газоанализаторы АКВТ" (агрегированные посуточные)*/
/*StartDate=01.MM.yyyy 00:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*DateFormat=d MMMM yyyy*/
/*DownQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	GroupDate as 'Дата',
	null,
	Round(AVG(AKVT_1_T), 2) as "Темп. 1 [AKVT_1_T]",
	Round(AVG(AKVT_1_CO), 2) as "CO 1 [AKVT_1_CO]",
	Round(AVG(AKVT_1_O2), 2) as "O2 1 [AKVT_1_O2]",
	null,
	Round(AVG(AKVT_2_T), 2) as "Темп. 2 [AKVT_2_T]",
	Round(AVG(AKVT_2_CO), 2) as "CO 2 [AKVT_2_CO]",
	Round(AVG(AKVT_2_O2), 2) as "O2 2 [AKVT_2_O2]"
FROM (
	SELECT
		DateAdd(day, 1, DateAdd(day, DateDiff(day, 0, DateAdd(minute, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, AKVT_1_T, AKVT_1_CO, AKVT_1_O2, AKVT_2_T, AKVT_2_CO, AKVT_2_O2
		FROM Runtime.dbo.AnalogWideHistory
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
	) AS T1
WHERE
	GroupDate <= DateAdd(day, DateDiff(day, 0, GetDate()), 0)
GROUP BY
	GroupDate
ORDER BY
	GroupDate