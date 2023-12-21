{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №3 (2 часть)*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P65b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 1, °С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 2, °С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 3, °С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 4, °С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 5, °С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 2)) as "Температура<br/>металла<br/>змеевиков 6, °С [K3_VG1_P70b]",
	null,
	CAST(K3_VG1_P13b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. сл. верх, °С [K3_VG1_P13b]",
	CAST(K3_VG1_P14b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. сл. низ, °С [K3_VG1_P14b]",
	CAST(K3_VG1_P15b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. спр. верх, °С [K3_VG1_P15b]",
	CAST(K3_VG1_P16b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>1ст. спр. низ, °С [K3_VG1_P16b]",
	CAST(K3_VG1_P17b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. сл. верх, °С [K3_VG1_P17b]",
	CAST(K3_VG1_P18b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. сл. низ, °С [K3_VG1_P18b]",
	CAST(K3_VG1_P19b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. спр. верх, °С [K3_VG1_P19b]",
	CAST(K3_VG1_P20b as decimal(15, 2)) as "Температура<br/>металла<br/>колл. впрыска<br/>2ст. спр. низ, °С [K3_VG1_P20b]",
	null,
	CAST(K3_VG1_P36b as decimal(15, 2)) as "Температура<br/>холодного<br/>воздуха, °С [K3_VG1_P36b]",
	null,
	CAST(K3_AI1PV as decimal(15, 2)) as "Расход<br/>газа, м3 [K3_AI1PV]",
	CAST(K3_AI3PV as decimal(15, 2)) as "Давление<br/>газа, кПа [K3_AI3PV]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b,
	K3_VG1_P13b,
	K3_VG1_P14b,
	K3_VG1_P15b,
	K3_VG1_P16b,
	K3_VG1_P17b,
	K3_VG1_P18b,
	K3_VG1_P19b,
	K3_VG1_P20b,
	K3_VG1_P36b,
	K3_AI1PV,
	K3_AI3PV
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")