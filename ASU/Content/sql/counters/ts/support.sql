{минутные срезы}
/*ReportName=ТС "Подпитка ТС" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U04_UM41F001*U04_SY00A700 as decimal(18,0)) as "G Подп.ТС, т/ч [U04_UM41F001]",
	CAST(U04_UM41P001*U04_SY00A700 as decimal(18,2)) as "P Подп.ТС, изб.МПа [U04_UM41P001]",
	CAST(U04_UM41T001*U04_SY00A700 as decimal(18,2)) as "T Подп.ТС, °С [U04_UM41T001]",
	CAST(U04_VB00T001*U04_SY00A700 as decimal(18,2)) as "Тхв, °С [U04_VB00T001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_VB00T001, U04_SY00A700, U04_UM41P001, U04_UM41T001, U04_UM41F001
	FROM Runtime.dbo.AnalogWideHistory  
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ТС "Подпитка ТС" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U04_UM41F001_H1 as decimal(18,0)) as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
	CAST(U04_UM41P001_H1 as decimal(18,2)) as "P Подп.ТС за п/ч, абс.МПа [U04_UM41P001_H1]",
	CAST(U04_UM41T001_H1 as decimal(18,2)) as "T Подп.ТС за п/ч, °С [U04_UM41T001_H1]",
	CAST(U04_UM41W001_H1 as decimal(18,0)) as "W Подп.ТС за п/ч, ГДж [U04_UM41W001_H1]",
	CAST(U04_UM32W001_H1 as decimal(18,0)) as "dW по МАГ.за п/ч, ГДж [U04_UM32W001_H1]",
	CAST(U04_VB00T001*U04_SY00A700 as decimal(15,2)) as "Тхв мгн, °С [Мгновенный срез Т источника на конец часа]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1, U04_UM41F001_H1, U04_UM41W001_H1, U04_VB00T001, U04_SY00A700, U04_UM32W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ТС "Подпитка ТС" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(U04_UM41F001_S1 as decimal(18,0)) as "G Подп.ТС за п/с, т/сут [U04_UM41F001_S1]",
	CAST(U04_UM41P001_S1 as decimal(18,2)) as "P Потп.ТС за п/с, абс.МПа [U04_UM41P001_S1]",
	CAST(U04_UM41T001_S1 as decimal(18,2)) as "T Потп.ТС за п/с, °С [U04_UM41T001_S1]",
	CAST(U04_UM41W001_S1 as decimal(18,0)) as "W Подп.ТС за п/с, ГДж [U04_UM41W001_S1 ]",
	CAST(U04_UM32W001_S1 as decimal(18,0)) as "dW по МАГ за п/с, ГДж [U04_UM32W001_S1]",
	CAST(U04_VB01T001_S1 as decimal(18,2)) as "Tхв за п/с, °С [U04_VB01T001_S1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U04_VB01T001_S1, U04_UM41T001_S1, U04_UM41P001_S1, U04_UM41F001_S1, U04_UM41W001_S1, U04_UM32W001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName=ТС "Подпитка ТС" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty) as "Cме- на [CLC_ShiftDuty]",
	CAST(U04_UM41F001_H1 as decimal(15,0)) as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
	CAST(U04_UM41P001_H1 as decimal(15,2)) as "P Подп.ТС за п/ч, абс.МПа [U04_UM41P001_H1]",
	CAST(U04_UM41T001_H1 as decimal(15,2)) as "T Подп.ТС за п/ч, °С [U04_UM41T001_H1]",
	CAST(U04_UM41W001_H1 as decimal(15,0)) as "W Подп.ТС за п/ч, ГДж [U04_UM41W001_H1]",
	CAST(U04_UM32W001_H1 as decimal(15,0)) as "dW по МАГ.за п/ч, ГДж [U04_UM32W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1, U04_UM41F001_H1, U04_UM41W001_H1, CLC_ShiftDuty, U04_UM32W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName=ТС "Подпитка ТС"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(sum(U04_UM41F001_H1) as decimal(15,0)) as "G Подп.ТС за смену, т/см [U04_UM41F001_H1]",
	CAST(avg(U04_UM41P001_H1) as decimal(15,2)) as "P Подп.ТС ср, абс.МПа [U04_UM41P001_H1]",
	CAST(avg(U04_UM41T001_H1) as decimal(15,2)) as "T Подп.ТС ср, °С [U04_UM41T001_H1]",
	CAST(Sum(U04_UM41W001_H1) as decimal(15,0)) as "W Подп.ТС за смену, ГДж [U04_UM41W001_H1]",
	CAST(sum(U04_UM32W001_H1) as decimal(15,0)) as "dW по МАГ.за смену, ГДж [U04_UM32W001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1,  U04_UM41F001_H1,  U04_UM41W001_H1, CLC_ShiftDuty, U04_UM32W001_H1
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
/*ReportName=ТС "Подпитка ТС" (агрегированные по сменам за месяц)*/
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
	CAST(sum(U04_UM41F001_H1) as decimal(15,0)) as "G Подп.ТС сум, т/см [U04_UM41F001_H1]",
	CAST(avg(U04_UM41P001_H1) as decimal(15,2)) as "P Подп.ТС ср, абс.МПа [U04_UM41P001_H1]",
	CAST(avg(U04_UM41T001_H1) as decimal(15,2)) as "T Подп.ТС ср, °С [U04_UM41T001_H1]",
	CAST(Sum(U04_UM41W001_H1) as decimal(15,0)) as "W Подп.ТС сум, ГДж [U04_UM41W001_H1]",
	CAST(sum(U04_UM32W001_H1) as decimal(15,0)) as "dW по МАГ.сум, ГДж [U04_UM32W001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1,  U04_UM41F001_H1,  U04_UM41W001_H1, CLC_ShiftDuty, U04_UM32W001_H1
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