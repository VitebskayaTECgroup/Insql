{минутные срезы}
/*ReportName="КА-5 Сводная ведомость" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(KA5_VG1_K058, 2) as ", °С [KA5_VG1_K058][Desc]",
	ROUND(KA5_VG1_K089, 2) as ", °С [KA5_VG1_K089][Desc]",
	ROUND(KA5_VG1_K090, 2) as ", °С [KA5_VG1_K090][Desc]",
	ROUND(KA5_VG1_K099, 2) as ", °С [KA5_VG1_K099][Desc]",
	ROUND(KA5_VG1_K091, 2) as ", °С [KA5_VG1_K091][Desc]",
	ROUND(KA5_VG1_K095, 2) as ", °С [KA5_VG1_K095][Desc]",
	ROUND(KA5_VG1_K021, 2) as ", °С [KA5_VG1_K021][Desc]",
	ROUND(KA5_VG1_K022, 2) as ", °С [KA5_VG1_K022][Desc]",
	ROUND(KA5_VG1_K001, 2) as ", %  [KA5_VG1_K001][Desc]",
	ROUND(KA5_VG1_K002, 2) as ", %  [KA5_VG1_K002][Desc]",
	ROUND(KA5_VG1_K093, 2) as ", °С [KA5_VG1_K093][Desc]",
	ROUND(KA5_VG1_K097, 2) as ", °С [KA5_VG1_K097][Desc]",
	ROUND(KA5_VG1_K103, 2) as ", °С [KA5_VG1_K103][Desc]",
	ROUND(KA5_VG1_K104, 2) as ", °С [KA5_VG1_K104][Desc]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K021,
	KA5_VG1_K022,
	KA5_VG1_K058,
	KA5_VG1_K089,
	KA5_VG1_K090,
	KA5_VG1_K099,
	KA5_VG1_K091,
	KA5_VG1_K095,
	KA5_VG1_K001,
	KA5_VG1_K002,
	KA5_VG1_K093,
	KA5_VG1_K097,
	KA5_VG1_K103,
	KA5_VG1_K104
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="КА-5 Сводная ведомость" (агрегированные за час)*/
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
	ROUND(AVG(KA5_VG1_K058), 2) as ", °С [KA5_VG1_K058][Desc]",
	ROUND(AVG(KA5_VG1_K089), 2) as ", °С [KA5_VG1_K089][Desc]",
	ROUND(AVG(KA5_VG1_K090), 2) as ", °С [KA5_VG1_K090][Desc]",
	ROUND(AVG(KA5_VG1_K099), 2) as ", °С [KA5_VG1_K099][Desc]",
	ROUND(AVG(KA5_VG1_K091), 2) as ", °С [KA5_VG1_K091][Desc]",
	ROUND(AVG(KA5_VG1_K095), 2) as ", °С [KA5_VG1_K095][Desc]",
	ROUND(AVG(KA5_VG1_K021), 2) as ", °С [KA5_VG1_K021][Desc]",
	ROUND(AVG(KA5_VG1_K022), 2) as ", °С [KA5_VG1_K022][Desc]",
	ROUND(AVG(KA5_VG1_K001), 2) as ", %  [KA5_VG1_K001][Desc]",
	ROUND(AVG(KA5_VG1_K002), 2) as ", %  [KA5_VG1_K002][Desc]",
	ROUND(AVG(KA5_VG1_K093), 2) as ", °С [KA5_VG1_K093][Desc]",
	ROUND(AVG(KA5_VG1_K097), 2) as ", °С [KA5_VG1_K097][Desc]",
	ROUND(AVG(KA5_VG1_K103), 2) as ", °С [KA5_VG1_K103][Desc]",
	ROUND(AVG(KA5_VG1_K104), 2) as ", °С [KA5_VG1_K104][Desc]"
FROM (
	SELECT
		DateAdd(hour, DateDiff(hour, 0, DateAdd(mi, -1, DateTime)), 0) as "DateTime",
		ROUND(KA5_VG1_K058, 2) as "KA5_VG1_K058",
		ROUND(KA5_VG1_K089, 2) as "KA5_VG1_K089",
		ROUND(KA5_VG1_K090, 2) as "KA5_VG1_K090",
		ROUND(KA5_VG1_K099, 2) as "KA5_VG1_K099",
		ROUND(KA5_VG1_K091, 2) as "KA5_VG1_K091",
		ROUND(KA5_VG1_K095, 2) as "KA5_VG1_K095",
		ROUND(KA5_VG1_K021, 2) as "KA5_VG1_K021",
		ROUND(KA5_VG1_K022, 2) as "KA5_VG1_K022",
		ROUND(KA5_VG1_K001, 2) as "KA5_VG1_K001",
		ROUND(KA5_VG1_K002, 2) as "KA5_VG1_K002",
		ROUND(KA5_VG1_K093, 2) as "KA5_VG1_K093",
		ROUND(KA5_VG1_K097, 2) as "KA5_VG1_K097",
		ROUND(KA5_VG1_K103, 2) as "KA5_VG1_K103",
		ROUND(KA5_VG1_K104, 2) as "KA5_VG1_K104"
	FROM
		OpenQuery(INSQL,
		"SELECT DateTime,
		KA5_VG1_K058,
		KA5_VG1_K089,
		KA5_VG1_K090,
		KA5_VG1_K099,
		KA5_VG1_K091,
		KA5_VG1_K095,
		KA5_VG1_K021,
		KA5_VG1_K022,
		KA5_VG1_K001,
		KA5_VG1_K002,
		KA5_VG1_K093,
		KA5_VG1_K097,
		KA5_VG1_K103,
		KA5_VG1_K104
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
/*ReportName="КА-5 Сводная ведомость" (агрегированные за сутки)*/
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
	ROUND(KA5_VG1_K058, 2) as ", °С [KA5_VG1_K058][Desc]",
	ROUND(KA5_VG1_K089, 2) as ", °С [KA5_VG1_K089][Desc]",
	ROUND(KA5_VG1_K090, 2) as ", °С [KA5_VG1_K090][Desc]",
	ROUND(KA5_VG1_K099, 2) as ", °С [KA5_VG1_K099][Desc]",
	ROUND(KA5_VG1_K091, 2) as ", °С [KA5_VG1_K091][Desc]",
	ROUND(KA5_VG1_K095, 2) as ", °С [KA5_VG1_K095][Desc]",
	ROUND(KA5_VG1_K021, 2) as ", °С [KA5_VG1_K021][Desc]",
	ROUND(KA5_VG1_K022, 2) as ", °С [KA5_VG1_K022][Desc]",
	ROUND(KA5_VG1_K001, 2) as ", %  [KA5_VG1_K001][Desc]",
	ROUND(KA5_VG1_K002, 2) as ", %  [KA5_VG1_K002][Desc]",
	ROUND(KA5_VG1_K093, 2) as ", °С [KA5_VG1_K093][Desc]",
	ROUND(KA5_VG1_K097, 2) as ", °С [KA5_VG1_K097][Desc]",
	ROUND(KA5_VG1_K103, 2) as ", °С [KA5_VG1_K103][Desc]",
	ROUND(KA5_VG1_K104, 2) as ", °С [KA5_VG1_K104][Desc]"
FROM KA5_Aggregated
WHERE 
	DateTime >= @start
	AND DateTime <= @finish
ORDER BY DateTime