{минутные срезы}
/*ReportName="ГАЗ по ГРП" (минутные срезы со счетчика)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(isnull(G01_AM31Q001,0) as decimal(25,3)) as "Qпр.к НУ по ОЛ, м3/ч [G01_AM31Q001]",
	CAST(isnull(G01_AM11P001,0) as decimal(25,3)) as "P ОЛ, абс.МПа [G01_AM11P001]",
	CAST(isnull(G01_AM11T001,0) as decimal(25,3)) as "T ОЛ, °С [G01_AM11T001]",

	CAST(isnull(G01_AM32Q001,0) as decimal(25,3)) as "Qпр.к НУ по ЛМР, м3/ч [G01_AM32Q001]",
	CAST(isnull(G01_AM12P001,0) as decimal(25,3)) as "P ЛМР, абс.МПа [G01_AM12P001]",
	CAST(isnull(G01_AM12T001,0) as decimal(25,3)) as "T ЛМР, °С [G01_AM12T001]",
	CAST(
	(
		(
			isnull(G01_AM31Q001, 0) 
			+ isnull(G01_AM32Q001, 0)
		)
		- 
		(
			(
				dbo.vst_checkDecimal(K1_AI1PV) 
				+ dbo.vst_checkDecimal(K1_AI2PV)
				+ dbo.vst_checkDecimal(K2_AI1PV)
				+ dbo.vst_checkDecimal(K2_AI2PV)
				+ dbo.vst_checkDecimal(K3_AI1PV)
				+ dbo.vst_checkDecimal(K3_AI2PV)
				+ dbo.vst_checkDecimal(K4_AI1PV)
				+ dbo.vst_checkDecimal(K4_AI2PV)
				+ dbo.vst_checkDecimal(K5_AI1PV)
				+ dbo.vst_checkDecimal(K5_AI2PV)
			) 
			/ 1000
		)
	) as decimal(25, 3)) as "Дельта [hint: Разница между показаниями расхода газа и суммой показаний расхода газа по котлам]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, G01_AM11P001, G01_SY00A700, G01_AM12P001, G01_AM11T001, G01_AM12T001, G01_AM31Q001,
	G01_AM32Q001, K1_AI1PV, K1_AI2PV, K2_AI1PV, K2_AI2PV, K3_AI1PV, K3_AI2PV, K4_AI1PV, K4_AI2PV, K5_AI1PV, K5_AI2PV
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="ГАЗ по ГРП" (часовые - со счетчика)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM31Q701_H1,0)/1000 as decimal(25,3)) as "Q по потр. за п/ч,  тыс. м3/ч [G01_AM31Q701_H1]",
	CAST(isnull(G01_AM11P001_H1,0) as decimal(25,3)) as "P ОЛ за п/ч, абс.МПа [G01_AM11P001_H1]",
	CAST(isnull(G01_AM11T001_H1,0) as decimal(25,3)) as "T ОЛ за п/ч, °С [G01_AM11T001_H1]",
	CAST(isnull(G01_AM12P001_H1,0) as decimal(25,3)) as "P ЛМР за п/ч, абс.МПа [G01_AM12P001_H1]",
	CAST(isnull(G01_AM12T001_H1,0) as decimal(25,3)) as "T ЛМР за п/ч, °С [G01_AM12T001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, G01_AM11P001_H1, G01_AM12P001_H1, G01_AM11T001_H1, G01_AM12T001_H1, G01_AM31Q701_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="ГАЗ по ГРП" (суточные со счетчика)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(isnull(G01_AM11Q001_S1,0) as decimal(25,3)) as "Q ОЛ за п/с, тыс.м3/сут [G01_AM11Q001_S1]",
	CAST(isnull(G01_AM11P001_S1,0) as decimal(25,3)) as "P ОЛ за п/с, абс.МПа [G01_AM11P001_S1]",
	CAST(isnull(G01_AM11T001_S1,0) as decimal(25,3)) as "T ОЛ за п/с, °С [G01_AM11T001_S1]",
	CAST(isnull(G01_AM12Q001_S1,0) as decimal(25,3)) as "Q ЛМР за п/с, тыс.м3/сут [G01_AM12Q001_S1]",
	CAST(isnull(G01_AM12P001_S1,0) as decimal(25,3)) as "P ЛМР за п/с, абс.МПа [G01_AM12P001_S1]",
	CAST(isnull(G01_AM12T001_S1,0) as decimal(25,3)) as "T ЛМР за п/с, °С [G01_AM12T001_S1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, G01_AM11Q001_S1, G01_AM12Q001_S1, G01_AM11T001_S1, G01_AM12T001_S1, G01_AM11P001_S1, G01_AM12P001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="ГАЗ по ГРП" (за смену 8/12 - со счетчика)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -65, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0)) as "Cмена [CLC_ShiftDuty]",
	CAST(isnull(G01_AM31Q701_H1,0)/1000 as decimal(25,3)) as "Q по потр. за п/ч,  тыс. м3/ч [G01_AM31Q701_H1]",
	CAST(isnull(G01_AM11P001_H1,0) as decimal(25,3)) as "P ОЛ за п/ч, абс.МПа [G01_AM11P001_H1]",
	CAST(isnull(G01_AM11T001_H1,0) as decimal(25,3)) as "T ОЛ за п/ч, °С [G01_AM11T001_H1]",
	CAST(isnull(G01_AM12P001_H1,0) as decimal(25,3)) as "P ЛМР за п/ч, абс.МПа [G01_AM12P001_H1]",
	CAST(isnull(G01_AM12T001_H1,0) as decimal(25,3)) as "T ЛМР за п/ч, °С [G01_AM12T001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, G01_AM11P001_H1, G01_AM12P001_H1, G01_AM11T001_H1, CLC_ShiftDuty, G01_AM12T001_H1, G01_AM31Q701_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="ГАЗ по ГРП"(агрегированные часовые данные по сменам - расчетный)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh,20,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,Max(DateTime)))*2,0,1)/2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null, 
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
	CAST(sum(isnull(G01_AM31Q701_H1,0))/1000 as decimal(25,3)) as "Q по потр. за смену,  тыс. м3/см [G01_AM31Q701_H1]",
	CAST(avg(isnull(G01_AM11P001_H1,0)) as decimal(25,3)) as "P ОЛ ср, абс.МПа [G01_AM11P001_H1]",
	CAST(avg(isnull(G01_AM11T001_H1,0)) as decimal(25,3)) as "T ОЛ ср, °С [G01_AM11T001_H1]",
	CAST(avg(isnull(G01_AM12P001_H1,0)) as decimal(25,3)) as "P ЛМР ср, абс.МПа [G01_AM12P001_H1]",
	CAST(avg(isnull(G01_AM12T001_H1,0)) as decimal(25,3)) as "T ЛМР ср, °С [G01_AM12T001_H1]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, G01_AM11P001_H1, G01_AM12P001_H1, G01_AM11T001_H1, CLC_ShiftDuty, G01_AM12T001_H1, G01_AM31Q701_H1
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
/*ReportName="ГАЗ по ГРП" (смены за месяц - расчетный)*/
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
	CAST(sum(isnull(G01_AM31Q701_H1,0))/1000 as decimal(25,3)) as "Q по потр. сум, тыс. м3/см [G01_AM31Q701_H1]",
	CAST(avg(isnull(G01_AM11P001_H1,0)) as decimal(25,3)) as "P ОЛ ср, абс.МПа [G01_AM11P001_H1]",
	CAST(avg(isnull(G01_AM11T001_H1,0)) as decimal(25,3)) as "T ОЛ ср, °С [G01_AM11T001_H1]",
	CAST(avg(isnull(G01_AM12P001_H1,0)) as decimal(25,3)) as "P ЛМР ср, абс.МПа [G01_AM12P001_H1]",
	CAST(avg(isnull(G01_AM12T001_H1,0)) as decimal(25,3)) as "T ЛМР ср, °С [G01_AM12T001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, G01_AM11P001_H1, G01_AM12P001_H1, G01_AM11T001_H1, CLC_ShiftDuty, G01_AM12T001_H1, G01_AM31Q701_H1
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