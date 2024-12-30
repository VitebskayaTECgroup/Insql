{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №4*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_Gper_par as decimal(15, 2)) as "Нагрузка котла,<br/>т/ч [K4_Gper_par]",
	null,
	CAST(K4_Ppar as decimal(15, 2)) as "Давление,<br/>кг/см2 [K4_Ppar]",
	CAST(K4_VG1_P25b as decimal(15, 2)) as "Температура<br/>перегретого<br/>пара, °С [K4_VG1_P25b]",
	null,
	CAST(K4_VG1_P70b as decimal(15, 2)) as "Температура<br/>за воздухоподо-<br/>гревателем<br/>левая, °С [K4_VG1_P70b]",
	CAST(K4_VG1_P71b as decimal(15, 2)) as "Температура<br/>за воздухоподо-<br/>гревателем<br/>правая, °С [K4_VG1_P71b]",
	null,
	CAST(K4_VG2_P4d as decimal(15, 2)) as "Разрежение<br/>перед дымососом<br/>левая, кПа [K4_VG2_P4d]",
	CAST(K4_VG2_P3d as decimal(15, 2)) as "Разрежение<br/>перед дымососом<br/>правая, кПа [K4_VG2_P3d]",
	null,
	CAST(K4_VG1_P80b as decimal(15, 2)) as "Температура<br/>воздуха после<br/>калорифера, °С [K4_VG1_P80b]",
	CAST(K4_VG1_P62b as decimal(15, 2)) as "Температура<br/>горячего воздуха<br/>левая, °С [K4_VG1_P62b]",
	CAST(K4_VG1_P63b as decimal(15, 2)) as "Температура<br/>горячего воздуха<br/>правая, °С [K4_VG1_P63b]",
	null,
	CAST(K4_Qgas_osn as decimal(15, 2)) as "Расход газа<br/>на котёл,<br/>м3/час [K4_Qgas_osn]",
	CAST(K4_Pgas as decimal(15, 2)) as "Давление газа<br/>перед котлом,<br/>кг/см2 [K4_Pgas]",
	null,
	CAST(K4_VG2_P3e as decimal(15, 2)) as "Содержание О2 в<br/>уходящих газах,<br/>% [K4_VG2_P3e]",
	null,
	CAST(K4_VG2_P4g as decimal(15, 2)) as "Непрерывная<br/>продувка<br/>т/ч [K4_VG2_P4g]",
	CAST(K4_VG1_P13b as decimal(15, 2)) as "Температура<br/>питательной<br/>воды, °С [K4_VG1_P13b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_Gper_par,
	K4_Ppar,
	K4_VG1_P25b,
	K4_VG1_P70b,
	K4_VG1_P71b,
	K3_VG2_P1d,
	K3_VG2_P2d,
	K4_VG2_P4d,
	K4_VG2_P3d,
	K4_VG1_P80b,
	K4_VG1_P62b,
	K4_VG1_P63b,
	K4_VG2_P3e,
	K4_Qgas_osn,
	K4_Pgas,
	K4_VG2_P4g,
	K4_VG1_P13b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")