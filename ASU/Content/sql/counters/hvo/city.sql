{минутные срезы}
/*ReportName="Городская Вода" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H03_VG11F001*H03_SY00A700 as decimal(15,2)) as "G гор.воды, т/ч [H03_VG11F001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001, H03_SY00A700, H03_VR12F001, H03_VG11F001, H01_VS21F001, H01_VS21T001
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
	CAST(H03_VG11F001_H1 as decimal(15,2)) as "G гор.воды за п/ч, т/ч [H03_VG11F001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, H03_VR12F001_H1, H03_VG11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1
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
	CAST(H03_VG11F001_S1 as decimal(15,2)) as "G гор.воды за п/с, т/сут [H03_VG11F001_S1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H03_VR11F001_S1, H03_VR12F001_S1, H03_VG11F001_S1, H01_VS21F001_S1, H01_VS21T001_S1
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
	CAST(isnull(H03_VG11F001_H1,0) as decimal(15,2)) as "G гор.воды за п/ч, т/ч [H03_VG11F001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H03_VR11F001_H1, CLC_ShiftDuty, H03_VR12F001_H1, H03_VG11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1
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
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateTime)*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(sum(H03_VG11F001_H1) as decimal(15,2)) as "G гор.воды за смену, т/см [H03_VG11F001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, CLC_ShiftDuty, H03_VR12F001_H1, H03_VG11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateTime)*2,0,1)/2))
Order By
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateTime)*2,0,1)/2))


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
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(H03_VG11F001_H1) as decimal(15,2)) as "G гор.воды сум, т/см [H03_VG11F001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, CLC_ShiftDuty, H03_VR12F001_H1, H03_VG11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1
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