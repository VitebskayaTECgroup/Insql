{минутные срезы}
/*ReportName="Бойлер горводы КО1" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(V04_VG21T001 as decimal(15,2) )as "Т бойлера КО1(U02-1), °С [V04_VG21T001]",
	CAST(V02_VK21F001*V02_SY00A700 as decimal(15,2)) as "G ОСВ КО2, т/ч [V02_VK21F001]",
	CAST(V02_VK21T001*V02_SY00A700 as decimal(15,2)) as "T ОСВ КО2, °С [V02_VK21T001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V04_VG21T001, V02_SY00A700, V02_VK21T001,  V02_VK21F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Бойлер горводы КО1" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(V04_VG21T001_H1 as decimal(15, 2)) as "Т ср бойлера КО1 за п/ч, °С [V04_VG21T001_H1]",
	CAST(V02_VK21F001_H1 as decimal(15, 2)) as "G ОСВ КО2 за п/ч, т/ч [V02_VK21F001_H1]",
	CAST(V02_VK21T001_H1 as decimal(15, 2)) as "T ОСВ КО2 за п/ч, °С [V02_VK21T001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V04_VG21T001_H1, V02_VK21T001_H1, V02_VK21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Бойлер горводы КО1" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(V04_VG21T001_S1 as decimal(15, 2)) as "Т ср бойлера КО1 за п/с, °С [V04_VG21T001_S1]",
	CAST(V02_VK21F001_S1 as decimal(15, 2)) as "G ОСВ КО2 за п/с, т/сут [V02_VK21F001_S1]",
	CAST(V02_VK21T001_S1 as decimal(15, 2)) as "T ОСВ КО2 за п/с, °С [V02_VK21T001_S1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V04_VG21T001_S1, V02_VK21T001_S1, V02_VK21F001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Бойлер горводы КО1" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
Select
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	CAST(V04_VG21T001_H1 as decimal(15,2)) as "Т ср бойлера КО1 за п/см, °С [V04_VG21T001_H1]",
	CAST(V02_VK21F001_H1 as decimal(15,2)) as "G ОСВ КО2 за п/см, т/ч [V02_VK21F001_H1]",
	CAST(V02_VK21T001_H1 as decimal(15,2)) as "T ОСВ КО2 за п/см, °С [V02_VK21T001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V04_VG21T001_H1, V02_VK21T001_H1, V02_VK21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Бойлер горводы КО1" (агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
select
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateTime)*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(AVG(V04_VG21T001_H1) as decimal(15,2)) as "Т ср бойлера КО1 за см, °С [V04_VG21T001_H1]",
	CAST(SUM(V02_VK21F001_H1) as decimal(15,2)) as "G ОСВ КО2 за смену, т/см [V02_VK21F001_H1]",
	CAST(AVG(V02_VK21T001_H1) as decimal(15,2)) as "T ОСВ КО2 ср, °С [V02_VK21T001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	CLC_ShiftDuty, V04_VG21T001_H1 , V02_VK21T001_H1, V02_VK21F001_H1
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
/*ReportName="Бойлер горводы КО1" (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(AVG(V04_VG21T001_H1) as decimal(15,2)) as "Т ср бойлера КО1 за п/ч, °С [V04_VG21T001_H1]",
	CAST(SUM(V02_VK21F001_H1) as decimal(15,2)) as "G ОСВ КО2 сум, т/см [V02_VK21F001_H1]",
	CAST(AVG(V02_VK21T001_H1) as decimal(15,2)) as "T ОСВ КО2 сред, °С [V02_VK21T001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V04_VG21T001_H1, V02_VK21T001_H1, V02_VK21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))