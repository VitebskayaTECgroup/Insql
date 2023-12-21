{минутные срезы}
/*ReportName=Базисная мазутная емкость №3 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M3_T1) as decimal(6,1)) as "T°С низ [M3_T1]",
	CAST(dbo.vst_nfloat(M3_T2) as decimal(6,1)) as "T°С с-на [M3_T2]",
	CAST(dbo.vst_nfloat(M3_T3) as decimal(6,1)) as "T°С верх [M3_T3]",
	CAST(dbo.vst_nfloat(M3_T4) as decimal(6,1)) as "T°С нар [M3_T4]",
	CAST(dbo.vst_nfloat(M3_H0) as decimal(6,2)) as "Высота М/О, м [M3_H0]",
	CAST(dbo.vst_nfloat(M3_HeightCalc)-dbo.vst_nfloat(M3_H0) as decimal(6,2)) as "Высота Р/О, м [M3_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M3_HeightCalc) as decimal(6,2)) as "Высота всего, м [M3_HeightCalc]",
	CAST(dbo.vst_nfloat(M03_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M03_AF00Q101]",
	CAST(dbo.vst_nfloat(M3_TotalV)-dbo.vst_nfloat(M03_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M3_TotalV-M03_AF00Q101]",
	CAST(dbo.vst_nfloat(M3_TotalV) as decimal(6,2)) as "Объем всего, м3 [M3_TotalV]",
	CAST(dbo.vst_nfloat(M3_M0) as decimal(6)) as "Масса М/О, т [M3_M0]",
	CAST(dbo.vst_nfloat(M3_Massa) as decimal(6)) as "Масса Р/О, т [M3_Massa]",
	CAST(dbo.vst_nfloat(M3_TotalM) as decimal(6)) as "Общая масса, т [M3_TotalM]",
	CAST(dbo.vst_nfloat(M03_AF00M101) as decimal(6,2)) as "Влажность, % [M03_AF00M101]",
	CAST(dbo.vst_nfloat(M03_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M03_AF03F701]",
	CAST(dbo.vst_nfloat(M03_AF00F101) as decimal(6,2)) as "Расход мазута емк N3, тонн [M03_AF00F101]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M3_T1, M3_T2, M3_T3, M3_T4, M3_H0, M3_HeightCalc, M03_AF00Q101, M3_TotalV, M3_M0, M3_Massa, M3_TotalM, M03_AF00M101, M03_AF03F701, M03_AF00F101
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Базисная мазутная емкость №3 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(dbo.vst_nfloat(M3_T1) as decimal(6,1)) as "T°С низ [M3_T1]",
	CAST(dbo.vst_nfloat(M3_T2) as decimal(6,1)) as "T°С с-на [M3_T2]",
	CAST(dbo.vst_nfloat(M3_T3) as decimal(6,1)) as "T°С верх [M3_T3]",
	CAST(dbo.vst_nfloat(M3_T4) as decimal(6,1)) as "T°С нар [M3_T4]",
	CAST(dbo.vst_nfloat(M3_H0) as decimal(6,2)) as "Высота М/О, м [M3_H0]",
	CAST(dbo.vst_nfloat(M3_HeightCalc)-dbo.vst_nfloat(M3_H0) as decimal(6,2)) as "Высота Р/О, м [M3_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M3_HeightCalc) as decimal(6,2)) as "Высота всего, м [M3_HeightCalc]",
	CAST(dbo.vst_nfloat(M03_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M03_AF00Q101]",
	CAST(dbo.vst_nfloat(M3_TotalV)-dbo.vst_nfloat(M03_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M3_TotalV-M03_AF00Q101]",
	CAST(dbo.vst_nfloat(M3_TotalV) as decimal(6,2)) as "Объем всего, м3 [M3_TotalV]",
	CAST(dbo.vst_nfloat(M3_M0) as decimal(6)) as "Масса М/О, т [M3_M0]",
	CAST(dbo.vst_nfloat(M3_Massa) as decimal(6)) as "Масса Р/О, т [M3_Massa]",
	CAST(dbo.vst_nfloat(M3_TotalM) as decimal(6)) as "Общая масса, т [M3_TotalM]",
	CAST(dbo.vst_nfloat(M03_AF00M101) as decimal(6,2)) as "Влажность, % [M03_AF00M101]",
	CAST(dbo.vst_nfloat(M03_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M03_AF03F701]",
	CAST(dbo.vst_nfloat(M03_AF00F101_H0) as decimal(6,2)) as "Расход мазута емк N3 час, тонн [M03_AF00F101_H0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M3_T1, M3_T2, M3_T3, M3_T4, M3_H0, M3_HeightCalc, M03_AF00Q101, M3_TotalV, M3_M0, M3_Massa, M3_TotalM, M03_AF00M101, M03_AF03F701, M03_AF00F101_H0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Базисная мазутная емкость №3 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(dbo.vst_nfloat(M3_T1) as decimal(6,1)) as "T°С низ [M3_T1]",
	CAST(dbo.vst_nfloat(M3_T2) as decimal(6,1)) as "T°С с-на [M3_T2]",
	CAST(dbo.vst_nfloat(M3_T3) as decimal(6,1)) as "T°С верх [M3_T3]",
	CAST(dbo.vst_nfloat(M3_T4) as decimal(6,1)) as "T°С нар [M3_T4]",
	CAST(dbo.vst_nfloat(M3_H0) as decimal(6,2)) as "Высота М/О, м [M3_H0]",
	CAST(dbo.vst_nfloat(M3_HeightCalc)-dbo.vst_nfloat(M3_H0) as decimal(6,2)) as "Высота Р/О, м [M3_HeightCalc-M3_H0]",
	CAST(dbo.vst_nfloat(M3_HeightCalc) as decimal(6,2)) as "Высота всего, м [M3_HeightCalc]",
	CAST(dbo.vst_nfloat(M03_AF00Q101) as decimal(6,2)) as "Объем М/О, м3 [M03_AF00Q101]",
	CAST(dbo.vst_nfloat(M3_TotalV)-dbo.vst_nfloat(M03_AF00Q101) as decimal(6,2)) as "Объем Р/О, м3, [M3_TotalV-M03_AF00Q101]",
	CAST(dbo.vst_nfloat(M3_TotalV) as decimal(6,2)) as "Объем всего, м3 [M3_TotalV]",
	CAST(dbo.vst_nfloat(M3_M0) as decimal(6)) as "Масса М/О, т [M3_M0]",
	CAST(dbo.vst_nfloat(M3_Massa) as decimal(6)) as "Масса Р/О, т [M3_Massa]",
	CAST(dbo.vst_nfloat(M3_TotalM) as decimal(6)) as "Общая масса, т [M3_TotalM]",
	CAST(dbo.vst_nfloat(M03_AF00M101) as decimal(6,2)) as "Влажность, % [M03_AF00M101]",
	CAST(dbo.vst_nfloat(M03_AF03F701) as decimal(6,2)) as "Общая масса сухого мазута, тонн [M03_AF03F701]",
	CAST(dbo.vst_nfloat(M03_AF00F101_S0) as decimal(6,2)) as "Расход мазута емк N3 сут, тонн [M03_AF00F101_S0]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M3_T1, M3_T2, M3_T3, M3_T4, M3_H0, M3_HeightCalc, M03_AF00Q101, M3_TotalV, M3_M0, M3_Massa, M3_TotalM, M03_AF00M101, M03_AF03F701, M03_AF00F101_S0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = 86400000
	AND DateTime >= @start
	AND DateTime <= @finish")