{минутные срезы}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IIIст.ПП) минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P49b as decimal(15, 2)) as "змеевик 6, °С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 2)) as "змеевик 12, °С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 2)) as "змеевик 66, °С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 2)) as "змеевик 72, °С [K3_VG1_P52b]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IIIст.ПП) агрегированные за час"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*UpQuery="агрегированные за сутки"*/
/*DownQuery="минутные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K3_VG1_P49b) as decimal(15, 2)) as "змеевик 6, °С [K3_VG1_P49b]",
	CAST(AVG(K3_VG1_P50b) as decimal(15, 2)) as "змеевик 12, °С [K3_VG1_P50b]",
	CAST(AVG(K3_VG1_P51b) as decimal(15, 2)) as "змеевик 66, °С [K3_VG1_P51b]",
	CAST(AVG(K3_VG1_P52b) as decimal(15, 2)) as "змеевик 72, °С [K3_VG1_P52b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b
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


{агрегированные за сутки}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IIIст.ПП) агрегированные за сутки"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K3_VG1_P49b) as decimal(15, 2)) as "змеевик 6 сред., °С [K3_VG1_P49b]",
	CAST(AVG(K3_VG1_P50b) as decimal(15, 2)) as "змеевик 12 сред., °С [K3_VG1_P50b]",
	CAST(AVG(K3_VG1_P51b) as decimal(15, 2)) as "змеевик 66 сред., °С [K3_VG1_P51b]",
	CAST(AVG(K3_VG1_P52b) as decimal(15, 2)) as "змеевик 72 сред., °С [K3_VG1_P52b]",
	null,
	CAST(MAX(K3_VG1_P49b) as decimal(15, 2)) as "змеевик 6 макс., °С [K3_VG1_P49b]",
	CAST(MAX(K3_VG1_P50b) as decimal(15, 2)) as "змеевик 12 макс., °С [K3_VG1_P50b]",
	CAST(MAX(K3_VG1_P51b) as decimal(15, 2)) as "змеевик 66 макс., °С [K3_VG1_P51b]",
	CAST(MAX(K3_VG1_P52b) as decimal(15, 2)) as "змеевик 72 макс., °С [K3_VG1_P52b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(day, DateDiff(day, 0, DateTime), 0)
ORDER BY
	DateAdd(day, DateDiff(day, 0, DateTime), 0)