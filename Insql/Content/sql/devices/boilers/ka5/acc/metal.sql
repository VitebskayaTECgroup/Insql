{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №5. Контроль металла*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(KA5_VG1_K052, 2) as "[KA5_VG1_K052][Description]",
	ROUND(KA5_VG1_K094, 2) as "[KA5_VG1_K094][Description]",
	ROUND(KA5_VG1_K053, 2) as "[KA5_VG1_K053][Description]",
	ROUND(KA5_VG1_K098, 2) as "[KA5_VG1_K098][Description]",
	ROUND(KA5_VG1_K054, 2) as "[KA5_VG1_K054][Description]",
	ROUND(KA5_VG1_K113, 2) as "[KA5_VG1_K113][Description]",
	ROUND(KA5_VG1_K055, 2) as "[KA5_VG1_K055][Description]",
	ROUND(KA5_VG1_K114, 2) as "[KA5_VG1_K114][Description]",
	ROUND(KA5_VG1_K056, 2) as "[KA5_VG1_K056][Description]",
	ROUND(KA5_VG1_K115, 2) as "[KA5_VG1_K115][Description]",
	ROUND(KA5_VG1_K057, 2) as "[KA5_VG1_K057][Description]",
	ROUND(KA5_VG1_K116, 2) as "[KA5_VG1_K116][Description]",
	ROUND(KA5_VG1_K048, 2) as "[KA5_VG1_K048][Description]",
	ROUND(KA5_VG1_K049, 2) as "[KA5_VG1_K049][Description]",
	ROUND(KA5_VG1_K050, 2) as "[KA5_VG1_K050][Description]",
	ROUND(KA5_VG1_K051, 2) as "[KA5_VG1_K051][Description]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K052,
	KA5_VG1_K094,
	KA5_VG1_K053,
	KA5_VG1_K098,
	KA5_VG1_K054,
	KA5_VG1_K113,
	KA5_VG1_K055,
	KA5_VG1_K114,
	KA5_VG1_K056,
	KA5_VG1_K115,
	KA5_VG1_K057,
	KA5_VG1_K116,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")