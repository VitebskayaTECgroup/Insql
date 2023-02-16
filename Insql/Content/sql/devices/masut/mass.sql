{минутные срезы}
/*ReportName=Общая масса мазута в емкостях 1-4 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(M1_massa as decimal(8,2)) as "Емк.№1 без МО [M1_massa]",
	CAST(M2_massa as decimal(8,2)) as "Емк.№2 без МО [M2_massa]",
	CAST(M3_massa as decimal(8,2)) as "Емк.№3 без МО [M3_massa]",
	CAST(M4_massa as decimal(8,2)) as "Емк.№4 без МО [M4_massa]",
	null,
	CAST(M1_massa+M2_massa+M3_massa+M4_massa as decimal(8,2)) as "Масса без МО [Hint:Общая масса мазута без МО]",
	CAST(M1_TotalM+M2_TotalM+M3_TotalM+M4_TotalM as decimal(8,2)) as "Всего масса c MO [Hint:Общая масса мазута c MO]",
	null,
	CAST(M1_TotalM as decimal(8,2)) as "Емк.№1 [M1_TotalM]",
	CAST(M2_TotalM as decimal(8,2)) as "Емк.№2 [M2_TotalM]",
	CAST(M3_TotalM as decimal(8,2)) as "Емк.№3 [M3_TotalM]",
	CAST(M4_TotalM as decimal(8,2)) as "Емк.№4 [M4_TotalM]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_TotalM,M2_TotalM,M3_TotalM,M4_TotalM,M4_massa,M1_massa,M2_massa,M3_massa,M1_M0,M2_M0,M3_M0,M4_M0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Общая масса мазута в емкостях 1-4 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(M1_massa as decimal(8,2)) as "Емк.№1 без МО [M1_massa]",
	CAST(M2_massa as decimal(8,2)) as "Емк.№2 без МО [M2_massa]",
	CAST(M3_massa as decimal(8,2)) as "Емк.№3 без МО [M3_massa]",
	CAST(M4_massa as decimal(8,2)) as "Емк.№4 без МО [M4_massa]",
	null,
	CAST(M4_massa+M1_massa+M2_massa+M3_massa as decimal(8,2)) as "Масса без МО [Hint:Общая масса мазута без МО]",
	CAST(M1_TotalM+M2_TotalM+M3_TotalM+M4_TotalM as decimal(8,2)) as "Всего масса [Hint:Общая масса мазута]",
	null,
	CAST(M1_TotalM as decimal(8,2)) as "Емк.№1 [M1_TotalM]",
	CAST(M2_TotalM as decimal(8,2)) as "Емк.№2 [M2_TotalM]",
	CAST(M3_TotalM as decimal(8,2)) as "Емк.№3 [M3_TotalM]",
	CAST(M4_TotalM as decimal(8,2)) as "Емк.№4 [M4_TotalM]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_TotalM,M2_TotalM,M3_TotalM,M4_TotalM,M4_massa,M1_massa,M2_massa,M3_massa,M1_M0,M2_M0,M3_M0,M4_M0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Общая масса мазута в емкостях 1-4 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(M1_massa as decimal(8,2)) as "Емк.№1 без МО [M1_massa]",
	CAST(M2_massa as decimal(8,2)) as "Емк.№2 без МО [M2_massa]",
	CAST(M3_massa as decimal(8,2)) as "Емк.№3 без МО [M3_massa]",
	CAST(M4_massa as decimal(8,2)) as "Емк.№4 без МО [M4_massa]",
	null,
	CAST(M4_massa+M1_massa+M2_massa+M3_massa as decimal(8,2)) as "Масса без МО [Hint:Общая масса мазута без МО]",
	CAST(M1_TotalM+M2_TotalM+M3_TotalM+M4_TotalM as decimal(8,2)) as "Всего масса [Hint:Общая масса мазута]",
	null,
	CAST(M1_TotalM as decimal(8,2)) as "Емк.№1 [M1_TotalM]",
	CAST(M2_TotalM as decimal(8,2)) as "Емк.№2 [M2_TotalM]",
	CAST(M3_TotalM as decimal(8,2)) as "Емк.№3 [M3_TotalM]",
	CAST(M4_TotalM as decimal(8,2)) as "Емк.№4 [M4_TotalM]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_TotalM,M2_TotalM,M3_TotalM,M4_TotalM,M4_massa,M1_massa,M2_massa,M3_massa,M1_M0,M2_M0,M3_M0,M4_M0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")