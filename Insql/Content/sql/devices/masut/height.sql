{минутные срезы}
/*ReportName=Общая Приведенная рабочая высота мазута в емкостях 1-4 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CASE WHEN (M1_HeightCalc not like '%e%') AND (M1_H0 not like '%e%') THEN CAST(M1_HeightCalc-M1_H0 as decimal(8,3)) ELSE 0 END as "Емк.№1 раб высота [M1_HeightCalc]",
	--CAST(M1_HeightCalc-M1_H0 as decimal(8,3)) as "Емк.№1 раб высота [M1_HeightCalc]",
	CASE WHEN (M2_HeightCalc not like '%e%') AND (M2_H0 not like '%e%') THEN CAST(M2_HeightCalc-M2_H0 as decimal(8,3)) ELSE 0 END as "Емк.№2 раб высота [M2_HeightCalc]",
	--CAST(M2_HeightCalc-M2_H0 as decimal(8,3)) as "Емк.№2 раб высота [M2_HeightCalc]",
	CASE WHEN (M3_HeightCalc not like '%e%') AND (M3_H0 not like '%e%') THEN CAST(M3_HeightCalc-M3_H0 as decimal(8,3)) ELSE 0 END as "Емк.№3 раб высота [M3_HeightCalc]",
	--CAST(M3_HeightCalc-M3_H0 as decimal(8,3)) as "Емк.№3 раб высота [M3_HeightCalc]",
	CASE WHEN (M4_HeightCalc not like '%e%') AND (M4_H0 not like '%e%') THEN CAST(M4_HeightCalc-M4_H0 as decimal(8,3)) ELSE 0 END as "Емк.№4 раб высота [M4_HeightCalc]",
	--CAST(M4_HeightCalc-M4_H0 as decimal(8,3)) as "Емк.№4 раб высота [M4_HeightCalc]",
	null,
	CASE WHEN (M1_HeightCalc not like '%e%') AND (M1_H0 not like '%e%') AND (M2_HeightCalc not like '%e%') AND (M2_H0 not like '%e%') AND (M3_HeightCalc not like '%e%') AND (M3_H0 not like '%e%') AND (M4_HeightCalc not like '%e%') AND (M4_H0 not like '%e%') THEN CAST((M4_HeightCalc-M4_H0)/5+(M1_HeightCalc-M1_H0+M2_HeightCalc-M2_H0+M3_HeightCalc-M3_H0)/5 as decimal(8,3)) ELSE 0 END as "Приведенная общая  раб высота, М [Hint:Общая приведенная рабочая высота мазута  Н1+Н2+Н3/5+Н4/5]"
	--CAST((M4_HeightCalc-M4_H0)/5+(M1_HeightCalc-M1_H0+M2_HeightCalc-M2_H0+M3_HeightCalc-M3_H0)/5 as decimal(8,3)) as "Приведенная общая  раб высота, М [Hint:Общая приведенная рабочая высота мазута  Н1+Н2+Н3/5+Н4/5]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M4_HeightCalc,M1_HeightCalc,M2_HeightCalc,M3_HeightCalc,M1_H0,M2_H0,M3_H0,M4_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Общая Приведенная рабочая высота мазута в емкостях 1-4 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CASE WHEN (M1_HeightCalc not like '%e%') AND (M1_H0 not like '%e%') THEN CAST(M1_HeightCalc-M1_H0 as decimal(8,3)) ELSE 0 END as "Емк.№1 раб высота [M1_HeightCalc]",
	--CAST(M1_HeightCalc-M1_H0 as decimal(8,3)) as "Емк.№1 раб высота [M1_HeightCalc]",
	CASE WHEN (M2_HeightCalc not like '%e%') AND (M2_H0 not like '%e%') THEN CAST(M2_HeightCalc-M2_H0 as decimal(8,3)) ELSE 0 END as "Емк.№2 раб высота [M2_HeightCalc]",
	--CAST(M2_HeightCalc-M2_H0 as decimal(8,3)) as "Емк.№2 раб высота [M2_HeightCalc]",
	CASE WHEN (M3_HeightCalc not like '%e%') AND (M3_H0 not like '%e%') THEN CAST(M3_HeightCalc-M3_H0 as decimal(8,3)) ELSE 0 END as "Емк.№3 раб высота [M3_HeightCalc]",
	--CAST(M3_HeightCalc-M3_H0 as decimal(8,3)) as "Емк.№3 раб высота [M3_HeightCalc]",
	CASE WHEN (M4_HeightCalc not like '%e%') AND (M4_H0 not like '%e%') THEN CAST(M4_HeightCalc-M4_H0 as decimal(8,3)) ELSE 0 END as "Емк.№4 раб высота [M4_HeightCalc]",
	--CAST(M4_HeightCalc-M4_H0 as decimal(8,3)) as "Емк.№4 раб высота [M4_HeightCalc]",
	null,
	CASE WHEN (M1_HeightCalc not like '%e%') AND (M1_H0 not like '%e%') AND (M2_HeightCalc not like '%e%') AND (M2_H0 not like '%e%') AND (M3_HeightCalc not like '%e%') AND (M3_H0 not like '%e%') AND (M4_HeightCalc not like '%e%') AND (M4_H0 not like '%e%') THEN CAST((M4_HeightCalc-M4_H0)/5+(M1_HeightCalc-M1_H0+M2_HeightCalc-M2_H0+M3_HeightCalc-M3_H0)/5 as decimal(8,3)) ELSE 0 END as "Приведенная общая  раб высота, М [Hint:Общая приведенная рабочая высота мазута  Н1+Н2+Н3/5+Н4/5]"
	--CAST((M4_HeightCalc-M4_H0)/5+(M1_HeightCalc-M1_H0+M2_HeightCalc-M2_H0+M3_HeightCalc-M3_H0)/5 as decimal(8,3)) as "Приведенная общая  раб высота, М [Hint:Общая приведенная рабочая высота мазута  Н1+Н2+Н3/5+Н4/5]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M4_HeightCalc,M1_HeightCalc,M2_HeightCalc,M3_HeightCalc,M1_H0,M2_H0,M3_H0,M4_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Общая Приведенная рабочая высота мазута в емкостях 1-4 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CASE WHEN (M1_HeightCalc not like '%e%') AND (M1_H0 not like '%e%') THEN CAST(M1_HeightCalc-M1_H0 as decimal(8,3)) ELSE 0 END as "Емк.№1 раб высота [M1_HeightCalc]",
	--CAST(M1_HeightCalc-M1_H0 as decimal(8,3)) as "Емк.№1 раб высота [M1_HeightCalc]",
	CASE WHEN (M2_HeightCalc not like '%e%') AND (M2_H0 not like '%e%') THEN CAST(M2_HeightCalc-M2_H0 as decimal(8,3)) ELSE 0 END as "Емк.№2 раб высота [M2_HeightCalc]",
	--CAST(M2_HeightCalc-M2_H0 as decimal(8,3)) as "Емк.№2 раб высота [M2_HeightCalc]",
	CASE WHEN (M3_HeightCalc not like '%e%') AND (M3_H0 not like '%e%') THEN CAST(M3_HeightCalc-M3_H0 as decimal(8,3)) ELSE 0 END as "Емк.№3 раб высота [M3_HeightCalc]",
	--CAST(M3_HeightCalc-M3_H0 as decimal(8,3)) as "Емк.№3 раб высота [M3_HeightCalc]",
	CASE WHEN (M4_HeightCalc not like '%e%') AND (M4_H0 not like '%e%') THEN CAST(M4_HeightCalc-M4_H0 as decimal(8,3)) ELSE 0 END as "Емк.№4 раб высота [M4_HeightCalc]",
	--CAST(M4_HeightCalc-M4_H0 as decimal(8,3)) as "Емк.№4 раб высота [M4_HeightCalc]",
	null,
	CASE WHEN (M1_HeightCalc not like '%e%') AND (M1_H0 not like '%e%') AND (M2_HeightCalc not like '%e%') AND (M2_H0 not like '%e%') AND (M3_HeightCalc not like '%e%') AND (M3_H0 not like '%e%') AND (M4_HeightCalc not like '%e%') AND (M4_H0 not like '%e%') THEN CAST((M4_HeightCalc-M4_H0)/5+(M1_HeightCalc-M1_H0+M2_HeightCalc-M2_H0+M3_HeightCalc-M3_H0)/5 as decimal(8,3)) ELSE 0 END as "Приведенная общая  раб высота, М [Hint:Общая приведенная рабочая высота мазута  Н1+Н2+Н3/5+Н4/5]"
	--CAST((M4_HeightCalc-M4_H0)/5+(M1_HeightCalc-M1_H0+M2_HeightCalc-M2_H0+M3_HeightCalc-M3_H0)/5 as decimal(8,3)) as "Приведенная общая  раб высота, М [Hint:Общая приведенная рабочая высота мазута  Н1+Н2+Н3/5+Н4/5]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M4_HeightCalc,M1_HeightCalc,M2_HeightCalc,M3_HeightCalc,M1_H0,M2_H0,M3_H0,M4_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")