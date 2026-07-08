{минутные срезы}
/*ReportName=ПАР "Мазутное хозяйство"(минутные)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_AI1PV / 100 * (1 - ROUND(ABS(K4_AI1PV) / 32768, 0, 1)) as decimal(15, 2)) as "G пар, т/ч [K4_AI1PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_AI1PV
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ПАР "Мазутное хозяйство"(часовые)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K4_AI1PV / 100 * (1 - ROUND(ABS(K4_AI1PV) / 32768, 0, 1)) as decimal(15, 2)) as "G пар за п/ч, т/ч [K4_AI1PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_AI1PV
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ПАР "Мазутное хозяйство"(суточные)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K4_AI1PV / 100 * (1 - ROUND(ABS(K4_AI1PV) / 32768, 0, 1)) as decimal(15, 2)) as "G пар за п/с, т/cут [K4_AI1PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_AI1PV
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName=ПАР "Мазутное хозяйство"(за смену 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]", 
	--CHAR(192+CLC_ShiftDuty) as "Cме- на [CLC_ShiftDuty]",
	CAST(K4_AI1PV / 100 * (1 - ROUND(ABS(K4_AI1PV) / 32768, 0, 1)) as decimal(15, 2)) as "G пар за п/ч, т/ч [K4_AI1PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty, K4_AI1PV
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName=ПАР "Мазутное хозяйство"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(sum(K4_AI1PV / 100 * (1 - ROUND(ABS(K4_AI1PV) / 32768, 0, 1))) as decimal(15, 2)) as "G пар за смену, т/см [K4_AI1PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty, K4_AI1PV
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
/*ReportName=ПАР "Мазутное хозяйство"агрегированные по сменам за месяц*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]", 
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(K4_AI1PV / 100 * (1 - ROUND(ABS(K4_AI1PV) / 32768, 0, 1))) as decimal(15, 2)) as "G пар сум, т/см [K4_AI1PV]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty, K4_AI1PV
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