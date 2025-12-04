{срезы минутные}
/*ReportName="Уровень воды в барабане" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K04_Hwater as decimal(15, 2)) as "Уровень воды в барабане<br>КС-2Е [K04_Hwater]",
	CAST(L_water_KA4L as decimal(15, 2)) as "Уровень воды в барабане<br>КП-140_(левый) [L_water_KA4L]",
	CAST(L_water_KA4R as decimal(15, 2)) as "Уровень воды в барабане<br>КП-140_(правый) [L_water_KA4R]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K04_Hwater,
	L_water_KA4L,
	L_water_KA4R
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="Уровень воды в барабане" (срезы часовые)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K04_Hwater as decimal(15, 2)) as "Уровень воды в барабане<br>КС-2Е [K04_Hwater]",
	CAST(L_water_KA4L as decimal(15, 2)) as "Уровень воды в барабане<br>КП-140_(левый) [L_water_KA4L]",
	CAST(L_water_KA4R as decimal(15, 2)) as "Уровень воды в барабане<br>КП-140_(правый) [L_water_KA4R]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K04_Hwater,
	L_water_KA4L,
	L_water_KA4R
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName="Уровень воды в барабане" (срезы суточные)*/
/*Mode=суточные-1*/
/*DownQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K04_Hwater as decimal(15, 2)) as "Уровень воды в барабане<br>КС-2Е [K04_Hwater]",
	CAST(L_water_KA4L as decimal(15, 2)) as "Уровень воды в барабане<br>КП-140_(левый) [L_water_KA4L]",
	CAST(L_water_KA4R as decimal(15, 2)) as "Уровень воды в барабане<br>КП-140_(правый) [L_water_KA4R]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K04_Hwater,
	L_water_KA4L,
	L_water_KA4R
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")