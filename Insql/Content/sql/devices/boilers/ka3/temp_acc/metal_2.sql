{минутные срезы}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IIст.ПП) минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P54b as decimal(15, 2)) as "ширма 1 вых, °С [K3_VG1_P54b]",
	CAST(K3_VG1_P56b as decimal(15, 2)) as "ширма 2 выз, °С [K3_VG1_P56b]",
	CAST(K3_VG1_P58b as decimal(15, 2)) as "ширма 3 выз, °С [K3_VG1_P58b]",
	CAST(K3_VG1_P60b as decimal(15, 2)) as "ширма 4 выз, °С [K3_VG1_P60b]",
	CAST(K3_VG1_P62b as decimal(15, 2)) as "ширма 5 выз, °С [K3_VG1_P62b]",
	CAST(K3_VG1_P64b as decimal(15, 2)) as "ширма 6 выз, °С [K3_VG1_P64b]",
	CAST(K3_VG1_P32b as decimal(15, 2)) as "ширма 7 выз, °С [K3_VG1_P32b]",
	CAST(K3_VG1_P34b as decimal(15, 2)) as "ширма 8 выз, °С [K3_VG1_P34b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P54b,
	K3_VG1_P56b,
	K3_VG1_P58b,
	K3_VG1_P60b,
	K3_VG1_P62b,
	K3_VG1_P64b,
	K3_VG1_P32b,
	K3_VG1_P34b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="КА-3 Контроль температуры (Контроль мет.IIст.ПП) агрегированные за час"*/
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
	CAST(AVG(K3_VG1_P54b) as decimal(15, 2)) as "ширма 1 вых, °С [K3_VG1_P54b]",
	CAST(AVG(K3_VG1_P56b) as decimal(15, 2)) as "ширма 2 выз, °С [K3_VG1_P56b]",
	CAST(AVG(K3_VG1_P58b) as decimal(15, 2)) as "ширма 3 выз, °С [K3_VG1_P58b]",
	CAST(AVG(K3_VG1_P60b) as decimal(15, 2)) as "ширма 4 выз, °С [K3_VG1_P60b]",
	CAST(AVG(K3_VG1_P62b) as decimal(15, 2)) as "ширма 5 выз, °С [K3_VG1_P62b]",
	CAST(AVG(K3_VG1_P64b) as decimal(15, 2)) as "ширма 6 выз, °С [K3_VG1_P64b]",
	CAST(AVG(K3_VG1_P32b) as decimal(15, 2)) as "ширма 7 выз, °С [K3_VG1_P32b]",
	CAST(AVG(K3_VG1_P34b) as decimal(15, 2)) as "ширма 8 выз, °С [K3_VG1_P34b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P54b,
	K3_VG1_P56b,
	K3_VG1_P58b,
	K3_VG1_P60b,
	K3_VG1_P62b,
	K3_VG1_P64b,
	K3_VG1_P32b,
	K3_VG1_P34b
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
/*ReportName="КА-3 Контроль температуры (Контроль мет.IIст.ПП) агрегированные за сутки"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(K3_VG1_P54b) as decimal(15, 2)) as "ширма 1 вых сред., °С [K3_VG1_P54b]",
	CAST(AVG(K3_VG1_P56b) as decimal(15, 2)) as "ширма 2 выз сред., °С [K3_VG1_P56b]",
	CAST(AVG(K3_VG1_P58b) as decimal(15, 2)) as "ширма 3 выз сред., °С [K3_VG1_P58b]",
	CAST(AVG(K3_VG1_P60b) as decimal(15, 2)) as "ширма 4 выз сред., °С [K3_VG1_P60b]",
	CAST(AVG(K3_VG1_P62b) as decimal(15, 2)) as "ширма 5 выз сред., °С [K3_VG1_P62b]",
	CAST(AVG(K3_VG1_P64b) as decimal(15, 2)) as "ширма 6 выз сред., °С [K3_VG1_P64b]",
	CAST(AVG(K3_VG1_P32b) as decimal(15, 2)) as "ширма 7 выз сред., °С [K3_VG1_P32b]",
	CAST(AVG(K3_VG1_P34b) as decimal(15, 2)) as "ширма 8 выз сред., °С [K3_VG1_P34b]",
	null,
	CAST(MAX(K3_VG1_P54b) as decimal(15, 2)) as "ширма 1 вых макс., °С [K3_VG1_P54b]",
	CAST(MAX(K3_VG1_P56b) as decimal(15, 2)) as "ширма 2 выз макс., °С [K3_VG1_P56b]",
	CAST(MAX(K3_VG1_P58b) as decimal(15, 2)) as "ширма 3 выз макс., °С [K3_VG1_P58b]",
	CAST(MAX(K3_VG1_P60b) as decimal(15, 2)) as "ширма 4 выз макс., °С [K3_VG1_P60b]",
	CAST(MAX(K3_VG1_P62b) as decimal(15, 2)) as "ширма 5 выз макс., °С [K3_VG1_P62b]",
	CAST(MAX(K3_VG1_P64b) as decimal(15, 2)) as "ширма 6 выз макс., °С [K3_VG1_P64b]",
	CAST(MAX(K3_VG1_P32b) as decimal(15, 2)) as "ширма 7 выз макс., °С [K3_VG1_P32b]",
	CAST(MAX(K3_VG1_P34b) as decimal(15, 2)) as "ширма 8 выз макс., °С [K3_VG1_P34b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P54b,
	K3_VG1_P56b,
	K3_VG1_P58b,
	K3_VG1_P60b,
	K3_VG1_P62b,
	K3_VG1_P64b,
	K3_VG1_P32b,
	K3_VG1_P34b
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