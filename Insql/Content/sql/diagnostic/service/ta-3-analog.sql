{Посекундный}
/*ReportName=Параметры ТА-3 (секундные данные)*/
/*ReportRefresh=dd.MM.yyyy HH:mm:01.000*/
/*StartDate=dd.MM.yyyy HH:mm:00.000*/
/*DeltaDate=00.00.0000 00:00:59.000*/
/*Step=00.00.0000 00:00:01.000*/
/*Resolution=1000*/
/*UpQuery="минутные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST (S3_SJ20P001 as decimal(15,3)) as "Давление масла на регулирование [S3_SJ20P001]",
	CAST (S3_STKER_Y1 as decimal(15,3)) as "Мощность активная [S3_STKER_Y1]",
	CAST (S3_SJ11D001 as decimal(15,3)) as "Нагрузка ЭД насоса системы регулирования № 1 [S3_SJ11D001]",
	CAST (S3_SJ54H101 as decimal(15,3)) as "Положение сервомотора повор. диафрагмы ЧСД [S3_SJ54H101]",
	CAST (S3_SJ55H101 as decimal(15,3)) as "Положение сервомотора повор. диафрагмы ЧНД [S3_SJ55H101]",
	CAST (S3_SJ52H101 as decimal(15,3)) as "Положение сервомотора РК [S3_SJ52H101]",
	CAST (S3_RA10F001G as decimal(15,3)) as "Учет перегретого пара. Массовый расход [S3_RA10F001G]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_SJ20P001, S3_STKER_Y1, S3_SJ11D001, S3_SJ54H101, S3_SJ55H101, S3_SJ52H101, S3_RA10F001G
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = 1000
	AND DateTime >= @start
	AND DateTime <= @finish")


{минутные срезы}
/*ReportName=Параметры ТА-3 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="Посекундный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST (S3_SJ20P001 as decimal(15,3)) as "Давление масла на регулирование [S3_SJ20P001]",
	CAST (S3_STKER_Y1 as decimal(15,3)) as "Мощность активная [S3_STKER_Y1]",
	CAST (S3_SJ11D001 as decimal(15,3)) as "Нагрузка ЭД насоса системы регулирования № 1 [S3_SJ11D001]",
	CAST (S3_SJ54H101 as decimal(15,3)) as "Положение сервомотора повор. диафрагмы ЧСД [S3_SJ54H101]",
	CAST (S3_SJ55H101 as decimal(15,3)) as "Положение сервомотора повор. диафрагмы ЧНД [S3_SJ55H101]",
	CAST (S3_SJ52H101 as decimal(15,3)) as "Положение сервомотора РК [S3_SJ52H101]",
	CAST (S3_RA10F001G as decimal(15,3)) as "Учет перегретого пара. Массовый расход [S3_RA10F001G]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_SJ20P001, S3_STKER_Y1, S3_SJ11D001, S3_SJ54H101, S3_SJ55H101, S3_SJ52H101, S3_RA10F001G
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")