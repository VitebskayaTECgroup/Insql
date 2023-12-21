{суточные срезы}
/*ReportName=Ввод параметров мазута емкостей 1-4 (срезы на конец суток)*/
/*Mode=суточные-1*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	CAST(M01_AF00X101 as decimal(8,3))
		as "Емк.№1 плотность г/см3 [hint:Edit:m1|M01_AF00X101][Edit:m1|M01_AF00X101]",
	CAST(M02_AF00X101 as decimal(8,3))
		as "Емк.№2 плотность г/см3 [hint:Edit:m1|M02_AF00X101][Edit:m1|M02_AF00X101]", 
	CAST(M03_AF00X101 as decimal(8,3))
		as "Емк.№3 плотность г/см3 [hint:Edit:m1|M03_AF00X101][Edit:m1|M03_AF00X101]",
	CAST(M04_AF00X101 as decimal(8,3))
		as "Емк.№4 плотность г/см3 [hint:Edit:m1|M04_AF00X101][Edit:m1|M04_AF00X101]",
	null,
	CAST(M01_AF00M101 as decimal(8,2))
		as "Емк.№1 влажность % [hint:Edit:m1|M01_AF00M101][Edit:m1|M01_AF00M101]",
	CAST(M02_AF00M101 as decimal(8,2))
		as "Емк.№2 влажность % [hint:Edit:m1|M02_AF00M101][Edit:m1|M02_AF00M101]",
	CAST(M03_AF00M101 as decimal(8,2))
		as "Емк.№3 влажность % [hint:Edit:m1|M03_AF00M101][Edit:m1|M03_AF00M101]",
	CAST(M04_AF00M101 as decimal(8,2))
		as "Емк.№4 влажность % [hint:Edit:m1|M04_AF00M101][Edit:m1|M04_AF00M101]",
	null,
	CAST(M01_AF00Q101 as decimal(8,2))
		as "Емк.№1 объем мертвого остатка м3 [hint:Edit:m1|M01_AF00Q101][Edit:m1|M01_AF00Q101]",
	CAST(M02_AF00Q101 as decimal(8,2))
		as "Емк.№2 объем мертвого остатка м3 [hint:Edit:m1|M02_AF00Q101][Edit:m1|M02_AF00Q101]",
	CAST(M03_AF00Q101 as decimal(8,2))
		as "Емк.№3 объем мертвого остатка м3 [hint:Edit:m1|M03_AF00Q101][Edit:m1|M03_AF00Q101]",
	CAST(M04_AF00Q101 as decimal(8,2))
		as "Емк.№4 объем мертвого остатка м3 [hint:Edit:m1|M04_AF00Q101][Edit:m1|M04_AF00Q101]",
	null,
	CAST(M00_AF01F100 as decimal(8,2))
		as "Масса мазута сторонних организаций, тонн [hint:Edit:m1|M00_AF01F100][Edit:m1|M00_AF01F100]",
	null,
	CAST(isnull(M00_AF03F702,0) as decimal(8,2)) 
		as "Масса мазута в приемных емкостях, тонн [hint:Edit:m1|M00_AF03F702][Edit:m1|M00_AF03F702]",
	null,
	CAST(isnull(M1_TotalM,0)+isnull(M2_TotalM,0)+isnull(M3_TotalM,0)+isnull(M4_TotalM,0)+isnull(M00_AF03F702,0) as decimal(8,2))
		as "Измеренная Масса мазута + пр.ёмкость, тонн",
	CAST((isnull(M1_TotalM,0)*(1-isnull(M01_AF00M101,0)/100))+(isnull(M2_TotalM,0)*(1-isnull(M02_AF00M101,0)/100))+(isnull(M3_TotalM,0)*(1-isnull(M03_AF00M101,0)/100))+(isnull(M4_TotalM,0)*(1-isnull(M04_AF00M101,0)/100))+isnull(M00_AF03F702,0)as decimal(8,2))
		as "Масса сухого мазута , тонн",
	CAST((isnull(M1_TotalM,0)*(1-isnull(M01_AF00M101,0)/100))-(isnull(M01_AF00Q101,0)*isnull(M01_AF00X101,0)*(1-isnull(M01_AF00M101,0)/100)) as decimal(8,3))
		as "Емк.№1 Масса Р.О. Сухого",
	CAST((isnull(M2_TotalM,0)*(1-isnull(M02_AF00M101,0)/100))-(isnull(M02_AF00Q101,0)*isnull(M02_AF00X101,0)*(1-isnull(M02_AF00M101,0)/100)) as decimal(8,3))
		as "Емк.№2 Масса Р.О. Сухого", 
	CAST((isnull(M3_TotalM,0)*(1-isnull(M03_AF00M101,0)/100))-(isnull(M03_AF00Q101,0)*isnull(M03_AF00X101,0)*(1-isnull(M03_AF00M101,0)/100)) as decimal(8,3))
		as "Емк.№3 Масса Р.О. Сухого",
	CAST((isnull(M4_TotalM,0)*(1-isnull(M04_AF00M101,0)/100))-(isnull(M04_AF00Q101,0)*isnull(M04_AF00X101,0)*(1-isnull(M04_AF00M101,0)/100)) as decimal(8,3))
		as "Емк.№4 Масса Р.О. Сухого",
	null,
	CAST((isnull(M1_TotalM,0)*(1-isnull(M01_AF00M101,0)/100))-(isnull(M01_AF00Q101,0)*isnull(M01_AF00X101,0)*(1-isnull(M01_AF00M101,0)/100))+(isnull(M2_TotalM,0)*(1-isnull(M02_AF00M101,0)/100))-(isnull(M02_AF00Q101,0)*isnull(M02_AF00X101,0)*(1-isnull(M02_AF00M101,0)/100))+(isnull(M3_TotalM,0)*(1-isnull(M03_AF00M101,0)/100))-(isnull(M03_AF00Q101,0)*isnull(M03_AF00X101,0)*(1-isnull(M03_AF00M101,0)/100))+(isnull(M4_TotalM,0)*(1-isnull(M04_AF00M101,0)/100))-(isnull(M04_AF00Q101,0)*isnull(M04_AF00X101,0)*(1-isnull(M04_AF00M101,0)/100))-isnull(M00_AF01F100,0) as decimal(8,2)) 
		as "Масса р.о. сухого мазута , тонн"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M1_TotalM, M2_TotalM, M3_TotalM, M4_TotalM,
	M01_AF00X101, M02_AF00X101, M03_AF00X101, M04_AF00X101,
	M01_AF00M101, M02_AF00M101, M03_AF00M101, M04_AF00M101,
	M01_AF00Q101, M02_AF00Q101, M03_AF00Q101, M04_AF00Q101,
	M00_AF01F100, M00_AF03F702,
	M4_massa, M1_massa, M2_massa, M3_massa, M1_M0, M2_M0, M3_M0, M4_M0
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")