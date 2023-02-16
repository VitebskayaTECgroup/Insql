{минутные срезы}
/*ReportName="КА-3 Контроль температуры (Контроль мет.Iст.ПП) минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P71b as decimal(15, 2)) as "т19, °С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 2)) as "т39, °С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 2)) as "т59, °С [K3_VG1_P73b]",
	CAST(K3_VG1_P81b as decimal(15, 2)) as "т9, °С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 2)) as "т50, °С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 2)) as "т70, °С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="КА-3 Контроль температуры (Контроль мет.Iст.ПП) агрегированные за час"*/
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
	CAST(AVG(K3_VG1_P71b) as decimal(15, 2)) as "т19, °С [K3_VG1_P71b]",
	CAST(AVG(K3_VG1_P72b) as decimal(15, 2)) as "т39, °С [K3_VG1_P72b]",
	CAST(AVG(K3_VG1_P73b) as decimal(15, 2)) as "т59, °С [K3_VG1_P73b]",
	CAST(AVG(K3_VG1_P81b) as decimal(15, 2)) as "т9, °С [K3_VG1_P81b]",
	CAST(AVG(K3_VG1_P82b) as decimal(15, 2)) as "т50, °С [K3_VG1_P82b]",
	CAST(AVG(K3_VG1_P83b) as decimal(15, 2)) as "т70, °С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
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
/*ReportName="КА-3 Контроль температуры (Контроль мет.Iст.ПП)"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K3_VG1_P71b) as decimal(15, 2)) as "т19 сред., °С [K3_VG1_P71b]",
	CAST(AVG(K3_VG1_P72b) as decimal(15, 2)) as "т39 сред., °С [K3_VG1_P72b]",
	CAST(AVG(K3_VG1_P73b) as decimal(15, 2)) as "т59 сред., °С [K3_VG1_P73b]",
	CAST(AVG(K3_VG1_P81b) as decimal(15, 2)) as "т9 сред., °С [K3_VG1_P81b]",
	CAST(AVG(K3_VG1_P82b) as decimal(15, 2)) as "т50 сред., °С [K3_VG1_P82b]",
	CAST(AVG(K3_VG1_P83b) as decimal(15, 2)) as "т70 сред., °С [K3_VG1_P83b]",
	null,
	CAST(MAX(K3_VG1_P71b) as decimal(15, 2)) as "т19 макс., °С [K3_VG1_P71b]",
	CAST(MAX(K3_VG1_P72b) as decimal(15, 2)) as "т39 макс., °С [K3_VG1_P72b]",
	CAST(MAX(K3_VG1_P73b) as decimal(15, 2)) as "т59 макс., °С [K3_VG1_P73b]",
	CAST(MAX(K3_VG1_P81b) as decimal(15, 2)) as "т9 макс., °С [K3_VG1_P81b]",
	CAST(MAX(K3_VG1_P82b) as decimal(15, 2)) as "т50 макс., °С [K3_VG1_P82b]",
	CAST(MAX(K3_VG1_P83b) as decimal(15, 2)) as "т70 макс., °С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
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