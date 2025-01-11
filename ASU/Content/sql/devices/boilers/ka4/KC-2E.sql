{срезы минутные}
/*ReportName="К-4 РМТ-19" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(K04_Hwater, 2) as "Уровень воды в барабане четвертого котла [K04_Hwater]",
	Round(K04_Tperpar, 2) as "Температура перегретого пара за котлом [K04_Tperpar]",
	Round(K4_Gper_par, 2) as "Расход перегретого пара [K4_Gper_par]",
	Round(K4_Gpit_wat, 2) as "Расход питательной воды [K4_Gpit_wat]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K04_Hwater, K04_Tperpar, K4_Gper_par, K4_Gpit_wat
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="К-4 РМТ-19" (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(K04_Hwater, 2) as "Уровень воды в барабане четвертого котла [K04_Hwater]",
	Round(K04_Tperpar, 2) as "Температура перегретого пара за котлом [K04_Tperpar]",
	Round(K4_Gper_par, 2) as "Расход перегретого пара [K4_Gper_par]",
	Round(K4_Gpit_wat, 2) as "Расход питательной воды [K4_Gpit_wat]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K04_Hwater, K04_Tperpar, K4_Gper_par, K4_Gpit_wat
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName="К-4 РМТ-19" (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(K04_Hwater, 2) as "Уровень воды в барабане четвертого котла [K04_Hwater]",
	Round(K04_Tperpar, 2) as "Температура перегретого пара за котлом [K04_Tperpar]",
	Round(K4_Gper_par, 2) as "Расход перегретого пара [K4_Gper_par]",
	Round(K4_Gpit_wat, 2) as "Расход питательной воды [K4_Gpit_wat]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K04_Hwater, K04_Tperpar, K4_Gper_par, K4_Gpit_wat
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
