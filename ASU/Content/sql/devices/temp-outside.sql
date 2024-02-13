{минутные срезы}
/*ReportName=Температура наружного воздуха (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CASE WHEN (M4_T4 not like '%e%') THEN CAST(M4_T4 as decimal(15,1)) ELSE 0 END as "T нар. маз. емк.№ 4, °С [M4_T4]",
	--CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Температура наружного воздуха (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CASE WHEN (M4_T4 not like '%e%') THEN CAST(M4_T4 as decimal(15,1)) ELSE 0 END as "T нар. маз. емк.№ 4, °С [M4_T4]",
	--CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Температура наружного воздуха (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	null,
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CASE WHEN (M4_T4 not like '%e%') THEN CAST(M4_T4 as decimal(15,1)) ELSE 0 END as "T нар. маз. емк.№ 4, °С [M4_T4]",
	--CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
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
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CASE WHEN (M4_T4 not like '%e%') THEN CAST(M4_T4 as decimal(15,1)) ELSE 0 END as "T нар. маз. емк.№ 4, °С [M4_T4]",
	--CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
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
	--DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateTime)*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(AVG(M2_T4) as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CASE WHEN (AVG(M4_T4) not like '%e%') THEN CAST(AVG(M4_T4) as decimal(15,1)) ELSE 0 END as "T нар. маз. емк.№ 4, °С [M4_T4]",
	--CAST(AVG(M4_T4) as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(AVG(U1_Tnv_3_4) as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty, M2_T4, M4_T4, U1_Tnv_3_4
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
	--'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(AVG(M2_T4) as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CASE WHEN (AVG(M4_T4) not like '%e%') THEN CAST(AVG(M4_T4) as decimal(15,1)) ELSE 0 END as "T нар. маз. емк.№ 4, °С [M4_T4]",
	--CAST(AVG(M4_T4) as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(AVG(U1_Tnv_3_4) as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
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