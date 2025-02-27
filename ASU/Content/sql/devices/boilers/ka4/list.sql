{минутные срезы}
/*ReportName="КА-4 Сводная ведомость" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_VG1_P25b as decimal(15, 1)) as "П25б<br>Тп, °С [K4_VG1_P25b]",
	CAST(K4_VG1_P72b as decimal(15, 1)) as "П72б<br>Tyr1 [K4_VG1_P72b]",
	CAST(K4_VG1_P81b as decimal(15, 1)) as "П81б<br>Tyr2 [K4_VG1_P81b]",
	CAST(K4_VG1_P76b as decimal(15, 1)) as "П76б<br>tхв сл, °С [K4_VG1_P76b]",
	CAST(K4_VG1_P79b as decimal(15, 1)) as "П79б<br>tхв спр, °С [K4_VG1_P79b]",
	CAST(K4_VG2_P3e as decimal(15, 2)) as "П3е<br>Q2сл, % [K4_VG2_P3e]",
	CAST(K4_VG2_P4e as decimal(15, 2)) as "П4е<br>Q2сп, % [K4_VG2_P4e]",
	CAST(K4_VG1_P75b as decimal(15, 1)) as "П75б<br>Ttкал сл, °С [K4_VG1_P75b]",
	CAST(K4_VG1_P80b as decimal(15, 1)) as "П80б<br>Tкал спр, °С [K4_VG1_P80b]",
	CAST(K4_VG1_P62b as decimal(15, 1)) as "П62б<br>Тгв сл, °С [K4_VG1_P62b]",
	CAST(K4_VG1_P63b as decimal(15, 1)) as "П63б<br>Tгв спр, °С [K4_VG1_P63b]",
	CAST(K4_VG2_P4g as decimal(15, 2)) as "П4г<br>Gн_пр, тонн [K4_VG2_P4g]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG1_P25b,
	K4_VG1_P72b,
	K4_VG1_P81b,
	K4_VG1_P76b,
	K4_VG1_P79b,
	K4_VG2_P3e,
	K4_VG2_P4e,
	K4_VG1_P75b,
	K4_VG1_P80b,
	K4_VG1_P62b,
	K4_VG1_P63b,
	K4_VG2_P4g
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
--/*UpQuery="агрегированные за сутки"*/


SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hour, 1, DateTime) as "Дата",
	null,
	CAST(AVG(K4_VG1_P25b) as decimal(15, 1)) as "П25б<br>Тп, °С [K4_VG1_P25b]",
	CAST(AVG(K4_VG1_P72b) as decimal(15, 1)) as "П72б<br>Tyr1 [K4_VG1_P72b]",
	CAST(AVG(K4_VG1_P81b) as decimal(15, 1)) as "П81б<br>Tyr2 [K4_VG1_P81b]",
	CAST(AVG(K4_VG1_P76b) as decimal(15, 1)) as "П76б<br>tхв сл, °С [K4_VG1_P76b]",
	CAST(AVG(K4_VG1_P79b) as decimal(15, 1)) as "П79б<br>tхв спр, °С [K4_VG1_P79b]",
	CAST(AVG(K4_VG2_P3e) as decimal(15, 2)) as "П3е<br>Q2сл, % [K4_VG2_P3e]",
	CAST(AVG(K4_VG2_P4e) as decimal(15, 2)) as "П4е<br>Q2сп, % [K4_VG2_P4e]",
	CAST(AVG(K4_VG1_P75b) as decimal(15, 1)) as "П75б<br>Ttкал сл, °С [K4_VG1_P75b]",
	CAST(AVG(K4_VG1_P80b) as decimal(15, 1)) as "П80б<br>Tкал спр, °С [K4_VG1_P80b]",
	CAST(AVG(K4_VG1_P62b) as decimal(15, 1)) as "П62б<br>Тгв сл, °С [K4_VG1_P62b]",
	CAST(AVG(K4_VG1_P63b) as decimal(15, 1)) as "П63б<br>Tгв спр, °С [K4_VG1_P63b]",
	CAST(SUM(K4_VG2_P4g) / 60 as decimal(15, 2)) as "П4г<br>Gн_пр, тонн [K4_VG2_P4g]"
FROM (
	SELECT
		DateAdd(hour, DateDiff(hour, 0, DateAdd(mi, -1, DateTime)), 0) as "DateTime",
		CAST(K4_VG1_P25b as decimal(15, 1)) as "K4_VG1_P25b",
		CAST(K4_VG1_P72b as decimal(15, 1)) as "K4_VG1_P72b",
		CAST(K4_VG1_P81b as decimal(15, 1)) as "K4_VG1_P81b",
		CAST(K4_VG1_P76b as decimal(15, 1)) as "K4_VG1_P76b",
		CAST(K4_VG1_P79b as decimal(15, 1)) as "K4_VG1_P79b",
		CAST(K4_VG2_P3e  as decimal(15, 2)) as "K4_VG2_P3e",
		CAST(K4_VG2_P4e  as decimal(15, 2)) as "K4_VG2_P4e",
		CAST(K4_VG1_P75b as decimal(15, 1)) as "K4_VG1_P75b",
		CAST(K4_VG1_P80b as decimal(15, 1)) as "K4_VG1_P80b",
		CAST(K4_VG1_P62b as decimal(15, 1)) as "K4_VG1_P62b",
		CAST(K4_VG1_P63b as decimal(15, 1)) as "K4_VG1_P63b",
		CAST(K4_VG2_P4g  as decimal(15, 2)) as "K4_VG2_P4g"
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime,
		K4_VG1_P25b,
		K4_VG1_P72b,
		K4_VG1_P81b,
		K4_VG1_P76b,
		K4_VG1_P79b,
		K4_VG2_P3e,
		K4_VG2_P4e,
		K4_VG1_P75b,
		K4_VG1_P80b,
		K4_VG1_P62b,
		K4_VG1_P63b,
		K4_VG2_P4g
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


--{агрегированные за сутки}
--/*ReportName="КА-4 Сводная ведомость" (агрегированные за сутки)*/
--/*StartDate=01.MM.yyyy 00:00:00.000*/
--/*DeltaDate=-01.01.0000 00:00:00.000*/
--/*Step=00.01.0000 00:00:00.000*/
--/*Resolution=60000*/
--/*DateFormat=d MMMM yyyy*/
--/*DownQuery="агрегированные за час"*/
--/*Database=ptocalc*/

--SET QUOTED_IDENTIFIER OFF
--SELECT
--	DateTime as "Дата",
--	null,
--	CAST(K4_VG1_P25b as decimal(15, 1)) as "П25б<br>Тп, °С [K4_VG1_P25b]",
--	CAST(K4_VG1_P72b as decimal(15, 1)) as "П72б<br>Tyr1 [K4_VG1_P72b]",
--	CAST(K4_VG1_P81b as decimal(15, 1)) as "П81б<br>Tyr2 [K4_VG1_P81b]",
--	CAST(K4_VG1_P76b as decimal(15, 1)) as "П76б<br>tхв сл, °С [K4_VG1_P76b]",
--	CAST(K4_VG1_P79b as decimal(15, 1)) as "П79б<br>tхв спр, °С [K4_VG1_P79b]",
--	CAST(K4_VG2_P3e as decimal(15, 2)) as "П3е<br>Q2сл, % [K4_VG2_P3e]",
--	CAST(K4_VG2_P4e as decimal(15, 2)) as "П4е<br>Q2сп, % [K4_VG2_P4e]",
--	CAST(K4_VG1_P75b as decimal(15, 1)) as "П75б<br>Ttкал сл, °С [K4_VG1_P75b]",
--	CAST(K4_VG1_P80b as decimal(15, 1)) as "П80б<br>Tкал спр, °С [K4_VG1_P80b]",
--	CAST(K4_VG1_P62b as decimal(15, 1)) as "П62б<br>Тгв сл, °С [K4_VG1_P62b]",
--	CAST(K4_VG1_P63b as decimal(15, 1)) as "П63б<br>Tгв спр, °С [K4_VG1_P63b]",
--	CAST(K4_VG2_P4g as decimal(15, 2)) as "П4г<br>Gн_пр, тонн [K4_VG2_P4g]"
--FROM KA4_Aggregated
--WHERE 
--	DateTime >= @start
--	AND DateTime <= @finish
--ORDER BY DateTime