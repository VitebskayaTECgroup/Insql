{ПОМИНУТНЫЙ}
/*ReportName=ТС "Подпитка ТС" (минутные)*/
/*ReportRefresh=dd.MM.yyyy HH:mm:05.000*/
/*StartDate=dd.MM.yyyy HH:01:00.000*/
/*DeltaDate=00.00.0000 00:59:00.000*/
/*Step=00.00.0000 01:00:00.000*/
/*Resolution=60000*/
/*UpQuery="ПОЧАСОВОЙ"*/


SET QUOTED_IDENTIFIER OFF
SELECT DateTime as Дата, 
null,
CAST(U04_UM41F001*U04_SY00A700 as decimal(15,0))as "G Подп.ТС, т/ч [U04_UM41F001]",
CAST(U04_UM41P001*U04_SY00A700 as decimal(15,2))as "P Подп.ТС, изб.МПа [U04_UM41P001]",
CAST(U04_UM41T001*U04_SY00A700 as decimal(15,2))as "T Подп.ТС, °С [U04_UM41T001]",
CAST(U04_VB00T001*U04_SY00A700 as decimal(15,2))as "Тхв, °С [U04_VB00T001]"

FROM OpenQuery(INSQL, 
"SELECT DateTime, U04_VB00T001, U04_SY00A700, U04_UM41P001, U04_UM41T001, U04_UM41F001  FROM Runtime.dbo.AnalogWideHistory  
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
")


{ПОЧАСОВОЙ}
/*ReportName=ТС "Подпитка ТС" (часовые)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=dd.MM.yyyy 01:05:00.000*/   
/*DeltaDate=00.00.0000 23:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="ПОМИНУТНЫЙ"*/
/*UpQuery="ПОСУТОЧНЫЙ"*/


SET QUOTED_IDENTIFIER OFF
SELECT 	
DateAdd(mi,-5,DateTime) as Дата, 	
null,
CAST(U04_UM41F001_H1 as decimal(15,0))as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
CAST(U04_UM41P001_H1 as decimal(15,2))as "P Подп.ТС за п/ч, абс.МПа [U04_UM41P001_H1]",
CAST(U04_UM41T001_H1 as decimal(15,2))as "T Подп.ТС за п/ч, °С [U04_UM41T001_H1]",
CAST(U04_UM41W001_H1 as decimal(15,0))as "W Подп.ТС за п/ч, ГДж [U04_UM41W001_H1]",
CAST(U04_UM32W001_H1 as decimal(15,0))as "dW по МАГ.за п/ч, ГДж [U04_UM32W001_H1]",
CAST(U04_VB00T001*U04_SY00A700 as decimal(15,2))as "Тхв мгн, °С [Мгновенный срез Т источника на конец часа]"
FROM OpenQuery(INSQL, 
"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1,  U04_UM41F001_H1,  U04_UM41W001_H1, U04_VB00T001, U04_SY00A700, U04_UM32W001_H1 FROM Runtime.dbo.AnalogWideHistory  
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
")

{ПОСУТОЧНЫЙ}
/*ReportName=ТС "Подпитка ТС" (суточные)*/
/*Mode=суточные-1*/
/*DownQuery="ПОЧАСОВОЙ"*/
/*UpQuery="СМЕНЫ ЗА МЕСЯЦ"*/


SET QUOTED_IDENTIFIER OFF
SELECT
DateAdd(mi,-1445,DateTime) as Дата,
null,
CAST(U04_UM41F001_S1 as decimal(9,0))as "G Подп.ТС за п/с, т/сут [U04_UM41F001_S1]",
CAST(U04_UM41P001_S1 as decimal(9,2))as "P Потп.ТС за п/с, абс.МПа [U04_UM41P001_S1]",
CAST(U04_UM41T001_S1 as decimal(9,2))as "T Потп.ТС за п/с, °С [U04_UM41T001_S1]",
CAST(U04_UM41W001_S1 as decimal(9,0))as "W Подп.ТС за п/с, ГДж [U04_UM41W001_S1 ]",
CAST(U04_UM32W001_S1 as decimal(9,0))as "dW по МАГ за п/с, ГДж [U04_UM32W001_S1]",
CAST(U04_VB01T001_S1 as decimal(9,2))as "Tхв за п/с, °С [U04_VB01T001_S1]"
FROM OpenQuery(INSQL, 
"SELECT DateTime, U04_VB01T001_S1, U04_UM41T001_S1, U04_UM41P001_S1, U04_UM41F001_S1, U04_UM41W001_S1, U04_UM32W001_S1  FROM Runtime.dbo.AnalogWideHistory  
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
")


{ПОЧАСОВОЙ 8/12}
/*ReportName=ТС "Подпитка ТС" (за смену 8/12)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=dd.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.00.0000 11:00:00.000*/
/*Step=00.00.0000 12:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="ПОМИНУТНЫЙ"*/
/*UpQuery="ПОСМЕННЫЙ"*/


SET QUOTED_IDENTIFIER OFF
Select 	
DateAdd(mi,-5,DateTime) as Дата, 	
null,
CHAR(192+CLC_ShiftDuty) as "Cме- на [CLC_ShiftDuty]",
CAST(U04_UM41F001_H1 as decimal(15,0))as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
CAST(U04_UM41P001_H1 as decimal(15,2))as "P Подп.ТС за п/ч, абс.МПа [U04_UM41P001_H1]",
CAST(U04_UM41T001_H1 as decimal(15,2))as "T Подп.ТС за п/ч, °С [U04_UM41T001_H1]",
CAST(U04_UM41W001_H1 as decimal(15,0))as "W Подп.ТС за п/ч, ГДж [U04_UM41W001_H1]",
CAST(U04_UM32W001_H1 as decimal(15,0))as "dW по МАГ.за п/ч, ГДж [U04_UM32W001_H1]"
FROM OpenQuery(INSQL, 
"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1,  U04_UM41F001_H1,  U04_UM41W001_H1, CLC_ShiftDuty, U04_UM32W001_H1 FROM Runtime.dbo.AnalogWideHistory  
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
")



{ПОСМЕННЫЙ}
/*ReportName=ТС "Подпитка ТС"(Посменно)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="ПОЧАСОВОЙ 8/12"*/
/*UpQuery="СМЕНЫ ЗА МЕСЯЦ"*/


SET QUOTED_IDENTIFIER OFF
select DateAdd(hh,20,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,Max(DateTime)))*2,0,1)/2)) as 'DateMarker', 
DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',  
null, 
CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
CAST(sum(U04_UM41F001_H1) as decimal(15,0))as "G Подп.ТС за смену, т/см [U04_UM41F001_H1]",
CAST(avg(U04_UM41P001_H1) as decimal(15,2))as "P Подп.ТС ср, абс.МПа [U04_UM41P001_H1]",
CAST(avg(U04_UM41T001_H1) as decimal(15,2))as "T Подп.ТС ср, °С [U04_UM41T001_H1]",
CAST(Sum(U04_UM41W001_H1) as decimal(15,0))as "W Подп.ТС за смену, ГДж [U04_UM41W001_H1]",
CAST(sum(U04_UM32W001_H1) as decimal(15,0))as "dW по МАГ.за смену, ГДж [U04_UM32W001_H1]"
FROM OpenQuery(INSQL, 
"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1,  U04_UM41F001_H1,  U04_UM41W001_H1, CLC_ShiftDuty, U04_UM32W001_H1 FROM Runtime.dbo.AnalogWideHistory  
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
")
Group BY DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))	
Order By DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))	



{СМЕНЫ ЗА МЕСЯЦ}
/*ReportName=ТС "Подпитка ТС" (СУММА СМЕН ЗА МЕСЯЦ)*/
/*ReportRefresh=dd.MM.yyyy HH:05:00.000*/
/*StartDate=01.MM.yyyy 09:05:00.000*/	
/*DeltaDate=00.01.0000 11:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=3600000*/
/*DownQuery="ПОСМЕННЫЙ"*/
/*UpQuery="ПОСУТОЧНЫЙ"*/


SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT 
'02'+Right(Convert(char(10),MIN(DateTime),104),8)  as 'DateMarker',
DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
null,
CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]", 
Count(*) as "Час [Время, отработанное сменой за месяц, час]",
CAST(sum(U04_UM41F001_H1) as decimal(15,0))as "G Подп.ТС сум, т/см [U04_UM41F001_H1]",
CAST(avg(U04_UM41P001_H1) as decimal(15,2))as "P Подп.ТС ср, абс.МПа [U04_UM41P001_H1]",
CAST(avg(U04_UM41T001_H1) as decimal(15,2))as "T Подп.ТС ср, °С [U04_UM41T001_H1]",
CAST(Sum(U04_UM41W001_H1) as decimal(15,0))as "W Подп.ТС сум, ГДж [U04_UM41W001_H1]",
CAST(sum(U04_UM32W001_H1) as decimal(15,0))as "dW по МАГ.сум, ГДж [U04_UM32W001_H1]"
FROM OpenQuery(INSQL, 
"SELECT DateTime, U04_UM41T001_H1, U04_UM41P001_H1,  U04_UM41F001_H1,  U04_UM41W001_H1, CLC_ShiftDuty, U04_UM32W001_H1 FROM Runtime.dbo.AnalogWideHistory   
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
")
Group BY CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) 
ORDER BY CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) 