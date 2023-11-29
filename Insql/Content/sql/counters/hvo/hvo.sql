{минутные срезы}
/*ReportName="Химводоочистка" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(isnull(H01_KB21F001,0)*isnull(H01_SY00A700,0) as decimal(15,2)) as "G загр. конд. из КТЦ, т/ч [H01_KB21F001]",
	CAST(isnull(H01_KC21F001,0)*isnull(H01_SY00A700,0) as decimal(15,2)) as "G очищ. конд. в КТЦ, т/ч [H01_KC21F001]",
	CAST(isnull(H01_VA21F001,0)*isnull(H01_SY00A700,0) as decimal(15,2)) as "G ХОВ, т/ч [H01_VA21F001]",
	CAST(isnull(H02_KB11F001,0)*isnull(H02_SY00A700,0) as decimal(15,2)) as "G загр. конд. до ф-ров КО, т/ч [H02_KB11F001]",
	CAST(isnull(H01_KC22F001,0)*isnull(H01_SY00A700,0) as decimal(15,2)) as "G очищ. конд.после ф-ров КО, т/ч [H01_KC22F001]",
	CAST(isnull(H02_VB11g001,0)*isnull(H02_SY00A700,0) as decimal(15,2)) as "G сырой воды на осв-ль №2, т/ч [H02_VB11g001]",
	CAST(isnull(H02_VA22F001,0)*isnull(H02_SY00A700,0) as decimal(15,2)) as "G ХОВ ХВО II, т/ч [H02_VA22F001]",
	CAST(isnull(H02_VB12F001,0)*isnull(H02_SY00A700,0) as decimal(15,2)) as "G сырой воды на осв-ль №1, т/ч [H02_VB12F001]",
	CAST(isnull(H02_KK11_F001,0)*isnull(H02_SY00A700,0) as decimal(15,2)) as "G к-та в бак<br>декарб.воды, т/ч [H02_KK11_F001]",
	Round((Isnull(H02_VB11G001, 0) + H02_VB12F001) - H01_VA21F001 * 1.28 - U04_UM41F001 * 0.97 * 1.12, 2) as "Собст-венные нужды, т/ч [Hint:(Isnull(H02_VB11G001, 0) + H02_VB12F001) - H01_VA21F001 * 1.28 - U04_UM41F001 * 0.97 * 1.12]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		H02_KK11_F001,
		H02_VB12F001,
		H02_VA22F001,
		H01_KB21F001,
		H01_SY00A700,
		H02_SY00A700,
		H01_KC21F001,
		H01_VA21F001,
		H02_KB11F001,
		H02_VB11g001,
		H01_KC22F001,
		U04_UM41F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Химводоочистка" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(H01_KB21F001_H1,0) as decimal(15,2)) as "G загр. конд. из КТЦ, т/ч [H01_KB21F001_H1]",
	CAST(isnull(H01_KC21F001_H1,0) as decimal(15,2)) as "G очищ. конд. в КТЦ, т/ч [H01_KC21F001_H1]",
	CAST(isnull(H01_VA21F001_H1,0) as decimal(15,2)) as "G ХОВ, т/ч [H01_VA21F001_H1]",
	CAST(isnull(H02_KB11F001_H1,0) as decimal(15,2)) as "G загр. конд. до ф-ров КО, т/ч [H02_KB11F001_H1]",
	CAST(isnull(H01_KC22F001_H1,0) as decimal(15,2)) as "G очищ. конд.после ф-ров КО, т/ч [H01_KC22F001_H1]",
	CAST(isnull(H02_VB11F001_H1,0) as decimal(15,2)) as "G сыр.воды на осв-ль №2, т/ч [H02_VB11F001_H1]",
	CAST(isnull(H02_VA22F001_H1,0) as decimal(15,2)) as "G ХОВ ХВО II, т/ч [H02_VA22F001_H1]",
	CAST(isnull(H02_VB12F001_H1,0) as decimal(15,2)) as "G сыр.воды на осв-ль №1, т/ч [H02_VB12F001_H1]",
	CAST(isnull(H02_KK11_F001_H1,0) as decimal(15,2)) as "G к-та в бак<br>декарб.воды, т/ч [H02_KK11_F001_H1]",
	Round(U04_UM41F001_H1, 2) as "G подпитки [U04_UM41F001_H1]",
	Round((Isnull(Cast(H02_VB11F001_H1 as decimal(15,6)), 0) + H02_VB12F001_H1) - H01_VA21F001_H1 * 1.28 - U04_UM41F001_H1 * 0.97 * 1.12, 2) as "Собственные нужды, т/ч"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		H02_KK11_F001_H1,
		H02_VA22F001_H1,
		H02_VB12F001_H1,
		H01_KB21F001_H1,
		H01_KC21F001_H1,
		H02_VB11F001_H1,
		H01_VA21F001_H1,
		H02_KB11F001_H1,
		H01_KC22F001_H1,
		H02_VB11G001_H1,
		U04_UM41F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Химводоочистка" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(H01_KB21F001_S1,0) as decimal(15,2)) as "G загр. конд. из КТЦ, т/сут [H01_KB21F001_S1]",
	CAST(isnull(H01_KC21F001_S1,0) as decimal(15,2)) as "G очищ. конд. в КТЦ, т/сут [H01_KC21F001_S1]",
	CAST(isnull(H01_VA21F001_S1,0) as decimal(15,2)) as "G ХОВ, т/сут [H01_VA21F001_S1]",
	CAST(isnull(H02_KB11F001_S1,0) as decimal(15,2)) as "G загр. конд. до ф-ров КО, т/сут [H02_KB11F001_S1]",
	CAST(isnull(H01_KC22F001_S1,0) as decimal(15,2)) as "G очищ. конд.после ф-ров КО, т/сут [H01_KC22F001_S1]",
	CAST(isnull(H02_VB11F001_S1,0) as decimal(15,2)) as "G сыр.воды на осв-ль №2, т/сут [H02_VB11F001_S1]",
	CAST(isnull(H02_VA22F001_S1,0) as decimal(15,2)) as "G ХОВ ХВО II, т/сут [H02_VA22F001_S1]",
	CAST(isnull(H02_VB12F001_S1,0) as decimal(15,2)) as "G сыр.воды на осв-ль №1, т/сут [H02_VB12F001_S1]",
	CAST(isnull(H02_KK11_F001_S1,0) as decimal(15,2)) as "G к-та в бак<br>декарб.воды, т/сут [H02_KK11_F001_S1]",
	Round(U04_UM41F001_S1, 2) as "G подпитки [U04_UM41F001_S1]",
	Round((Isnull(H02_VB11F001_S1, 0) + H02_VB12F001_S1) - H01_VA21F001_S1 * 1.28 - U04_UM41F001_S1 * 0.97 * 1.12, 2) as "Собственные нужды, т/ч"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
		H02_KK11_F001_S1,
		H02_VA22F001_S1,
		H02_VB12F001_S1,
		H01_KB21F001_S1,
		H01_KC21F001_S1,
		H02_VB11F001_S1,
		H01_VA21F001_S1,
		H02_KB11F001_S1,
		H01_KC22F001_S1,
		U04_UM41F001_S1,
		H02_VB11G001_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Химводоочистка" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0)) as "Cме- на [CLC_ShiftDuty]",
	CAST(isnull(H01_KB21F001_H1,0) as decimal(15,2)) as "G загр. конд. из КТЦм, т/см [H01_KB21F001_H1]",
	CAST(isnull(H01_KC21F001_H1,0) as decimal(15,2)) as "G очищ. конд. в КТЦм, т/см [H01_KC21F001_H1]",
	CAST(isnull(H01_VA21F001_H1,0) as decimal(15,2)) as "G ХОВм, т/см [H01_VA21F001_H1]",
	CAST(isnull(H02_KB11F001_H1,0) as decimal(15,2)) as "G загр. конд. до ф-ров КОм, т/см [H02_KB11F001_H1]",
	CAST(isnull(H01_KC22F001_H1,0) as decimal(15,2)) as "G очищ. конд.после ф-ров КОм, т/см [H01_KC22F001_H1]",
	CAST(isnull(H02_VB11F001_H1,0) as decimal(15,2)) as "G сыр.воды на осв-ль №2м, т/см [H02_VB11F001_H1]",
	CAST(isnull(H02_VA22F001_H1,0) as decimal(15,2)) as "G ХОВ ХВО IIм, т/см [H02_VA22F001_H1]",
	CAST(isnull(H02_VB12F001_H1,0) as decimal(15,2)) as "G сыр.воды на осв-ль №1м, т/см [H02_VB12F001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  H02_VA22F001_H1, H02_VB12F001_H1, H01_KB21F001_H1, H01_KC21F001_H1, H02_VB11F001_H1, CLC_ShiftDuty, H01_VA21F001_H1, H02_KB11F001_H1, H01_KC22F001_H1 FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Химводоочистка"(агрегированные часовые данные по сменам)*/
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
	CAST(sum(isnull(H01_KC21F001_H1,0)) as decimal(15,2)) as "G очищ. конд. в КТЦ за смену, т/см [H01_KC21F001_H1]",
	CAST(sum(isnull(H01_VA21F001_H1,0)) as decimal(15,2)) as "G ХОВ за смену, т/см [H01_VA21F001_H1]",
	CAST(sum(isnull(H02_KB11F001_H1,0)) as decimal(15,2)) as "G загр. конд. до ф-ров КО за смену, т/см [H02_KB11F001_H1]",
	CAST(sum(isnull(H01_KC22F001_H1,0)) as decimal(15,2)) as "G очищ. конд.после ф-ров КО за смену, т/см [H01_KC22F001_H1]",
	CAST(sum(isnull(H02_VB11F001_H1,0)) as decimal(15,2)) as "G сыр.воды на осв-ль №2 за смену, т/см [H02_VB11F001_H1]",
	CAST(sum(isnull(H02_VA22F001_S1,0)) as decimal(15,2)) as "G ХОВ ХВО II за смену, т/см [H02_VA22F001_S1]",
	CAST(sum(isnull(H02_VB12F001_S1,0)) as decimal(15,2)) as "G сыр.воды на осв-ль №1 за смену, т/см [H02_VB12F001_S1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  H02_VA22F001_S1, H02_VB12F001_S1,
	H01_KB21F001_S1, H01_KC21F001_S1,H01_KB21F001_H1, H02_VB11F001_H1, H01_KC21F001_H1, CLC_ShiftDuty, H01_VA21F001_H1, H02_KB11F001_H1, H01_KC22F001_H1 FROM Runtime.dbo.AnalogWideHistory  
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
/*ReportName="Химводоочистка" (агрегированные по сменам за месяц)*/
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
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]",
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(isnull(H01_KB21F001_H1,0)) as decimal(15,2)) as "G загр. конд. из КТЦ сум, т/см [H01_KB21F001_H1]",
	CAST(sum(isnull(H01_KC21F001_H1,0)) as decimal(15,2)) as "G очищ. конд. в КТЦ сум, т/см [H01_KC21F001_H1]",
	CAST(sum(isnull(H01_VA21F001_H1,0)) as decimal(15,2)) as "G ХОВ сум, т/см [H01_VA21F001_H1]",
	CAST(sum(isnull(H02_KB11F001_H1,0)) as decimal(15,2)) as "G загр. конд. до ф-ров КО сум, т/см [H02_KB11F001_H1]",
	CAST(sum(isnull(H01_KC22F001_H1,0)) as decimal(15,2)) as "G очищ. конд.после ф-ров КО сум, т/см [H01_KC22F001_H1]",
	CAST(sum(isnull(H02_VB11F001_H1,0)) as decimal(15,2)) as "G сыр.воды на осв-ль №2,сум т/см [H02_VB11F001_H1]",
	CAST(sum(isnull(H02_VA22F001_H1,0)) as decimal(15,2)) as "G ХОВ ХВО II сум, т/см [H02_VA22F001_H1]",
	CAST(sum(isnull(H02_VB12F001_H1,0)) as decimal(15,2)) as "G сыр.воды на осв-ль №1 сум, т/см [H02_VB12F001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,  H02_VA22F001_H1, H02_VB12F001_H1, H01_KB21F001_H1, H01_KC21F001_H1, H02_VB11F001_H1, CLC_ShiftDuty, H01_VA21F001_H1, H02_KB11F001_H1, H01_KC22F001_H1 FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))