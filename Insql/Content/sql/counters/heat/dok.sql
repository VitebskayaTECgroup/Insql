{минутные срезы}
/*ReportName=ПАР "ДОК" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U02_UN11F001*U02_SY00A700 as decimal(15,2)) as "G Пар18, т/ч [U02_UN11F001]",
	CAST(U02_UN11P001*U02_SY00A700 as decimal(15,2)) as "P Пар18, изб.МПа [U02_UN11P001]",
	CAST(U02_UN11T001*U02_SY00A700 as decimal(15,2)) as "T Пар18, °С [U02_UN11T001]",
	CAST(U02_UN12F001*U02_SY00A700 as decimal(15,2)) as "G Пар28, т/ч [U02_UN12F001]",
	CAST(U02_UN12P001*U02_SY00A700 as decimal(15,2)) as "P Пар28, абс.МПа [U02_UN12P001]",
	CAST(U02_UN12T001*U02_SY00A700 as decimal(15,2)) as "T Пар28, °С [U02_UN12T001]",
	CAST(U02_UN21F001*U02_SY00A700 as decimal(15,2)) as "G Конд, т/ч [U02_UN21F001]",
	CAST(U02_UN21T001*U02_SY00A700 as decimal(15,2)) as "T Конд, °С [U02_UN21T001]",
	CAST(U02_VB00T001*U02_SY00A700 as decimal(15,2)) as "Tхв, °С [U02_VB00T001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U02_VB00T001, U02_SY00A700, U02_UN11P001, U02_UN12P001,  U02_UN11T001, U02_UN12T001, U02_UN21T001, U02_UN11F001, U02_UN12F001, U02_UN21F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ПАР "ДОК" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U02_UN11F001_H1 as decimal(15,2)) as "G Пар18 за п/ч, т/ч [U02_UN11F001_H1]",
	CAST(U02_UN11P001_H1 as decimal(15,2)) as "P Пар18 за п/ч, абс.МПа [U02_UN11P001_H1]",
	CAST(U02_UN11T001_H1 as decimal(15,2)) as "T Пар18 за п/ч, °С [U02_UN11T001_H1]",
	null,
	CAST(U02_UN12F001_H1 as decimal(15,2)) as "G Пар28 за п/ч, т/ч [U02_UN12F001_H1]",
	CAST(U02_UN12P001_H1 as decimal(15,2)) as "P Пар28 за п/ч, абс.МПа [U02_UN12P001_H1]",
	CAST(U02_UN12T001_H1 as decimal(15,2)) as "T Пар28 за п/ч, °С [U02_UN12T001_H1]",
	null,
	CAST(U02_UN21F001_H1 as decimal(15,2)) as "G Конд за п/ч, т/ч [U02_UN21F001_H1]",
	CAST(U02_UN21T001_H1 as decimal(15,2)) as "T Конд за п/ч, °С [U02_UN21T001_H1]",
	null,
	CAST(U02_UN11W001_H1 / 4.187 as decimal(15,2)) as "W Пар18 за п/ч, ГКал [U02_UN11W001_H1]",
	CAST(U02_UN12W001_H1 / 4.187 as decimal(15,2)) as "W Пар28 за п/ч, ГКал [U02_UN12W001_H1]",
	CAST(U02_UN21W001_H1 / 4.187 as decimal(15,2)) as "W Конд за п/ч, ГКал [U02_UN21W001_H1]",
	CAST(U02_UN31W001_H1 / 4.187 as decimal(15,2)) as "dW по МАГ за п/ч, ГКал [U02_UN31W001_H1]",
	null,
	CAST(U02_VB00T001 as decimal(15,2)) as "Tхв мгн, °С [U02_VB00T001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U02_UN11T001_H1, U02_UN12T001_H1, U02_UN21T001_H1, U02_UN11P001_H1, U02_UN12P001_H1, 
	U02_VB00T001, U02_SY00A700,
	U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1 
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{суточные срезы}
/*ReportName=ПАР "ДОК" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null, 
	CAST(U02_UN11F001_S1 as decimal(15,2)) as "G Пар18 за п/ч, т/ч [U02_UN11F001_S1]",
	CAST(U02_UN11P001_S1 as decimal(15,2)) as "P Пар18 за п/ч, абс.МПа [U02_UN11P001_S1]",
	CAST(U02_UN11T001_S1 as decimal(15,2)) as "T Пар18 за п/ч, °С [U02_UN11T001_S1]",
	null,
	CAST(U02_UN12F001_S1 as decimal(15,2)) as "G Пар28 за п/ч, т/ч [U02_UN12F001_S1]",
	CAST(U02_UN12P001_S1 as decimal(15,2)) as "P Пар28 за п/ч, абс.МПа [U02_UN12P001_S1]",
	CAST(U02_UN12T001_S1 as decimal(15,2)) as "T Пар28 за п/ч, °С [U02_UN12T001_S1]",
	null,
	CAST(U02_UN21F001_S1 as decimal(15,2)) as "G Конд за п/ч, т/ч [U02_UN21F001_S1]",
	CAST(U02_UN21T001_S1 as decimal(15,2)) as "T Конд за п/ч, °С [U02_UN21T001_S1]",
	null,
	CAST(U02_UN11W001_S1 / 4.187 as decimal(15,2)) as "W Пар18 за п/ч, ГКал [U02_UN11W001_S1]",
	CAST(U02_UN12W001_S1 / 4.187 as decimal(15,2)) as "W Пар28 за п/ч, ГКал [U02_UN12W001_S1]",
	CAST(U02_UN21W001_S1 / 4.187 as decimal(15,2)) as "W Конд за п/ч, ГКал [U02_UN21W001_S1]",
	CAST(U02_UN31W001_S1 / 4.187 as decimal(15,2)) as "dW по МАГ за п/ч, ГКал [U02_UN31W001_S1]",
	null,
	CAST(U02_VB00T001_S1 as decimal(9,2)) as "Tхв за п/с, °С [U02_VB00T001_S1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U02_UN11T001_S1, U02_UN12T001_S1, U02_UN21T001_S1, U02_UN11P001_S1, U02_UN12P001_S1, U02_VB00T001_S1,
	U02_UN11F001_S1, U02_UN12F001_S1, U02_UN21F001_S1, U02_UN11W001_S1, U02_UN12W001_S1, U02_UN21W001_S1, U02_UN31W001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName=ПАР "ДОК" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty) as "Cмена [CLC_ShiftDuty]",
	CAST(U02_UN11F001_H1 as decimal(15,2)) as "G Пар18 за п/ч, т/ч [U02_UN11F001_H1]",
	CAST(U02_UN11P001_H1 as decimal(15,2)) as "P Пар18 за п/ч, абс.МПа [U02_UN11P001_H1]",
	CAST(U02_UN11T001_H1 as decimal(15,2)) as "T Пар18 за п/ч, °С [U02_UN11T001_H1]",
	CAST(U02_UN12F001_H1 as decimal(15,2)) as "G Пар28 за п/ч, т/ч [U02_UN12F001_H1]",
	CAST(U02_UN12P001_H1 as decimal(15,2)) as "P Пар28 за п/ч, абс.МПа [U02_UN12P001_H1]",
	CAST(U02_UN12T001_H1 as decimal(15,2)) as "T Пар28 за п/ч, °С [U02_UN12T001_H1]",
	CAST(U02_UN21F001_H1 as decimal(15,2)) as "G Конд за п/ч, т/ч [U02_UN21F001_H1]",
	CAST(U02_UN21T001_H1 as decimal(15,2)) as "T Конд за п/ч, °С [U02_UN21T001_H1]",
	CAST(U02_UN11W001_H1 / 4.187 as decimal(15,2)) as "W Пар18 за п/ч, ГДж [U02_UN11W001_H1]",
	CAST(U02_UN12W001_H1 / 4.187 as decimal(15,2)) as "W Пар28 за п/ч, ГДж [U02_UN12W001_H1]",
	CAST(U02_UN21W001_H1 / 4.187 as decimal(15,2)) as "W Конд за п/ч, ГДж [U02_UN21W001_H1]",
	CAST(U02_UN31W001_H1 / 4.187 as decimal(15,2)) as "dW по МАГ за п/ч, ГДж [U02_UN31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U02_UN11T001_H1, U02_UN12T001_H1, U02_UN21T001_H1, U02_UN11P001_H1, U02_UN12P001_H1, CLC_ShiftDuty,
	U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName=ПАР "ДОК"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh,20,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,Max(DateTime)))*2,0,1)/2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null, 
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
	CAST(sum(U02_UN11F001_H1) as decimal(15,2)) as "G Пар18 за смену, т/см [U02_UN11F001_H1]",
	CAST(AVG(U02_UN11P001_H1) as decimal(15,2)) as "P Пар18 ср, абс.МПа [U02_UN11P001_H1]",
	CAST(AVG(U02_UN11T001_H1) as decimal(15,2)) as "T Пар18 ср, °С [U02_UN11T001_H1]",
	CAST(sum(U02_UN12F001_H1) as decimal(15,2)) as "G Пар28 за смену, т/см [U02_UN12F001_H1]",
	CAST(AVG(U02_UN12P001_H1) as decimal(15,2)) as "P Пар28 ср, абс.МПа [U02_UN12P001_H1]",
	CAST(AVG(U02_UN12T001_H1) as decimal(15,2)) as "T Пар28 ср, °С [U02_UN12T001_H1]",
	CAST(sum(U02_UN21F001_H1) as decimal(15,2)) as "G Конд за смену, т/см [U02_UN21F001_H1]",
	CAST(AVG(U02_UN21T001_H1) as decimal(15,2)) as "T Конд ср, °С [U02_UN21T001_H1]",
	CAST(sum(U02_UN11W001_H1) / 4.187 as decimal(15,2)) as "W Пар18 за смену, ГДж [U02_UN11W001_H1]",
	CAST(sum(U02_UN12W001_H1) / 4.187 as decimal(15,2)) as "W Пар28 за смену, ГДж [U02_UN12W001_H1]",
	CAST(sum(U02_UN21W001_H1) / 4.187 as decimal(15,2)) as "W Конд за смену, ГДж [U02_UN21W001_H1]",
	CAST(sum(U02_UN31W001_H1) / 4.187 as decimal(15,2)) as "dW по МАГ за смену, ГДж [U02_UN31W001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U02_UN11T001_H1, U02_UN12T001_H1, U02_UN21T001_H1, U02_UN11P001_H1, U02_UN12P001_H1,
	CLC_ShiftDuty,
	U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
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
/*ReportName=ПАР "ДОК" (агрегированные по сменам за месяц)*/
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
	CAST(sum(U02_UN11F001_H1) as decimal(15,2)) as "G Пар18 сум, т/см [U02_UN11F001_H1]",
	CAST(AVG(U02_UN11P001_H1) as decimal(15,2)) as "P Пар18 ср, абс.МПа [U02_UN11P001_H1]",
	CAST(AVG(U02_UN11T001_H1) as decimal(15,2)) as "T Пар18 ср, °С [U02_UN11T001_H1]",
	CAST(sum(U02_UN12F001_H1) as decimal(15,2)) as "G Пар28 сум, т/см [U02_UN12F001_H1]",
	CAST(AVG(U02_UN12P001_H1) as decimal(15,2)) as "P Пар28 ср, абс.МПа [U02_UN12P001_H1]",
	CAST(AVG(U02_UN12T001_H1) as decimal(15,2)) as "T Пар28 ср, °С [U02_UN12T001_H1]",
	CAST(sum(U02_UN21F001_H1) as decimal(15,2)) as "G Конд сум, т/см [U02_UN21F001_H1]",
	CAST(AVG(U02_UN21T001_H1) as decimal(15,2)) as "T Конд ср, °С [U02_UN21T001_H1]",
	CAST(sum(U02_UN11W001_H1) / 4.187 as decimal(15,2)) as "W Пар18 сум, ГДж [U02_UN11W001_H1]",
	CAST(sum(U02_UN12W001_H1) / 4.187 as decimal(15,2)) as "W Пар28 сум, ГДж [U02_UN12W001_H1]",
	CAST(sum(U02_UN21W001_H1) / 4.187 as decimal(15,2)) as "W Конд сум, ГДж [U02_UN21W001_H1]",
	CAST(sum(U02_UN31W001_H1) / 4.187 as decimal(15,2)) as "dW по МАГ сум, ГДж [U02_UN31W001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U02_UN11T001_H1, U02_UN12T001_H1, U02_UN21T001_H1, U02_UN11P001_H1, U02_UN12P001_H1, CLC_ShiftDuty,
	U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
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