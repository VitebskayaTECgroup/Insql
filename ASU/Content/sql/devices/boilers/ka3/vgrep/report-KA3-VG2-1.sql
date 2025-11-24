{срезы минутные}
/*ReportName="Отчёт КА-3 VG2. Экран 1" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P77b as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(K3_VG2_P3b as decimal(15, 1)) as "П3б<br>°С [K3_VG2_P3b]",
	CAST(K3_VG2_P4b as decimal(15, 1)) as "П4б<br>°С [K3_VG2_P4b]",
	CAST(K3_VG2_P5b as decimal(15, 1)) as "П5б<br>°С [K3_VG2_P5b]",
	CAST(K3_VG2_P6b as decimal(15, 1)) as "П6б<br>°С [K3_VG2_P6b]",
	CAST(K3_VG2_P7b as decimal(15, 1)) as "П7б<br>°С [K3_VG2_P7b]",
	CAST(K3_VG2_P8b as decimal(15, 1)) as "П8б<br>°С [K3_VG2_P8b]",
	CAST(K3_VG2_P9b as decimal(15, 1)) as "П9б<br>°С [K3_VG2_P9b]",
	CAST(K3_VG2_P12b as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(K3_VG2_P10b as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(K3_VG2_P1b as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(K3_VG2_P2b as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(K3_VG2_P11b as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(K3_VG2_P79b as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	CAST(K3_VG2_P80b as decimal(15, 1)) as "П80б<br>°С [K3_VG2_P80b]",
	null,
	CAST(K3_VG2_P1e as decimal(15, 1)) as "П1е [K3_VG2_P1e]",
	CAST(K3_VG2_P2e as decimal(15, 1)) as "П2е [K3_VG2_P2e]",
	CAST(K3_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K3_VG2_P4e]",
	CAST(K3_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K3_VG2_P3e]",
	CAST(K3_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K3_VG2_P5e]",
	CAST(K3_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K3_VG2_P6e]",
	null,
	CAST(K3_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K3_VG2_P7d]",
	CAST(K3_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K3_VG2_P5d]",
	CAST(K3_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K3_VG2_P6d]",
	CAST(K3_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K3_VG2_P10d]",
	CAST(K3_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K3_VG2_P9d]",
	CAST(K3_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K3_VG2_P8d]",
	CAST(K3_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(K3_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K3_VG2_P20v]",
	CAST(K3_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K3_VG2_P19v]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P80b,
	K3_VG2_P1e,
	K3_VG2_P2e,
	K3_VG2_P4e,
	K3_VG2_P3e,
	K3_VG2_P5e,
	K3_VG2_P6e,
	K3_VG2_P7d,
	K3_VG2_P5d,
	K3_VG2_P6d,
	K3_VG2_P10d,
	K3_VG2_P9d,
	K3_VG2_P8d,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P20v,
	K3_VG2_P19v
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-3 VG2. Экран 1" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P77b as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(K3_VG2_P3b as decimal(15, 1)) as "П3б<br>°С [K3_VG2_P3b]",
	CAST(K3_VG2_P4b as decimal(15, 1)) as "П4б<br>°С [K3_VG2_P4b]",
	CAST(K3_VG2_P5b as decimal(15, 1)) as "П5б<br>°С [K3_VG2_P5b]",
	CAST(K3_VG2_P6b as decimal(15, 1)) as "П6б<br>°С [K3_VG2_P6b]",
	CAST(K3_VG2_P7b as decimal(15, 1)) as "П7б<br>°С [K3_VG2_P7b]",
	CAST(K3_VG2_P8b as decimal(15, 1)) as "П8б<br>°С [K3_VG2_P8b]",
	CAST(K3_VG2_P9b as decimal(15, 1)) as "П9б<br>°С [K3_VG2_P9b]",
	CAST(K3_VG2_P12b as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(K3_VG2_P10b as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(K3_VG2_P1b as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(K3_VG2_P2b as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(K3_VG2_P11b as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(K3_VG2_P79b as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	CAST(K3_VG2_P80b as decimal(15, 1)) as "П80б<br>°С [K3_VG2_P80b]",
	null,
	CAST(K3_VG2_P1e as decimal(15, 1)) as "П1е [K3_VG2_P1e]",
	CAST(K3_VG2_P2e as decimal(15, 1)) as "П2е [K3_VG2_P2e]",
	CAST(K3_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K3_VG2_P4e]",
	CAST(K3_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K3_VG2_P3e]",
	CAST(K3_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K3_VG2_P5e]",
	CAST(K3_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K3_VG2_P6e]",
	null,
	CAST(K3_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K3_VG2_P7d]",
	CAST(K3_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K3_VG2_P5d]",
	CAST(K3_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K3_VG2_P6d]",
	CAST(K3_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K3_VG2_P10d]",
	CAST(K3_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K3_VG2_P9d]",
	CAST(K3_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K3_VG2_P8d]",
	CAST(K3_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(K3_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K3_VG2_P20v]",
	CAST(K3_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K3_VG2_P19v]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P80b,
	K3_VG2_P1e,
	K3_VG2_P2e,
	K3_VG2_P4e,
	K3_VG2_P3e,
	K3_VG2_P5e,
	K3_VG2_P6e,
	K3_VG2_P7d,
	K3_VG2_P5d,
	K3_VG2_P6d,
	K3_VG2_P10d,
	K3_VG2_P9d,
	K3_VG2_P8d,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P20v,
	K3_VG2_P19v
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-3 VG2. Экран 1" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P77b as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(K3_VG2_P3b as decimal(15, 1)) as "П3б<br>°С [K3_VG2_P3b]",
	CAST(K3_VG2_P4b as decimal(15, 1)) as "П4б<br>°С [K3_VG2_P4b]",
	CAST(K3_VG2_P5b as decimal(15, 1)) as "П5б<br>°С [K3_VG2_P5b]",
	CAST(K3_VG2_P6b as decimal(15, 1)) as "П6б<br>°С [K3_VG2_P6b]",
	CAST(K3_VG2_P7b as decimal(15, 1)) as "П7б<br>°С [K3_VG2_P7b]",
	CAST(K3_VG2_P8b as decimal(15, 1)) as "П8б<br>°С [K3_VG2_P8b]",
	CAST(K3_VG2_P9b as decimal(15, 1)) as "П9б<br>°С [K3_VG2_P9b]",
	CAST(K3_VG2_P12b as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(K3_VG2_P10b as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(K3_VG2_P1b as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(K3_VG2_P2b as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(K3_VG2_P11b as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(K3_VG2_P79b as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	CAST(K3_VG2_P80b as decimal(15, 1)) as "П80б<br>°С [K3_VG2_P80b]",
	null,
	CAST(K3_VG2_P1e as decimal(15, 1)) as "П1е [K3_VG2_P1e]",
	CAST(K3_VG2_P2e as decimal(15, 1)) as "П2е [K3_VG2_P2e]",
	CAST(K3_VG2_P4e as decimal(15, 1)) as "П4е<br>% [K3_VG2_P4e]",
	CAST(K3_VG2_P3e as decimal(15, 1)) as "П3е<br>% [K3_VG2_P3e]",
	CAST(K3_VG2_P5e as decimal(15, 1)) as "П5е<br>ppm [K3_VG2_P5e]",
	CAST(K3_VG2_P6e as decimal(15, 1)) as "П6е<br>ppm [K3_VG2_P6e]",
	null,
	CAST(K3_VG2_P7d as decimal(15, 1)) as "П7д<br>кПа [K3_VG2_P7d]",
	CAST(K3_VG2_P5d as decimal(15, 1)) as "П5д<br>кПа [K3_VG2_P5d]",
	CAST(K3_VG2_P6d as decimal(15, 1)) as "П6д<br>кПа [K3_VG2_P6d]",
	CAST(K3_VG2_P10d as decimal(15, 1)) as "П10д<br>кПа [K3_VG2_P10d]",
	CAST(K3_VG2_P9d as decimal(15, 1)) as "П9д<br>кПа [K3_VG2_P9d]",
	CAST(K3_VG2_P8d as decimal(15, 1)) as "П8д<br>кПа [K3_VG2_P8d]",
	CAST(K3_VG2_P4d as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(K3_VG2_P3d as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(K3_VG2_P20v as decimal(15, 1)) as "П20в<br>кПа [K3_VG2_P20v]",
	CAST(K3_VG2_P19v as decimal(15, 1)) as "П19в<br>кПа [K3_VG2_P19v]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P80b,
	K3_VG2_P1e,
	K3_VG2_P2e,
	K3_VG2_P4e,
	K3_VG2_P3e,
	K3_VG2_P5e,
	K3_VG2_P6e,
	K3_VG2_P7d,
	K3_VG2_P5d,
	K3_VG2_P6d,
	K3_VG2_P10d,
	K3_VG2_P9d,
	K3_VG2_P8d,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P20v,
	K3_VG2_P19v
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-3 VG2. Экран 1" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(K3_VG2_P77b) as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(AVG(K3_VG2_P3b) as decimal(15, 1)) as "П3б<br>°С [K3_VG2_P3b]",
	CAST(AVG(K3_VG2_P4b) as decimal(15, 1)) as "П4б<br>°С [K3_VG2_P4b]",
	CAST(AVG(K3_VG2_P5b) as decimal(15, 1)) as "П5б<br>°С [K3_VG2_P5b]",
	CAST(AVG(K3_VG2_P6b) as decimal(15, 1)) as "П6б<br>°С [K3_VG2_P6b]",
	CAST(AVG(K3_VG2_P7b) as decimal(15, 1)) as "П7б<br>°С [K3_VG2_P7b]",
	CAST(AVG(K3_VG2_P8b) as decimal(15, 1)) as "П8б<br>°С [K3_VG2_P8b]",
	CAST(AVG(K3_VG2_P9b) as decimal(15, 1)) as "П9б<br>°С [K3_VG2_P9b]",
	CAST(AVG(K3_VG2_P12b) as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(AVG(K3_VG2_P10b) as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(AVG(K3_VG2_P1b) as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(AVG(K3_VG2_P2b) as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(AVG(K3_VG2_P11b) as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(AVG(K3_VG2_P79b) as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	CAST(AVG(K3_VG2_P80b) as decimal(15, 1)) as "П80б<br>°С [K3_VG2_P80b]",
	null,
	CAST(AVG(K3_VG2_P1e) as decimal(15, 1)) as "П1е [K3_VG2_P1e]",
	CAST(AVG(K3_VG2_P2e) as decimal(15, 1)) as "П2е [K3_VG2_P2e]",
	CAST(AVG(K3_VG2_P4e) as decimal(15, 1)) as "П4е<br>% [K3_VG2_P4e]",
	CAST(AVG(K3_VG2_P3e) as decimal(15, 1)) as "П3е<br>% [K3_VG2_P3e]",
	CAST(AVG(K3_VG2_P5e) as decimal(15, 1)) as "П5е<br>ppm [K3_VG2_P5e]",
	CAST(AVG(K3_VG2_P6e) as decimal(15, 1)) as "П6е<br>ppm [K3_VG2_P6e]",
	null,
	CAST(AVG(K3_VG2_P7d) as decimal(15, 1)) as "П7д<br>кПа [K3_VG2_P7d]",
	CAST(AVG(K3_VG2_P5d) as decimal(15, 1)) as "П5д<br>кПа [K3_VG2_P5d]",
	CAST(AVG(K3_VG2_P6d) as decimal(15, 1)) as "П6д<br>кПа [K3_VG2_P6d]",
	CAST(AVG(K3_VG2_P10d) as decimal(15, 1)) as "П10д<br>кПа [K3_VG2_P10d]",
	CAST(AVG(K3_VG2_P9d) as decimal(15, 1)) as "П9д<br>кПа [K3_VG2_P9d]",
	CAST(AVG(K3_VG2_P8d) as decimal(15, 1)) as "П8д<br>кПа [K3_VG2_P8d]",
	CAST(AVG(K3_VG2_P4d) as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(AVG(K3_VG2_P3d) as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(AVG(K3_VG2_P20v) as decimal(15, 1)) as "П20в<br>кПа [K3_VG2_P20v]",
	CAST(AVG(K3_VG2_P19v) as decimal(15, 1)) as "П19в<br>кПа [K3_VG2_P19v]"
FROM
	OpenQuery(INSQL,
		"SELECT DateTime, 
		K3_VG2_P77b,
		K3_VG2_P3b,
		K3_VG2_P4b,
		K3_VG2_P5b,
		K3_VG2_P6b,
		K3_VG2_P7b,
		K3_VG2_P8b,
		K3_VG2_P9b,
		K3_VG2_P12b,
		K3_VG2_P10b,
		K3_VG2_P1b,
		K3_VG2_P2b,
		K3_VG2_P11b,
		K3_VG2_P79b,
		K3_VG2_P80b,
		K3_VG2_P1e,
		K3_VG2_P2e,
		K3_VG2_P4e,
		K3_VG2_P3e,
		K3_VG2_P5e,
		K3_VG2_P6e,
		K3_VG2_P7d,
		K3_VG2_P5d,
		K3_VG2_P6d,
		K3_VG2_P10d,
		K3_VG2_P9d,
		K3_VG2_P8d,
		K3_VG2_P4d,
		K3_VG2_P3d,
		K3_VG2_P20v,
		K3_VG2_P19v
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
/*ReportName="Отчёт КА-3 VG2. Экран 1" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(K3_VG2_P77b) as decimal(15, 1)) as "П77б<br>°С [K3_VG2_P77b]",
	null,
	CAST(AVG(K3_VG2_P3b) as decimal(15, 1)) as "П3б<br>°С [K3_VG2_P3b]",
	CAST(AVG(K3_VG2_P4b) as decimal(15, 1)) as "П4б<br>°С [K3_VG2_P4b]",
	CAST(AVG(K3_VG2_P5b) as decimal(15, 1)) as "П5б<br>°С [K3_VG2_P5b]",
	CAST(AVG(K3_VG2_P6b) as decimal(15, 1)) as "П6б<br>°С [K3_VG2_P6b]",
	CAST(AVG(K3_VG2_P7b) as decimal(15, 1)) as "П7б<br>°С [K3_VG2_P7b]",
	CAST(AVG(K3_VG2_P8b) as decimal(15, 1)) as "П8б<br>°С [K3_VG2_P8b]",
	CAST(AVG(K3_VG2_P9b) as decimal(15, 1)) as "П9б<br>°С [K3_VG2_P9b]",
	CAST(AVG(K3_VG2_P12b) as decimal(15, 1)) as "П12б<br>°С [K3_VG2_P12b]",
	CAST(AVG(K3_VG2_P10b) as decimal(15, 1)) as "П10б<br>°С [K3_VG2_P10b]",
	CAST(AVG(K3_VG2_P1b) as decimal(15, 1)) as "П1б<br>°С [K3_VG2_P1b]",
	CAST(AVG(K3_VG2_P2b) as decimal(15, 1)) as "П2б<br>°С [K3_VG2_P2b]",
	CAST(AVG(K3_VG2_P11b) as decimal(15, 1)) as "П11б<br>°С [K3_VG2_P11b]",
	CAST(AVG(K3_VG2_P79b) as decimal(15, 1)) as "П79б<br>°С [K3_VG2_P79b]",
	CAST(AVG(K3_VG2_P80b) as decimal(15, 1)) as "П80б<br>°С [K3_VG2_P80b]",
	null,
	CAST(AVG(K3_VG2_P1e) as decimal(15, 1)) as "П1е [K3_VG2_P1e]",
	CAST(AVG(K3_VG2_P2e) as decimal(15, 1)) as "П2е [K3_VG2_P2e]",
	CAST(AVG(K3_VG2_P4e) as decimal(15, 1)) as "П4е<br>% [K3_VG2_P4e]",
	CAST(AVG(K3_VG2_P3e) as decimal(15, 1)) as "П3е<br>% [K3_VG2_P3e]",
	CAST(AVG(K3_VG2_P5e) as decimal(15, 1)) as "П5е<br>ppm [K3_VG2_P5e]",
	CAST(AVG(K3_VG2_P6e) as decimal(15, 1)) as "П6е<br>ppm [K3_VG2_P6e]",
	null,
	CAST(AVG(K3_VG2_P7d) as decimal(15, 1)) as "П7д<br>кПа [K3_VG2_P7d]",
	CAST(AVG(K3_VG2_P5d) as decimal(15, 1)) as "П5д<br>кПа [K3_VG2_P5d]",
	CAST(AVG(K3_VG2_P6d) as decimal(15, 1)) as "П6д<br>кПа [K3_VG2_P6d]",
	CAST(AVG(K3_VG2_P10d) as decimal(15, 1)) as "П10д<br>кПа [K3_VG2_P10d]",
	CAST(AVG(K3_VG2_P9d) as decimal(15, 1)) as "П9д<br>кПа [K3_VG2_P9d]",
	CAST(AVG(K3_VG2_P8d) as decimal(15, 1)) as "П8д<br>кПа [K3_VG2_P8d]",
	CAST(AVG(K3_VG2_P4d) as decimal(15, 1)) as "П4д<br>кПа [K3_VG2_P4d]",
	CAST(AVG(K3_VG2_P3d) as decimal(15, 1)) as "П3д<br>кПа [K3_VG2_P3d]",
	CAST(AVG(K3_VG2_P20v) as decimal(15, 1)) as "П20в<br>кПа [K3_VG2_P20v]",
	CAST(AVG(K3_VG2_P19v) as decimal(15, 1)) as "П19в<br>кПа [K3_VG2_P19v]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P77b,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P12b,
	K3_VG2_P10b,
	K3_VG2_P1b,
	K3_VG2_P2b,
	K3_VG2_P11b,
	K3_VG2_P79b,
	K3_VG2_P80b,
	K3_VG2_P1e,
	K3_VG2_P2e,
	K3_VG2_P4e,
	K3_VG2_P3e,
	K3_VG2_P5e,
	K3_VG2_P6e,
	K3_VG2_P7d,
	K3_VG2_P5d,
	K3_VG2_P6d,
	K3_VG2_P10d,
	K3_VG2_P9d,
	K3_VG2_P8d,
	K3_VG2_P4d,
	K3_VG2_P3d,
	K3_VG2_P20v,
	K3_VG2_P19v
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
