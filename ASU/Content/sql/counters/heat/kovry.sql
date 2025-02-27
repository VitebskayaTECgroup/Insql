{минутные срезы}
/*ReportName=ОАО "Витебские ковры", трубопровод (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	ROUND(isnull(U10_UN11F001, 0)  / 1000, 1) as "Массовый расход пара, т/ч [U10_UN11F001]",
	ROUND(isnull(U10_UN11P001, 0), 2) as "Абсолют. давление пара, КПа [U10_UN11P001]",
	ROUND(isnull(U10_UN11T001, 0), 1) as "Температура пара, °С [U10_UN11T001]",
	ROUND(isnull(U10_UN11Q001, 0), 1) as "Объемный расход пара, м3/ч [U10_UN11Q001]",
	ROUND(isnull(U10_UN11W001, 0) / 1000000, 1) as "Тепловая энергия пара, ГКал/ч [U10_UN11W001]",
	ROUND(isnull(U10_UN11H001, 0) / 1000, 1) as "Энтальпия пара, ГКал/т [U10_UN11H001]",
	ROUND(isnull(U10_UN11R001, 0), 1) as "Плотность пара, кг/м3 [U10_UN11R001]",
	NULL,
	ROUND(isnull(U10_UN21F001, 0) / 1000, 1) as "Массовый расход конденсата, т/ч [U10_UN21F001]",
	ROUND(isnull(U10_UN21P001, 0), 2) as "Избыт. давление конденсата, КПа [U10_UN21P001]",
	ROUND(isnull(U10_UN21T001, 0), 1) as "Температура конденсата, °С [U10_UN21T001]",
	ROUND(isnull(U10_UN21Q001, 0), 1) as "Объемный расход конденсата, м3/ч [U10_UN21Q001]",
	ROUND(isnull(U10_UN21W001, 0) / 1000000, 1) as "Тепловая энергия конденсата, ГКал/ч [U10_UN21W001]",
	ROUND(isnull(U10_UN21H001, 0) / 1000, 1) as "Энтальпия конденсата, ГКал/т [U10_UN21H001]",
	ROUND(isnull(U10_UN21R001, 0), 1) as "Плотность конденсата, кг/м3 [U10_UN21R001]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		U10_UN11F001, U10_UN11P001, U10_UN11T001, U10_UN11Q001, U10_UN11W001, U10_UN11H001, U10_UN11R001,
		U10_UN21F001, U10_UN21P001, U10_UN21T001, U10_UN21Q001, U10_UN21W001, U10_UN21H001, U10_UN21R001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ОАО "Витебские ковры", трубопровод (срезы на конец часа)*/
/*Mode=часовые-1*/
/*StartDate=dd.MM.yyyy 01:06:00.000*/
/*DeltaDate=00.00.0000 23:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*DateFormat=dd.MM.yyyy HH:mm*/
/*Resolution=3600000*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	NULL,
	ROUND(isnull(U10_UN11F001_H1, 0) / 1000, 1) as "Суммарный массовый расход пара за п/ч, т [U10_UN11F001_H1]",
	ROUND(isnull(U10_UN11P001_H1, 0), 2) as "Среднее абсолют. давление пара за п/ч, кПа [U10_UN11P001_H1]",
	ROUND(isnull(U10_UN11T001_H1, 0), 1) as "Средняя температура пара за п/ч, °С [U10_UN11T001_H1]",
	ROUND(isnull(U10_UN11W001_H1, 0) / 1000000, 1) as "Общая тепловая энергия пара за п/ч, ГКал/ч [U10_UN11W001_H1]",
	NULL,
	ROUND(isnull(U10_UN21F001_H1, 0) / 1000, 1) as "Суммарный массовый расход конденсата за п/ч, т [U10_UN21F001_H1]",
	ROUND(isnull(U10_UN21P001_H1, 0), 2) as "Среднее избыт. давление конденсата за п/ч, кПа [U10_UN21P001_H1]",
	ROUND(isnull(U10_UN21T001_H1, 0), 1) as "Средняя температура конденсата за п/ч, °С [U10_UN21T001_H1]",
	ROUND(isnull(U10_UN21W001_H1, 0) / 1000000, 1) as "Общая тепловая энергия конденсата за п/ч, ГКал/ч [U10_UN21W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		U10_UN11F001_H1, U10_UN11P001_H1, U10_UN11T001_H1, U10_UN11W001_H1,
		U10_UN21F001_H1, U10_UN21P001_H1, U10_UN21T001_H1, U10_UN21W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ОАО "Витебские ковры", трубопровод (срезы на конец суток)*/
/*Mode=суточные-1*/
/*StartDate=02.MM.yyyy 00:06:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*DateFormat=d MMMM yyyy*/
/*Resolution=86400000*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF

SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	NULL,
	ROUND(isnull(U10_UN11F001_S1, 0) / 1000, 1) as "Суммарный массовый расход пара за п/с, т [U10_UN11F001_S1]",
	ROUND(isnull(U10_UN11P001_S1, 0), 2) as "Среднее абсолют. давление пара за п/с, кПа [U10_UN11P001_S1]",
	ROUND(isnull(U10_UN11T001_S1, 0), 1) as "Средняя температура пара за п/с, °С [U10_UN11T001_S1]",
	ROUND(isnull(U10_UN11W001_S1, 0) / 1000000, 1) as "Общая тепловая энергия пара за п/с, ГКал/ч [U10_UN11W001_S1]",
	NULL,
	ROUND(isnull(U10_UN21F001_S1, 0) / 1000, 1) as "Суммарный массовый расход конденсата за п/с, т [U10_UN21F001_S1]",
	ROUND(isnull(U10_UN21P001_S1, 0), 2) as "Среднее избыт. давление конденсата за п/с, кПа [U10_UN21P001_S1]",
	ROUND(isnull(U10_UN21T001_S1, 0), 1) as "Средняя температура конденсата за п/с, °С [U10_UN21T001_S1]",
	ROUND(isnull(U10_UN21W001_S1, 0) / 1000000, 1) as "Общая тепловая энергия конденсата за п/с, ГКал/ч [U10_UN21W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		U10_UN11F001_S1, U10_UN11P001_S1, U10_UN11T001_S1, U10_UN11W001_S1,
		U10_UN21F001_S1, U10_UN21P001_S1, U10_UN21T001_S1, U10_UN21W001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName=ОАО "Витебские ковры", трубопровод (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF

SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	NULL,
	CHAR(192 + isnull(CLC_ShiftDuty, 0)) as "Cме-на [CLC_ShiftDuty]",
	CAST(isnull(U10_UN11F001_H1, 0) / 1000 as decimal(15, 2)) as "Суммарный массовый расход пара за п/ч, т [U10_UN11F001_H1]",
	CAST(isnull(U10_UN11P001_H1, 0) as decimal(15, 2)) as "Среднее абсолют. давление пара за п/ч, кПа [U10_UN11P001_H1]",
	CAST(isnull(U10_UN11T001_H1, 0) as decimal(15, 2)) as "Средняя температура пара за п/ч, °С [U10_UN11T001_H1]",
	CAST(isnull(U10_UN11W001_H1, 0) / 1000000 as decimal(15, 2)) as "Общая тепловая энергия пара за п/ч, ГКал/ч [U10_UN11W001_H1]",
	NULL,
	CAST(isnull(U10_UN21F001_H1, 0) / 1000 as decimal(15, 2)) as "Суммарный массовый расход конденсата за п/ч, т [U10_UN21F001_H1]",
	CAST(isnull(U10_UN21P001_H1, 0) as decimal(15, 2)) as "Среднее избыт. давление конденсата за п/ч, кПа [U10_UN21P001_H1]",
	CAST(isnull(U10_UN21T001_H1, 0) as decimal(15, 2)) as "Средняя температура конденсата за п/ч, °С [U10_UN21T001_H1]",
	CAST(isnull(U10_UN21W001_H1, 0) / 1000000 as decimal(15, 2)) as "Общая тепловая энергия конденсата за п/ч, ГКал/ч [U10_UN21W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime, CLC_ShiftDuty,
		U10_UN11F001_H1, U10_UN11P001_H1, U10_UN11T001_H1, U10_UN11W001_H1,
		U10_UN21F001_H1, U10_UN21P001_H1, U10_UN21T001_H1, U10_UN21W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName=ОАО "Витебские ковры", трубопровод (агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF

SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi, 480, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, DateTime)) * 2, 0, 1) / 2)) as "Дата",
	NULL,
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	NULL,
	CAST(SUM(isnull(U10_UN11F001_H1, 0)) / 1000 as decimal(15, 2)) as "Суммарный массовый расход пара за смену, т [U10_UN11F001_H1]",
	CAST(AVG(isnull(U10_UN11P001_H1, 0)) as decimal(15, 2)) as "Среднее абсолют. давление пара за смену, кПа [U10_UN11P001_H1]",
	CAST(AVG(isnull(U10_UN11T001_H1, 0)) as decimal(15, 2)) as "Средняя температура пара за смену, °С [U10_UN11T001_H1]",
	CAST(SUM(isnull(U10_UN11W001_H1, 0)) / 1000000 as decimal(15, 2)) as "Общая тепловая энергия пара за смену, ГКал/ч [U10_UN11W001_H1]",
	NULL,
	CAST(SUM(isnull(U10_UN21F001_H1, 0)) / 1000 as decimal(15, 2)) as "Суммарный массовый расход конденсата за смену, т [U10_UN21F001_H1]",
	CAST(AVG(isnull(U10_UN21P001_H1, 0)) as decimal(15, 2)) as "Среднее избыт. давление конденсата за смену, кПа [U10_UN21P001_H1]",
	CAST(AVG(isnull(U10_UN21T001_H1, 0)) as decimal(15, 2)) as "Средняя температура конденсата за смену, °С [U10_UN21T001_H1]",
	CAST(SUM(isnull(U10_UN21W001_H1, 0)) / 1000000 as decimal(15, 2)) as "Общая тепловая энергия конденсата за смену, ГКал/ч [U10_UN21W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime, CLC_ShiftDuty,
		U10_UN11F001_H1, U10_UN11P001_H1, U10_UN11T001_H1, U10_UN11W001_H1,
		U10_UN21F001_H1, U10_UN21P001_H1, U10_UN21T001_H1, U10_UN21W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(mi, 480, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, DateTime)) * 2, 0, 1) / 2))
ORDER By
	DateAdd(mi, 480, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, DateTime)) * 2, 0, 1) / 2))

{смены за месяц}
/*ReportName=ОАО "Витебские ковры", трубопровод (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'

SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm, MIN(DateTime)) + " " + DateName(yyyy, MIN(DateTime)) as "Дата",
	NULL,
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	NULL,
	CAST(SUM(isnull(U10_UN11F001_H1, 0)) / 1000 as decimal(15, 2)) as "Суммарный массовый расход пара, т [U10_UN11F001_H1]",
	CAST(AVG(isnull(U10_UN11P001_H1, 0)) as decimal(15, 2)) as "Среднее абсолют. давление пара, кПа [U10_UN11P001_H1]",
	CAST(AVG(isnull(U10_UN11T001_H1, 0)) as decimal(15, 2)) as "Средняя температура пара, °С [U10_UN11T001_H1]",
	CAST(SUM(isnull(U10_UN11W001_H1, 0)) / 1000000 as decimal(15, 2)) as "Общая тепловая энергия пара, ГКал/ч [U10_UN11W001_H1]",
	NULL,NULL,
	CAST(SUM(isnull(U10_UN21F001_H1, 0)) / 1000 as decimal(15, 2)) as "Суммарный массовый расход конденсата, т [U10_UN21F001_H1]",
	CAST(AVG(isnull(U10_UN21P001_H1, 0)) as decimal(15, 2)) as "Среднее избыт. давление конденсата, кПа [U10_UN21P001_H1]",
	CAST(AVG(isnull(U10_UN21T001_H1, 0)) as decimal(15, 2)) as "Средняя температура конденсата, °С [U10_UN21T001_H1]",
	CAST(SUM(isnull(U10_UN21W001_H1, 0)) / 1000000 as decimal(15, 2)) as "Общая тепловая энергия конденсата, ГКал/ч [U10_UN21W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime, CLC_ShiftDuty,
		U10_UN11F001_H1, U10_UN11P001_H1, U10_UN11T001_H1, U10_UN11W001_H1,
		U10_UN21F001_H1, U10_UN21P001_H1, U10_UN21T001_H1, U10_UN21W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))