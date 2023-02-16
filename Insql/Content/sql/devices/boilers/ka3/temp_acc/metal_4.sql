{минутные срезы}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IVст.ПП) минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P65b as decimal(15, 2)) as "т3, °С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 2)) as "т10, °С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 2)) as "т17, °С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 2)) as "т24, °С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 2)) as "т31, °С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 2)) as "т38, °С [K3_VG1_P70b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IVст.ПП) агрегированные за час"*/
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
	CAST(AVG(K3_VG1_P65b) as decimal(15, 2)) as "т3 сред., °С [K3_VG1_P65b]",
	CAST(AVG(K3_VG1_P66b) as decimal(15, 2)) as "т10 сред., °С [K3_VG1_P66b]",
	CAST(AVG(K3_VG1_P67b) as decimal(15, 2)) as "т17 сред., °С [K3_VG1_P67b]",
	CAST(AVG(K3_VG1_P68b) as decimal(15, 2)) as "т24 сред., °С [K3_VG1_P68b]",
	CAST(AVG(K3_VG1_P69b) as decimal(15, 2)) as "т31 сред., °С [K3_VG1_P69b]",
	CAST(AVG(K3_VG1_P70b) as decimal(15, 2)) as "т38 сред., °С [K3_VG1_P70b]",
	null,
	CAST(MAX(K3_VG1_P65b) as decimal(15, 2)) as "т3 макс., °С [K3_VG1_P65b]",
	CAST(MAX(K3_VG1_P66b) as decimal(15, 2)) as "т10 макс., °С [K3_VG1_P66b]",
	CAST(MAX(K3_VG1_P67b) as decimal(15, 2)) as "т17 макс., °С [K3_VG1_P67b]",
	CAST(MAX(K3_VG1_P68b) as decimal(15, 2)) as "т24 макс., °С [K3_VG1_P68b]",
	CAST(MAX(K3_VG1_P69b) as decimal(15, 2)) as "т31 макс., °С [K3_VG1_P69b]",
	CAST(MAX(K3_VG1_P70b) as decimal(15, 2)) as "т38 макс., °С [K3_VG1_P70b]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b
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
/*ReportName="КА-3 Контроль температуры (Контроль мет.IVст.ПП) агрегированные за сутки"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K3_VG1_P65b) as decimal(15, 2)) as "т3 сред., °С [K3_VG1_P65b]",
	CAST(AVG(K3_VG1_P66b) as decimal(15, 2)) as "т10 сред., °С [K3_VG1_P66b]",
	CAST(AVG(K3_VG1_P67b) as decimal(15, 2)) as "т17 сред., °С [K3_VG1_P67b]",
	CAST(AVG(K3_VG1_P68b) as decimal(15, 2)) as "т24 сред., °С [K3_VG1_P68b]",
	CAST(AVG(K3_VG1_P69b) as decimal(15, 2)) as "т31 сред., °С [K3_VG1_P69b]",
	CAST(AVG(K3_VG1_P70b) as decimal(15, 2)) as "т38 сред., °С [K3_VG1_P70b]",
	null,
	CAST(MAX(K3_VG1_P65b) as decimal(15, 2)) as "т3 макс., °С [K3_VG1_P65b]",
	CAST(MAX(K3_VG1_P66b) as decimal(15, 2)) as "т10 макс., °С [K3_VG1_P66b]",
	CAST(MAX(K3_VG1_P67b) as decimal(15, 2)) as "т17 макс., °С [K3_VG1_P67b]",
	CAST(MAX(K3_VG1_P68b) as decimal(15, 2)) as "т24 макс., °С [K3_VG1_P68b]",
	CAST(MAX(K3_VG1_P69b) as decimal(15, 2)) as "т31 макс., °С [K3_VG1_P69b]",
	CAST(MAX(K3_VG1_P70b) as decimal(15, 2)) as "т38 макс., °С [K3_VG1_P70b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b
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