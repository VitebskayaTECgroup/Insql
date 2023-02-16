{минутные срезы}
/*ReportName="СН КО по вход/выход конденсата в ХЦ" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(isnull(H01_KB21F001,0)*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "G загр. конд. из КТЦ, т/ч [H01_KB21F001]",
	CAST(isnull(U01_UN21F001,0)*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "G конд КИМ, т/ч [U01_UN21F001]",
	CAST(isnull(U02_UN21F001,0)*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "G конд ДОК, т/ч [U02_UN21F001]",
	CAST(isnull(U03_UN21F001,0)*isnull(U03_SY00A700,0) as decimal(15,2))
		as "G конд. ВЗРД, т/ч [U03_UN21F001]",
	CAST((isnull(H01_KB21F001,0)+isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0))*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) 	as decimal(15,2)) as "Сумма загр-го кон-та, т/ч [Hint: Загрязненный из КТЦ +Конденсат с КИМ+Конденсат с ДОК+Конденсат с ВЗРД]",
	CAST(isnull(H01_KC21F001,0)*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "G очищ. конд. в КТЦ, т/ч [H01_KC21F001]",
	CAST((isnull(H01_KB21F001,0)+isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0)-isnull(H01_KC21F001,0))*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ, т/ч [Hint: Загрязненный Конденсат - очищенный]",
	CAST((dbo.vst_SafeDIV((isnull(H01_KB21F001,0)+isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0)-isnull(H01_KC21F001,0)),(isnull(H01_KC21F001,0)))*100)*isnull(H01_SY00A700,0)*isnull(U01_SY00A700,0)*isnull(U02_SY00A700,0) as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ , % [Hint: Процент от очищенного конденсата]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_KB21F001, U01_UN21F001, U02_UN21F001, U03_UN21F001, H01_KC21F001, H01_SY00A700, U01_SY00A700, U02_SY00A700, U03_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="СН КО по вход/выход конденсата в ХЦ" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(H01_KB21F001_H1,0) as decimal(15,2))
		as "G загр. конд. из КТЦ за п/ч, т/ч [H01_KB21F001_H1]",
	CAST(isnull(U01_UN21F001_H1,0) as decimal(15,2))
		as "G конд. КИМ за п/ч, т/ч [U01_UN21F001_H1]",
	CAST(isnull(U02_UN21F001_H1,0) as decimal(15,2))
		as "G конд. ДОК за п/ч, т/ч [U02_UN21F001_H1]",
	CAST(isnull(U03_UN21F001_H1,0) as decimal(15,2))
		as "G конд. ВЗРД за п/ч, т/ч [U03_UN21F001_H1]",
	CAST(isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0) as decimal(15,2))
		as "Сумма загр-го кон-та за п/ч, т/ч [Hint: Загрязненный из КТЦ +Конденсат с КИМ+Конденсат с ДОК+Конденсат с ВЗРД]",
	CAST(isnull(H01_KC21F001_H1,0) as decimal(15,2))
		as "G очищ. конд. в КТЦ за п/ч, т/ч [H01_KC21F001_H1]",
	CAST(isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)-isnull(H01_KC21F001_H1,0) as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/ч, т/ч [Hint: Загрязненный Конденсат - очищенный]",
	CAST(dbo.vst_SafeDIV((isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)-isnull(H01_KC21F001_H1,0)),(isnull(H01_KC21F001_H1,0)))*100 as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/ч, % [Hint: Процент от очищенного конденсата]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  H01_KB21F001_H1, U01_UN21F001_H1, U02_UN21F001_H1, H01_KC21F001_H1, U03_UN21F001_H1
	FROM Runtime.dbo.AnalogWideHistory  
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="СН КО по вход/выход конденсата в ХЦ" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(H01_KB21F001_S1,0) as decimal(15,2))
		as "G загр. конд. из КТЦ за п/c, т/сут [H01_KB21F001_S1]",
	CAST(isnull(U01_UN21F001_S1,0) as decimal(15,2))
		as "G конд.КИМ за п/c, т/сут [U01_UN21F001_S1]",
	CAST(isnull(U02_UN21F001_S1,0) as decimal(15,2))
		as "G конд. ДОК за п/c, т/сут [U02_UN21F001_S1]",
	CAST(isnull(U03_UN21F001_S1,0) as decimal(15,2))
		as "G конд. ВЗРД за п/с, т/cут [U03_UN21F001_S1]",
	CAST(isnull(H01_KB21F001_S1,0)+isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_s1,0)+isnull(U03_UN21F001_s1,0) as decimal(15,2))
		as "Сумма загр-го кон-та за п/c, т/сут [Hint: Загрязненный из КТЦ +Конденсат с КИМ+Конденсат с ДОК+Конденсат с ВЗРД]",
	CAST(isnull(H01_KC21F001_S1,0) as decimal(15,2))
		as "G очищ. конд. в КТЦ за п/c, т/сут [H01_KC21F001_S1]",
	CAST(isnull(H01_KB21F001_S1,0)+isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_s1,0)+isnull(U03_UN21F001_s1,0)-isnull(H01_KC21F001_S1,0) as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/c, т/сут [Hint: Загрязненный Конденсат - очищенный]",
	CAST(dbo.vst_SafeDIV((isnull(H01_KB21F001_S1,0)+isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_s1,0)+isnull(U03_UN21F001_s1,0)-isnull(H01_KC21F001_S1,0)),(isnull(H01_KC21F001_S1,0)+0.000001))*100 as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/c, % [Hint: Процент от очищенного конденсата]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_KB21F001_S1, U01_UN21F001_S1, U02_UN21F001_S1, H01_KC21F001_S1, U03_UN21F001_s1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="СН КО по вход/выход конденсата в ХЦ" (часовые срезы по сменам 8/12)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=dd.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.00.0000 11:00:00.000*/
/*Step=00.00.0000 12:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0))
		as "Cмена [CLC_ShiftDuty]",
	CAST(isnull(H01_KB21F001_H1,0) as decimal(15,2))
		as "G загр. конд. из КТЦ за п/ч, т/ч [H01_KB21F001_H1]",
	CAST(isnull(U01_UN21F001_H1,0) as decimal(15,2))
		as "G конд. КИМ за п/ч, т/ч [U01_UN21F001_H1]",
	CAST(isnull(U02_UN21F001_H1,0) as decimal(15,2))
		as "G конд. ДОК за п/ч, т/ч [U02_UN21F001_H1]",
	CAST(isnull(U03_UN21F001_H1,0) as decimal(15,2))
		as "G конд. ВЗРД за п/ч, т/ч [U03_UN21F001_H1]",
	CAST(isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0) as decimal(15,2))
		as "Сумма загр-го кон-та за п/ч, т/ч [Hint: Загрязненный из КТЦ +Конденсат с КИМ+Конденсат с ДОК+Конденсат с ВЗРД]",
	CAST(isnull(H01_KC21F001_H1,0) as decimal(15,2))
		as "G очищ. конд. в КТЦ за п/ч, т/ч [H01_KC21F001_H1]",
	CAST(isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)-isnull(H01_KC21F001_H1,0) as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/ч, т/ч [Hint: Загрязненный Конденсат - очищенный]",
	CAST(dbo.vst_SafeDIV((isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)-isnull(H01_KC21F001_H1,0)),(isnull(H01_KC21F001_H1,0)))*100 as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/ч, % [Hint: Процент от очищенного конденсата]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  H01_KB21F001_H1, U01_UN21F001_H1, CLC_ShiftDuty, U02_UN21F001_H1, H01_KC21F001_H1, U03_UN21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="СН КО по вход/выход конденсата в ХЦ"(агрегированные часовые данные по сменам)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
	CAST(sum(isnull(H01_KB21F001_H1,0)) as decimal(15,2)) as "G загр. конд. из КТЦ за смену, т/см [H01_KB21F001_H1]",
	CAST(sum(isnull(U01_UN21F001_H1,0)) as decimal(15,2)) as "G конд. КИМ за смену, т/см [U01_UN21F001_H1]",
	CAST(sum(isnull(U02_UN21F001_H1,0)) as decimal(15,2)) as "G конд. ДОК за смену, т/см [U02_UN21F001_H1]",
	CAST(sum(isnull(U03_UN21F001_H1,0)) as decimal(15,2)) as "G конд. ВЗРД за п/см, т/см [U03_UN21F001_H1]",
	CAST(sum(isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(15,2)) as "Сумма загр-го кон-та за смену, т/см [Hint: Загрязненный из КТЦ +Конденсат с КИМ+Конденсат с ДОК+Конденсат с ВЗРД]",
	CAST(sum(isnull(H01_KC21F001_H1,0)) as decimal(15,2)) as "G очищ. конд. в КТЦ за смену, т/см [H01_KC21F001_H1]",
	CAST(sum(isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)-isnull(H01_KC21F001_H1,0)) as decimal(15,2)) as "СН КО по вх/вых конд в ХЦ за смену, т/см [Hint: Загрязненный Конденсат - очищенный]",
	CAST(avg(dbo.vst_SafeDIV((isnull(H01_KB21F001_H1,0)+isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)-isnull(H01_KC21F001_H1,0)),(isnull(H01_KC21F001_H1,0))))*100 as decimal(15,2)) as "СН КО по вх/вых конд в ХЦ за п/см, % [Hint: Процент от очищенного конденсата]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,  H01_KB21F001_H1, U01_UN21F001_H1, CLC_ShiftDuty, U02_UN21F001_H1, H01_KC21F001_H1, U03_UN21F001_H1  FROM Runtime.dbo.AnalogWideHistory
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
/*ReportName="СН КО по вход/выход конденсата в ХЦ" (агрегированные по сменам за месяц)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))
		as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
		as "Cмена [CLC_ShiftDuty]", 
	Count(*)
		as "Час [Hint: Время, отработанное сменой за месяц, час]",
	CHAR(192+MIN(CLC_ShiftDuty))
		as "Cмена [CLC_ShiftDuty]",
	CAST(sum(H01_KB21F001_H1) as decimal(15,2))
		as "G загр. конд. из КТЦ сум, т/см [H01_KB21F001_H1]",
	CAST(sum(U01_UN21F001_H1) as decimal(15,2))
		as "G конд. КИМ сум, т/см [U01_UN21F001_H1]",
	CAST(sum(U02_UN21F001_H1) as decimal(15,2))
		as "G конд. ДОК сум, т/см [U02_UN21F001_H1]",
	CAST(sum(U03_UN21F001_H1) as decimal(15,2))
		as "G конд. ВЗРД сум, т/см [U03_UN21F001_H1]",
	CAST(sum(H01_KB21F001_H1+U01_UN21F001_H1+U02_UN21F001_H1+U03_UN21F001_H1) as decimal(15,2))
		as "Сумма загр-го кон-та сум, т/см [Hint: Загрязненный из КТЦ +Конденсат с КИМ+Конденсат с ДОК+Конденсат с ВЗРД]",
	CAST(sum(H01_KC21F001_H1) as decimal(15,2))
		as "G очищ. конд. в КТЦ за смену, т/см [H01_KC21F001_H1]",
	CAST(sum(H01_KB21F001_H1+U01_UN21F001_H1+U02_UN21F001_H1+U03_UN21F001_H1-H01_KC21F001_H1) as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ сум, т/см [Hint: Загрязненный Конденсат - очищенный]",
	CAST(avg(dbo.vst_SafeDIV((H01_KB21F001_H1+U01_UN21F001_H1+U02_UN21F001_H1+U03_UN21F001_H1-H01_KC21F001_H1),(H01_KC21F001_H1)))*100 as decimal(15,2))
		as "СН КО по вх/вых конд в ХЦ за п/см, % [Hint: Процент от очищенного конденсата]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_KB21F001_H1, U01_UN21F001_H1, CLC_ShiftDuty, U02_UN21F001_H1, H01_KC21F001_H1, U03_UN21F001_H1
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