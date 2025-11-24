{срезы минутные}
/*ReportName="Отчёт КА-3 VG2. Экран 2" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P23v as decimal(15, 1)) as "П23в<br>°С [K3_VG2_P23v]",
	CAST(K3_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K3_VG2_P21v]",
	CAST(K3_VG2_P24v as decimal(15, 1)) as "П24в<br>кПа [K3_VG2_P24v]",
	CAST(K3_VG2_P22v as decimal(15, 1)) as "П22в<br>кПа [K3_VG2_P22v]",
	CAST(K3_VG2_P25v as decimal(15, 1)) as "П25в<br>кПа [K3_VG2_P25v]",
	CAST(K3_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K3_VG2_P6v]",
	CAST(K3_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K3_VG2_P7v]",
	CAST(K3_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K3_VG2_P8v]",
	CAST(K3_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K3_VG2_P9v]",
	CAST(K3_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K3_VG2_P10v]",
	CAST(K3_VG2_P11v as decimal(15, 1)) as "П11в<br>кПа [K3_VG2_P11v]",
	CAST(K3_VG2_P1g as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(K3_VG2_P5g as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P12v as decimal(15, 1)) as "П12в<br>кПа [K3_VG2_P12v]",
	CAST(K3_VG2_P13v as decimal(15, 1)) as "П13в<br>кПа [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 1)) as "П14в<br>кПа [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K3_VG2_P15v]",
	CAST(K3_VG2_P1d as decimal(15, 1)) as "П1д<br>Па [K3_VG2_P1d]",
	CAST(K3_VG2_P2d as decimal(15, 1)) as "П2д<br>Па [K3_VG2_P2d]",
	CAST(K3_VG2_P1v as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(K3_VG2_P17v as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(K3_VG2_P18v as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(K3_VG2_P2v as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(K3_VG2_P2g as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]",
	null,
	CAST(K3_VG2_P84b as decimal(15, 1)) as "П84б<br>°С [K3_VG2_P84b]",
	CAST(K3_VG2_P85b as decimal(15, 1)) as "П85б<br>°С [K3_VG2_P85b]",
	CAST(K3_VG2_P86b as decimal(15, 1)) as "П86б<br>°С [K3_VG2_P86b]",
	CAST(K3_VG2_P87b as decimal(15, 1)) as "П87б<br>°С [K3_VG2_P87b]",
	CAST(K3_VG2_P88b as decimal(15, 1)) as "П88б<br>°С [K3_VG2_P88b]",
	CAST(K3_VG2_P89b as decimal(15, 1)) as "П89б<br>°С [K3_VG2_P89b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P23v,
	K3_VG2_P21v,
	K3_VG2_P24v,
	K3_VG2_P22v,
	K3_VG2_P25v,
	K3_VG2_P6v,
	K3_VG2_P7v,
	K3_VG2_P8v,
	K3_VG2_P9v,
	K3_VG2_P10v,
	K3_VG2_P11v,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v,
	K3_VG2_P1d,
	K3_VG2_P2d,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g,
	K3_VG2_P84b,
	K3_VG2_P85b,
	K3_VG2_P86b,
	K3_VG2_P87b,
	K3_VG2_P88b,
	K3_VG2_P89b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-3 VG2. Экран 2" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P23v as decimal(15, 1)) as "П23в<br>°С [K3_VG2_P23v]",
	CAST(K3_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K3_VG2_P21v]",
	CAST(K3_VG2_P24v as decimal(15, 1)) as "П24в<br>кПа [K3_VG2_P24v]",
	CAST(K3_VG2_P22v as decimal(15, 1)) as "П22в<br>кПа [K3_VG2_P22v]",
	CAST(K3_VG2_P25v as decimal(15, 1)) as "П25в<br>кПа [K3_VG2_P25v]",
	CAST(K3_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K3_VG2_P6v]",
	CAST(K3_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K3_VG2_P7v]",
	CAST(K3_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K3_VG2_P8v]",
	CAST(K3_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K3_VG2_P9v]",
	CAST(K3_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K3_VG2_P10v]",
	CAST(K3_VG2_P11v as decimal(15, 1)) as "П11в<br>кПа [K3_VG2_P11v]",
	CAST(K3_VG2_P1g as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(K3_VG2_P5g as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P12v as decimal(15, 1)) as "П12в<br>кПа [K3_VG2_P12v]",
	CAST(K3_VG2_P13v as decimal(15, 1)) as "П13в<br>кПа [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 1)) as "П14в<br>кПа [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K3_VG2_P15v]",
	CAST(K3_VG2_P1d as decimal(15, 1)) as "П1д<br>Па [K3_VG2_P1d]",
	CAST(K3_VG2_P2d as decimal(15, 1)) as "П2д<br>Па [K3_VG2_P2d]",
	CAST(K3_VG2_P1v as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(K3_VG2_P17v as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(K3_VG2_P18v as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(K3_VG2_P2v as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(K3_VG2_P2g as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]",
	null,
	CAST(K3_VG2_P84b as decimal(15, 1)) as "П84б<br>°С [K3_VG2_P84b]",
	CAST(K3_VG2_P85b as decimal(15, 1)) as "П85б<br>°С [K3_VG2_P85b]",
	CAST(K3_VG2_P86b as decimal(15, 1)) as "П86б<br>°С [K3_VG2_P86b]",
	CAST(K3_VG2_P87b as decimal(15, 1)) as "П87б<br>°С [K3_VG2_P87b]",
	CAST(K3_VG2_P88b as decimal(15, 1)) as "П88б<br>°С [K3_VG2_P88b]",
	CAST(K3_VG2_P89b as decimal(15, 1)) as "П89б<br>°С [K3_VG2_P89b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P23v,
	K3_VG2_P21v,
	K3_VG2_P24v,
	K3_VG2_P22v,
	K3_VG2_P25v,
	K3_VG2_P6v,
	K3_VG2_P7v,
	K3_VG2_P8v,
	K3_VG2_P9v,
	K3_VG2_P10v,
	K3_VG2_P11v,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v,
	K3_VG2_P1d,
	K3_VG2_P2d,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g,
	K3_VG2_P84b,
	K3_VG2_P85b,
	K3_VG2_P86b,
	K3_VG2_P87b,
	K3_VG2_P88b,
	K3_VG2_P89b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-3 VG2. Экран 2" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P23v as decimal(15, 1)) as "П23в<br>°С [K3_VG2_P23v]",
	CAST(K3_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K3_VG2_P21v]",
	CAST(K3_VG2_P24v as decimal(15, 1)) as "П24в<br>кПа [K3_VG2_P24v]",
	CAST(K3_VG2_P22v as decimal(15, 1)) as "П22в<br>кПа [K3_VG2_P22v]",
	CAST(K3_VG2_P25v as decimal(15, 1)) as "П25в<br>кПа [K3_VG2_P25v]",
	CAST(K3_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K3_VG2_P6v]",
	CAST(K3_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K3_VG2_P7v]",
	CAST(K3_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K3_VG2_P8v]",
	CAST(K3_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K3_VG2_P9v]",
	CAST(K3_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K3_VG2_P10v]",
	CAST(K3_VG2_P11v as decimal(15, 1)) as "П11в<br>кПа [K3_VG2_P11v]",
	CAST(K3_VG2_P1g as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(K3_VG2_P4g as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(K3_VG2_P5g as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(K3_VG2_P12v as decimal(15, 1)) as "П12в<br>кПа [K3_VG2_P12v]",
	CAST(K3_VG2_P13v as decimal(15, 1)) as "П13в<br>кПа [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 1)) as "П14в<br>кПа [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K3_VG2_P15v]",
	CAST(K3_VG2_P1d as decimal(15, 1)) as "П1д<br>Па [K3_VG2_P1d]",
	CAST(K3_VG2_P2d as decimal(15, 1)) as "П2д<br>Па [K3_VG2_P2d]",
	CAST(K3_VG2_P1v as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(K3_VG2_P17v as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(K3_VG2_P18v as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(K3_VG2_P2v as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(K3_VG2_P2g as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(K3_VG2_P3g as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]",
	null,
	CAST(K3_VG2_P84b as decimal(15, 1)) as "П84б<br>°С [K3_VG2_P84b]",
	CAST(K3_VG2_P85b as decimal(15, 1)) as "П85б<br>°С [K3_VG2_P85b]",
	CAST(K3_VG2_P86b as decimal(15, 1)) as "П86б<br>°С [K3_VG2_P86b]",
	CAST(K3_VG2_P87b as decimal(15, 1)) as "П87б<br>°С [K3_VG2_P87b]",
	CAST(K3_VG2_P88b as decimal(15, 1)) as "П88б<br>°С [K3_VG2_P88b]",
	CAST(K3_VG2_P89b as decimal(15, 1)) as "П89б<br>°С [K3_VG2_P89b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P23v,
	K3_VG2_P21v,
	K3_VG2_P24v,
	K3_VG2_P22v,
	K3_VG2_P25v,
	K3_VG2_P6v,
	K3_VG2_P7v,
	K3_VG2_P8v,
	K3_VG2_P9v,
	K3_VG2_P10v,
	K3_VG2_P11v,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v,
	K3_VG2_P1d,
	K3_VG2_P2d,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g,
	K3_VG2_P84b,
	K3_VG2_P85b,
	K3_VG2_P86b,
	K3_VG2_P87b,
	K3_VG2_P88b,
	K3_VG2_P89b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-3 VG2. Экран 2" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(K3_VG2_P23v) as decimal(15, 1)) as "П23в<br>°С [K3_VG2_P23v]",
	CAST(AVG(K3_VG2_P21v) as decimal(15, 1)) as "П21в<br>кПа [K3_VG2_P21v]",
	CAST(AVG(K3_VG2_P24v) as decimal(15, 1)) as "П24в<br>кПа [K3_VG2_P24v]",
	CAST(AVG(K3_VG2_P22v) as decimal(15, 1)) as "П22в<br>кПа [K3_VG2_P22v]",
	CAST(AVG(K3_VG2_P25v) as decimal(15, 1)) as "П25в<br>кПа [K3_VG2_P25v]",
	CAST(AVG(K3_VG2_P6v) as decimal(15, 1)) as "П6в<br>кПа [K3_VG2_P6v]",
	CAST(AVG(K3_VG2_P7v) as decimal(15, 1)) as "П7в<br>кПа [K3_VG2_P7v]",
	CAST(AVG(K3_VG2_P8v) as decimal(15, 1)) as "П8в<br>кПа [K3_VG2_P8v]",
	CAST(AVG(K3_VG2_P9v) as decimal(15, 1)) as "П9в<br>кПа [K3_VG2_P9v]",
	CAST(AVG(K3_VG2_P10v) as decimal(15, 1)) as "П10в<br>кПа [K3_VG2_P10v]",
	CAST(AVG(K3_VG2_P11v) as decimal(15, 1)) as "П11в<br>кПа [K3_VG2_P11v]",
	CAST(AVG(K3_VG2_P1g) as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(AVG(K3_VG2_P4g) as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(AVG(K3_VG2_P5g) as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(AVG(K3_VG2_P12v) as decimal(15, 1)) as "П12в<br>кПа [K3_VG2_P12v]",
	CAST(AVG(K3_VG2_P13v) as decimal(15, 1)) as "П13в<br>кПа [K3_VG2_P13v]",
	CAST(AVG(K3_VG2_P14v) as decimal(15, 1)) as "П14в<br>кПа [K3_VG2_P14v]",
	CAST(AVG(K3_VG2_P15v) as decimal(15, 1)) as "П15в<br>кПа [K3_VG2_P15v]",
	CAST(AVG(K3_VG2_P1d) as decimal(15, 1)) as "П1д<br>Па [K3_VG2_P1d]",
	CAST(AVG(K3_VG2_P2d) as decimal(15, 1)) as "П2д<br>Па [K3_VG2_P2d]",
	CAST(AVG(K3_VG2_P1v) as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(AVG(K3_VG2_P17v) as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(AVG(K3_VG2_P18v) as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(AVG(K3_VG2_P2v) as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(AVG(K3_VG2_P2g) as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(AVG(K3_VG2_P3g) as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]",
	null,
	CAST(AVG(K3_VG2_P84b) as decimal(15, 1)) as "П84б<br>°С [K3_VG2_P84b]",
	CAST(AVG(K3_VG2_P85b) as decimal(15, 1)) as "П85б<br>°С [K3_VG2_P85b]",
	CAST(AVG(K3_VG2_P86b) as decimal(15, 1)) as "П86б<br>°С [K3_VG2_P86b]",
	CAST(AVG(K3_VG2_P87b) as decimal(15, 1)) as "П87б<br>°С [K3_VG2_P87b]",
	CAST(AVG(K3_VG2_P88b) as decimal(15, 1)) as "П88б<br>°С [K3_VG2_P88b]",
	CAST(AVG(K3_VG2_P89b) as decimal(15, 1)) as "П89б<br>°С [K3_VG2_P89b]"
FROM
	OpenQuery(INSQL,
		"SELECT DateTime, 
		K3_VG2_P23v,
		K3_VG2_P21v,
		K3_VG2_P24v,
		K3_VG2_P22v,
		K3_VG2_P25v,
		K3_VG2_P6v,
		K3_VG2_P7v,
		K3_VG2_P8v,
		K3_VG2_P9v,
		K3_VG2_P10v,
		K3_VG2_P11v,
		K3_VG2_P1g,
		K3_VG2_P4g,
		K3_VG2_P5g,
		K3_VG2_P12v,
		K3_VG2_P13v,
		K3_VG2_P14v,
		K3_VG2_P15v,
		K3_VG2_P1d,
		K3_VG2_P2d,
		K3_VG2_P1v,
		K3_VG2_P17v,
		K3_VG2_P18v,
		K3_VG2_P2v,
		K3_VG2_P2g,
		K3_VG2_P3g,
		K3_VG2_P84b,
		K3_VG2_P85b,
		K3_VG2_P86b,
		K3_VG2_P87b,
		K3_VG2_P88b,
		K3_VG2_P89b
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
/*ReportName="Отчёт КА-3 VG2. Экран 2" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(K3_VG2_P23v) as decimal(15, 1)) as "П23в<br>°С [K3_VG2_P23v]",
	CAST(AVG(K3_VG2_P21v) as decimal(15, 1)) as "П21в<br>кПа [K3_VG2_P21v]",
	CAST(AVG(K3_VG2_P24v) as decimal(15, 1)) as "П24в<br>кПа [K3_VG2_P24v]",
	CAST(AVG(K3_VG2_P22v) as decimal(15, 1)) as "П22в<br>кПа [K3_VG2_P22v]",
	CAST(AVG(K3_VG2_P25v) as decimal(15, 1)) as "П25в<br>кПа [K3_VG2_P25v]",
	CAST(AVG(K3_VG2_P6v) as decimal(15, 1)) as "П6в<br>кПа [K3_VG2_P6v]",
	CAST(AVG(K3_VG2_P7v) as decimal(15, 1)) as "П7в<br>кПа [K3_VG2_P7v]",
	CAST(AVG(K3_VG2_P8v) as decimal(15, 1)) as "П8в<br>кПа [K3_VG2_P8v]",
	CAST(AVG(K3_VG2_P9v) as decimal(15, 1)) as "П9в<br>кПа [K3_VG2_P9v]",
	CAST(AVG(K3_VG2_P10v) as decimal(15, 1)) as "П10в<br>кПа [K3_VG2_P10v]",
	CAST(AVG(K3_VG2_P11v) as decimal(15, 1)) as "П11в<br>кПа [K3_VG2_P11v]",
	CAST(AVG(K3_VG2_P1g) as decimal(15, 1)) as "П1г<br>т/ч [K3_VG2_P1g]",
	CAST(AVG(K3_VG2_P4g) as decimal(15, 1)) as "П4г<br>т/ч [K3_VG2_P4g]",
	CAST(AVG(K3_VG2_P5g) as decimal(15, 1)) as "П5г<br>т/ч [K3_VG2_P5g]",
	CAST(AVG(K3_VG2_P12v) as decimal(15, 1)) as "П12в<br>кПа [K3_VG2_P12v]",
	CAST(AVG(K3_VG2_P13v) as decimal(15, 1)) as "П13в<br>кПа [K3_VG2_P13v]",
	CAST(AVG(K3_VG2_P14v) as decimal(15, 1)) as "П14в<br>кПа [K3_VG2_P14v]",
	CAST(AVG(K3_VG2_P15v) as decimal(15, 1)) as "П15в<br>кПа [K3_VG2_P15v]",
	CAST(AVG(K3_VG2_P1d) as decimal(15, 1)) as "П1д<br>Па [K3_VG2_P1d]",
	CAST(AVG(K3_VG2_P2d) as decimal(15, 1)) as "П2д<br>Па [K3_VG2_P2d]",
	CAST(AVG(K3_VG2_P1v) as decimal(15, 1)) as "П1в<br>МПа [K3_VG2_P1v]",
	null,
	CAST(AVG(K3_VG2_P17v) as decimal(15, 1)) as "П17в<br>МПа [K3_VG2_P17v]",
	CAST(AVG(K3_VG2_P18v) as decimal(15, 1)) as "П18в<br>МПа [K3_VG2_P18v]",
	null,
	CAST(AVG(K3_VG2_P2v) as decimal(15, 1)) as "П2в<br>МПа [K3_VG2_P2v]",
	null,
	CAST(AVG(K3_VG2_P2g) as decimal(15, 1)) as "П2г<br>т/ч [K3_VG2_P2g]",
	CAST(AVG(K3_VG2_P3g) as decimal(15, 1)) as "П3г<br>т/ч [K3_VG2_P3g]",
	null,
	CAST(AVG(K3_VG2_P84b) as decimal(15, 1)) as "П84б<br>°С [K3_VG2_P84b]",
	CAST(AVG(K3_VG2_P85b) as decimal(15, 1)) as "П85б<br>°С [K3_VG2_P85b]",
	CAST(AVG(K3_VG2_P86b) as decimal(15, 1)) as "П86б<br>°С [K3_VG2_P86b]",
	CAST(AVG(K3_VG2_P87b) as decimal(15, 1)) as "П87б<br>°С [K3_VG2_P87b]",
	CAST(AVG(K3_VG2_P88b) as decimal(15, 1)) as "П88б<br>°С [K3_VG2_P88b]",
	CAST(AVG(K3_VG2_P89b) as decimal(15, 1)) as "П89б<br>°С [K3_VG2_P89b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P23v,
	K3_VG2_P21v,
	K3_VG2_P24v,
	K3_VG2_P22v,
	K3_VG2_P25v,
	K3_VG2_P6v,
	K3_VG2_P7v,
	K3_VG2_P8v,
	K3_VG2_P9v,
	K3_VG2_P10v,
	K3_VG2_P11v,
	K3_VG2_P1g,
	K3_VG2_P4g,
	K3_VG2_P5g,
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v,
	K3_VG2_P1d,
	K3_VG2_P2d,
	K3_VG2_P1v,
	K3_VG2_P17v,
	K3_VG2_P18v,
	K3_VG2_P2v,
	K3_VG2_P2g,
	K3_VG2_P3g,
	K3_VG2_P84b,
	K3_VG2_P85b,
	K3_VG2_P86b,
	K3_VG2_P87b,
	K3_VG2_P88b,
	K3_VG2_P89b
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
