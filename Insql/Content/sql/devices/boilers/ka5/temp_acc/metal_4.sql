{минутные срезы}
/*ReportName="Контроль металла IV ступени пароперегревателя к/а БК5-160-100 ст.№5 минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K065 as decimal(15, 2)) as "Змеевик №3, °С [KA5_VG1_K065]",
	CAST(KA5_VG1_K066 as decimal(15, 2)) as "Змеевик №10, °С [KA5_VG1_K066]",
	CAST(KA5_VG1_K067 as decimal(15, 2)) as "Змеевик №17, °С [KA5_VG1_K067]",
	CAST(KA5_VG1_K068 as decimal(15, 2)) as "Змеевик №24, °С [KA5_VG1_K068]",
	CAST(KA5_VG1_K069 as decimal(15, 2)) as "Змеевик №31, °С [KA5_VG1_K069]",
	CAST(KA5_VG1_K070 as decimal(15, 2)) as "Змеевик №38, °С [KA5_VG1_K070]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Контроль металла IV ступени пароперегревателя к/а БК5-160-100 ст.№5 агрегированные за час"*/
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
	CAST(AVG(KA5_VG1_K065) as decimal(15, 2)) as "Змеевик №3, °С [KA5_VG1_K065]",
	CAST(AVG(KA5_VG1_K066) as decimal(15, 2)) as "Змеевик №10, °С [KA5_VG1_K066]",
	CAST(AVG(KA5_VG1_K067) as decimal(15, 2)) as "Змеевик №17, °С [KA5_VG1_K067]",
	CAST(AVG(KA5_VG1_K068) as decimal(15, 2)) as "Змеевик №24, °С [KA5_VG1_K068]",
	CAST(AVG(KA5_VG1_K069) as decimal(15, 2)) as "Змеевик №31, °С [KA5_VG1_K069]",
	CAST(AVG(KA5_VG1_K070) as decimal(15, 2)) as "Змеевик №38, °С [KA5_VG1_K070]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070
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
/*ReportName="Контроль металла IV ступени пароперегревателя к/а БК5-160-100 ст.№5 агрегированные за сутки"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K065) as decimal(15, 2)) as "Змеевик №3<br>среднее, °С [KA5_VG1_K065]",
	CAST(AVG(KA5_VG1_K066) as decimal(15, 2)) as "Змеевик №10<br>среднее, °С [KA5_VG1_K066]",
	CAST(AVG(KA5_VG1_K067) as decimal(15, 2)) as "Змеевик №17<br>среднее, °С [KA5_VG1_K067]",
	CAST(AVG(KA5_VG1_K068) as decimal(15, 2)) as "Змеевик №24<br>среднее, °С [KA5_VG1_K068]",
	CAST(AVG(KA5_VG1_K069) as decimal(15, 2)) as "Змеевик №31<br>среднее, °С [KA5_VG1_K069]",
	CAST(AVG(KA5_VG1_K070) as decimal(15, 2)) as "Змеевик №38<br>среднее, °С [KA5_VG1_K070]",
	null,
	CAST(MAX(KA5_VG1_K065) as decimal(15, 2)) as "Змеевик №3<br>макс., °С [KA5_VG1_K065]",
	CAST(MAX(KA5_VG1_K066) as decimal(15, 2)) as "Змеевик №10<br>макс., °С [KA5_VG1_K066]",
	CAST(MAX(KA5_VG1_K067) as decimal(15, 2)) as "Змеевик №17<br>макс., °С [KA5_VG1_K067]",
	CAST(MAX(KA5_VG1_K068) as decimal(15, 2)) as "Змеевик №24<br>макс., °С [KA5_VG1_K068]",
	CAST(MAX(KA5_VG1_K069) as decimal(15, 2)) as "Змеевик №31<br>макс., °С [KA5_VG1_K069]",
	CAST(MAX(KA5_VG1_K070) as decimal(15, 2)) as "Змеевик №38<br>макс., °С [KA5_VG1_K070]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070
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