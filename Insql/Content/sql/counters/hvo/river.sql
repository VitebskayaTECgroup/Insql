{минутные срезы}
/*ReportName="Отвод тепла стоков в реку" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(isnull(H01_VS21T001,0)*isnull(U04_SY00A700,0)*isnull(H01_SY00A700,0) as decimal(15,2))
		as "Т сброс вод, °С [H01_VS21T001]",
	CAST(isnull(U04_VB00T001,0)*isnull(U04_SY00A700,0)*isnull(H01_SY00A700,0) as decimal(15,2))
		as "Тхв, °С [U04_VB00T001]",
	CAST(isnull(H01_VS21T001,0)*isnull(U04_SY00A700,0)*isnull(H01_SY00A700,0)-isnull(U04_VB00T001,0)*isnull(U04_SY00A700,0)*isnull(H01_SY00A700,0) as decimal(15,2))
		as "&#916 (Тсв,Тхв)[CHECK:5,4.8,-5,-5][Hint:Дельта (Тсв,Тхв)]",
	CAST(H01_VS21F001*U04_SY00A700*H01_SY00A700 as decimal(15,2))
		as "Q сброс вод, м3/ч [H01_VS21F001]",
	CAST(((H01_VS21T001-U04_VB00T001)*H01_VS21F001*0.001)*U04_SY00A700*H01_SY00A700 as decimal(15,2))
		as "Отвод тепла в реку, ГКал [hint: (H01_VS21T001-U04_VB00T001)*H01_VS21F001*0.001]",
	CAST(((H01_VS21T001-U04_VB00T001)*(isnull(H03_VR11F001*H03_SY00A700,0)+isnull(H03_VR12F001*H03_SY00A700,0)+isnull(u03_VR11F001*U03_SY00A700,0)-0.7*isnull(H01_VA21F001*H01_SY00A700,0)-isnull(U04_UM41F001*u04_SY00A700,0))*0.001) as decimal(15,2))
		as "Отвод тепла в реку(расчетный), ГКал [hint: (Тсбр.в.-Тхв)*Gсбр(расч)*0,001,Гкал/ч.]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VS21T001, U04_VB00T001, H01_VS21F001, U04_SY00A700, H01_SY00A700, H03_VR11F001, H03_SY00A700,H03_VR12F001,H03_SY00A700,u03_VR11F001,U03_SY00A700,H01_VA21F001,H01_SY00A700,U04_UM41F001,u04_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Отвод тепла стоков в реку" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(H01_VS21T001_H1,0) as decimal(15,2))
		as "Т сброс вод за п/ч, °С [H01_VS21T001_H1]",
	CAST(isnull(U04_VB00T001,0) as decimal(15,2))
		as "Тхв, °С [Мгновенный срез Т источника на конец часа]",
	CAST(isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0) as decimal(15,2))
		as "&#916 (Тсв,Тхв)[CHECK:5,4.8,-5,-5][Hint:Дельта (Тсв,Тхв)]",
	CAST(isnull(H01_VS21F001_H1,0) as decimal(15,2))
		as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_H1]",
	CAST((isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0))*isnull(H01_VS21F001_H1,0)*0.001 as decimal(15,2))
		as "Отвод тепла в реку, ГКал [hint: (H01_VS21T001_H1-U04_VB00T001)*H01_VS21F001_H1*0.001]",
	CAST((isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0))*(isnull(H03_VR11F001_H1,0)+isnull(H03_VR12F001_H1,0)+isnull(u03_VR11F001_H1,0)-0.7*isnull(H01_VA21F001_H1,0)-isnull(U04_UM41F001_H1,0))*0.001 as decimal(15,2))
		as "Отвод тепла в реку(расчетный), ГКал [hint: (Тсбр.в.-Тхв)*Gсбр(расч)*0,001,Гкал/ч.]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VS21T001_H1, U04_VB00T001, H01_VS21F001_H1, H03_VR11F001_H1,H03_VR12F001_H1,u03_VR11F001_H1,H01_VA21F001_H1,U04_UM41F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Отвод тепла стоков в реку" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(H01_VS21T001_S1,0) as decimal(15,2))
		as "Т сброс вод за п/с, °С [H01_VS21T001_S1]",
	CAST(isnull(U04_VB01T001_S1,0) as decimal(15,2))
		as "Тхв за п/с, °С [U04_VB00T001]",
	CAST(isnull(H01_VS21T001_S1,0)-isnull(U04_VB01T001_S1,0) as decimal(15,2))
		as "&#916 (Тсв,Тхв)[CHECK:5,4.8,-5,-5][Hint:Дельта (Тсв,Тхв)]",
	CAST(isnull(H01_VS21F001_S1,0) as decimal(15,2))
		as "Q сброс вод за п/с, м3/сут [H01_VS21F001_S1]",
	CAST((isnull(H01_VS21T001_S1,0)-isnull(U04_VB01T001_S1,0))*isnull(H01_VS21F001_S1,0)*0.001 as decimal(15,2))
		as "Отвод тепла в реку, ГКал [hint: (H01_VS21T001_S1-U04_VB00T001_S1)*H01_VS21F001_S1*0.001]",
	CAST((isnull(H01_VS21T001_S1,0)-isnull(U04_VB01T001_S1,0))*(isnull(H03_VR11F001_S1,0)+isnull(H03_VR12F001_S1,0)+isnull(u03_VR11F001_s1,0)-0.7*isnull(H01_VA21F001_S1,0)-isnull(U04_UM41F001_S1,0))*0.001 as decimal(15,2))
		as "Отвод тепла в реку(расчетный), ГКал [hint: (Тсбр.в.-Тхв)*Gсбр(расч)*0,001,Гкал/ч.]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VS21T001_S1, U04_VB01T001_S1, H01_VS21F001_S1, H03_VR11F001_S1,H03_VR12F001_S1,u03_VR11F001_s1,H01_VA21F001_S1,U04_UM41F001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Отвод тепла стоков в реку" (часовые срезы по сменам 8/12)*/
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
	CAST(isnull(H01_VS21T001_H1,0) as decimal(15,2))
		as "Т сброс вод за п/ч, °С [H01_VS21T001_H1]",
	CAST(isnull(U04_VB00T001,0) as decimal(15,2))
		as "Тхв, °С [Мгновенный срез Т источника на конец часа]",
	CAST(isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0) as decimal(15,2))
		as "&#916 (Тсв,Тхв)[CHECK:5,4.8,-5,-5][Hint:Дельта (Тсв,Тхв)]",
	CAST(isnull(H01_VS21F001_H1,0) as decimal(15,2))
		as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_H1]",
	CAST((isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0))*isnull(H01_VS21F001_H1,0)*0.001 as decimal(15,2))
		as "Отвод тепла в реку, ГКал [hint: (H01_VS21T001_H1-U04_VB00T001)*H01_VS21F001_H1*0.001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VS21T001_H1, CLC_ShiftDuty, U04_VB00T001, H01_VS21F001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Отвод тепла стоков в реку"(агрегированные часовые данные по сменам)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))
		as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime)))
		as "Cмена [CLC_ShiftDuty]",
	CAST(avg(isnull(H01_VS21T001_H1,0)) as decimal(15,2))
		as "Т сброс вод за п/см, °С [H01_VS21T001_H1]",
	CAST(avg(isnull(U04_VB00T001,0)) as decimal(15,2))
		as "Тхв средн, °С [Среднее Мгновенныч срезов Т источника на конец часа]",
	CAST(avg(isnull(H01_VS21T001_H1,0))-avg(isnull(U04_VB00T001,0)) as decimal(15,2))
		as "&#916 (Тсв,Тхв)[CHECK:5,4.8,-5,-5][Hint:Дельта (Тсв,Тхв)]",
	CAST(sum(isnull(H01_VS21F001_H1,0)) as decimal(15,2))
		as "Q сброс вод за смену, м3/см [H01_VS21F001_H1]",
	CAST(sum((isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0))*isnull(H01_VS21F001_H1,0)*0.001) as decimal(15,2))
		as "Отвод тепла в реку, ГКал [hint: (H01_VS21T001_H1-U04_VB00T001)*H01_VS21F001_H1*0.001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VS21T001_H1, CLC_ShiftDuty, U04_VB00T001, H01_VS21F001_H1
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
/*ReportName="Отвод тепла стоков в реку" (агрегированные по сменам за месяц)*/
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
		as "Час [Время, отработанное сменой за месяц, час]",
	CAST(avg(isnull(H01_VS21T001_H1,0)) as decimal(15,2))
		as "Т сброс вод средн, °С [H01_VS21T001_H1]",
	CAST(avg(isnull(U04_VB00T001,0)) as decimal(15,2))
		as "Тхв средн, °С [Среднее Мгновенныч срезов Т источника на конец часа]",
	CAST(avg(isnull(H01_VS21T001_H1,0))-avg(isnull(U04_VB00T001,0)) as decimal(15,2))
		as "&#916 (Тсв,Тхв)[CHECK:5,4.8,-5,-5][Hint:Дельта (Тсв,Тхв)]",
	CAST(sum(isnull(H01_VS21F001_H1,0)) as decimal(15,2))
		as "Q сброс вод сум, м3/см [H01_VS21F001_H1]",
	CAST(sum((isnull(H01_VS21T001_H1,0)-isnull(U04_VB00T001,0))*isnull(H01_VS21F001_H1,0)*0.001) as decimal(15,2))
		as "Отвод тепла в реку, сум ГКал [hint: (H01_VS21T001_H1-U04_VB00T001)*H01_VS21F001_H1*0.001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_VS21T001_H1, CLC_ShiftDuty, U04_VB00T001, H01_VS21F001_H1
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