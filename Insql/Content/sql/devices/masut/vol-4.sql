{минутные срезы}
/*ReportName=Базисная мазутная емкость №4 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M4_T1) as decimal(6,1)) as "T°С низ [M4_T1]",
	CAST(dbo.vst_nfloat(M4_T2) as decimal(6,1)) as "T°С с-на [M4_T2]",
	CAST(dbo.vst_nfloat(M4_T3) as decimal(6,1)) as "T°С верх [M4_T3]",
	CAST(dbo.vst_nfloat(M4_T4) as decimal(6,1)) as "T°С нар [M4_T4]",
	CAST(dbo.vst_nfloat(M4_H0) as decimal(6,2)) as "Высота М/О, м [M4_H0]",
	CAST(dbo.vst_nfloat(M4_HeightCalc)-dbo.vst_nfloat(M4_H0) as decimal(6,2)) as "Высота Р/О, м [M4_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M4_HeightCalc) as decimal(6,2)) as "Высота всего, м [M4_HeightCalc]",
	CAST(dbo.vst_nfloat(M04_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M04_AF00Q101]",
	CAST(dbo.vst_nfloat(M4_TotalV)-dbo.vst_nfloat(M04_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M4_TotalV-M04_AF00Q101]",
	CAST(dbo.vst_nfloat(M4_TotalV) as decimal(6,2)) as "Объем всего, м3 [M4_TotalV]",
	CAST(dbo.vst_nfloat(M4_M0) as decimal(6)) as "Масса М/О, т [M4_M0]",
	CAST(dbo.vst_nfloat(M4_Massa) as decimal(6)) as "Масса Р/О, т [M4_Massa]",
	CAST(dbo.vst_nfloat(M4_TotalM) as decimal(6)) as "Общая масса, т [M4_TotalM]",
	CAST(dbo.vst_nfloat(M04_AF00M101) as decimal(6,2)) as "Влажность, % [M04_AF00M101]",
	CAST(dbo.vst_nfloat(M04_AF03F701) as decimal(8,2)) as "Общая масса сухого мазута, тонн [M04_AF03F701]",
	CAST(dbo.vst_nfloat(M04_AF00F101) as decimal(6,2)) as "Расход мазута емк N4, тонн [M04_AF00F101]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M4_T1, M4_T2, M4_T3, M4_T4, M4_H0, M4_HeightCalc, M04_AF00Q101, M4_TotalV, M4_M0, M4_Massa, M4_TotalM, M04_AF00M101, M04_AF03F701, M04_AF00F101
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Базисная мазутная емкость №4 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M4_T1) as decimal(6,1)) as "T°С низ [M4_T1]",
	CAST(dbo.vst_nfloat(M4_T2) as decimal(6,1)) as "T°С с-на [M4_T2]",
	CAST(dbo.vst_nfloat(M4_T3) as decimal(6,1)) as "T°С верх [M4_T3]",
	CAST(dbo.vst_nfloat(M4_T4) as decimal(6,1)) as "T°С нар [M4_T4]",
	CAST(dbo.vst_nfloat(M4_H0) as decimal(6,2)) as "Высота М/О, м [M4_H0]",
	CAST(dbo.vst_nfloat(M4_HeightCalc)-dbo.vst_nfloat(M4_H0) as decimal(6,2)) as "Высота Р/О, м [M4_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M4_HeightCalc) as decimal(6,2)) as "Высота всего, м [M4_HeightCalc]",
	CAST(dbo.vst_nfloat(M04_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M04_AF00Q101]",
	CAST(dbo.vst_nfloat(M4_TotalV)-dbo.vst_nfloat(M04_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M4_TotalV-M04_AF00Q101]",
	CAST(dbo.vst_nfloat(M4_TotalV) as decimal(6,2)) as "Объем всего, м3 [M4_TotalV]",
	CAST(dbo.vst_nfloat(M4_M0) as decimal(6)) as "Масса М/О, т [M4_M0]",
	CAST(dbo.vst_nfloat(M4_Massa) as decimal(6)) as "Масса Р/О, т [M4_Massa]",
	CAST(dbo.vst_nfloat(M4_TotalM) as decimal(6)) as "Общая масса, т [M4_TotalM]",
	CAST(dbo.vst_nfloat(M04_AF00M101) as decimal(6,2)) as "Влажность, % [M04_AF00M101]",
	CAST(dbo.vst_nfloat(M04_AF03F701) as decimal(8,2)) as "Общая масса сухого мазута, тонн [M04_AF03F701]",
	CAST(dbo.vst_nfloat(M04_AF00F101_H0) as decimal(6,2)) as "Расход мазута емк N4 час, тонн [M04_AF00F101_H0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M4_T1, M4_T2, M4_T3, M4_T4, M4_H0, M4_HeightCalc, M04_AF00Q101, M4_TotalV, M4_M0, M4_Massa, M4_TotalM, M04_AF00M101, M04_AF03F701, M04_AF00F101_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Базисная мазутная емкость №4 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(dbo.vst_nfloat(M4_T1) as decimal(6,1)) as "T°С низ [M4_T1]",
	CAST(dbo.vst_nfloat(M4_T2) as decimal(6,1)) as "T°С с-на [M4_T2]",
	CAST(dbo.vst_nfloat(M4_T3) as decimal(6,1)) as "T°С верх [M4_T3]",
	CAST(dbo.vst_nfloat(M4_T4) as decimal(6,1)) as "T°С нар [M4_T4]",
	CAST(dbo.vst_nfloat(M4_H0) as decimal(6,2)) as "Высота М/О, м [M4_H0]",
	CAST(dbo.vst_nfloat(M4_HeightCalc)-dbo.vst_nfloat(M4_H0) as decimal(6,2)) as "Высота Р/О, м [M4_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M4_HeightCalc) as decimal(6,2)) as "Высота всего, м [M4_HeightCalc]",
	CAST(dbo.vst_nfloat(M04_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M04_AF00Q101]",
	CAST(dbo.vst_nfloat(M4_TotalV)-dbo.vst_nfloat(M04_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M4_TotalV-M04_AF00Q101]",
	CAST(dbo.vst_nfloat(M4_TotalV) as decimal(6,2)) as "Объем всего, м3 [M4_TotalV]",
	CAST(dbo.vst_nfloat(M4_M0) as decimal(6)) as "Масса М/О, т [M4_M0]",
	CAST(dbo.vst_nfloat(M4_Massa) as decimal(6)) as "Масса Р/О, т [M4_Massa]",
	CAST(dbo.vst_nfloat(M4_TotalM) as decimal(6)) as "Общая масса, т [M4_TotalM]",
	CAST(dbo.vst_nfloat(M04_AF00M101) as decimal(6,2)) as "Влажность, % [M04_AF00M101]",
	CAST(dbo.vst_nfloat(M04_AF03F701) as decimal(8,2)) as "Общая масса сухого мазута, тонн [M04_AF03F701]",
	CAST(dbo.vst_nfloat(M04_AF00F101_S0) as decimal(6,2)) as "Расход мазута емк N4 сут, тонн [M04_AF00F101_S0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M4_T1, M4_T2, M4_T3, M4_T4, M4_H0, M4_HeightCalc, M04_AF00Q101, M4_TotalV, M4_M0, M4_Massa, M4_TotalM, M04_AF00M101, M04_AF03F701, M04_AF00F101_S0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")