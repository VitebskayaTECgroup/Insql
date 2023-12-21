{минутные срезы}
/*ReportName=Сбросная вода (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H16_VS11V001 as decimal(15,5)) as "Накопленный объем (м. куб.)  [H16_VS11V001]",
	CAST(H16_VS11L001 as decimal(15,5)) as "Уровень (м)  [H16_VS11L001]",
	CAST(H16_VS11F001*3600 as decimal(15,5)) as "Расход (м.куб. / час)  [H16_VS11F001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H16_VS11V001, H16_VS11L001, H16_VS11F001
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Сбросная вода (часовые данные)*/
/*StartDate=dd.MM.yyyy 01:00:00.000*/
/*DeltaDate=00.00.0000 23:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H16_VS11V001 as decimal(15,5)) as "Накопленный объем (м. куб.)  [H16_VS11V001]",
	CAST(H16_VS11L001 as decimal(15,5)) as "Уровень (м)  [H16_VS11L001]",
	CAST(H16_VS11F001*3600 as decimal(15,5)) as "Расход (м.куб. / час)  [H16_VS11F001]"
FROM
	OpenQuery(INSQL,
"SELECT DateTime, H16_VS11V001, H16_VS11L001, H16_VS11F001
FROM Runtime.dbo.AnalogWideHistory
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Сбросная вода (суточные данные)*/
/*StartDate=02.MM.yyyy 00:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=86400000*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H16_VS11V001 as decimal(15,5)) as "Накопленный объем (м. куб.) [H16_VS11V001]",
	CAST(H16_VS11L001 as decimal(15,5)) as "Уровень (м) [H16_VS11L001]",
	CAST(H16_VS11F001*3600 as decimal(15,5)) as "Расход (м.куб. / час) [H16_VS11F001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H16_VS11V001, H16_VS11L001, H16_VS11F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")