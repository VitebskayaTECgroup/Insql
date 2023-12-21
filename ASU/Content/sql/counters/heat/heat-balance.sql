{минутные срезы}
/*ReportName="БАЛАНС-ПАР" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST((isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0)+isnull(U03_UN11F001,0))*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "G сум пара, т/ч [hint: Сумма расход пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST((isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0))*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "G сум конд, т/ч [hint: Сумма возврата конденсата Док+КИМ+ВЗРД]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U01_UN11F001, U01_UN21F001, U02_UN11F001, U02_UN12F001, U02_UN21F001, U03_UN11F001, U03_UN21F001, U01_SY00A700, U02_SY00A700, U03_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="БАЛАНС-ПАР" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0)+isnull(U03_UN11F001_H1,0) as decimal(15,2))
		as "G сум пара за п/ч, т/ч [hint: Сумма расход пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0) as decimal(15,2))
		as "G сум конд. за п/ч, т/ч [hint: Сумма возврата конденсата Док+КИМ+ВЗРД]",
	CAST(isnull(U01_UN11W001_H1,0)+isnull(U02_UN11W001_H1,0)+isnull(U02_UN12W001_H1,0)+isnull(U03_UN11W001_H1,0) as decimal(15,2))
		as "W сум пара за п/ч, ГДж [hint: Суммарная энергия пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(isnull(U01_UN21W001_H1,0)+isnull(U02_UN21W001_H1,0)+isnull(U03_UN21W001_H1,0) as decimal(15,2))
		as "W сум конд. за п/ч, ГДж [hint: Суммарная энергия конденсата Док+КИМ+ВЗРД]",
	CAST(isnull(U01_UN31W001_H1,0)+isnull(U02_UN31W001_H1,0)+isnull(U03_UN31W001_H1,0) as decimal(15,2))
		as "dW сум по МАГ. за п/ч, ГДж [hint: Суммарная энергия по магистралям Док+КИМ+ВЗРД]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_H1, U01_UN21F001_H1, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1, U02_UN11F001_H1, U02_UN12F001_H1,
	U03_UN11F001_H1, U03_UN21F001_H1,  U03_UN11W001_H1, U03_UN21W001_H1, U03_UN31W001_H1,
	U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="БАЛАНС-ПАР" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0)+isnull(U03_UN11F001_s1,0) as decimal(8,2))
		as "G сум пара за п/c, т/сут [hint: Сумма расход пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_s1,0) as decimal(8,2))
		as "G сум конд. за п/c, т/сут [hint: Сумма возврат конденсата Док+КИМ+ВЗРД]",
	CAST(isnull(U01_UN11W001_S1,0)+isnull(U02_UN11W001_s1,0)+isnull(U02_UN12W001_S1,0)+isnull(U03_UN11W001_s1,0) as decimal(8,2))
		as "W сум пара за п/с, ГДж [hint: Суммарная энергия пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(isnull(U01_UN21W001_S1,0)+isnull(U02_UN21W001_S1,0)+isnull(U03_UN21W001_s1,0)+isnull(U03_UN31W001_s1,0) as decimal(8,2))
		as "W сум конд. за п/c, ГДж [hint: Суммарная энергия конденсата Док+КИМ+ВЗРД]",
	CAST(isnull(U01_UN31W001_S1,0)+isnull(U02_UN31W001_S1,0) as decimal(8,2))
		as "dW сум по МАГ. за п/c, ГДж [hint: Суммарная энергия по магистралям Док+КИМ+ВЗРД]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_S1, U01_UN21F001_S1, U01_UN11W001_S1, U01_UN21W001_S1, U01_UN31W001_S1, U02_UN11F001_S1, U02_UN12F001_S1, 
	U03_UN11F001_s1, U03_UN21F001_s1,  U03_UN11W001_s1, U03_UN21W001_s1, U03_UN31W001_s1,
	U02_UN21F001_S1, U02_UN11W001_S1, U02_UN12W001_S1, U02_UN21W001_S1, U02_UN31W001_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="БАЛАНС-ПАР" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0))
		as "Cмена [hint: CLC_ShiftDuty]",
	CAST(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0)+isnull(U03_UN11F001_H1,0) as decimal(15,2))
		as "G сум пара за п/ч, т/ч [hint: Сумма расход пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0) as decimal(15,2))
		as "G сум конд. за п/ч, т/ч [hint: Сумма возврата конденсата Док+КИМ+ВЗРД]",
	CAST(isnull(U01_UN11W001_H1,0)+isnull(U02_UN11W001_H1,0)+isnull(U02_UN12w001_H1,0)+isnull(U03_UN11w001_H1,0) as decimal(15,2))
		as "W сум пара за п/ч, ГДж [hint: Суммарная энергия пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(isnull(U01_UN21W001_H1,0)+isnull(U02_UN21w001_H1,0)+isnull(U03_UN21w001_H1,0) as decimal(15,2))
		as "W сум конд. за п/ч, ГДж [hint: Суммарная энергия конденсата Док+КИМ+ВЗРД]",
	CAST(isnull(U01_UN31W001_H1,0)+isnull(U02_UN31w001_H1,0)+isnull(U03_UN31w001_H1,0) as decimal(15,2))
		as "dW сум по МАГ. за п/ч, ГДж [hint: Суммарная энергия по магистралям Док+КИМ+ВЗРД]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_H1, CLC_ShiftDuty, U01_UN21F001_H1, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1, U02_UN11F001_H1, 
	U03_UN11F001_H1, U03_UN21F001_H1, U03_UN11W001_H1, U03_UN21W001_H1, U03_UN31W001_H1,
	U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null, 
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime)))
		as "Cмена [hint: CLC_ShiftDuty]",
	CAST(sum(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0)+isnull(U03_UN11F001_H1,0)) as decimal(15,2))
		as "G сум пара за смену, т/см [hint: Сумма расход пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(15,2))
		as "G сум конд. за смену, т/см [hint: Сумма возврата конденсата Док+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN11W001_H1,0)+isnull(U02_UN11W001_H1,0)+isnull(U02_UN12w001_H1,0)+isnull(U03_UN11w001_H1,0)) as decimal(15,2))
		as "W сум пара за смену, ГДж [hint: Суммарная энергия пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN21W001_H1,0)+isnull(U02_UN21w001_H1,0)+isnull(U03_UN21w001_H1,0)) as decimal(15,2))
		as "W сум конд. за смену, ГДж [hint: Суммарная энергия конденсата Док+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN31W001_H1,0)+isnull(U02_UN31w001_H1,0)+isnull(U03_UN31w001_H1,0)) as decimal(15,2))
		as "dW сум по МАГ. за п/ч, ГДж [hint: Суммарная энергия по магистралям Док+КИМ+ВЗРД]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U01_UN11F001_H1, CLC_ShiftDuty, U01_UN21F001_H1, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1, U02_UN11F001_H1,
	U03_UN11F001_H1, U03_UN21F001_H1, U03_UN11W001_H1, U03_UN21W001_H1, U03_UN31W001_H1,
	U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
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
/*ReportName="БАЛАНС-ПАР" (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
		as "Cмена [hint: CLC_ShiftDuty]", 
	Count(*)
		as "Час [hint: Время, отработанное сменой за месяц, час]",
	CAST(sum(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0)+isnull(U03_UN11F001_H1,0)) as decimal(15,2))
		as "G сум пара, т/см [hint: Сумма расход пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(15,2))
		as "G сум конд., т/см [hint: Сумма возврата конденсата Док+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN11W001_H1,0)+isnull(U02_UN11W001_H1,0)+isnull(U02_UN12w001_H1,0)+isnull(U03_UN11w001_H1,0)) as decimal(15,2))
		as "W сум пара, ГДж [hint: Суммарная энергия пара Док19+ДОК28+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN21W001_H1,0)+isnull(U02_UN21w001_H1,0)+isnull(U03_UN21w001_H1,0)) as decimal(15,2))
		as "W сум конд. за смену, ГДж [hint: Суммарная энергия конденсата Док+КИМ+ВЗРД]",
	CAST(sum(isnull(U01_UN31W001_H1,0)+isnull(U02_UN31w001_H1,0)+isnull(U03_UN31w001_H1,0)) as decimal(15,2))
		as "dW сум по МАГ., ГДж [hint: Суммарная энергия по магистралям Док+КИМ+ВЗРД]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U01_UN11F001_H1, CLC_ShiftDuty, U01_UN21F001_H1, U01_UN11W001_H1, U01_UN21W001_H1, U01_UN31W001_H1, U02_UN11F001_H1,
	U03_UN11F001_H1, U03_UN21F001_H1,  U03_UN11W001_H1, U03_UN21W001_H1, U03_UN31W001_H1,
	U02_UN12F001_H1, U02_UN21F001_H1, U02_UN11W001_H1, U02_UN12W001_H1, U02_UN21W001_H1, U02_UN31W001_H1
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