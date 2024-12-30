{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №4. Контроль металла*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(K4_VG1_P32b, 2) as "1, °С [K4_VG1_P32b]",
	ROUND(K4_VG1_P33b, 2) as "2, °С [K4_VG1_P33b]",
	ROUND(K4_VG1_P34b, 2) as "3, °С [K4_VG1_P34b]",
	ROUND(K4_VG1_P35b, 2) as "4, °С [K4_VG1_P35b]",
	ROUND(K4_VG1_P36b, 2) as "5, °С [K4_VG1_P36b]",
	ROUND(K4_VG1_P37b, 2) as "6, °С [K4_VG1_P37b]",
	ROUND(K4_VG1_P38b, 2) as "7, °С [K4_VG1_P38b]",
	ROUND(K4_VG1_P39b, 2) as "8, °С [K4_VG1_P39b]",
	ROUND(K4_VG1_P40b, 2) as "9, °С [K4_VG1_P40b]",
	ROUND(K4_VG1_P41b, 2) as "10, °С [K4_VG1_P41b]",
	ROUND(K4_VG1_P42b, 2) as "11, °С [K4_VG1_P42b]",
	ROUND(K4_VG1_P43b, 2) as "12, °С [K4_VG1_P43b]",
	null,
	ROUND(K4_VG1_P44b, 2) as "№6, °С [K4_VG1_P44b]",
	ROUND(K4_VG1_P45b, 2) as "№12, °С [K4_VG1_P45b]",
	ROUND(K4_VG1_P46b, 2) as "№66, °С [K4_VG1_P46b]",
	ROUND(K4_VG1_P47b, 2) as "№72, °С [K4_VG1_P47b]"

	/* старое, полные названия столбцов */
	/*ROUND(K4_VG1_P32b, 2) as "[K4_VG1_P32b][Description]",*/
	/*ROUND(K4_VG1_P33b, 2) as "[K4_VG1_P33b][Description]",*/
	/*ROUND(K4_VG1_P34b, 2) as "[K4_VG1_P34b][Description]",*/
	/*ROUND(K4_VG1_P35b, 2) as "[K4_VG1_P35b][Description]",*/
	/*ROUND(K4_VG1_P36b, 2) as "[K4_VG1_P36b][Description]",*/
	/*ROUND(K4_VG1_P37b, 2) as "[K4_VG1_P37b][Description]",*/
	/*ROUND(K4_VG1_P38b, 2) as "[K4_VG1_P38b][Description]",*/
	/*ROUND(K4_VG1_P39b, 2) as "[K4_VG1_P39b][Description]",*/
	/*ROUND(K4_VG1_P40b, 2) as "[K4_VG1_P40b][Description]",*/
	/*ROUND(K4_VG1_P41b, 2) as "[K4_VG1_P41b][Description]",*/
	/*ROUND(K4_VG1_P42b, 2) as "[K4_VG1_P42b][Description]",*/
	/*ROUND(K4_VG1_P43b, 2) as "[K4_VG1_P43b][Description]",*/
	/*ROUND(K4_VG1_P44b, 2) as "[K4_VG1_P44b][Description]",*/
	/*ROUND(K4_VG1_P45b, 2) as "[K4_VG1_P45b][Description]",*/
	/*ROUND(K4_VG1_P46b, 2) as "[K4_VG1_P46b][Description]",*/
	/*ROUND(K4_VG1_P47b, 2) as "[K4_VG1_P47b][Description]"*/
	
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG1_P32b,
	K4_VG1_P33b,
	K4_VG1_P34b,
	K4_VG1_P35b,
	K4_VG1_P36b,
	K4_VG1_P37b,
	K4_VG1_P38b,
	K4_VG1_P39b,
	K4_VG1_P40b,
	K4_VG1_P41b,
	K4_VG1_P42b,
	K4_VG1_P43b,
	K4_VG1_P44b,
	K4_VG1_P45b,
	K4_VG1_P46b,
	K4_VG1_P47b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")