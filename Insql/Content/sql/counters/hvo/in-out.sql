{минутные срезы}
/*ReportName="Речная, Сбросная вода" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U03_VR11F001*U03_SY00A700 as decimal(15,2)) as "G реч.воды л.№1нов,м3/ч [U03_VR11F001]",
	CAST(H03_VR11F001*H03_SY00A700 as decimal(15,2)) as "G реч.воды л.№2, т/ч [H03_VR11F001]",
	CAST(H03_VR12F001*H03_SY00A700 as decimal(15,2)) as "G реч.воды л.№3, т/ч [H03_VR12F001]",
	CAST(u03_VR11F001+H03_VR11F001+H03_VR12F001 as decimal(15,2)) as "G реч.воды сумм ,т/ч [Сумма речной воды Л1+Л2+Л3]",
	CAST(H01_VS21F001*H03_SY00A700 as decimal(15,2)) as "Q сброс вод, м3/ч [H01_VS21F001]",
	CAST(H01_VS21T001*H03_SY00A700 as decimal(15,2)) as "Т сброс вод, °С [H01_VS21T001]",
	CAST(H03_VR11P001*H03_SY00A700 as decimal(15,2)) as "Давление речводы линия2, °С [H03_VR11P001]",
	CAST(H03_VR12P001*H03_SY00A700 as decimal(15,2)) as "Давление речводы линия3, °С [H03_VR12P001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001, H03_SY00A700, H03_VR12F001, H03_VG11F001, H01_VS21F001, H01_VS21T001, U03_VR11F001, U03_SY00A700, H03_VR11P001, H03_VR12P001
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Речная, Сбросная вода" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U03_VR11F001_H1 as decimal(15,2)) as "G реч.воды л.№1нов, м3/ч [U03_VR11F001_H1]",
	CAST(H03_VR11F001_H1 as decimal(15,2)) as "G реч.воды л.№2 за п/ч, т/ч [H03_VR11F001_H1]",
	CAST(H03_VR12F001_H1 as decimal(15,2)) as "G реч.воды л.№3 за п/ч, т/ч [H03_VR12F001_H1]",
	CAST(u03_VR11F001_H1+H03_VR11F001_H1+H03_VR12F001_H1 as decimal(15,2)) as "G реч.воды сумм ,т/ч [Сумма речной воды Л1+Л2+Л3]",
	CAST(H01_VS21F001_H1 as decimal(15,2)) as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_H1]",
	CAST(H01_VS21T001_H1 as decimal(15,2)) as "Т сброс вод за п/ч, °С [H01_VS21T001_H1]",
	CAST(H03_VR11P001_H1 as decimal(15,2)) as "Давление речводы линия2 за п/ч, °С [H03_VR11P001_H1]",
	CAST(H03_VR12P001_H1 as decimal(15,2)) as "Давление речводы линия3 за п/ч, °С [H03_VR12P001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, H03_VR12F001_H1, H03_VG11F001_H1, U03_VR11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1, U03_VR11F001_h1, H03_VR11P001_H1, H03_VR12P001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Речная, Сбросная вода" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null, 
	CAST(U03_VR11F001_S1 as decimal(15,2)) as "G реч.воды л.№1нов,м3/ч [U03_VR11F001_S1]",
	CAST(H03_VR11F001_S1 as decimal(15,2)) as "G реч.воды л. №2 за п/с, т/сут [H03_VR11F001_S1]",
	CAST(H03_VR12F001_S1 as decimal(15,2)) as "G реч.воды л. №3 за п/с, т/сут [H03_VR12F001_S1]",
	CAST(u03_VR11F001_S1+H03_VR11F001_S1+H03_VR12F001_S1 as decimal(15,2)) as "G реч.воды сумм ,т/ч [Сумма речной воды Л1+Л2+Л3]",
	CAST(H01_VS21F001_S1 as decimal(9,2)) as "Q сброс вод за п/с, м3/сут [H01_VS21F001_S1]",
	CAST(H01_VS21T001_S1 as decimal(9,2)) as "Т сброс вод за п/с, °С [H01_VS21T001_S1]",
	CAST(H03_VR11P001_S1 as decimal(15,2)) as "Давление речводы линия2 за п/c, °С [H03_VR11P001_S1]",
	CAST(H03_VR12P001_S1 as decimal(15,2)) as "Давление речводы линия3 за п/c, °С [H03_VR12P001_S1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H03_VR11F001_S1, H03_VR12F001_S1, H03_VG11F001_S1, H01_VS21F001_S1, H01_VS21T001_S1, U03_VR11F001_S1, H03_VR11P001_S1, H03_VR12P001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Речная, Сбросная вода" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0)) as "Cме- на [CLC_ShiftDuty]",
	CAST(isnull(U03_VR11F001_H1,0) as decimal(15,2)) as "G реч.воды л.№1нов,м3/ч [U03_VR11F001_H1]",
	CAST(isnull(H03_VR11F001_H1,0) as decimal(15,2)) as "G реч.воды л.№2 за п/ч, т/ч [H03_VR11F001_H1]",
	CAST(isnull(H03_VR12F001_H1,0) as decimal(15,2)) as "G реч.воды л.№3 за п/ч, т/ч [H03_VR12F001_H1]",
	CAST(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)+isnull(H03_VR12F001_H1,0) as decimal(15,2)) as "G реч.воды сумм ,т/ч [Сумма речной воды Л1+Л2+Л3]",
	CAST(isnull(H01_VS21F001_H1,0) as decimal(15,2)) as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_H1]",
	CAST(isnull(H01_VS21T001_H1,0) as decimal(15,2)) as "Т сброс вод за п/ч, °С [H01_VS21T001_H1]",
	CAST(isnull(H03_VR11P001_H1,0) as decimal(15,2)) as "Давление речводы линия2 за п/ч, °С [H03_VR11P001_H1]",
	CAST(isnull(H03_VR12P001_H1,0) as decimal(15,2)) as "Давление речводы линия3 за п/ч, °С [H03_VR12P001_H1]"
		
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, CLC_ShiftDuty, H03_VR12F001_H1, H03_VG11F001_H1, U03_VR11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1, 
	H03_VR11P001_H1, H03_VR12P001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Речная, Сбросная вода"(агрегированные часовые данные по сменам)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateTime)*2,0,1)/2)) as 'Дата',  
	null, 
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
	CAST(sum(U03_VR11F001_H1) as decimal(15,2)) as "G реч.воды л.№1нов за смену, м3/см [U03_VR11F001_H1]",
	CAST(sum(H03_VR11F001_H1) as decimal(15,2)) as "G реч.воды л.№2 за смену, т/см [H03_VR11F001_H1]",
	CAST(sum(H03_VR12F001_H1) as decimal(15,2)) as "G реч.воды л.№3 за смену, т/см [H03_VR12F001_H1]",
	CAST(sum(u03_VR11F001_H1+H03_VR11F001_H1+H03_VR12F001_H1) as decimal(15,2)) as "G реч.воды сумм ,т/ч [Сумма речной воды Л1+Л2+Л3]",
	CAST(sum(H01_VS21F001_H1) as decimal(15,2)) as "Q сброс вод за смену, м3/см [H01_VS21F001_H1]",
	CAST(avg(H01_VS21T001_H1) as decimal(15,2)) as "Т сброс вод ср, °С [H01_VS21T001_H1]",
	CAST(avg(H03_VR11P001_H1) as decimal(15,2)) as "Давление речводы линия2 ср, °С [H03_VR11P001_H1]",
	CAST(avg(H03_VR12P001_H1) as decimal(15,2)) as "Давление речводы линия3 ср, °С [H03_VR12P001_H1]"
		
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, CLC_ShiftDuty, H03_VR12F001_H1, H03_VG11F001_H1, U03_VR11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1, 
	H03_VR11P001_H1, H03_VR11P001_H1, H03_VR12P001_H1
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
/*ReportName="Речная, Сбросная вода" (агрегированные по сменам за месяц)*/
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
	CAST(sum(U03_VR11F001_H1) as decimal(15,2)) as "G реч.воды л.№1нов за смену, м3/см [U03_VR11F001_H1]",
	CAST(sum(H03_VR11F001_H1) as decimal(15,2)) as "G реч.воды л.№2 сум, т/см [H03_VR11F001_H1]",
	CAST(sum(H03_VR12F001_H1) as decimal(15,2)) as "G реч.воды л.№3 сум, т/см [H03_VR12F001_H1]",
	CAST(sum(u03_VR11F001_H1+H03_VR11F001_H1+H03_VR12F001_H1) as decimal(15,2)) as "G реч.воды сумм ,т/ч [Сумма речной воды Л1+Л2+Л3]",
	CAST(sum(H01_VS21F001_H1) as decimal(15,2)) as "Q сброс вод сум, м3/см [H01_VS21F001_H1]",
	CAST(avg(H01_VS21T001_H1) as decimal(15,2)) as "Т сброс вод ср, °С [H01_VS21T001_H1]",
	CAST(avg(H03_VR11P001_H1) as decimal(15,2)) as "Давление речводы линия2 ср, °С [H03_VR11P001_H1]",
	CAST(avg(H03_VR12P001_H1) as decimal(15,2)) as "Давление речводы линия3 ср, °С [H03_VR12P001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H03_VR11F001_H1, CLC_ShiftDuty, H03_VR12F001_H1, U03_VR11F001_H1, H03_VG11F001_H1, H01_VS21F001_H1, H01_VS21T001_H1,
	H03_VR11P001_H1, H03_VR12P001_H1
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