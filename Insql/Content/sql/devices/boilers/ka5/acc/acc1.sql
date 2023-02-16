{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №5 (1 часть)*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(KA5_VG1_K090, 2) as "[KA5_VG1_K090][Description]",
	ROUND(KA5_VG1_K099, 2) as "[KA5_VG1_K099][Description]",
	ROUND(KA5_VG1_K093, 2) as "[KA5_VG1_K093][Description]",
	ROUND(KA5_VG1_K103, 2) as "[KA5_VG1_K103][Description]",
	ROUND(KA5_VG1_K104, 2) as "[KA5_VG1_K104][Description]",
	ROUND(KA5_VG1_K001, 2) as "[KA5_VG1_K001][Description]",
	ROUND(KA5_VG1_K089, 2) as "[KA5_VG1_K089][Description]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K090,
	KA5_VG1_K099,
	KA5_VG1_K093,
	KA5_VG1_K103,
	KA5_VG1_K104,
	KA5_VG1_K001,
	KA5_VG1_K089
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")