{минутные срезы}
/*ReportName="Контроль металла III ступени пароперегревателя к/а БК5-160-100 ст.№5 минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K048 as decimal(15, 2)) as "Змеевик №6, °С [KA5_VG1_K048]",
	CAST(KA5_VG1_K049 as decimal(15, 2)) as "Змеевик №12, °С [KA5_VG1_K049]",
	CAST(KA5_VG1_K050 as decimal(15, 2)) as "Змеевик №66, °С [KA5_VG1_K050]",
	CAST(KA5_VG1_K051 as decimal(15, 2)) as "Змеевик №72, °С [KA5_VG1_K051]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Контроль металла III ступени пароперегревателя к/а БК5-160-100 ст.№5 агрегированные за час"*/
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
	CAST(AVG(KA5_VG1_K048) as decimal(15, 2)) as "Змеевик №6, °С [KA5_VG1_K048]",
	CAST(AVG(KA5_VG1_K049) as decimal(15, 2)) as "Змеевик №12, °С [KA5_VG1_K049]",
	CAST(AVG(KA5_VG1_K050) as decimal(15, 2)) as "Змеевик №66, °С [KA5_VG1_K050]",
	CAST(AVG(KA5_VG1_K051) as decimal(15, 2)) as "Змеевик №72, °С [KA5_VG1_K051]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051
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
/*ReportName="Контроль металла III ступени пароперегревателя к/а БК5-160-100 ст.№5 агрегированные за сутки"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K048) as decimal(15, 2)) as "Змеевик №6<br>среднее, °С [KA5_VG1_K048]",
	CAST(AVG(KA5_VG1_K049) as decimal(15, 2)) as "Змеевик №12<br>среднее, °С [KA5_VG1_K049]",
	CAST(AVG(KA5_VG1_K050) as decimal(15, 2)) as "Змеевик №66<br>среднее, °С [KA5_VG1_K050]",
	CAST(AVG(KA5_VG1_K051) as decimal(15, 2)) as "Змеевик №72<br>среднее, °С [KA5_VG1_K051]",
	null,
	CAST(MAX(KA5_VG1_K048) as decimal(15, 2)) as "Змеевик №6<br>макс., °С [KA5_VG1_K048]",
	CAST(MAX(KA5_VG1_K049) as decimal(15, 2)) as "Змеевик №12<br>макс., °С [KA5_VG1_K049]",
	CAST(MAX(KA5_VG1_K050) as decimal(15, 2)) as "Змеевик №66<br>макс., °С [KA5_VG1_K050]",
	CAST(MAX(KA5_VG1_K051) as decimal(15, 2)) as "Змеевик №72<br>макс., °С [KA5_VG1_K051]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051
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