{минутные срезы}
/*ReportName="Потери пара и конденсата в КТЦ" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(H01_VA21F001 as decimal(15,2))
		as "G ХОВ в КТЦ, тонн [H01_VA21F001_S1]",
	CAST(H01_KC21F001 as decimal(15,2))
		as "G очищ. конд. из ХЦ в КТЦ, тонн [H01_KC21F001]",
	CAST(H01_VA21F001 + H01_KC21F001 as decimal(15,2))
		as "Всего приход в КТЦ, тонн [(3=1+2) (H01_VA21F001+H01_KC21F001)]",
	CAST(U01_UN11F001 + U02_UN11F001 + U02_UN12F001 as decimal(15,2))
		as "G сум пара, т/сут [расход пара ПОТРЕБИТЕЛЯМ]",
	CAST(H01_KB21F001 as decimal(15,2))
		as "G загр. конд. из КТЦ в ХЦ, тонн [H01_KB21F001]",
	CAST((U04_UM41F001 * 0.02) as decimal(15,2))
		as "G Пара на Подп.ТС, тонн [Расход пара на подпитку ТС (U04_UM41F001*0,02)]",
	CAST((U01_UN11F001 + U02_UN11F001 + U02_UN12F001) + H01_KB21F001 + (U04_UM41F001 * 0.02) as decimal(15,2))
		as "Всего из КТЦ, тонн [7=4+5+6]",
	CAST((H01_VA21F001 + H01_KC21F001) - ((U01_UN11F001 + U02_UN11F001 + U02_UN12F001) + H01_KB21F001 + (U04_UM41F001 * 0.02)) as decimal(15,2)) 
		as "Потери в КТЦ, тонн [8=3-7]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VA21F001, H01_KC21F001, U01_UN11F001, U02_UN11F001, U02_UN12F001, H01_KB21F001, U04_UM41F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Потери пара и конденсата в КТЦ" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	CAST(H01_VA21F001_H1 as decimal(15,2))
		as "G ХОВ в КТЦ, тонн [H01_VA21F001_H1]",
	CAST(H01_KC21F001_H1 as decimal(15,2))
		as "G очищ. конд. из ХЦ в КТЦ, тонн [H01_KC21F001_H1]",
	CAST(H01_VA21F001_H1 + H01_KC21F001_H1 as decimal(15,2))
		as "Всего приход в КТЦ, тонн [(3=1+2) (H01_VA21F001_H1+H01_KC21F001_H1)]",
	CAST(U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1 as decimal(15,2))
		as "G сум пара, т/сут [расход пара ПОТРЕБИТЕЛЯМ]",
	CAST(H01_KB21F001_H1 as decimal(15,2))
		as "G загр. конд. из КТЦ в ХЦ, тонн [H01_KB21F001_H1]",
	CAST((U04_UM41F001_H1*0.02) as decimal(15,2))
		as "G Пара на Подп.ТС, тонн [Расход пара на подпитку ТС (U04_UM41F001_H1*0,02)]",
	CAST((U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1)+H01_KB21F001_H1+(U04_UM41F001_H1*0.02) as decimal(15,2))
		as "Всего из КТЦ, тонн [7=4+5+6]",
	CAST((H01_VA21F001_H1 + H01_KC21F001_H1) - ((U01_UN11F001_H1 + U02_UN11F001_H1 + U02_UN12F001_H1) + H01_KB21F001_H1 + (U04_UM41F001_H1 * 0.02)) as decimal(15,2))
		as "Потери в КТЦ, тонн [8=3-7]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VA21F001_H1, H01_KC21F001_H1, U01_UN11F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, H01_KB21F001_H1, U04_UM41F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Потери пара и конденсата в КТЦ" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(H01_VA21F001_S1 as decimal(15,2))
		as "G ХОВ в КТЦ, тонн [H01_VA21F001_S1]",
	CAST(H01_KC21F001_S1 as decimal(15,2))
		as "G очищ. конд. из ХЦ в КТЦ, тонн [H01_KC21F001_S1]",
	CAST(H01_VA21F001_S1 + H01_KC21F001_S1 as decimal(15,2))
		as "Всего приход в КТЦ, тонн [(3=1+2) (H01_VA21F001_S1+H01_KC21F001_S1)]",
	CAST(U01_UN11F001_S1+U02_UN11F001_S1+U02_UN12F001_S1 as decimal(15,2))
		as "G сум пара, т/сут [расход пара ПОТРЕБИТЕЛЯМ]",
	CAST(H01_KB21F001_S1 as decimal(15,2))
		as "G загр. конд. из КТЦ в ХЦ, тонн [H01_KB21F001_S1]",
	CAST((U04_UM41F001_S1*0.02) as decimal(15,2))
		as "G Пара на Подп.ТС, тонн [Расход пара на подпитку ТС (U04_UM41F001_S1*0,02)]",
	CAST((U01_UN11F001_S1 + U02_UN11F001_S1+U02_UN12F001_S1) + H01_KB21F001_S1 + (U04_UM41F001_S1 * 0.02) as decimal(15,2))
		as "Всего из КТЦ, тонн [7=4+5+6]",
	CAST((H01_VA21F001_S1 + H01_KC21F001_S1) - ((U01_UN11F001_S1+U02_UN11F001_S1+U02_UN12F001_S1)+ H01_KB21F001_S1+ (U04_UM41F001_S1*0.02)) as decimal(15,2))
		as "Потери в КТЦ, тонн [8=3-7]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VA21F001_S1, H01_KC21F001_S1, U01_UN11F001_S1, U02_UN11F001_S1, U02_UN12F001_S1, H01_KB21F001_S1, U04_UM41F001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Потери пара и конденсата в КТЦ" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty)
		as "Cме- на [CLC_ShiftDuty]",
	CAST(H01_VA21F001_H1 as decimal(15,2))
		as "G ХОВ в КТЦ, тонн [H01_VA21F001_H1]",
	CAST(H01_KC21F001_H1 as decimal(15,2))
		as "G очищ. конд. из ХЦ в КТЦ, тонн [H01_KC21F001_H1]",
	CAST(H01_VA21F001_H1 + H01_KC21F001_H1 as decimal(15,2))
		as "Всего приход в КТЦ, тонн [(3=1+2) (H01_VA21F001_H1+H01_KC21F001_H1)]",
	CAST(U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1 as decimal(15,2))
		as "G сум пара, т/сут [расход пара ПОТРЕБИТЕЛЯМ]",
	CAST(H01_KB21F001_H1 as decimal(15,2))
		as "G загр. конд. из КТЦ в ХЦ, тонн [H01_KB21F001_H1]",
	CAST((U04_UM41F001_H1*0.02) as decimal(15,2))
		as "G Пара на Подп.ТС, тонн [Расход пара на подпитку ТС (U04_UM41F001_H1*0,02)]",
	CAST((U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1)+H01_KB21F001_H1+(U04_UM41F001_H1*0.02)as decimal(15,2))
		as "Всего из КТЦ, тонн [7=4+5+6]",
	CAST((H01_VA21F001_H1 +H01_KC21F001_H1)-((U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1)+H01_KB21F001_H1+(U04_UM41F001_H1*0.02)) as decimal(15,2))
		as "Потери в КТЦ, тонн [8=3-7]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H01_VA21F001_H1, CLC_ShiftDuty, H01_KC21F001_H1, U01_UN11F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, H01_KB21F001_H1, U04_UM41F001_H1
	FROM Runtime.dbo.AnalogWideHistory  
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Потери пара и конденсата в КТЦ"(агрегированные часовые данные по сменам)*/
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
	CAST(sum(H01_VA21F001_H1) as decimal(15,2))
		as "G ХОВ в КТЦ, тонн [H01_VA21F001_H1]",
	CAST(sum(H01_KC21F001_H1) as decimal(15,2))
		as "G очищ. конд. из ХЦ в КТЦ, тонн [H01_KC21F001_H1]",
	CAST(SUM(H01_VA21F001_H1 + H01_KC21F001_H1 )as decimal(15,2))
		as "Всего приход в КТЦ, тонн [(3=1+2) (H01_VA21F001_H1+H01_KC21F001_H1)]",
	CAST(sum(U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1 )as decimal(15,2))
		as "G сум пара, т/сут [расход пара ПОТРЕБИТЕЛЯМ]",
	CAST(sum(H01_KB21F001_H1) as decimal(15,2))
		as "G загр. конд. из КТЦ в ХЦ, тонн [H01_KB21F001_H1]",
	CAST(sum((U04_UM41F001_H1)*0.02) as decimal(15,2))
		as "G Пара на Подп.ТС, тонн [Расход пара на подпитку ТС (U04_UM41F001_H1*0,02)]",
	CAST(sum((U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1)+H01_KB21F001_H1+(U04_UM41F001_H1*0.02)) as decimal(15,2))
		as "Всего из КТЦ, тонн [7=4+5+6]",
	CAST(sum((H01_VA21F001_H1 +H01_KC21F001_H1)-((U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1)+H01_KB21F001_H1+(U04_UM41F001_H1*0.02))) as decimal(15,2))
		as "Потери в КТЦ, тонн [8=3-7]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VA21F001_H1, CLC_ShiftDuty, H01_KC21F001_H1, U01_UN11F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, H01_KB21F001_H1, U04_UM41F001_H1
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
/*ReportName="Потери пара и конденсата в КТЦ" (агрегированные по сменам за месяц)*/
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
	CAST(sum(H01_VA21F001_H1) as decimal(15,2))
		as "G ХОВ в КТЦ, тонн [H01_VA21F001_H1]",
	CAST(sum(H01_KC21F001_H1) as decimal(15,2))
		as "G очищ. конд. из ХЦ в КТЦ, тонн [H01_KC21F001_H1]",
	CAST(SUM(H01_VA21F001_H1 + H01_KC21F001_H1)as decimal(15,2))
		as "Всего приход в КТЦ, тонн [(3=1+2) (H01_VA21F001_H1+H01_KC21F001_H1)]",
	CAST(sum(U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1 )as decimal(15,2))
		as "G сум пара, т/сут [расход пара ПОТРЕБИТЕЛЯМ]",
	CAST(sum(H01_KB21F001_H1) as decimal(15,2))
		as "G загр. конд. из КТЦ в ХЦ, тонн [H01_KB21F001_H1]",
	CAST(sum((U04_UM41F001_H1)*0.02) as decimal(15,2))
		as "G Пара на Подп.ТС, тонн [Расход пара на подпитку ТС (U04_UM41F001_H1*0,02)]",
	CAST(sum((U01_UN11F001_H1+U02_UN11F001_H1+U02_UN12F001_H1)+H01_KB21F001_H1+(U04_UM41F001_H1*0.02)) as decimal(15,2))
		as "Всего из КТЦ, тонн [7=4+5+6]",
	CAST(sum((H01_VA21F001_H1 + H01_KC21F001_H1) - ((U01_UN11F001_H1 + U02_UN11F001_H1 + U02_UN12F001_H1) + H01_KB21F001_H1 + (U04_UM41F001_H1 * 0.02))) as decimal(15,2))
		as "Потери в КТЦ, тонн [8=3-7]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VA21F001_H1, CLC_ShiftDuty, H01_KC21F001_H1, U01_UN11F001_H1, U02_UN11F001_H1, U02_UN12F001_H1, H01_KB21F001_H1, U04_UM41F001_H1
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