{минутные срезы}
/*ReportName="Потери пара и конденсата  всего по ТЭЦ" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0) as decimal(8,2))
		as "G сум пара, тонн [расход пара ПОТРЕБИТЕЛЯМ (1)]",
	CAST(isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0) as decimal(8,2))
		as "G сум конд., тонн [возврат конденсата ОТ ПОТРЕБИТЕЛЕЙ (2)]",
	CAST((isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0))- (isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0)) as decimal(8,2))
		as "G не возврат конд, тонн [Не возврат конденсата от потребителей (3=1-2)]",
	CAST(isnull(H01_VA21F001,0) as decimal(15,2))
		as "G ХОВ, тонн [H01_VA21F001]",
	CAST(isnull(H01_VA21F001,0) - ((isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0))- (isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0))) as decimal(15,2))
		as "Потери пара и конд по ТЭЦ, тонн [Потери пара и конденсата по ТЭЦ. Тонн (5=4-3)]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U01_UN11F001, U01_UN21F001, H01_VA21F001, U02_UN11F001, U02_UN12F001, U02_UN21F001, U03_UN21F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Потери пара и конденсата  всего по ТЭЦ" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0) as decimal(8,2))
		as "G сум пара, тонн [расход пара ПОТРЕБИТЕЛЯМ (1)]",
	CAST(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0) as decimal(8,2))
		as "G сум конд., тонн [возврат конденсата ОТ ПОТРЕБИТЕЛЕЙ (2)]",
	CAST((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(8,2))
		as "G не возврат конд, тонн [Не возврат конденсата от потребителей (3=1-2)]",
	CAST(isnull(H01_VA21F001_H1,0) as decimal(15,2))
		as "G ХОВ, тонн [H01_VA21F001_H1]",
	CAST(isnull(H01_VA21F001_H1,0) -((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- (isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0))) as decimal(15,2))
		as "Потери пара и конд по ТЭЦ, тонн [Потери пара и конденсата по ТЭЦ. Тонн (5=4-3)]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_H1, U01_UN21F001_H1, H01_VA21F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U03_UN21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Потери пара и конденсата  всего по ТЭЦ" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0)as decimal(8,2))
		as "G сум пара, тонн [расход пара ПОТРЕБИТЕЛЯМ (1)]",
	CAST(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0)as decimal(8,2))
		as "G сум конд., тонн [возврат конденсата ОТ ПОТРЕБИТЕЛЕЙ (2)]",
	CAST((isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0))-(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0)) as decimal(8,2))
		as "G не возврат конд, тонн [Не возврат конденсата от потребителей (3=1-2)]",
	CAST(isnull(H01_VA21F001_S1,0) as decimal(15,2))
		as "G ХОВ, тонн [H01_VA21F001_S1]",
	CAST(isnull(H01_VA21F001_S1,0) -( (isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0))- (isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0))) as decimal(15,2))
		as "Потери пара и конд по ТЭЦ, тонн [Потери пара и конденсата по ТЭЦ. Тонн (5=4-3)]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_S1, U01_UN21F001_S1, H01_VA21F001_S1, U02_UN11F001_S1, U02_UN12F001_S1, U02_UN21F001_S1, U03_UN21F001_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Потери пара и конденсата  всего по ТЭЦ" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0))
		as "Cме- на [CLC_ShiftDuty]",
	CAST(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0) as decimal(8,2))
		as "G сум пара, тонн [расход пара ПОТРЕБИТЕЛЯМ (1)]",
	CAST(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0) as decimal(8,2))
		as "G сум конд., тонн [возврат конденсата ОТ ПОТРЕБИТЕЛЕЙ (2)]",
	CAST((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- (isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(8,2))
		as "G не возврат конд, тонн [Не возврат конденсата от потребителей (3=1-2)]",
	CAST(isnull(H01_VA21F001_H1,0) as decimal(15,2))
		as "G ХОВ, тонн [H01_VA21F001_H1]",
	CAST(isnull(H01_VA21F001_H1,0) -( (isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- (isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0))) as decimal(15,2))
		as "Потери пара и конд по ТЭЦ, тонн [Потери пара и конденсата по ТЭЦ. Тонн (5=4-3)]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_H1, CLC_ShiftDuty, U01_UN21F001_H1, H01_VA21F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U03_UN21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Потери пара и конденсата  всего по ТЭЦ"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime)))
		as "Cмена [CLC_ShiftDuty]",
	CAST(sum(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0)) as decimal(8,2))
		as "G сум пара, тонн [расход пара ПОТРЕБИТЕЛЯМ (1)]",
	CAST(sum(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(8,2))
		as "G сум конд., тонн [возврат конденсата ОТ ПОТРЕБИТЕЛЕЙ (2)]",
	CAST(sum((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- (isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))
	as decimal(8,2))
		as "G не возврат конд, тонн [Не возврат конденсата от потребителей (3=1-2)]",
	CAST(sum(isnull(H01_VA21F001_H1,0)) as decimal(15,2))
		as "G ХОВ, тонн [H01_VA21F001_H1]",
	CAST(sum(isnull(H01_VA21F001_H1,0)-((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))) as decimal(15,2))
		as "Потери пара и конд по ТЭЦ, тонн [Потери пара и конденсата по ТЭЦ. Тонн (5=4-3)]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_H1, CLC_ShiftDuty, U01_UN21F001_H1,  H01_VA21F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U03_UN21F001_H1
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
/*ReportName="Потери пара и конденсата  всего по ТЭЦ" (агрегированные по сменам за месяц)*/
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
		as "Cмена [CLC_ShiftDuty]",
	Count(*)
		as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0)) as decimal(8,2))
		as "G сум пара, тонн [расход пара ПОТРЕБИТЕЛЯМ (1)]",
	CAST(sum(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(8,2))
		as "G сум конд., тонн [возврат конденсата ОТ ПОТРЕБИТЕЛЕЙ (2)]",
	CAST(sum((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0))) as decimal(8,2))
		as "G не возврат конд, тонн [Не возврат конденсата от потребителей (3=1-2)]",
	CAST(sum(isnull(H01_VA21F001_H1,0)) as decimal(15,2))
		as "G ХОВ, тонн [H01_VA21F001_H1]",
	CAST(sum(isnull(H01_VA21F001_H1,0)-( (isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))) as decimal(15,2))
		as "Потери пара и конд по ТЭЦ, тонн [Потери пара и конденсата по ТЭЦ. Тонн (5=4-3)]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001_H1, CLC_ShiftDuty, U01_UN21F001_H1,  H01_VA21F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, U02_UN21F001_H1, U03_UN21F001_H1
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