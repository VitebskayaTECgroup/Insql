{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №3. Контроль металла*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P53b as decimal(15, 2)) as "1, °С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 2)) as "2, °С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 2)) as "3, °С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 2)) as "4, °С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 2)) as "5, °С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 2)) as "6, °С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 2)) as "7, °С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 2)) as "8, °С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 2)) as "9, °С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 2)) as "10, °С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 2)) as "11, °С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 2)) as "12, °С [K3_VG1_P64b]",
	null,
	CAST(K3_VG1_P49b as decimal(15, 2)) as "№6, °С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 2)) as "№12, °С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 2)) as "№66, °С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 2)) as "№72, °С [K3_VG1_P52b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P53b,
	K3_VG1_P54b,
	K3_VG1_P55b,
	K3_VG1_P56b,
	K3_VG1_P57b,
	K3_VG1_P58b,
	K3_VG1_P59b,
	K3_VG1_P60b,
	K3_VG1_P61b,
	K3_VG1_P62b,
	K3_VG1_P63b,
	K3_VG1_P64b,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")