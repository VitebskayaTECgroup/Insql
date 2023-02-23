{минутные срезы}
/*ReportName=Данные с приборов МЕТРАН (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H14_AK1X001 as decimal(15,5)) as "L cерн.кисл. [H14_AK1X001]",
	CAST(H14_KB1L001 as decimal(15,5)) as "L загряз.конд. [H14_KB1L001]",
	CAST(H14_KC1L001 as decimal(15,5)) as "L очищ.конд. [H14_KC1L001]",
	CAST(H14_KK1F001 as decimal(15,5)) as "Q конд. осн. [H14_KK1F001]",
	CAST(H14_KK1F002 as decimal(15,5)) as "Q конд. дубл. [H14_KK1F002]",
	CAST(H14_KK1T001 as decimal(15,5)) as "T конд. [H14_KK1T001]",
	CAST(H14_KK1X001 as decimal(15,5)) as "S конд. [H14_KK1X001]",
	CAST(H14_VE1L001 as decimal(15,5)) as "L декарб.воды [H14_VE1L001]",
	null,
	CAST(H15_VE1F001 as decimal(15,5)) as "Q ПТ1 осн. [H15_VE1F001]",
	CAST(H15_VE1F002 as decimal(15,5)) as "Q ПТ1 дубл. [H15_VE1F002]",
	CAST(H15_VE1F003 as decimal(15,5)) as "Q ПТ2-1 осн. [H15_VE1F003]",
	CAST(H15_VE1F004 as decimal(15,5)) as "Q ПТ2-1 дубл. [H15_VE1F004]",
	CAST(H15_VE1F005 as decimal(15,5)) as "Q ПТ2-2 осн. [H15_VE1F005]",
	CAST(H15_VE1F006 as decimal(15,5)) as "Q ПТ2-2 дубл. [H15_VE1F006]",
	CAST(H15_VE1X001 as decimal(15,5)) as "pH осн. [H15_VE1X001]",
	CAST(H15_VE1X002 as decimal(15,5)) as "pH дубл. [H15_VE1X002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
	H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Данные с приборов МЕТРАН (часовые срезы)*/
/*StartDate=dd.MM.yyyy 01:00:00.000*/
/*DeltaDate=00.00.0000 23:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H14_AK1X001 as decimal(15,5)) as "L cерн.кисл. [H14_AK1X001]",
	CAST(H14_KB1L001 as decimal(15,5)) as "L загряз.конд. [H14_KB1L001]",
	CAST(H14_KC1L001 as decimal(15,5)) as "L очищ.конд. [H14_KC1L001]",
	CAST(H14_KK1F001 as decimal(15,5)) as "Q конд. осн. [H14_KK1F001]",
	CAST(H14_KK1F002 as decimal(15,5)) as "Q конд. дубл. [H14_KK1F002]",
	CAST(H14_KK1T001 as decimal(15,5)) as "T конд. [H14_KK1T001]",
	CAST(H14_KK1X001 as decimal(15,5)) as "S конд. [H14_KK1X001]",
	CAST(H14_VE1L001 as decimal(15,5)) as "L декарб.воды [H14_VE1L001]",
	null,
	CAST(H15_VE1F001 as decimal(15,5)) as "Q ПТ1 осн. [H15_VE1F001]",
	CAST(H15_VE1F002 as decimal(15,5)) as "Q ПТ1 дубл. [H15_VE1F002]",
	CAST(H15_VE1F003 as decimal(15,5)) as "Q ПТ2-1 осн. [H15_VE1F003]",
	CAST(H15_VE1F004 as decimal(15,5)) as "Q ПТ2-1 дубл. [H15_VE1F004]",
	CAST(H15_VE1F005 as decimal(15,5)) as "Q ПТ2-2 осн. [H15_VE1F005]",
	CAST(H15_VE1F006 as decimal(15,5)) as "Q ПТ2-2 дубл. [H15_VE1F006]",
	CAST(H15_VE1X001 as decimal(15,5)) as "pH осн. [H15_VE1X001]",
	CAST(H15_VE1X002 as decimal(15,5)) as "pH дубл. [H15_VE1X002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
	H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Данные с приборов МЕТРАН (суточные срезы)*/
/*StartDate=02.MM.yyyy 00:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=86400000*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H14_AK1X001 as decimal(15,5)) as "L cерн.кисл. [H14_AK1X001]",
	CAST(H14_KB1L001 as decimal(15,5)) as "L загряз.конд. [H14_KB1L001]",
	CAST(H14_KC1L001 as decimal(15,5)) as "L очищ.конд. [H14_KC1L001]",
	CAST(H14_KK1F001 as decimal(15,5)) as "Q конд. осн. [H14_KK1F001]",
	CAST(H14_KK1F002 as decimal(15,5)) as "Q конд. дубл. [H14_KK1F002]",
	CAST(H14_KK1T001 as decimal(15,5)) as "T конд. [H14_KK1T001]",
	CAST(H14_KK1X001 as decimal(15,5)) as "S конд. [H14_KK1X001]",
	CAST(H14_VE1L001 as decimal(15,5)) as "L декарб.воды [H14_VE1L001]",
	null,
	CAST(H15_VE1F001 as decimal(15,5)) as "Q ПТ1 осн. [H15_VE1F001]",
	CAST(H15_VE1F002 as decimal(15,5)) as "Q ПТ1 дубл. [H15_VE1F002]",
	CAST(H15_VE1F003 as decimal(15,5)) as "Q ПТ2-1 осн. [H15_VE1F003]",
	CAST(H15_VE1F004 as decimal(15,5)) as "Q ПТ2-1 дубл. [H15_VE1F004]",
	CAST(H15_VE1F005 as decimal(15,5)) as "Q ПТ2-2 осн. [H15_VE1F005]",
	CAST(H15_VE1F006 as decimal(15,5)) as "Q ПТ2-2 дубл. [H15_VE1F006]",
	CAST(H15_VE1X001 as decimal(15,5)) as "pH осн. [H15_VE1X001]",
	CAST(H15_VE1X002 as decimal(15,5)) as "pH дубл. [H15_VE1X002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
	H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые агрегированные}
/*ReportName=Данные с приборов МЕТРАН (часовые агрегированные)*/
/*StartDate=dd.MM.yyyy 00:01:00.000*/
/*DeltaDate=00.00.0000 23:59:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DateFormat=dd.MM.yyyy HH:mm*/

SET QUOTED_IDENTIFIER OFF
SELECT
	GroupDate as 'Дата',
	null,
	CAST(AVG(H14_AK1X001) as decimal(15,5)) as "AVG<br>L<br>cерн.кисл. [H14_AK1X001]",
	CAST(AVG(H14_KB1L001) as decimal(15,5)) as "AVG<br>L<br>загряз.конд. [H14_KB1L001]",
	CAST(AVG(H14_KC1L001) as decimal(15,5)) as "AVG<br>L<br>очищ.конд. [H14_KC1L001]",
	CAST(SUM(H14_KK1F001) as decimal(15,5)) as "SUM<br>Q<br>конд.осн. [H14_KK1F001]",
	CAST(SUM(H14_KK1F002) as decimal(15,5)) as "SUM<br>Q<br>конд.дубл. [H14_KK1F002]",
	CAST(AVG(H14_KK1T001) as decimal(15,5)) as "AVG<br>T<br>конд. [H14_KK1T001]",
	CAST(AVG(H14_KK1X001) as decimal(15,5)) as "AVG<br>S<br>конд. [H14_KK1X001]",
	CAST(AVG(H14_VE1L001) as decimal(15,5)) as "AVG<br>L<br>декарб.воды [H14_VE1L001]",
	null,
	CAST(SUM(H15_VE1F001) as decimal(15,5)) as "SUM<br>Q<br>ПТ1_осн. [H15_VE1F001]",
	CAST(SUM(H15_VE1F002) as decimal(15,5)) as "SUM<br>Q<br>ПТ1_дубл. [H15_VE1F002]",
	CAST(SUM(H15_VE1F003) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-1_осн. [H15_VE1F003]",
	CAST(SUM(H15_VE1F004) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-1_дубл. [H15_VE1F004]",
	CAST(SUM(H15_VE1F005) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-2_осн. [H15_VE1F005]",
	CAST(SUM(H15_VE1F006) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-2_дубл. [H15_VE1F006]",
	CAST(AVG(H15_VE1X001) as decimal(15,5)) as "AVG<br>pH<br>осн. [H15_VE1X001]",
	CAST(AVG(H15_VE1X002) as decimal(15,5)) as "AVG<br>pH<br>дубл. [H15_VE1X002]"
FROM (
	SELECT
		DateAdd(hour, 1, DateAdd(hour, DateDiff(hour, 0, DateAdd(minute, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL, 
		"SELECT DateTime, 
		H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
		H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
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


{суточные агрегированные}
/*ReportName=Данные с приборов МЕТРАН (суточные агрегированные)*/
/*StartDate=01.MM.yyyy 01:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="часовые срезы"*/
/*DateFormat=d MMMM yyyy*/

SET QUOTED_IDENTIFIER OFF
SELECT
	GroupDate as 'Дата',
	null,
	CAST(AVG(H14_AK1X001) as decimal(15,5)) as "AVG<br>L<br>cерн.кисл. [H14_AK1X001]",
	CAST(AVG(H14_KB1L001) as decimal(15,5)) as "AVG<br>L<br>загряз.конд. [H14_KB1L001]",
	CAST(AVG(H14_KC1L001) as decimal(15,5)) as "AVG<br>L<br>очищ.конд. [H14_KC1L001]",
	CAST(SUM(H14_KK1F001) as decimal(15,5)) as "SUM<br>Q<br>конд.осн. [H14_KK1F001]",
	CAST(SUM(H14_KK1F002) as decimal(15,5)) as "SUM<br>Q<br>конд.дубл. [H14_KK1F002]",
	CAST(AVG(H14_KK1T001) as decimal(15,5)) as "AVG<br>T<br>конд. [H14_KK1T001]",
	CAST(AVG(H14_KK1X001) as decimal(15,5)) as "AVG<br>S<br>конд. [H14_KK1X001]",
	CAST(AVG(H14_VE1L001) as decimal(15,5)) as "AVG<br>L<br>декарб.воды [H14_VE1L001]",
	null,
	CAST(SUM(H15_VE1F001) as decimal(15,5)) as "SUM<br>Q<br>ПТ1_осн. [H15_VE1F001]",
	CAST(SUM(H15_VE1F002) as decimal(15,5)) as "SUM<br>Q<br>ПТ1_дубл. [H15_VE1F002]",
	CAST(SUM(H15_VE1F003) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-1_осн. [H15_VE1F003]",
	CAST(SUM(H15_VE1F004) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-1_дубл. [H15_VE1F004]",
	CAST(SUM(H15_VE1F005) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-2_осн. [H15_VE1F005]",
	CAST(SUM(H15_VE1F006) as decimal(15,5)) as "SUM<br>Q<br>ПТ2-2_дубл. [H15_VE1F006]",
	CAST(AVG(H15_VE1X001) as decimal(15,5)) as "AVG<br>pH<br>осн. [H15_VE1X001]",
	CAST(AVG(H15_VE1X002) as decimal(15,5)) as "AVG<br>pH<br>дубл. [H15_VE1X002]"
FROM (
	SELECT
		DateAdd(day, 0, DateAdd(day, DateDiff(day, 0, DateAdd(hour, -1, DateTime)), 0)) as GroupDate,
		*
	FROM
		OpenQuery(INSQL, 
		"SELECT DateTime, 
		H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
		H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
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