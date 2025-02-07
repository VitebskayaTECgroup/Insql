{срезы по 4 часа}
/*ReportName=Суточная ведомость 2 котлоагрегата БКЗ №4 (2 часть)*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_VG1_P48b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 3, °С [K4_VG1_P48b]",
	CAST(K4_VG1_P49b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 10, °С [K4_VG1_P49b]",
	CAST(K4_VG1_P50b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 17, °С [K4_VG1_P50b]",
	CAST(K4_VG1_P51b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 24, °С [K4_VG1_P51b]",
	CAST(K4_VG1_P52b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 31, °С [K4_VG1_P52b]",
	CAST(K4_VG1_P53b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 38, °С [K4_VG1_P53b]",
	null,
	CAST(K4_VG1_P14b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. сл. низ, °С [K4_VG1_P14b]",
	CAST(K4_VG1_P15b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. сл. верх, °С [K4_VG1_P15b]",
	CAST(K4_VG1_P16b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. спр. низ, °С [K4_VG1_P16b]",
	CAST(K4_VG1_P17b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. спр. верх, °С [K4_VG1_P17b]",
	null,
	CAST(K4_VG1_P18b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. сл. низ, °С [K4_VG1_P18b]",
	CAST(K4_VG1_P19b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. сл. верх, °С [K4_VG1_P19b]",
	CAST(K4_VG1_P20b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. спр. низ, °С [K4_VG1_P20b]",
	CAST(K4_VG1_P21b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. спр. верх, °С [K4_VG1_P21b]",
	null,
	CAST(K4_VG1_P76b as decimal(15, 2)) as "Температура<br/>холодного<br/>воздуха<br/>слева, °С [K4_VG1_P76b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG1_P48b,
	K4_VG1_P49b,
	K4_VG1_P50b,
	K4_VG1_P51b,
	K4_VG1_P52b,
	K4_VG1_P53b,
	K4_VG1_P14b,
	K4_VG1_P15b,
	K4_VG1_P16b,
	K4_VG1_P17b,
	K4_VG1_P18b,
	K4_VG1_P19b,
	K4_VG1_P20b,
	K4_VG1_P21b,
	K4_VG1_P76b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")