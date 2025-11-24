{срезы минутные}
/*ReportName="Отчёт КА-4 VG2. Экран 1" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K4_VG2_P3e]",
	CAST(K4_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K4_VG2_P4e]",
	CAST(K4_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K4_VG2_P5e]",
	CAST(K4_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K4_VG2_P6e]",
	null,
	CAST(K4_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K4_VG2_P7d]",
	CAST(K4_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K4_VG2_P5d]",
	CAST(K4_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K4_VG2_P6d]",
	CAST(K4_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K4_VG2_P10d]",
	CAST(K4_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K4_VG2_P8d]",
	CAST(K4_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K4_VG2_P9d]",
	CAST(K4_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K4_VG2_P4d]",
	CAST(K4_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K4_VG2_P3d]",
	CAST(K4_VG2_P16v as decimal(15, 1)) as "П16в<br>кПа [K4_VG2_P16v]",
	CAST(K4_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K4_VG2_P15v]",
	CAST(K4_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K4_VG2_P19v]",
	CAST(K4_VG2_P17v as decimal(15, 1)) as "П17в<br>кПа [K4_VG2_P17v]",
	CAST(K4_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K4_VG2_P20v]",
	CAST(K4_VG2_P18v as decimal(15, 1)) as "П18в<br>кПа [K4_VG2_P18v]",
	CAST(K4_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K4_VG2_P21v]",
	CAST(K4_VG2_P4v as decimal(15, 1)) as "П4в<br>кПа [K4_VG2_P4v]",
	CAST(K4_VG2_P5v as decimal(15, 1)) as "П5в<br>кПа [K4_VG2_P5v]",
	CAST(K4_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K4_VG2_P6v]",
	CAST(K4_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K4_VG2_P7v]",
	CAST(K4_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K4_VG2_P8v]",
	CAST(K4_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K4_VG2_P9v]",
	CAST(K4_VG2_P4g as decimal(15, 1)) as "П4г<br>кПа [K4_VG2_P4g]",
	CAST(K4_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K4_VG2_P10v]",
	CAST(K4_VG2_P9g as decimal(15, 1)) as "П9г<br>кПа [K4_VG2_P9g]",
	CAST(K4_VG2_P11d as decimal(15, 1)) as "П11д<br>кПа [K4_VG2_P11d]",
	CAST(K4_VG2_P12d as decimal(15, 1)) as "П12д<br>кПа [K4_VG2_P12d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG2_P3e,
	K4_VG2_P4e,
	K4_VG2_P5e,
	K4_VG2_P6e,
	K4_VG2_P7d,
	K4_VG2_P5d,
	K4_VG2_P6d,
	K4_VG2_P10d,
	K4_VG2_P8d,
	K4_VG2_P9d,
	K4_VG2_P4d,
	K4_VG2_P3d,
	K4_VG2_P16v,
	K4_VG2_P15v,
	K4_VG2_P19v,
	K4_VG2_P17v,
	K4_VG2_P20v,
	K4_VG2_P18v,
	K4_VG2_P21v,
	K4_VG2_P4v,
	K4_VG2_P5v,
	K4_VG2_P6v,
	K4_VG2_P7v,
	K4_VG2_P8v,
	K4_VG2_P9v,
	K4_VG2_P4g,
	K4_VG2_P10v,
	K4_VG2_P9g,
	K4_VG2_P11d,
	K4_VG2_P12d
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-4 VG2. Экран 1" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K4_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K4_VG2_P3e]",
	CAST(K4_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K4_VG2_P4e]",
	CAST(K4_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K4_VG2_P5e]",
	CAST(K4_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K4_VG2_P6e]",
	null,
	CAST(K4_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K4_VG2_P7d]",
	CAST(K4_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K4_VG2_P5d]",
	CAST(K4_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K4_VG2_P6d]",
	CAST(K4_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K4_VG2_P10d]",
	CAST(K4_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K4_VG2_P8d]",
	CAST(K4_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K4_VG2_P9d]",
	CAST(K4_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K4_VG2_P4d]",
	CAST(K4_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K4_VG2_P3d]",
	CAST(K4_VG2_P16v as decimal(15, 1)) as "П16в<br>кПа [K4_VG2_P16v]",
	CAST(K4_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K4_VG2_P15v]",
	CAST(K4_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K4_VG2_P19v]",
	CAST(K4_VG2_P17v as decimal(15, 1)) as "П17в<br>кПа [K4_VG2_P17v]",
	CAST(K4_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K4_VG2_P20v]",
	CAST(K4_VG2_P18v as decimal(15, 1)) as "П18в<br>кПа [K4_VG2_P18v]",
	CAST(K4_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K4_VG2_P21v]",
	CAST(K4_VG2_P4v as decimal(15, 1)) as "П4в<br>кПа [K4_VG2_P4v]",
	CAST(K4_VG2_P5v as decimal(15, 1)) as "П5в<br>кПа [K4_VG2_P5v]",
	CAST(K4_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K4_VG2_P6v]",
	CAST(K4_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K4_VG2_P7v]",
	CAST(K4_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K4_VG2_P8v]",
	CAST(K4_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K4_VG2_P9v]",
	CAST(K4_VG2_P4g as decimal(15, 1)) as "П4г<br>кПа [K4_VG2_P4g]",
	CAST(K4_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K4_VG2_P10v]",
	CAST(K4_VG2_P9g as decimal(15, 1)) as "П9г<br>кПа [K4_VG2_P9g]",
	CAST(K4_VG2_P11d as decimal(15, 1)) as "П11д<br>кПа [K4_VG2_P11d]",
	CAST(K4_VG2_P12d as decimal(15, 1)) as "П12д<br>кПа [K4_VG2_P12d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG2_P3e,
	K4_VG2_P4e,
	K4_VG2_P5e,
	K4_VG2_P6e,
	K4_VG2_P7d,
	K4_VG2_P5d,
	K4_VG2_P6d,
	K4_VG2_P10d,
	K4_VG2_P8d,
	K4_VG2_P9d,
	K4_VG2_P4d,
	K4_VG2_P3d,
	K4_VG2_P16v,
	K4_VG2_P15v,
	K4_VG2_P19v,
	K4_VG2_P17v,
	K4_VG2_P20v,
	K4_VG2_P18v,
	K4_VG2_P21v,
	K4_VG2_P4v,
	K4_VG2_P5v,
	K4_VG2_P6v,
	K4_VG2_P7v,
	K4_VG2_P8v,
	K4_VG2_P9v,
	K4_VG2_P4g,
	K4_VG2_P10v,
	K4_VG2_P9g,
	K4_VG2_P11d,
	K4_VG2_P12d
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-4 VG2. Экран 1" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K4_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K4_VG2_P3e]",
	CAST(K4_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K4_VG2_P4e]",
	CAST(K4_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K4_VG2_P5e]",
	CAST(K4_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K4_VG2_P6e]",
	null,
	CAST(K4_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K4_VG2_P7d]",
	CAST(K4_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K4_VG2_P5d]",
	CAST(K4_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K4_VG2_P6d]",
	CAST(K4_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K4_VG2_P10d]",
	CAST(K4_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K4_VG2_P8d]",
	CAST(K4_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K4_VG2_P9d]",
	CAST(K4_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K4_VG2_P4d]",
	CAST(K4_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K4_VG2_P3d]",
	CAST(K4_VG2_P16v as decimal(15, 1)) as "П16в<br>кПа [K4_VG2_P16v]",
	CAST(K4_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K4_VG2_P15v]",
	CAST(K4_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K4_VG2_P19v]",
	CAST(K4_VG2_P17v as decimal(15, 1)) as "П17в<br>кПа [K4_VG2_P17v]",
	CAST(K4_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K4_VG2_P20v]",
	CAST(K4_VG2_P18v as decimal(15, 1)) as "П18в<br>кПа [K4_VG2_P18v]",
	CAST(K4_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K4_VG2_P21v]",
	CAST(K4_VG2_P4v as decimal(15, 1)) as "П4в<br>кПа [K4_VG2_P4v]",
	CAST(K4_VG2_P5v as decimal(15, 1)) as "П5в<br>кПа [K4_VG2_P5v]",
	CAST(K4_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K4_VG2_P6v]",
	CAST(K4_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K4_VG2_P7v]",
	CAST(K4_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K4_VG2_P8v]",
	CAST(K4_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K4_VG2_P9v]",
	CAST(K4_VG2_P4g as decimal(15, 1)) as "П4г<br>кПа [K4_VG2_P4g]",
	CAST(K4_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K4_VG2_P10v]",
	CAST(K4_VG2_P9g as decimal(15, 1)) as "П9г<br>кПа [K4_VG2_P9g]",
	CAST(K4_VG2_P11d as decimal(15, 1)) as "П11д<br>кПа [K4_VG2_P11d]",
	CAST(K4_VG2_P12d as decimal(15, 1)) as "П12д<br>кПа [K4_VG2_P12d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG2_P3e,
	K4_VG2_P4e,
	K4_VG2_P5e,
	K4_VG2_P6e,
	K4_VG2_P7d,
	K4_VG2_P5d,
	K4_VG2_P6d,
	K4_VG2_P10d,
	K4_VG2_P8d,
	K4_VG2_P9d,
	K4_VG2_P4d,
	K4_VG2_P3d,
	K4_VG2_P16v,
	K4_VG2_P15v,
	K4_VG2_P19v,
	K4_VG2_P17v,
	K4_VG2_P20v,
	K4_VG2_P18v,
	K4_VG2_P21v,
	K4_VG2_P4v,
	K4_VG2_P5v,
	K4_VG2_P6v,
	K4_VG2_P7v,
	K4_VG2_P8v,
	K4_VG2_P9v,
	K4_VG2_P4g,
	K4_VG2_P10v,
	K4_VG2_P9g,
	K4_VG2_P11d,
	K4_VG2_P12d
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-4 VG2. Экран 1" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K4_VG2_P3e]",
	CAST(K4_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K4_VG2_P4e]",
	CAST(K4_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K4_VG2_P5e]",
	CAST(K4_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K4_VG2_P6e]",
	null,
	CAST(K4_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K4_VG2_P7d]",
	CAST(K4_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K4_VG2_P5d]",
	CAST(K4_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K4_VG2_P6d]",
	CAST(K4_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K4_VG2_P10d]",
	CAST(K4_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K4_VG2_P8d]",
	CAST(K4_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K4_VG2_P9d]",
	CAST(K4_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K4_VG2_P4d]",
	CAST(K4_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K4_VG2_P3d]",
	CAST(K4_VG2_P16v as decimal(15, 1)) as "П16в<br>кПа [K4_VG2_P16v]",
	CAST(K4_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K4_VG2_P15v]",
	CAST(K4_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K4_VG2_P19v]",
	CAST(K4_VG2_P17v as decimal(15, 1)) as "П17в<br>кПа [K4_VG2_P17v]",
	CAST(K4_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K4_VG2_P20v]",
	CAST(K4_VG2_P18v as decimal(15, 1)) as "П18в<br>кПа [K4_VG2_P18v]",
	CAST(K4_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K4_VG2_P21v]",
	CAST(K4_VG2_P4v as decimal(15, 1)) as "П4в<br>кПа [K4_VG2_P4v]",
	CAST(K4_VG2_P5v as decimal(15, 1)) as "П5в<br>кПа [K4_VG2_P5v]",
	CAST(K4_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K4_VG2_P6v]",
	CAST(K4_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K4_VG2_P7v]",
	CAST(K4_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K4_VG2_P8v]",
	CAST(K4_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K4_VG2_P9v]",
	CAST(K4_VG2_P4g as decimal(15, 1)) as "П4г<br>кПа [K4_VG2_P4g]",
	CAST(K4_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K4_VG2_P10v]",
	CAST(K4_VG2_P9g as decimal(15, 1)) as "П9г<br>кПа [K4_VG2_P9g]",
	CAST(K4_VG2_P11d as decimal(15, 1)) as "П11д<br>кПа [K4_VG2_P11d]",
	CAST(K4_VG2_P12d as decimal(15, 1)) as "П12д<br>кПа [K4_VG2_P12d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
	K4_VG2_P3e,
	K4_VG2_P4e,
	K4_VG2_P5e,
	K4_VG2_P6e,
	K4_VG2_P7d,
	K4_VG2_P5d,
	K4_VG2_P6d,
	K4_VG2_P10d,
	K4_VG2_P8d,
	K4_VG2_P9d,
	K4_VG2_P4d,
	K4_VG2_P3d,
	K4_VG2_P16v,
	K4_VG2_P15v,
	K4_VG2_P19v,
	K4_VG2_P17v,
	K4_VG2_P20v,
	K4_VG2_P18v,
	K4_VG2_P21v,
	K4_VG2_P4v,
	K4_VG2_P5v,
	K4_VG2_P6v,
	K4_VG2_P7v,
	K4_VG2_P8v,
	K4_VG2_P9v,
	K4_VG2_P4g,
	K4_VG2_P10v,
	K4_VG2_P9g,
	K4_VG2_P11d,
	K4_VG2_P12d
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
/*ReportName="Отчёт КА-4 VG2. Экран 1" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(K4_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K4_VG2_P3e]",
	CAST(K4_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K4_VG2_P4e]",
	CAST(K4_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K4_VG2_P5e]",
	CAST(K4_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K4_VG2_P6e]",
	null,
	CAST(K4_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K4_VG2_P7d]",
	CAST(K4_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K4_VG2_P5d]",
	CAST(K4_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K4_VG2_P6d]",
	CAST(K4_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K4_VG2_P10d]",
	CAST(K4_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K4_VG2_P8d]",
	CAST(K4_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K4_VG2_P9d]",
	CAST(K4_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K4_VG2_P4d]",
	CAST(K4_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K4_VG2_P3d]",
	CAST(K4_VG2_P16v as decimal(15, 1)) as "П16в<br>кПа [K4_VG2_P16v]",
	CAST(K4_VG2_P15v as decimal(15, 1)) as "П15в<br>кПа [K4_VG2_P15v]",
	CAST(K4_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K4_VG2_P19v]",
	CAST(K4_VG2_P17v as decimal(15, 1)) as "П17в<br>кПа [K4_VG2_P17v]",
	CAST(K4_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K4_VG2_P20v]",
	CAST(K4_VG2_P18v as decimal(15, 1)) as "П18в<br>кПа [K4_VG2_P18v]",
	CAST(K4_VG2_P21v as decimal(15, 1)) as "П21в<br>кПа [K4_VG2_P21v]",
	CAST(K4_VG2_P4v as decimal(15, 1)) as "П4в<br>кПа [K4_VG2_P4v]",
	CAST(K4_VG2_P5v as decimal(15, 1)) as "П5в<br>кПа [K4_VG2_P5v]",
	CAST(K4_VG2_P6v as decimal(15, 1)) as "П6в<br>кПа [K4_VG2_P6v]",
	CAST(K4_VG2_P7v as decimal(15, 1)) as "П7в<br>кПа [K4_VG2_P7v]",
	CAST(K4_VG2_P8v as decimal(15, 1)) as "П8в<br>кПа [K4_VG2_P8v]",
	CAST(K4_VG2_P9v as decimal(15, 1)) as "П9в<br>кПа [K4_VG2_P9v]",
	CAST(K4_VG2_P4g as decimal(15, 1)) as "П4г<br>кПа [K4_VG2_P4g]",
	CAST(K4_VG2_P10v as decimal(15, 1)) as "П10в<br>кПа [K4_VG2_P10v]",
	CAST(K4_VG2_P9g as decimal(15, 1)) as "П9г<br>кПа [K4_VG2_P9g]",
	CAST(K4_VG2_P11d as decimal(15, 1)) as "П11д<br>кПа [K4_VG2_P11d]",
	CAST(K4_VG2_P12d as decimal(15, 1)) as "П12д<br>кПа [K4_VG2_P12d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K4_VG2_P3e,
	K4_VG2_P4e,
	K4_VG2_P5e,
	K4_VG2_P6e,
	K4_VG2_P7d,
	K4_VG2_P5d,
	K4_VG2_P6d,
	K4_VG2_P10d,
	K4_VG2_P8d,
	K4_VG2_P9d,
	K4_VG2_P4d,
	K4_VG2_P3d,
	K4_VG2_P16v,
	K4_VG2_P15v,
	K4_VG2_P19v,
	K4_VG2_P17v,
	K4_VG2_P20v,
	K4_VG2_P18v,
	K4_VG2_P21v,
	K4_VG2_P4v,
	K4_VG2_P5v,
	K4_VG2_P6v,
	K4_VG2_P7v,
	K4_VG2_P8v,
	K4_VG2_P9v,
	K4_VG2_P4g,
	K4_VG2_P10v,
	K4_VG2_P9g,
	K4_VG2_P11d,
	K4_VG2_P12d
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
