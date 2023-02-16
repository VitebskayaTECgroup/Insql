{минутные срезы}
/*ReportName=Сбросная вода (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H14_AK1X001 as decimal(15,5)) as "L cерн.кисл. [H14_AK1X001]",
	CAST(H14_KB1L001 as decimal(15,5)) as "L загряз.конд. [H14_KB1L001]",
	CAST(H14_KC1L001 as decimal(15,5)) as "L очищ.конд. [H14_KC1L001]",
	CAST(H14_KK1F001 as decimal(15,5)) as "Q конд. осн. [H14_KK1F001]",
	CAST(H14_KK1F002 as decimal(15,5)) as "Q конд. дубл. [H14_KK1F002]",
	CAST(H14_KK1T001 as decimal(15,5)) as "T конд. [H14_KK1T001]",
	CAST(H14_KK1X001 as decimal(15,5)) as "S конд. [H14_KK1X001]",
	CAST(H14_VE1L001 as decimal(15,5)) as "L декарб.воды [H14_VE1L001]",
	null,
	CAST(H15_VE1F001 as decimal(15,5)) as "Q ПТ1 осн. [H15_VE1F001]",
	CAST(H15_VE1F002 as decimal(15,5)) as "Q ПТ1 дубл. [H15_VE1F002]",
	CAST(H15_VE1F003 as decimal(15,5)) as "Q ПТ2-1 осн. [H15_VE1F003]",
	CAST(H15_VE1F004 as decimal(15,5)) as "Q ПТ2-1 дубл. [H15_VE1F004]",
	CAST(H15_VE1F005 as decimal(15,5)) as "Q ПТ2-2 осн. [H15_VE1F005]",
	CAST(H15_VE1F006 as decimal(15,5)) as "Q ПТ2-2 дубл. [H15_VE1F006]",
	CAST(H15_VE1X001 as decimal(15,5)) as "pH осн. [H15_VE1X001]",
	CAST(H15_VE1X002 as decimal(15,5)) as "pH дубл. [H15_VE1X002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
	H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
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
	CAST(H14_AK1X001 as decimal(15,5)) as "L cерн.кисл. [H14_AK1X001]",
	CAST(H14_KB1L001 as decimal(15,5)) as "L загряз.конд. [H14_KB1L001]",
	CAST(H14_KC1L001 as decimal(15,5)) as "L очищ.конд. [H14_KC1L001]",
	CAST(H14_KK1F001 as decimal(15,5)) as "Q конд. осн. [H14_KK1F001]",
	CAST(H14_KK1F002 as decimal(15,5)) as "Q конд. дубл. [H14_KK1F002]",
	CAST(H14_KK1T001 as decimal(15,5)) as "T конд. [H14_KK1T001]",
	CAST(H14_KK1X001 as decimal(15,5)) as "S конд. [H14_KK1X001]",
	CAST(H14_VE1L001 as decimal(15,5)) as "L декарб.воды [H14_VE1L001]",
	null,
	CAST(H15_VE1F001 as decimal(15,5)) as "Q ПТ1 осн. [H15_VE1F001]",
	CAST(H15_VE1F002 as decimal(15,5)) as "Q ПТ1 дубл. [H15_VE1F002]",
	CAST(H15_VE1F003 as decimal(15,5)) as "Q ПТ2-1 осн. [H15_VE1F003]",
	CAST(H15_VE1F004 as decimal(15,5)) as "Q ПТ2-1 дубл. [H15_VE1F004]",
	CAST(H15_VE1F005 as decimal(15,5)) as "Q ПТ2-2 осн. [H15_VE1F005]",
	CAST(H15_VE1F006 as decimal(15,5)) as "Q ПТ2-2 дубл. [H15_VE1F006]",
	CAST(H15_VE1X001 as decimal(15,5)) as "pH осн. [H15_VE1X001]",
	CAST(H15_VE1X002 as decimal(15,5)) as "pH дубл. [H15_VE1X002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
	H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
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
	CAST(H14_AK1X001 as decimal(15,5)) as "L cерн.кисл. [H14_AK1X001]",
	CAST(H14_KB1L001 as decimal(15,5)) as "L загряз.конд. [H14_KB1L001]",
	CAST(H14_KC1L001 as decimal(15,5)) as "L очищ.конд. [H14_KC1L001]",
	CAST(H14_KK1F001 as decimal(15,5)) as "Q конд. осн. [H14_KK1F001]",
	CAST(H14_KK1F002 as decimal(15,5)) as "Q конд. дубл. [H14_KK1F002]",
	CAST(H14_KK1T001 as decimal(15,5)) as "T конд. [H14_KK1T001]",
	CAST(H14_KK1X001 as decimal(15,5)) as "S конд. [H14_KK1X001]",
	CAST(H14_VE1L001 as decimal(15,5)) as "L декарб.воды [H14_VE1L001]",
	null,
	CAST(H15_VE1F001 as decimal(15,5)) as "Q ПТ1 осн. [H15_VE1F001]",
	CAST(H15_VE1F002 as decimal(15,5)) as "Q ПТ1 дубл. [H15_VE1F002]",
	CAST(H15_VE1F003 as decimal(15,5)) as "Q ПТ2-1 осн. [H15_VE1F003]",
	CAST(H15_VE1F004 as decimal(15,5)) as "Q ПТ2-1 дубл. [H15_VE1F004]",
	CAST(H15_VE1F005 as decimal(15,5)) as "Q ПТ2-2 осн. [H15_VE1F005]",
	CAST(H15_VE1F006 as decimal(15,5)) as "Q ПТ2-2 дубл. [H15_VE1F006]",
	CAST(H15_VE1X001 as decimal(15,5)) as "pH осн. [H15_VE1X001]",
	CAST(H15_VE1X002 as decimal(15,5)) as "pH дубл. [H15_VE1X002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	H14_AK1X001, H14_KB1L001, H14_KC1L001, H14_KK1F001, H14_KK1F002, H14_KK1T001, H14_KK1X001, H14_VE1L001, 
	H15_VE1F001, H15_VE1F002, H15_VE1F003, H15_VE1F004, H15_VE1F005, H15_VE1F006, H15_VE1X001, H15_VE1X002
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")