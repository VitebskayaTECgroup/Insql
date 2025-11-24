{срезы минутные}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P77b as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(K3_VG2_P12b as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(K3_VG2_P10b as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(K3_VG2_P1b as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(K3_VG2_P2b as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(K3_VG2_P11b as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(K3_VG2_P79b as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	null,
	CAST(K3_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(K3_VG2_P1g as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(K3_VG2_P5g as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P1v as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(K3_VG2_P17v as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(K3_VG2_P18v as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(K3_VG2_P2v as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(K3_VG2_P2g as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P77b as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(K3_VG2_P12b as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(K3_VG2_P10b as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(K3_VG2_P1b as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(K3_VG2_P2b as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(K3_VG2_P11b as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(K3_VG2_P79b as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	null,
	CAST(K3_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(K3_VG2_P1g as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(K3_VG2_P5g as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P1v as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(K3_VG2_P17v as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(K3_VG2_P18v as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(K3_VG2_P2v as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(K3_VG2_P2g as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P77b as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(K3_VG2_P12b as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(K3_VG2_P10b as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(K3_VG2_P1b as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(K3_VG2_P2b as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(K3_VG2_P11b as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(K3_VG2_P79b as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	null,
	CAST(K3_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(K3_VG2_P1g as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(K3_VG2_P5g as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P1v as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(K3_VG2_P17v as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(K3_VG2_P18v as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(K3_VG2_P2v as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(K3_VG2_P2g as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(K3_VG2_P77b) as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(AVG(K3_VG2_P12b) as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(AVG(K3_VG2_P10b) as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(AVG(K3_VG2_P1b) as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(AVG(K3_VG2_P2b) as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(AVG(K3_VG2_P11b) as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(AVG(K3_VG2_P79b) as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	null,
	CAST(AVG(K3_VG2_P4d) as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(AVG(K3_VG2_P3d) as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(AVG(K3_VG2_P1g) as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(AVG(K3_VG2_P4g) as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(AVG(K3_VG2_P5g) as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(AVG(K3_VG2_P1v) as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(AVG(K3_VG2_P17v) as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(AVG(K3_VG2_P18v) as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(AVG(K3_VG2_P2v) as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(AVG(K3_VG2_P2g) as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(AVG(K3_VG2_P3g) as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]"
FROM
	OpenQuery(INSQL,
		"SELECT DateTime, 
		K3_VG2_P77b,
		K3_VG2_P12b,
		K3_VG2_P10b,
		K3_VG2_P1b,
		K3_VG2_P2b,
		K3_VG2_P11b,
		K3_VG2_P79b,
		K3_VG2_P4d,
		K3_VG2_P3d,
		K3_VG2_P1g,
		K3_VG2_P4g,
		K3_VG2_P5g,
		K3_VG2_P1v,
		K3_VG2_P17v,
		K3_VG2_P18v,
		K3_VG2_P2v,
		K3_VG2_P2g,
		K3_VG2_P3g
		FROM Runtime.dbo.AnalogWideHistory
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime

{агрегированные за сутки}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(K3_VG2_P77b) as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(AVG(K3_VG2_P12b) as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(AVG(K3_VG2_P10b) as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(AVG(K3_VG2_P1b) as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(AVG(K3_VG2_P2b) as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(AVG(K3_VG2_P11b) as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(AVG(K3_VG2_P79b) as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	null,
	CAST(AVG(K3_VG2_P4d) as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(AVG(K3_VG2_P3d) as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(AVG(K3_VG2_P1g) as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(AVG(K3_VG2_P4g) as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(AVG(K3_VG2_P5g) as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(AVG(K3_VG2_P1v) as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(AVG(K3_VG2_P17v) as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(AVG(K3_VG2_P18v) as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(AVG(K3_VG2_P2v) as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(AVG(K3_VG2_P2g) as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(AVG(K3_VG2_P3g) as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime
