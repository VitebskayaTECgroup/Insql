{часовые срезы}
/*ReportName="ГАЗ по ГРП" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="часовые срезы 9/24"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -65, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM31Q701_H1_korr,0)/1000 as decimal(25,3)) as "Q по потр. за п/ч, тыс. м3/ч [G01_AM31Q701_H1]",
	CAST(isnull(G01_AM11P001_H1,0) as decimal(25,3)) as "P ОЛ за п/ч, абс.МПа [G01_AM11P001_H1]",
	CAST(isnull(G01_AM11T001_H1,0) as decimal(25,2)) as "T ОЛ за п/ч, °С [G01_AM11T001_H1]",
	CAST(isnull(G01_AM12P001_H1,0) as decimal(25,3)) as "P ЛМР за п/ч, абс.МПа [G01_AM12P001_H1]",
	CAST(isnull(G01_AM12T001_H1,0) as decimal(25,2)) as "T ЛМР за п/ч, °С [G01_AM12T001_H1]"
FROM (
	SELECT *,
		CASE WHEN DateTime >= '20211008 15:49:00' AND DateTime <= '20211026 10:00:00' THEN G01_AM31Q701_H1 / 1000 ELSE G01_AM31Q701_H1 END AS G01_AM31Q701_H1_korr
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, G01_AM11P001_H1, G01_AM12P001_H1, G01_AM11T001_H1, G01_AM12T001_H1, G01_AM31Q701_H1
		FROM Runtime.dbo.AnalogWideHistory 
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
) AS T1


{суточные срезы}
/*ReportName="ГАЗ по ГРП" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="посменный 9/24"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM11Q001_V1_korr,0) as decimal(25,3)) as "Q ОЛ за п/с, тыс.м3/сут [G01_AM11Q001_V1]",
	CAST(isnull(G01_AM11P001_S1,0) as decimal(25,3)) as "P ОЛ за п/с, абс.МПа [G01_AM11P001_S1]",
	CAST(isnull(G01_AM11T001_S1,0) as decimal(25,2)) as "T ОЛ за п/с, °С [G01_AM11T001_S1]",
	CAST(isnull(G01_AM12Q001_V1,0) as decimal(25,3)) as "Q ЛМР за п/с, тыс.м3/сут [G01_AM12Q001_V1]",
	CAST(isnull(G01_AM12P001_S1,0) as decimal(25,3)) as "P ЛМР за п/с, абс.МПа [G01_AM12P001_S1]",
	CAST(isnull(G01_AM12T001_S1,0) as decimal(25,2)) as "T ЛМР за п/с, °С [G01_AM12T001_S1]",
	CAST(isnull(G01_AM11Q001_V1_korr,0)+isnull(G01_AM12Q001_V1,0) as decimal(25,3)) as "Q сум за п/с, тыс.м3/сут [G01_AM11Q001_V1+G01_AM12Q001_V1]"
FROM (
	SELECT *,
		CASE WHEN DateTime >= '20211008 15:49:00' AND DateTime <= '20211027 01:00:00' THEN G01_AM11Q001_V1 / 1000 ELSE G01_AM11Q001_V1 END AS G01_AM11Q001_V1_korr
	FROM
		OpenQuery(INSQL, 
		"SELECT DateTime, G01_AM11Q001_V1, G01_AM12Q001_V1, G01_AM11T001_S1, G01_AM12T001_S1, G01_AM11P001_S1, G01_AM12P001_S1
		FROM Runtime.dbo.AnalogWideHistory 
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
) AS T1


{часовые срезы 9/24}
/*ReportName="ГАЗ по ГРП" (почасовые за смену 9/24)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=dd.MM.yyyy 10:05:00.000*/
/*DeltaDate=00.00.0000 23:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="часовые срезы"*/
/*UpQuery="посменный 9/24"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -65, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM31Q701_H1_korr,0)/1000 as decimal(25,3)) as "Q по потр. за п/ч,  тыс. м3/ч [G01_AM31Q701_H1]",
	CAST(isnull(G01_AM11P001_H1,0) as decimal(25,3)) as "P ОЛ за п/ч, абс.МПа [G01_AM11P001_H1]",
	CAST(isnull(G01_AM11T001_H1,0) as decimal(25,2)) as "T ОЛ за п/ч, °С [G01_AM11T001_H1]",
	CAST(isnull(G01_AM12P001_H1,0) as decimal(25,3)) as "P ЛМР за п/ч, абс.МПа [G01_AM12P001_H1]",
	CAST(isnull(G01_AM12T001_H1,0) as decimal(25,2)) as "T ЛМР за п/ч, °С [G01_AM12T001_H1]"
FROM (
	SELECT *,
		CASE WHEN DateTime >= '20211008 15:49:00' AND DateTime <= '20211026 10:00:00' THEN G01_AM31Q701_H1 / 1000 ELSE G01_AM31Q701_H1 END AS G01_AM31Q701_H1_korr
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, G01_AM11P001_H1, G01_AM12P001_H1, G01_AM11T001_H1, CLC_ShiftDuty, G01_AM12T001_H1, G01_AM31Q701_H1
		FROM Runtime.dbo.AnalogWideHistory
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
) AS T1



{посменный 9/24}
/*ReportName="ГАЗ по ГРП"(агрегированные часовые данные по сменам за прош. смену с 9 до 9 )*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=02.MM.yyyy 09:05:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=86400000*/
/*DownQuery="часовые срезы 9/24"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1500, DateTime) as 'Дата',
	null,
	CAST(isnull(G01_AM11Q001_S1_korr,0) as decimal(25,3)) as "Q ОЛ за п/см, тыс.м3/см [G01_AM11Q001_S1]",
	CAST(isnull(G01_AM12Q001_S1,0) as decimal(25,3)) as "Q ЛМР за п/см, тыс.м3/см [G01_AM12Q001_S1]"
FROM (
	SELECT *,
		CASE WHEN DateTime >= '20211008 15:49:00' AND DateTime <= '20211026 10:00:00' THEN G01_AM11Q001_S1 / 1000 ELSE G01_AM11Q001_S1 END AS G01_AM11Q001_S1_korr
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime, G01_AM11Q001_S1, CLC_ShiftDuty, G01_AM12Q001_S1
		FROM Runtime.dbo.AnalogWideHistory 
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
) AS T1