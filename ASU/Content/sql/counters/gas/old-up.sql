{С НАЧАЛА СУТОК}
/*ReportName="ГАЗ по ГРП" (Нарастающим с начала суток)*/
/*Mode=часовые-1*/
/*DownQuery="С НАЧАЛА СМЕНЫ"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
Select
	DateAdd(mi, -65, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM11Q001_s0,0) as decimal(25,3)) as "G ОЛ за п/с, м3[G01_AM11Q001_s0]",
	CAST(isnull(G01_AM12Q001_s0,0) as decimal(25,3)) as "G ЛМР за п/с, м3[G01_AM12Q001_s0]",
	CAST(isnull(G01_AM11Q001_s0,0)+isnull(G01_AM12Q001_s0,0) as decimal(25,3)) as "G сум за п/с, тыс. м3[Hint: Суммарный расход]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, G01_AM11Q001_s0, G01_AM12Q001_s0
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="ГАЗ по ГРП" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="С НАЧАЛА СУТОК"*/
/*UpQuery="посменный 9/24"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM11Q001_S1,0) as decimal(25,3)) as "Q ОЛ за п/с, тыс.м3/сут [G01_AM11Q001_S1]",
	CAST(isnull(G01_AM12Q001_S1,0) as decimal(25,3)) as "Q ЛМР за п/с, тыс.м3/сут [G01_AM12Q001_S1]",
	CAST(isnull(G01_AM11Q001_s1,0)+isnull(G01_AM12Q001_s1,0) as decimal(25,3)) as "G сум за п/с, тыс. м3[Hint: Суммарный расход]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, G01_AM11Q001_S1, G01_AM12Q001_S1, G01_AM11T001_S1, G01_AM12T001_S1, G01_AM11P001_S1, G01_AM12P001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{С НАЧАЛА СМЕНЫ}
/*ReportName="ГАЗ по ГРП" (Нарастающим с начала смены)*/
/*StartDate=dd.MM.yyyy 10:05:00.000*/
/*DeltaDate=00.00.0000 23:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="С НАЧАЛА СУТОК"*/
/*UpQuery="посменный 9/24"*/

SET QUOTED_IDENTIFIER OFF
Select
	DateAdd(mi, -65, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM11Q001_V0,0) as decimal(25,3)) as "G ОЛ за п/с,м3[G01_AM11Q001_V0]",
	CAST(isnull(G01_AM12Q001_V0,0) as decimal(25,3)) as "G ЛМР за п/с,м3[G01_AM12Q001_V0]",
	CAST(isnull(G01_AM11Q001_V0,0)+isnull(G01_AM12Q001_V0,0) as decimal(25,3)) as "G сум за п/с, тыс. м3[Hint: Суммарный расход]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, G01_AM11Q001_V0, G01_AM12Q001_V0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный 9/24}
/*ReportName="ГАЗ по ГРП"(агрегированные часовые данные по сменам с 9 до 9)*/
/*StartDate=02.MM.yyyy 09:05:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=86400000*/
/*DownQuery="С НАЧАЛА СМЕНЫ"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1500, DateTime) as 'Дата - время начала смены',
	null,
	CAST(isnull(G01_AM11Q001_V1,0) as decimal(25,3)) as "Q ОЛ за п/см, тыс.м3/см [G01_AM11Q001_V1]",
	CAST(isnull(G01_AM12Q001_V1,0) as decimal(25,3)) as "Q ЛМР за п/см, тыс.м3/см [G01_AM12Q001_V1]",
	CAST(isnull(G01_AM11Q001_V1,0)+isnull(G01_AM12Q001_V1,0) as decimal(25,3)) as "G сум за п/см, тыс. м3[Hint: Суммарный расход]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, G01_AM11Q001_V1, CLC_ShiftDuty, G01_AM12Q001_V1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")