{минутные срезы}
/*ReportName=Дополнительная информация по котлоагрегатам (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K03_WaterLevel as decimal(15, 2)) as "К/О №3, L воды в барабане, мм [K03_WaterLevel]",
	null,
	CAST(K03_TPerPar as decimal(15, 2)) as "К/О №3, T перегр. пара за котлом, °С [K03_TPerPar]",
	null,
	CAST(K03_Gwater1st as decimal(15, 2)) as "К/О №3, G воды на впр. 1ст., т/ч [K03_Gwater1st]",
	CAST(K03_Gwater2st as decimal(15, 2)) as "К/О №3, G воды на впр. 2ст., т/ч [K03_Gwater2st]",
	CAST(K03_Pbaraban as decimal(15, 2)) as "К/О №3, P в барабане, МПа [K03_Pbaraban]",
	CAST(K03_Pperpar as decimal(15, 2)) as "К/О №3, P перегр. пара, МПа [K03_Pperpar]",
	CAST(K03_Pwater as decimal(15, 2)) as "К/О №3, P пит. воды, МПа [K03_Pwater]",
	null,
	CAST(K04_Tperpar as decimal(15, 2)) as "К/О №4, T перегр. пара за котлом, °С [K04_Tperpar]",
	CAST(K04_Hwater as decimal(15, 2)) as "К/О №4, уровень воды в барабане, мм [K04_Hwater]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K03_WaterLevel, K03_TPerPar, K03_Gwater1st, K03_Gwater2st, K03_Pbaraban, K03_Pperpar, K03_Pwater, K04_Tperpar, K04_Hwater
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{часовые срезы}
/*ReportName=Дополнительная информация по котлоагрегатам (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K03_WaterLevel as decimal(15, 2)) as "К/О №3, L воды в барабане, мм [K03_WaterLevel]",
	null,
	CAST(K03_TPerPar as decimal(15, 2)) as "К/О №3, T перегр. пара за котлом, °С [K03_TPerPar]",
	null,
	CAST(K03_Gwater1st as decimal(15, 2)) as "К/О №3, G воды на впр. 1ст., т/ч [K03_Gwater1st]",
	CAST(K03_Gwater2st as decimal(15, 2)) as "К/О №3, G воды на впр. 2ст., т/ч [K03_Gwater2st]",
	CAST(K03_Pbaraban as decimal(15, 2)) as "К/О №3, P в барабане, МПа [K03_Pbaraban]",
	CAST(K03_Pperpar as decimal(15, 2)) as "К/О №3, P перегр. пара, МПа [K03_Pperpar]",
	CAST(K03_Pwater as decimal(15, 2)) as "К/О №3, P пит. воды, МПа [K03_Pwater]",
	null,
	CAST(K04_Tperpar as decimal(15, 2)) as "К/О №4, T перегр. пара за котлом, °С [K04_Tperpar]",
	CAST(K04_Hwater as decimal(15, 2)) as "К/О №4, уровень воды в барабане, мм [K04_Hwater]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K03_WaterLevel, K03_TPerPar, K03_Gwater1st, K03_Gwater2st, K03_Pbaraban, K03_Pperpar, K03_Pwater, K04_Tperpar, K04_Hwater
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{суточные срезы}
/*ReportName=Дополнительная информация по котлоагрегатам (суточные срезы)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	CAST(K03_WaterLevel as decimal(15, 2)) as "К/О №3, L воды в барабане, мм [K03_WaterLevel]",
	null,
	CAST(K03_TPerPar as decimal(15, 2)) as "К/О №3, T перегр. пара за котлом, °С [K03_TPerPar]",
	null,
	CAST(K03_Gwater1st as decimal(15, 2)) as "К/О №3, G воды на впр. 1ст., т/ч [K03_Gwater1st]",
	CAST(K03_Gwater2st as decimal(15, 2)) as "К/О №3, G воды на впр. 2ст., т/ч [K03_Gwater2st]",
	CAST(K03_Pbaraban as decimal(15, 2)) as "К/О №3, P в барабане, МПа [K03_Pbaraban]",
	CAST(K03_Pperpar as decimal(15, 2)) as "К/О №3, P перегр. пара, МПа [K03_Pperpar]",
	CAST(K03_Pwater as decimal(15, 2)) as "К/О №3, P пит. воды, МПа [K03_Pwater]",
	null,
	CAST(K04_Tperpar as decimal(15, 2)) as "К/О №4, T перегр. пара за котлом, °С [K04_Tperpar]",
	CAST(K04_Hwater as decimal(15, 2)) as "К/О №4, уровень воды в барабане, мм [K04_Hwater]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K03_WaterLevel, K03_TPerPar, K03_Gwater1st, K03_Gwater2st, K03_Pbaraban, K03_Pperpar, K03_Pwater, K04_Tperpar, K04_Hwater
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{часовые агрегированные}
/*ReportName=Дополнительная информация по котлоагрегатам (часовые агрегированные)*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.900*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="минутные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K03_WaterLevel) as decimal(15, 2)) as "К/О №3, L воды в барабане, мм [K03_WaterLevel]",
	null,
	CAST(AVG(K03_TPerPar) as decimal(15, 2)) as "К/О №3, T перегр. пара за котлом, °С [K03_TPerPar]",
	null,
	CAST(AVG(K03_Gwater1st) as decimal(15, 2)) as "К/О №3, G воды на впр. 1ст., т/ч [K03_Gwater1st]",
	CAST(AVG(K03_Gwater2st) as decimal(15, 2)) as "К/О №3, G воды на впр. 2ст., т/ч [K03_Gwater2st]",
	CAST(AVG(K03_Pbaraban) as decimal(15, 2)) as "К/О №3, P в барабане, МПа [K03_Pbaraban]",
	CAST(AVG(K03_Pperpar) as decimal(15, 2)) as "К/О №3, P перегр. пара, МПа [K03_Pperpar]",
	CAST(AVG(K03_Pwater) as decimal(15, 2)) as "К/О №3, P пит. воды, МПа [K03_Pwater]",
	null,
	CAST(AVG(K04_Tperpar) as decimal(15, 2)) as "К/О №4, T перегр. пара за котлом, °С [K04_Tperpar]",
	CAST(AVG(K04_Hwater) as decimal(15, 2)) as "К/О №4, уровень воды в барабане, мм [K04_Hwater]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K03_WaterLevel, K03_TPerPar, K03_Gwater1st, K03_Gwater2st, K03_Pbaraban, K03_Pperpar, K03_Pwater, K04_Tperpar, K04_Hwater
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0)
ORDER BY
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0)