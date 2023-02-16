{минутные срезы}
/*ReportName=Базисная мазутная емкость №1 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M1_T1) as decimal(6,1)) as "T°С низ [M1_T1]",
	CAST(dbo.vst_nfloat(M1_T2) as decimal(6,1)) as "T°С с-на [M1_T2]",
	CAST(dbo.vst_nfloat(M1_T3) as decimal(6,1)) as "T°С верх [M1_T3]",
	CAST(dbo.vst_nfloat(M1_T4) as decimal(6,1)) as "T°С нар [M1_T4]",
	CAST(dbo.vst_nfloat(M1_H0) as decimal(6,2)) as "Высота М/О, м [M1_H0]",
	CAST(dbo.vst_nfloat(M1_HeightCalc)-dbo.vst_nfloat(M1_H0) as decimal(6,2)) as "Высота Р/О, м [hint:M1_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M1_HeightCalc) as decimal(6,2)) as "Высота всего, м [M1_HeightCalc]",
	CAST(dbo.vst_nfloat(M01_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M01_AF00Q101]",
	CAST(dbo.vst_nfloat(M1_TotalV)-dbo.vst_nfloat(M01_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [hint:M1_TotalV-M01_AF00Q101]",
	CAST(dbo.vst_nfloat(M1_TotalV) as decimal(6,2)) as "Объем всего, м3 [M1_TotalV]",
	CAST(dbo.vst_nfloat(M1_M0) as decimal(6)) as "Масса М/О, т [M1_M0]",
	CAST(dbo.vst_nfloat(M1_Massa) as decimal(6)) as "Масса Р/О, т [M1_Massa]",
	CAST(dbo.vst_nfloat(M1_TotalM) as decimal(6)) as "Общая масса, т [M1_TotalM]",
	CAST(dbo.vst_nfloat(M01_AF00M101) as decimal(6,2)) as "Влажность, % [M01_AF00M101]",
	CAST(dbo.vst_nfloat(M01_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M01_AF03F701]",
	CAST(dbo.vst_nfloat(M01_AF00F101) as decimal(6,2)) as "Расход мазута емк N1 [M01_AF00F101]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_T1, M1_T2, M1_T3, M1_T4, M1_H0, M1_HeightCalc, M01_AF00Q101, M1_TotalV, M1_M0, M1_Massa, M1_TotalM, M01_AF00M101, M01_AF03F701, M01_AF00F101
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Базисная мазутная емкость №1 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M1_T1) as decimal(6,1)) as "T°С низ [M1_T1]",
	CAST(dbo.vst_nfloat(M1_T2) as decimal(6,1)) as "T°С с-на [M1_T2]",
	CAST(dbo.vst_nfloat(M1_T3) as decimal(6,1)) as "T°С верх [M1_T3]",
	CAST(dbo.vst_nfloat(M1_T4) as decimal(6,1)) as "T°С нар [M1_T4]",
	CAST(dbo.vst_nfloat(M1_H0) as decimal(6,2)) as "Высота М/О, м [M1_H0]",
	CAST(dbo.vst_nfloat(M1_HeightCalc)-dbo.vst_nfloat(M1_H0) as decimal(6,2)) as "Высота Р/О, м [hint:M1_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M1_HeightCalc) as decimal(6,2)) as "Высота всего, м [M1_HeightCalc]",
	CAST(dbo.vst_nfloat(M01_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M01_AF00Q101]",
	CAST(dbo.vst_nfloat(M1_TotalV)-dbo.vst_nfloat(M01_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [hint:M1_TotalV-M01_AF00Q101]",
	CAST(dbo.vst_nfloat(M1_TotalV) as decimal(6,2)) as "Объем всего, м3 [M1_TotalV]",
	CAST(dbo.vst_nfloat(M1_M0) as decimal(6)) as "Масса М/О, т [M1_M0]",
	CAST(dbo.vst_nfloat(M1_Massa) as decimal(6)) as "Масса Р/О, т [M1_Massa]",
	CAST(dbo.vst_nfloat(M1_TotalM) as decimal(6)) as "Общая масса, т [M1_TotalM]",
	CAST(dbo.vst_nfloat(M01_AF00M101) as decimal(6,2)) as "Влажность, % [M01_AF00M101]",
	CAST(dbo.vst_nfloat(M01_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M01_AF03F701]",
	CAST(dbo.vst_nfloat(M01_AF00F101_H0) as decimal(6,2)) as "Расход мазута емк N1 час [M01_AF00F101_H0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_T1, M1_T2, M1_T3, M1_T4, M1_H0, M1_HeightCalc, M01_AF00Q101, M1_TotalV, M1_M0, M1_Massa, M1_TotalM, M01_AF00M101, M01_AF03F701, M01_AF00F101_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Базисная мазутная емкость №1 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(dbo.vst_nfloat(M1_T1) as decimal(6,1)) as "T°С низ [M1_T1]",
	CAST(dbo.vst_nfloat(M1_T2) as decimal(6,1)) as "T°С с-на [M1_T2]",
	CAST(dbo.vst_nfloat(M1_T3) as decimal(6,1)) as "T°С верх [M1_T3]",
	CAST(dbo.vst_nfloat(M1_T4) as decimal(6,1)) as "T°С нар [M1_T4]",
	CAST(dbo.vst_nfloat(M1_H0) as decimal(6,2)) as "Высота М/О, м [M1_H0]",
	CAST(dbo.vst_nfloat(M1_HeightCalc)-dbo.vst_nfloat(M1_H0) as decimal(6,2)) as "Высота Р/О, м [hint:M1_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M1_HeightCalc) as decimal(6,2)) as "Высота всего, м [M1_HeightCalc]",
	CAST(dbo.vst_nfloat(M01_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M01_AF00Q101]",
	CAST(dbo.vst_nfloat(M1_TotalV)-dbo.vst_nfloat(M01_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [hint:M1_TotalV-M01_AF00Q101]",
	CAST(dbo.vst_nfloat(M1_TotalV) as decimal(6,2)) as "Объем всего, м3 [M1_TotalV]",
	CAST(dbo.vst_nfloat(M1_M0) as decimal(6)) as "Масса М/О, т [M1_M0]",
	CAST(dbo.vst_nfloat(M1_Massa) as decimal(6)) as "Масса Р/О, т [M1_Massa]",
	CAST(dbo.vst_nfloat(M1_TotalM) as decimal(6)) as "Общая масса, т [M1_TotalM]",
	CAST(dbo.vst_nfloat(M01_AF00M101) as decimal(6,2)) as "Влажность, % [M01_AF00M101]",
	CAST(dbo.vst_nfloat(M01_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M01_AF03F701]",
	CAST(dbo.vst_nfloat(M01_AF00F101_S0) as decimal(6,2)) as "Расход мазута емк N1 сут [M01_AF00F101_S0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_T1, M1_T2, M1_T3, M1_T4, M1_H0, M1_HeightCalc, M01_AF00Q101, M1_TotalV, M1_M0, M1_Massa, M1_TotalM, M01_AF00M101, M01_AF03F701, M01_AF00F101_S0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")