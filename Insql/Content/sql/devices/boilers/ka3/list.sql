{минутные срезы}
/*ReportName="КА-3 Сводная ведомость" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P18v as decimal(15, 2)) as "П18в<br>Рп, МПа [K3_VG2_P18v]",
	CAST(K3_VG2_P2v as decimal(15, 2)) as "П2в<br>Рпв, МПа [K3_VG2_P2v]",
	CAST(K3_VG2_P3v as decimal(15, 2)) as "П3в<br>Рпв, МПа [K3_VG2_P3v]",
	CAST(K3_VG1_P24b as decimal(15, 2)) as "П24б<br>Тп, °С [K3_VG1_P24b]",
	CAST(K3_VG2_P1g as decimal(15, 2)) as "П1г<br>Gп, тонн [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 2)) as "П4г<br>Gп, тонн [K3_VG2_P4g]",
	CAST(K3_VG2_P77b as decimal(15, 2)) as "П77б<br>tпв до котла, °C [K3_VG2_P77b]",
	CAST(K3_VG2_P2g as decimal(15, 2)) as "П2г<br>Gпв, тонн [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 2)) as "П3г<br>Gпв_, тонн [K3_VG2_P3g]",
	CAST(K3_VG2_P79b as decimal(15, 2)) as "П79б<br>Tyr1 [K3_VG2_P79b]",
	CAST(K3_VG2_P89b as decimal(15, 2)) as "П89б<br>Tyr2 [K3_VG2_P89b]",
	CAST(K3_VG1_P35b as decimal(15, 2)) as "П35б<br>tхв сл, °С [K3_VG1_P35b]",
	CAST(K3_VG1_P36b as decimal(15, 2)) as "П36б<br>tхв спр, °С [K3_VG1_P36b]",
	CAST(K3_VG2_P3e as decimal(15, 2)) as "П3е<br>Q2сл, % [K3_VG2_P3e]",
	CAST(K3_VG2_P4e as decimal(15, 2)) as "П4е<br>Q2сп, % [K3_VG2_P4e]",
	CAST(K3_VG2_P88b as decimal(15, 2)) as "П88б<br>Ttкал сл, °С [K3_VG2_P88b]",
	CAST(K3_VG2_P80b as decimal(15, 2)) as "П80б<br>Tкал спр, °С [K3_VG2_P80b]",
	CAST(K3_VG1_P39b as decimal(15, 2)) as "П39б<br>Тгв сл, °С [K3_VG1_P39b]",
	CAST(K3_VG1_P40b as decimal(15, 2)) as "П40б<br>Tгв спр, °С [K3_VG1_P40b]",
	CAST(K3_VG2_P5g as decimal(15, 2)) as "П5г<br>Gн_пр, тонн [K3_VG2_P5g]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P18v,
	K3_VG1_P24b,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P77b,
	K3_VG2_P2v,
	K3_VG2_P3v,
	K3_VG2_P79b,
	K3_VG2_P89b,
	K3_VG1_P35b,
	K3_VG1_P36b,
	K3_VG2_P3e,
	K3_VG2_P4e,
	K3_VG2_P88b,
	K3_VG2_P80b,
	K3_VG1_P39b,
	K3_VG1_P40b,
	K3_VG2_P5g,
	K3_VG2_P2g,
	K3_VG2_P3g
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="КА-3 Сводная ведомость" (агрегированные за час)*/
/*StartDate=dd.MM.yyyy 00:01:00.000*/
/*DeltaDate=00.00.0000 23:59:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DateFormat=dd.MM.yyyy HH:mm*/
/*DownQuery="минутные срезы"*/
/*UpQuery="агрегированные за сутки"*/


SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hour, 1, DateTime) as "Дата",
	null,
	CAST(AVG(K3_VG2_P18v) as decimal(15, 2)) as "П18в<br>Рп, МПа [K3_VG2_P18v]",
	CAST(AVG(K3_VG2_P2v) as decimal(15, 2)) as "П2в<br>Рпв, МПа [K3_VG2_P2v]",
	CAST(AVG(K3_VG2_P3v) as decimal(15, 2)) as "П3в<br>Рпв, МПа [K3_VG2_P3v]",
	CAST(AVG(K3_VG1_P24b) as decimal(15, 2)) as "П24б<br>Тп, °С [K3_VG1_P24b]",
	CAST(SUM(K3_VG2_P1g) / 60 as decimal(15, 2)) as "П1г<br>Gп, тонн [K3_VG2_P1g]",
	CAST(SUM(K3_VG2_P4g) / 60 as decimal(15, 2)) as "П4г<br>Gп, тонн [K3_VG2_P4g]",
	CAST(AVG(K3_VG2_P77b) as decimal(15, 2)) as "П77б<br>tпв до<br>котла, °C [K3_VG2_P77b]",
	CAST(SUM(K3_VG2_P2g) / 60 as decimal(15, 2)) as "П2г<br>Gпв, тонн [K3_VG2_P2g]",
	CAST(SUM(K3_VG2_P3g) / 60 as decimal(15, 2)) as "П3г<br>Gпв_, тонн [K3_VG2_P3g]",
	CAST(AVG(K3_VG2_P79b) as decimal(15, 2)) as "П79б<br>Tyr1 [K3_VG2_P79b]",
	CAST(AVG(K3_VG2_P89b) as decimal(15, 2)) as "П89б<br>Tyr2 [K3_VG2_P89b]",
	CAST(AVG(K3_VG1_P35b) as decimal(15, 2)) as "П35б<br>tхв сл, °С [K3_VG1_P35b]",
	CAST(AVG(K3_VG1_P36b) as decimal(15, 2)) as "П36б<br>tхв спр, °С [K3_VG1_P36b]",
	CAST(AVG(K3_VG2_P3e) as decimal(15, 2)) as "П3е<br>Q2сл, % [K3_VG2_P3e]",
	CAST(AVG(K3_VG2_P4e) as decimal(15, 2)) as "П4е<br>Q2сп, % [K3_VG2_P4e]",
	CAST(AVG(K3_VG2_P88b) as decimal(15, 2)) as "П88б<br>Ttкал сл, °С [K3_VG2_P88b]",
	CAST(AVG(K3_VG2_P80b) as decimal(15, 2)) as "П80б<br>Tкал спр, °С [K3_VG2_P80b]",
	CAST(AVG(K3_VG1_P39b) as decimal(15, 2)) as "П39б<br>Тгв сл, °С [K3_VG1_P39b]",
	CAST(AVG(K3_VG1_P40b) as decimal(15, 2)) as "П40б<br>Tгв спр, °С [K3_VG1_P40b]",
	CAST(SUM(K3_VG2_P5g) / 60 as decimal(15, 2)) as "П5г<br>Gн_пр, тонн [K3_VG2_P5g]"
FROM (
	SELECT
		DateAdd(hour, DateDiff(hour, 0, DateAdd(mi, -1, DateTime)), 0) as "DateTime",
		CAST(K3_VG2_P18v as decimal(15, 2)) as "K3_VG2_P18v",
		CAST(K3_VG2_P2v  as decimal(15, 2)) as "K3_VG2_P2v",
		CAST(K3_VG2_P3v  as decimal(15, 2)) as "K3_VG2_P3v",
		CAST(K3_VG1_P24b as decimal(15, 2)) as "K3_VG1_P24b",
		CAST(K3_VG2_P1g  as decimal(15, 2)) as "K3_VG2_P1g",
		CAST(K3_VG2_P4g  as decimal(15, 2)) as "K3_VG2_P4g",
		CAST(K3_VG2_P77b as decimal(15, 2)) as "K3_VG2_P77b",
		CAST(K3_VG2_P2g  as decimal(15, 2)) as "K3_VG2_P2g",
		CAST(K3_VG2_P3g  as decimal(15, 2)) as "K3_VG2_P3g",
		CAST(K3_VG2_P79b as decimal(15, 2)) as "K3_VG2_P79b",
		CAST(K3_VG2_P89b as decimal(15, 2)) as "K3_VG2_P89b",
		CAST(K3_VG1_P35b as decimal(15, 2)) as "K3_VG1_P35b",
		CAST(K3_VG1_P36b as decimal(15, 2)) as "K3_VG1_P36b",
		CAST(K3_VG2_P3e  as decimal(15, 2)) as "K3_VG2_P3e",
		CAST(K3_VG2_P4e  as decimal(15, 2)) as "K3_VG2_P4e",
		CAST(K3_VG2_P88b as decimal(15, 2)) as "K3_VG2_P88b",
		CAST(K3_VG2_P80b as decimal(15, 2)) as "K3_VG2_P80b",
		CAST(K3_VG1_P39b as decimal(15, 2)) as "K3_VG1_P39b",
		CAST(K3_VG1_P40b as decimal(15, 2)) as "K3_VG1_P40b",
		CAST(K3_VG2_P5g  as decimal(15, 2)) as "K3_VG2_P5g"
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime,
		K3_VG2_P18v,
		K3_VG1_P24b,
		K3_VG2_P1g,
		K3_VG2_P4g,
		K3_VG2_P77b,
		K3_VG2_P2v,
		K3_VG2_P3v,
		K3_VG2_P79b,
		K3_VG2_P89b,
		K3_VG1_P35b,
		K3_VG1_P36b,
		K3_VG2_P3e,
		K3_VG2_P4e,
		K3_VG2_P88b,
		K3_VG2_P80b,
		K3_VG1_P39b,
		K3_VG1_P40b,
		K3_VG2_P5g,
		K3_VG2_P2g,
		K3_VG2_P3g
		FROM Runtime.dbo.AnalogWideHistory 
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
	) AS MinutesAgregated
GROUP BY
	DateTime
ORDER BY
	DateTime


{агрегированные за сутки}
/*ReportName="КА-3 Сводная ведомость" (агрегированные за сутки)*/
/*StartDate=01.MM.yyyy 00:00:00.000*/
/*DeltaDate=-01.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*Resolution=60000*/
/*DateFormat=d MMMM yyyy*/
/*DownQuery="агрегированные за час"*/
/*Database=ptocalc*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P18v as decimal(15, 2)) as "П18в<br>Рп, МПа [K3_VG2_P18v]",
	CAST(K3_VG2_P2v as decimal(15, 2)) as "П2в<br>Рпв, МПа [K3_VG2_P2v]",
	CAST(K3_VG2_P3v as decimal(15, 2)) as "П3в<br>Рпв, МПа [K3_VG2_P3v]",
	CAST(K3_VG1_P24b as decimal(15, 2)) as "П24б<br>Тп, °С [K3_VG1_P24b]",
	CAST(K3_VG2_P1g as decimal(15, 2)) as "П1г<br>Gп, тонн [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 2)) as "П4г<br>Gп, тонн [K3_VG2_P4g]",
	CAST(K3_VG2_P77b as decimal(15, 2)) as "П77б<br>tпв до котла, °C [K3_VG2_P77b]",
	CAST(K3_VG2_P2g as decimal(15, 2)) as "П2г<br>Gпв, тонн [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 2)) as "П3г<br>Gпв_, тонн [K3_VG2_P3g]",
	CAST(K3_VG2_P79b as decimal(15, 2)) as "П79б<br>Tyr1 [K3_VG2_P79b]",
	CAST(K3_VG2_P89b as decimal(15, 2)) as "П89б<br>Tyr2 [K3_VG2_P89b]",
	CAST(K3_VG1_P35b as decimal(15, 2)) as "П35б<br>tхв сл, °С [K3_VG1_P35b]",
	CAST(K3_VG1_P36b as decimal(15, 2)) as "П36б<br>tхв спр, °С [K3_VG1_P36b]",
	CAST(K3_VG2_P3e as decimal(15, 2)) as "П3е<br>Q2сл, % [K3_VG2_P3e]",
	CAST(K3_VG2_P4e as decimal(15, 2)) as "П4е<br>Q2сп, % [K3_VG2_P4e]",
	CAST(K3_VG2_P88b as decimal(15, 2)) as "П88б<br>Ttкал сл, °С [K3_VG2_P88b]",
	CAST(K3_VG2_P80b as decimal(15, 2)) as "П80б<br>Tкал спр, °С [K3_VG2_P80b]",
	CAST(K3_VG1_P39b as decimal(15, 2)) as "П39б<br>Тгв сл, °С [K3_VG1_P39b]",
	CAST(K3_VG1_P40b as decimal(15, 2)) as "П40б<br>Tгв спр, °С [K3_VG1_P40b]",
	CAST(K3_VG2_P5g as decimal(15, 2)) as "П5г<br>Gн_пр, тонн [K3_VG2_P5g]"
FROM KA3_Aggregated
WHERE 
	DateTime >= @start
	AND DateTime <= @finish
ORDER BY DateTime