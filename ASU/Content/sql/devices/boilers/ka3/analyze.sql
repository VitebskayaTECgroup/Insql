{минутные срезы}
/*ReportName="КА-3 Параметры для анализа качества пусков и остановов котла" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="срез на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P3b as decimal(15, 2)) as "П3б, °С [K3_VG2_P3b]",
	CAST(K3_VG2_P4b as decimal(15, 2)) as "П4б, °С [K3_VG2_P4b]",
	CAST(K3_VG2_P5b as decimal(15, 2)) as "П5б, °С [K3_VG2_P5b]",
	CAST(K3_VG2_P6b as decimal(15, 2)) as "П6б, °С [K3_VG2_P6b]",
	CAST(K3_VG2_P7b as decimal(15, 2)) as "П7б, °С [K3_VG2_P7b]",
	CAST(K3_VG2_P8b as decimal(15, 2)) as "П8б, °С [K3_VG2_P8b]",
	CAST(K3_VG2_P9b as decimal(15, 2)) as "П9б, °С [K3_VG2_P9b]",
	CAST(K3_VG2_P10b as decimal(15, 2)) as "П10б, °С [K3_VG2_P10b]",
	CAST(K3_VG2_P12b as decimal(15, 2)) as "П12б, °С [K3_VG2_P12b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P10b,
	K3_VG2_P12b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез на конец часа}
/*ReportName="КА-3 Параметры для анализа качества пусков и остановов котла" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="срез на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P3b as decimal(15, 2)) as "П3б, °С [K3_VG2_P3b]",
	CAST(K3_VG2_P4b as decimal(15, 2)) as "П4б, °С [K3_VG2_P4b]",
	CAST(K3_VG2_P5b as decimal(15, 2)) as "П5б, °С [K3_VG2_P5b]",
	CAST(K3_VG2_P6b as decimal(15, 2)) as "П6б, °С [K3_VG2_P6b]",
	CAST(K3_VG2_P7b as decimal(15, 2)) as "П7б, °С [K3_VG2_P7b]",
	CAST(K3_VG2_P8b as decimal(15, 2)) as "П8б, °С [K3_VG2_P8b]",
	CAST(K3_VG2_P9b as decimal(15, 2)) as "П9б, °С [K3_VG2_P9b]",
	CAST(K3_VG2_P10b as decimal(15, 2)) as "П10б, °С [K3_VG2_P10b]",
	CAST(K3_VG2_P12b as decimal(15, 2)) as "П12б, °С [K3_VG2_P12b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P10b,
	K3_VG2_P12b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{срез на конец суток}
/*ReportName="КА-3 Параметры для анализа качества пусков и остановов котла" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срез на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P3b as decimal(15, 2)) as "П3б, °С [K3_VG2_P3b]",
	CAST(K3_VG2_P4b as decimal(15, 2)) as "П4б, °С [K3_VG2_P4b]",
	CAST(K3_VG2_P5b as decimal(15, 2)) as "П5б, °С [K3_VG2_P5b]",
	CAST(K3_VG2_P6b as decimal(15, 2)) as "П6б, °С [K3_VG2_P6b]",
	CAST(K3_VG2_P7b as decimal(15, 2)) as "П7б, °С [K3_VG2_P7b]",
	CAST(K3_VG2_P8b as decimal(15, 2)) as "П8б, °С [K3_VG2_P8b]",
	CAST(K3_VG2_P9b as decimal(15, 2)) as "П9б, °С [K3_VG2_P9b]",
	CAST(K3_VG2_P10b as decimal(15, 2)) as "П10б, °С [K3_VG2_P10b]",
	CAST(K3_VG2_P12b as decimal(15, 2)) as "П12б, °С [K3_VG2_P12b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P3b,
	K3_VG2_P4b,
	K3_VG2_P5b,
	K3_VG2_P6b,
	K3_VG2_P7b,
	K3_VG2_P8b,
	K3_VG2_P9b,
	K3_VG2_P10b,
	K3_VG2_P12b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")