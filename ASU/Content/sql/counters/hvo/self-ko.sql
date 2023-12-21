{минутные срезы}
/*ReportName="Городская Вода" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(isnull(H02_KB11F001,0)*isnull(H01_SY00A700,0)*isnull(H02_SY00A700,0) as decimal(8,2))
		as "G загр. конд. до ф-ров КО, т/ч [H02_KB11F001]",
	CAST(isnull(H01_KC22F001,0)*isnull(H01_SY00A700,0)*isnull(H02_SY00A700,0) as decimal(8,2))
		as "G очищ. конд.после ф-ров КО, т/ч [H01_KC22F001]",
	CAST((isnull(H02_KB11F001,0)-isnull(H01_KC22F001,0))*isnull(H01_SY00A700,0)*isnull(H02_SY00A700,0) as decimal(8,2))
		as "СН КО по фильтрам, т/ч [hint: H02_KB11F001-H01_KC22F001]",
	CAST((dbo.vst_SafeDIV((isnull(H02_KB11F001,0)-isnull(H01_KC22F001,0)),(isnull(H01_KC22F001,0)))*100)*isnull(H01_SY00A700,0)*isnull(H02_SY00A700,0) as decimal(5,1))
		as "СН КО по фильтрам, % [hint: СН КО по фильтрам за п/ч, %]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  H02_KB11F001, H01_KC22F001, H01_SY00A700, H02_SY00A700
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Городская Вода" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(H02_KB11F001_H1,0) as decimal(8,2))
		as "G загр. конд. до ф-ров КО за п/ч, т/ч [H02_KB11F001_H1]",
	CAST(isnull(H01_KC22F001_H1,0) as decimal(8,2))
		as "G очищ. конд.после ф-ров КО за п/ч, т/ч [H01_KC22F001_H1]",
	CAST(isnull(H02_KB11F001_H1,0)-isnull(H01_KC22F001_H1,0) as decimal(8,2))
		as "СН КО по фильтрам за п/ч, т/ч [hint: H02_KB11F001_H1-H01_KC22F001_H1]",
	CAST(dbo.vst_SafeDIV((isnull(H02_KB11F001_H1,0)-isnull(H01_KC22F001_H1,0)),(isnull(H01_KC22F001_H1,0)))*100 as decimal(15,2))
		as "СН КО по фильтрам за п/ч, % [hint: СН КО по фильтрам за п/ч, %]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H02_KB11F001_H1, H01_KC22F001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Городская Вода" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(H02_KB11F001_S1,0) as decimal(8,2))
		as "G загр. конд. до ф-ров КО за п/c, т/сут [H02_KB11F001_S1]",
	CAST(isnull(H01_KC22F001_S1,0) as decimal(8,2))
		as "G очищ. конд.после ф-ров КО за п/c, т/сут [H01_KC22F001_S1]",
	CAST(isnull(H02_KB11F001_S1,0)-isnull(H01_KC22F001_S1,0) as decimal(8,2))
		as "СН КО по фильтрам за п/c, т/сут [hint: H02_KB11F001_S1-H01_KC22F001_S1]",
	CAST(dbo.vst_SafeDIV((isnull(H02_KB11F001_S1,0)-isnull(H01_KC22F001_S1,0)),(isnull(H01_KC22F001_S1,0)))*100 as decimal(15,2))
		as "СН КО по фильтрам за п/c, % [hint: СН КО по фильтрам за п/c, %]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H02_KB11F001_S1, H01_KC22F001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Городская Вода" (часовые срезы по сменам 8/12)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=dd.MM.yyyy 09:05:00.000*/
/*DeltaDate=00.00.0000 11:00:00.000*/
/*Step=00.00.0000 12:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0)) as "Cме- на [CLC_ShiftDuty]",
	CAST(isnull(H02_KB11F001_H1,0) as decimal(8,2)) as "G загр. конд. до ф-ров КО за п/ч, т/ч [H02_KB11F001_H1]",
	CAST(isnull(H01_KC22F001_H1,0) as decimal(8,2)) as "G очищ. конд.после ф-ров КО за п/ч, т/ч [H01_KC22F001_H1]",
	CAST(isnull(H02_KB11F001_H1,0)-isnull(H01_KC22F001_H1,0) as decimal(8,2)) as "СН КО по фильтрам за п/ч, т/ч [hint: H02_KB11F001_H1-H01_KC22F001_H1]",
	CAST(dbo.vst_SafeDIV((isnull(H02_KB11F001_H1,0)-isnull(H01_KC22F001_H1,0)),(isnull(H01_KC22F001_H1,0)))*100 as decimal(15,2)) as "СН КО по фильтрам за п/ч, % [hint: СН КО по фильтрам за п/ч, %]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,  H02_KB11F001_H1, CLC_ShiftDuty, H01_KC22F001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Городская Вода"(агрегированные часовые данные по сменам)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата', 
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(sum(H02_KB11F001_H1) as decimal(8,2)) as "G загр. конд. до ф-ров КО за смену, т/см [H02_KB11F001_H1]",
	CAST(sum(H01_KC22F001_H1) as decimal(8,2)) as "G очищ. конд.после ф-ров КО за смену, т/см [H01_KC22F001_H1]",
	CAST(sum(H02_KB11F001_H1-H01_KC22F001_H1) as decimal(8,2)) as "СН КО по фильтрам за смену, т/см [hint: H02_KB11F001_H1-H01_KC22F001_H1]",
	CAST(avg(dbo.vst_SafeDIV((H02_KB11F001_H1-H01_KC22F001_H1),(H01_KC22F001_H1)))*100 as decimal(15,2)) as "СН КО по фильтрам ср. за смену, % [hint: СН КО по фильтрам за п/ч, %]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,  H02_KB11F001_H1, CLC_ShiftDuty, H01_KC22F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))
Order By
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))


{смены за месяц}
/*ReportName="Городская Вода" (агрегированные по сменам за месяц)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))
		as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
		as "Cмена [CLC_ShiftDuty]", 
	Count(*)
		as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(H02_KB11F001_H1) as decimal(8,2))
		as "G загр. конд. до ф-ров КО сум, т/см [H02_KB11F001_H1]",
	CAST(sum(H01_KC22F001_H1) as decimal(8,2))
		as "G очищ. конд.после ф-ров КО сум, т/см [H01_KC22F001_H1]",
	CAST(sum(H02_KB11F001_H1-H01_KC22F001_H1) as decimal(8,2))
		as "СН КО по фильтрам сум, т/см [hint: H02_KB11F001_H1-H01_KC22F001_H1]",
	CAST(avg(dbo.vst_SafeDIV((H02_KB11F001_H1-H01_KC22F001_H1),(H01_KC22F001_H1)))*100 as decimal(15,21))
		as "СН КО по фильтрам средн, % [hint: СН КО по фильтрам за п/ч, %]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H02_KB11F001_H1, CLC_ShiftDuty, H01_KC22F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))