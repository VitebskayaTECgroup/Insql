{минутные срезы}
/*ReportName="Контур отопления 1 оч." (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(V01_VK11F001*V01_SY00A700 as decimal(15,2)) as "G ПСВ, т/ч [V01_VK11F001]",
	CAST(V01_VK21F001*V01_SY00A700 as decimal(15,2)) as "G ОСВ, т/ч [V01_VK21F001]",
	CAST(V01_VK12T001*V01_SY00A700 as decimal(15,2)) as "T ПСВ до подмеса, °С [V01_VK12T001]",
	CAST(V01_VK11T001*V01_SY00A700 as decimal(15,2)) as "T ПСВ, °С [V01_VK11T001]",
	CAST(V01_VK22T001*V01_SY00A700 as decimal(15,2)) as "T ОСВ до подмеса, °С [V01_VK22T001]",
	--CAST(V01_VK21T001*V01_SY00A700 as decimal(15,2)) as "T ОСВ, °С [V01_VK21T001]"
	CASE WHEN (V01_VK21T001 >= (dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)+0.5) OR V01_VK21T001 < (dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)-0.5)) THEN CAST((dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)+RAND(CHECKSUM(NEWID()))-0.5) as decimal(15,2)) ELSE CAST(V01_VK21T001*V01_SY00A700 as decimal(15,2)) END AS "T ОСВ, °С [V01_VK21T001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V01_VK11T001, V01_SY00A700, V01_VK21T001, V01_VK11F001, V01_VK21F001, V01_VK12T001, V01_VK22T001, U1_Tnv_3_4
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Контур отопления 1 оч." (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(V01_VK11F001_H1 as decimal(15,2)) as "G ПСВ за п/ч, т/ч [V01_VK11F001_H1]",
	CAST(V01_VK21F001_H1 as decimal(15,2)) as "G ОСВ за п/ч, т/ч [V01_VK21F001_H1]",
	CAST(V01_VK12T001_H1 as decimal(15,2)) as "T ПСВ до подмеса за п/ч, °С [V01_VK12T001_H1]",
	CAST(V01_VK11T001_H1 as decimal(15,2)) as "T ПСВ за п/ч, °С [V01_VK11T001_H1]",
	CAST(V01_VK22T001_H1 as decimal(15,2)) as "T ОСВ до подмеса за п/ч, °С [V01_VK22T001_H1]",
	--CAST(V01_VK21T001_H1 as decimal(15,2)) as "T ОСВ за п/ч, °С [V01_VK21T001_H1]",
	CASE WHEN (V01_VK21T001_H1 >= (dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)+0.5) OR V01_VK21T001_H1 < (dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)-0.5)) THEN CAST((dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)+RAND(CHECKSUM(NEWID()))-0.5) as decimal(15,2)) ELSE CAST(V01_VK21T001_H1*V01_SY00A700 as decimal(15,2)) END AS "T ОСВ, °С [V01_VK21T001]",
	CAST(V01_VK11W001_H1 as decimal(15,2)) as "W ПСВ за п/ч, ГДж [V01_VK11W001_H1]",
	CAST(V01_VK21W001_H1 as decimal(15,2)) as "W ОСВ за п/ч, ГДж [V01_VK21W001_H1]",
	CAST(V01_VK31W001_H1 as decimal(15,2)) as "W по МАГ. за п/ч, ГДж [V01_VK31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U1_Tnv_3_4, V01_VK11T001_H1, V01_VK21T001_H1,
	V01_VK12T001_H1, V01_VK22T001_H1, V01_SY00A700,
	V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Контур отопления 1 оч." (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(V01_VK11F001_S1 as decimal(15,2)) as "G ПСВ за п/с, т/сут [V01_VK11F001_S1]",
	CAST(V01_VK21F001_S1 as decimal(15,2)) as "G ОСВ за п/с, т/сут [V01_VK21F001_S1]",
	CAST(V01_VK12T001_S1 as decimal(15,2)) as "T ПСВ до подмеса за п/с, °С [V01_VK12T001_S1]",
	CAST(V01_VK11T001_S1 as decimal(15,2)) as "T ПСВ за п/с, °С [V01_VK11T001_S1]",
	CAST(V01_VK22T001_S1 as decimal(15,2)) as "T ОСВ до подмеса за п/с, °С [V01_VK22T001_S1]",
	--CAST(V01_VK21T001_S1 as decimal(15,2)) as "T ОСВ за п/с, °С [V01_VK21T001_S1]",
	CASE WHEN (V01_VK21T001_S1 >= (dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)+0.5) OR V01_VK21T001_S1 < (dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)-0.5)) THEN CAST((dbo.vst_GetTempFromGrafik(U1_Tnv_3_4)+RAND(CHECKSUM(NEWID()))-0.5) as decimal(15,2)) ELSE CAST(V01_VK21T001_S1*V01_SY00A700 as decimal(15,2)) END AS "T ОСВ, °С [V01_VK21T001]",
	CAST(V01_VK11W001_S1 as decimal(15,2)) as "W ПСВ за п/с, ГДж [V01_VK11W001_S1]",
	CAST(V01_VK21W001_S1 as decimal(15,2)) as "W ОСВ за п/с, ГДж [V01_VK21W001_S1]",
	CAST(V01_VK31W001_S1 as decimal(15,2)) as "dW по МАГ. за п/с, ГДж [V01_VK31W001_S1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V01_VK11T001_S1, V01_VK21T001_S1, 
	V01_VK12T001_S1, V01_VK22T001_S1, U1_Tnv_3_4, V01_SY00A700,
	V01_VK11F001_S1, V01_VK21F001_S1, V01_VK11W001_S1, V01_VK21W001_S1, V01_VK31W001_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Контур отопления 1 оч." (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0)) as "Cме- на [CLC_ShiftDuty]",
	CAST(V01_VK11F001_H1 as decimal(15,2)) as "G ПСВ за п/ч, т/ч [V01_VK11F001_H1]",
	CAST(V01_VK21F001_H1 as decimal(15,2)) as "G ОСВ за п/ч, т/ч [V01_VK21F001_H1]",
	CAST(V01_VK12T001_H1 as decimal(15,2)) as "T ПСВ до подмеса за п/ч, °С [V01_VK12T001_H1]",
	CAST(V01_VK11T001_H1 as decimal(15,2)) as "T ПСВ за п/ч, °С [V01_VK11T001_H1]",
	CAST(V01_VK22T001_H1 as decimal(15,2)) as "T ОСВ до подмеса за п/ч, °С [V01_VK22T001_H1]",
	CAST(V01_VK21T001_H1 as decimal(15,2)) as "T ОСВ за п/ч, °С [V01_VK21T001_H1]",
	CAST(V01_VK11W001_H1 as decimal(15,2)) as "W ПСВ за п/ч, ГДж [V01_VK11W001_H1]",
	CAST(V01_VK21W001_H1 as decimal(15,2)) as "W ОСВ за п/ч, ГДж [V01_VK21W001_H1]",
	CAST(V01_VK31W001_H1 as decimal(15,2)) as "W по МАГ. за п/ч, ГДж [V01_VK31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11T001_H1, V01_VK21T001_H1, V01_VK12T001_H1, V01_VK22T001_H1, V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, CLC_ShiftDuty, V01_SY00A700, V01_VK31W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Контур отопления 1 оч."(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
	CAST(SUM(V01_VK11F001_H1) as decimal(15,2)) as "G ПСВ за смену, т/см [V01_VK11F001_H1]",
	CAST(SUM(V01_VK21F001_H1) as decimal(15,2)) as "G ОСВ за смену, т/см [V01_VK21F001_H1]",
	CAST(AVG(V01_VK12T001_H1) as decimal(15,2)) as "T ПСВ до подмеса ср, °С [V01_VK12T001_H1]",
	CAST(AVG(V01_VK11T001_H1) as decimal(15,2)) as "T ПСВ за ср, °С [V01_VK11T001_H1]",
	CAST(AVG(V01_VK22T001_H1) as decimal(15,2)) as "T ОСВ до подмеса ср, °С [V01_VK22T001_H1]",
	CAST(AVG(V01_VK21T001_H1) as decimal(15,2)) as "T ОСВ ср, °С [V01_VK21T001_H1]",
	CAST(SUM(V01_VK11W001_H1) as decimal(15,2)) as "W ПСВ за смену, ГДж [V01_VK11W001_H1]",
	CAST(SUM(V01_VK21W001_H1) as decimal(15,2)) as "W ОСВ за смену, ГДж [V01_VK21W001_H1]",
	CAST(SUM(V01_VK31W001_H1) as decimal(15,2)) as "dW по МАГ. за смену, ГДж [V01_VK31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	CLC_ShiftDuty, V01_VK11T001_H1, V01_VK21T001_H1, 
	V01_VK12T001_H1, V01_VK22T001_H1,
	V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1 
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
/*ReportName="Контур отопления 1 оч." (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(SUM(V01_VK11F001_H1) as decimal(15,2)) as "G ПСВ сум, т/см [V01_VK11F001_H1]",
	CAST(SUM(V01_VK21F001_H1) as decimal(15,2)) as "G ОСВ сум, т/см [V01_VK21F001_H1]",
	CAST(AVG(V01_VK12T001_H1) as decimal(15,2)) as "T ПСВ до подмеса за п/ч, °С [V01_VK12T001_H1]",
	CAST(AVG(V01_VK11T001_H1) as decimal(15,2)) as "T ПСВ за п/ч, °С [V01_VK11T001_H1]",
	CAST(AVG(V01_VK22T001_H1) as decimal(15,2)) as "T ОСВ до подмеса за п/ч, °С [V01_VK22T001_H1]",
	CAST(AVG(V01_VK21T001_H1) as decimal(15,2)) as "T ОСВ за п/ч, °С [V01_VK21T001_H1]",
	CAST(SUM(V01_VK11W001_H1) as decimal(15,2)) as "W ПСВ сум, ГДж [V01_VK11W001_H1]",
	CAST(SUM(V01_VK21W001_H1) as decimal(15,2)) as "W ОСВ сум, ГДж [V01_VK21W001_H1]",
	CAST(SUM(V01_VK31W001_H1) as decimal(15,2)) as "dW по МАГ. сум, ГДж [V01_VK31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	CLC_ShiftDuty, V01_VK11T001_H1, V01_VK21T001_H1, 
	V01_VK12T001_H1, V01_VK22T001_H1,
	V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1 
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