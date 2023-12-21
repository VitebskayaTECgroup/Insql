{минутные срезы}
/*ReportName=Базисная мазутная емкость №2 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M2_T1) as decimal(6,1)) as "T°С низ [M2_T1]",
	CAST(dbo.vst_nfloat(M2_T2) as decimal(6,1)) as "T°С с-на [M2_T2]",
	CAST(dbo.vst_nfloat(M2_T3) as decimal(6,1)) as "T°С верх [M2_T3]",
	CAST(dbo.vst_nfloat(M2_T4) as decimal(6,1)) as "T°С нар [M2_T4]",
	CAST(dbo.vst_nfloat(M2_H0) as decimal(6,2)) as "Высота М/О, м [M2_H0]",
	CAST(dbo.vst_nfloat(M2_HeightCalc)-dbo.vst_nfloat(M2_H0) as decimal(6,2)) as "Высота Р/О, м [M2_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M2_HeightCalc) as decimal(6,2)) as "Высота всего, м [M2_HeightCalc]",
	CAST(dbo.vst_nfloat(M02_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M02_AF00Q101]",
	CAST(dbo.vst_nfloat(M2_TotalV)-dbo.vst_nfloat(M02_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M2_TotalV-M02_AF00Q101]",
	CAST(dbo.vst_nfloat(M2_TotalV) as decimal(6,2)) as "Объем всего, м3 [M2_TotalV]",
	CAST(dbo.vst_nfloat(M2_M0) as decimal(6)) as "Масса М/О, т [M2_M0]",
	CAST(dbo.vst_nfloat(M2_Massa) as decimal(6)) as "Масса Р/О, т [M2_Massa]",
	CAST(dbo.vst_nfloat(M2_TotalM) as decimal(6)) as "Общая масса, т [M2_TotalM]",
	CAST(dbo.vst_nfloat(M02_AF00M101) as decimal(6,2)) as "Влажность, % [M02_AF00M101]",
	CAST(dbo.vst_nfloat(M02_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M02_AF03F701]",
	CAST(dbo.vst_nfloat(M02_AF00F101) as decimal(6,2)) as "Расход мазута емк N2 [M02_AF00F101]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T1, M2_T2, M2_T3, M2_T4, M2_H0, M2_HeightCalc, M02_AF00Q101, M2_TotalV, M2_M0, M2_Massa, M2_TotalM, M02_AF00M101, M02_AF03F701, M02_AF00F101
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Базисная мазутная емкость №2 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M2_T1) as decimal(6,1)) as "T°С низ [M2_T1]",
	CAST(dbo.vst_nfloat(M2_T2) as decimal(6,1)) as "T°С с-на [M2_T2]",
	CAST(dbo.vst_nfloat(M2_T3) as decimal(6,1)) as "T°С верх [M2_T3]",
	CAST(dbo.vst_nfloat(M2_T4) as decimal(6,1)) as "T°С нар [M2_T4]",
	CAST(dbo.vst_nfloat(M2_H0) as decimal(6,2)) as "Высота М/О, м [M2_H0]",
	CAST(dbo.vst_nfloat(M2_HeightCalc)-dbo.vst_nfloat(M2_H0) as decimal(6,2)) as "Высота Р/О, м [M2_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M2_HeightCalc) as decimal(6,2)) as "Высота всего, м [M2_HeightCalc]",
	CAST(dbo.vst_nfloat(M02_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M02_AF00Q101]",
	CAST(dbo.vst_nfloat(M2_TotalV)-dbo.vst_nfloat(M02_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M2_TotalV-M02_AF00Q101]",
	CAST(dbo.vst_nfloat(M2_TotalV) as decimal(6,2)) as "Объем всего, м3 [M2_TotalV]",
	CAST(dbo.vst_nfloat(M2_M0) as decimal(6)) as "Масса М/О, т [M2_M0]",
	CAST(dbo.vst_nfloat(M2_Massa) as decimal(6)) as "Масса Р/О, т [M2_Massa]",
	CAST(dbo.vst_nfloat(M2_TotalM) as decimal(6)) as "Общая масса, т [M2_TotalM]",
	CAST(dbo.vst_nfloat(M02_AF00M101) as decimal(6,2)) as "Влажность, % [M02_AF00M101]",
	CAST(dbo.vst_nfloat(M02_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M02_AF03F701]",
	CAST(dbo.vst_nfloat(M02_AF00F101_H0) as decimal(6,2)) as "Расход мазута емк N2 [M02_AF00F101_H0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T1, M2_T2, M2_T3, M2_T4, M2_H0, M2_HeightCalc, M02_AF00Q101, M2_TotalV, M2_M0, M2_Massa, M2_TotalM, M02_AF00M101, M02_AF03F701, M02_AF00F101_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Базисная мазутная емкость №2 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(dbo.vst_nfloat(M2_T1) as decimal(6,1)) as "T°С низ [M2_T1]",
	CAST(dbo.vst_nfloat(M2_T2) as decimal(6,1)) as "T°С с-на [M2_T2]",
	CAST(dbo.vst_nfloat(M2_T3) as decimal(6,1)) as "T°С верх [M2_T3]",
	CAST(dbo.vst_nfloat(M2_T4) as decimal(6,1)) as "T°С нар [M2_T4]",
	CAST(dbo.vst_nfloat(M2_H0) as decimal(6,2)) as "Высота М/О, м [M2_H0]",
	CAST(dbo.vst_nfloat(M2_HeightCalc)-dbo.vst_nfloat(M2_H0) as decimal(6,2)) as "Высота Р/О, м [M2_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M2_HeightCalc) as decimal(6,2)) as "Высота всего, м [M2_HeightCalc]",
	CAST(dbo.vst_nfloat(M02_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M02_AF00Q101]",
	CAST(dbo.vst_nfloat(M2_TotalV)-dbo.vst_nfloat(M02_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M2_TotalV-M02_AF00Q101]",
	CAST(dbo.vst_nfloat(M2_TotalV) as decimal(6,2)) as "Объем всего, м3 [M2_TotalV]",
	CAST(dbo.vst_nfloat(M2_M0) as decimal(6)) as "Масса М/О, т [M2_M0]",
	CAST(dbo.vst_nfloat(M2_Massa) as decimal(6)) as "Масса Р/О, т [M2_Massa]",
	CAST(dbo.vst_nfloat(M2_TotalM) as decimal(6)) as "Общая масса, т [M2_TotalM]",
	CAST(dbo.vst_nfloat(M02_AF00M101) as decimal(6,2)) as "Влажность, % [M02_AF00M101]",
	CAST(dbo.vst_nfloat(M02_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M02_AF03F701]",
	CAST(dbo.vst_nfloat(M02_AF00F101_S0) as decimal(6,2)) as "Расход мазута емк N2 [M02_AF00F101_S0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T1, M2_T2, M2_T3, M2_T4, M2_H0, M2_HeightCalc, M02_AF00Q101, M2_TotalV, M2_M0, M2_Massa, M2_TotalM, M02_AF00M101, M02_AF03F701, M02_AF00F101_S0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")