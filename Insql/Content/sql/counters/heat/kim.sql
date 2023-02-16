{минутные срезы}
/*ReportName=ПАР "КИМ"(минутные)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U01_UN11F001*U01_SY00A700 as decimal(15,2)) as "G пар, т/ч [U01_UN11F001]",
	CAST(U01_UN11P001*U01_SY00A700 as decimal(15,2)) as "P пар, изб.МПа [U01_UN11P001]",
	CAST(U01_UN11T001*U01_SY00A700 as decimal(15,2)) as "T пар, °С [U01_UN11T001]",
	CAST(U01_UN21F001*U01_SY00A700 as decimal(15,2)) as "G кон, т/ч [U01_UN21F001]",
	CAST(U01_UN21P001*U01_SY00A700 as decimal(15,2)) as "P кон, изб.МПа [U01_UN21P001]",
	CAST(U01_UN21T001*U01_SY00A700 as decimal(15,2)) as "T кон, °С [U01_UN21T001]",
	CAST(U01_VB00T001*U01_SY00A700 as decimal(15,2)) as "Тхв, °С [U01_VB00T001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_SY00A700, U01_VB00T001, U01_UN11P001, U01_UN21P001, U01_UN11T001, U01_UN21T001, U01_UN11F001, U01_UN21F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ПАР "КИМ"(часовые)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U01_UN11F001_H1 as decimal(15,2)) as "G пар за п/ч, т/ч [U01_UN11F001_H1]",
	CAST(U01_UN11P001_H1 as decimal(15,2)) as "P пар за п/ч, абс.МПа [U01_UN11P001_H1]",
	CAST(U01_UN11T001_H1 as decimal(15,2)) as "T пар за п/ч, °С [U01_UN11T001_H1]",
	CAST(U01_UN21F001_H1 as decimal(15,2)) as "G кон за п/ч, т/ч [U01_UN21F001_H1]",
	CAST(U01_UN21P001_H1 as decimal(15,2)) as "P кон за п/ч, абс.МПа [U01_UN21P001_H1]",
	CAST(U01_UN21T001_H1 as decimal(15,2)) as "T кон за п/ч, °С [U01_UN21T001_H1]",
	CAST(U01_UN11W001_H1 as decimal(15,2)) as "W пар за п/ч, ГДж [U01_UN11W001_H1]",
	CAST(U01_UN21W001_H1 as decimal(15,2)) as "W кон за п/ч, ГДж [U01_UN21W001_H1]",
	CAST(U01_UN31W001_H1 as decimal(15,2)) as "dW по маг.за п/ч, ГДж [U01_UN31W001_H1]",
	CAST(U01_VB00T001*U01_SY00A700 as decimal(15,2)) as "Тхв мгн, °С [Мгновенный срез Т источника на конец часа]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11T001_H1, U01_UN21T001_H1, U01_UN11P001_H1, U01_UN21P001_H1, U01_UN11F001_H1, U01_UN21F001_H1, U01_SY00A700, U01_VB00T001, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ПАР "КИМ"(суточные)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(U01_UN11F001_S1 as decimal(15,2)) as "G пар за п/с, т/cут [U01_UN11F001_S1]",
	CAST(U01_UN11P001_S1 as decimal(15,2)) as "P пар за п/с, абс.МПа [U01_UN11P001_S1]",
	CAST(U01_UN11T001_S1 as decimal(15,2)) as "T пар за п/с, °С [U01_UN11T001_S1]",
	CAST(U01_UN21F001_S1 as decimal(15,2)) as "G кон за п/с, т/cут [U01_UN21F001_S1]",
	CAST(U01_UN21P001_S1 as decimal(15,2)) as "P кон за п/с, абс.МПа [U01_UN21P001_S1]",
	CAST(U01_UN21T001_S1 as decimal(15,2)) as "T кон за п/с, °С [U01_UN21T001_S1]",
	CAST(U01_UN11W001_S1 as decimal(15,2)) as "W пар за п/с, ГДж [U01_UN11W001_S1]",
	CAST(U01_UN21W001_S1 as decimal(15,2)) as "W кон за п/с, ГДж [U01_UN21W001_S1]",
	CAST(U01_UN31W001_S1 as decimal(15,2)) as "dW по МАГ за п/с, ГДж [U01_UN31W001_S1]",
	CAST(U01_VB01T001_S1 as decimal(15,2)) as "Tхв за п/с, °С [U01_VB01T001_S1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_VB01T001_S1, U01_UN11T001_S1, U01_UN21T001_S1, U01_UN11P001_S1, U01_UN21P001_S1, U01_UN11F001_S1, U01_UN21F001_S1, U01_UN11W001_S1, U01_UN21W001_S1, U01_UN31W001_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName=ПАР "КИМ"(за смену 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty) as "Cме- на [CLC_ShiftDuty]",
	CAST(U01_UN11F001_H1 as decimal(15,2)) as "G пар за п/ч, т/ч [U01_UN11F001_H1]",
	CAST(U01_UN11P001_H1 as decimal(15,2)) as "P пар за п/ч, абс.МПа [U01_UN11P001_H1]",
	CAST(U01_UN11T001_H1 as decimal(15,2)) as "T пар за п/ч, °С [U01_UN11T001_H1]",
	CAST(U01_UN21F001_H1 as decimal(15,2)) as "G кон за п/ч, т/ч [U01_UN21F001_H1]",
	CAST(U01_UN21P001_H1 as decimal(15,2)) as "P кон за п/ч, абс.МПа [U01_UN21P001_H1]",
	CAST(U01_UN21T001_H1 as decimal(15,2)) as "T кон за п/ч, °С [U01_UN21T001_H1]",
	CAST(U01_UN11W001_H1 as decimal(15,2)) as "W пар за п/ч, ГДж [U01_UN11W001_H1]",
	CAST(U01_UN21W001_H1 as decimal(15,2)) as "W кон за п/ч, ГДж [U01_UN21W001_H1]",
	CAST(U01_UN31W001_H1 as decimal(15,2)) as "dW по маг.за п/ч, ГДж [U01_UN31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11T001_H1, U01_UN21T001_H1, U01_UN11P001_H1, U01_UN21P001_H1, U01_UN11F001_H1, U01_UN21F001_H1,  CLC_ShiftDuty, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName=ТС "Монолит"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(sum(U01_UN11F001_H1) as decimal(15,2)) as "G пар за смену, т/см [U01_UN11F001_H1]",
	CAST(avg(U01_UN11P001_H1) as decimal(15,2)) as "P пар ср, абс.МПа [U01_UN11P001_H1]",
	CAST(avg(U01_UN11T001_H1) as decimal(15,2)) as "T пар ср, °С [U01_UN11T001_H1]",
	CAST(sum(U01_UN21F001_H1) as decimal(15,2)) as "G кон за смену, т/см [U01_UN21F001_H1]",
	CAST(avg(U01_UN21P001_H1) as decimal(15,2)) as "P кон ср, абс.МПа [U01_UN21P001_H1]",
	CAST(avg(U01_UN21T001_H1) as decimal(15,2)) as "T кон ср, °С [U01_UN21T001_H1]",
	CAST(sum(U01_UN11W001_H1) as decimal(15,2)) as "W пар за смену, ГДж [U01_UN11W001_H1]",
	CAST(sum(U01_UN21W001_H1) as decimal(15,2)) as "W кон за смену, ГДж [U01_UN21W001_H1]",
	CAST(sum(U01_UN31W001_H1) as decimal(15,2)) as "dW по маг.за смену, ГДж [U01_UN31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11T001_H1, U01_UN21T001_H1, U01_UN11P001_H1, U01_UN21P001_H1, U01_UN11F001_H1, U01_UN21F001_H1, CLC_ShiftDuty, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1
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
/*ReportName=ПАР "КИМ"агрегированные по сменам за месяц*/
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
	CAST(sum(U01_UN11F001_H1) as decimal(15,2)) as "G пар сум, т/см [U01_UN11F001_H1]",
	CAST(avg(U01_UN11P001_H1) as decimal(15,2)) as "P пар сред, абс.МПа [U01_UN11P001_H1]",
	CAST(avg(U01_UN11T001_H1) as decimal(15,2)) as "T пар сред, °С [U01_UN11T001_H1]",
	CAST(sum(U01_UN21F001_H1) as decimal(15,2)) as "G кон сум, т/см [U01_UN21F001_H1]",
	CAST(avg(U01_UN21P001_H1) as decimal(15,2)) as "P кон сред, абс.МПа [U01_UN21P001_H1]",
	CAST(avg(U01_UN21T001_H1) as decimal(15,2)) as "T кон сред, °С [U01_UN21T001_H1]",
	CAST(sum(U01_UN11W001_H1) as decimal(15,2)) as "W пар сум, ГДж [U01_UN11W001_H1]",
	CAST(sum(U01_UN21W001_H1) as decimal(15,2)) as "W кон сум, ГДж [U01_UN21W001_H1]",
	CAST(sum(U01_UN31W001_H1) as decimal(15,2)) as "dW по маг. сум, ГДж [U01_UN31W001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11T001_H1, U01_UN21T001_H1, U01_UN11P001_H1, U01_UN21P001_H1, U01_UN11F001_H1, U01_UN21F001_H1, CLC_ShiftDuty, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1
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