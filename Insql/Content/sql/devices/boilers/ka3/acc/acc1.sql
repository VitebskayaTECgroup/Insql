{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №3 (1 часть)*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P1g as decimal(15, 2)) as "Нагрузка котла, т/ч [K3_VG2_P1g]",
	null,
	CAST(K3_VG2_P18v as decimal(15, 2)) as "Давление, кг/см2 [K3_VG2_P18v]",
	CAST(K3_VG1_P24b as decimal(15, 2)) as "Температура<br/>перегретого<br/>пара, °С [K3_VG1_P24b]",
	null,
	CAST(K3_VG1_P47b as decimal(15, 2)) as "Температура<br/>за воздухоподо-<br/>гревателем<br/>левая, °С [K3_VG1_P47b]",
	CAST(K3_VG1_P48b as decimal(15, 2)) as "Температура<br/>за воздухоподо-<br/>гревателем<br/>правая, °С [K3_VG1_P48b]",
	null,
	CAST(K3_VG2_P1d as decimal(15, 2)) as "Разрежение<br/>в топке<br/>левая, кг/м2 [K3_VG2_P1d]",
	CAST(K3_VG2_P2d as decimal(15, 2)) as "Разрежение<br/>в топке<br/>правая, кг/м2 [K3_VG2_P2d]",
	CAST(K3_VG2_P4d as decimal(15, 2)) as "Разрежение<br/>перед дымососом<br/>левая, кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 2)) as "Разрежение<br/>перед дымососом<br/>правая, кПа [K3_VG2_P3d]",
	null,
	CAST(K3_VG2_P80b as decimal(15, 2)) as "Температура<br/>воздуха после<br/>калорифера, °С [K3_VG2_P80b]",
	CAST(K3_VG1_P39b as decimal(15, 2)) as "Температура<br/>горячего воздуха<br/>левая, °С [K3_VG1_P39b]",
	CAST(K3_VG1_P40b as decimal(15, 2)) as "Температура<br/>горячего воздуха<br/>правая, °С [K3_VG1_P40b]",
	null,
	CAST(K3_VG2_P4e as decimal(15, 2)) as "Содержание О2 в<br/>уходящих газах<br/>, % [K3_VG2_P4e]",
	CAST(K3_VG2_P13v as decimal(15, 2)) as "Давление<br/>воздуха перед<br/>горелкой 1 [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 2)) as "Давление<br/>воздуха перед<br/>горелкой 2 [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 2)) as "Давление<br/>воздуха перед<br/>горелкой 3 [K3_VG2_P15v]",
	CAST(K3_VG2_P5g as decimal(15, 2)) as "Непрерывная<br/>продувка<br/>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P77b as decimal(15, 2)) as "Температура<br/>питательной<br/>воды, °С [K3_VG2_P77b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P1g,
	K3_VG2_P18v,
	K3_VG1_P24b,
	K3_VG1_P47b,
	K3_VG1_P48b,
	K3_VG2_P1d,
	K3_VG2_P2d,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P80b,
	K3_VG1_P39b,
	K3_VG1_P40b,
	K3_VG2_P4e,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v,
	K3_VG2_P5g,
	K3_VG2_P77b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")