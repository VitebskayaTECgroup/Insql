{минутные срезы}
/*ReportName="КА-3 Давление воздуха" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="срез на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG2_P12v as decimal(15, 2)) as "П12в (общий короб), °С [K3_VG2_P12v]",
	CAST(K3_VG2_P13v as decimal(15, 2)) as "П13в (горелка №1), °С [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 2)) as "П14в (горелка №2), °С [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 2)) as "П15в (горелка №3), °С [K3_VG2_P15v]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез на конец часа}
/*ReportName="КА-3 Давление воздуха" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="срез на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P12v as decimal(15, 2)) as "П12в (общий короб), °С [K3_VG2_P12v]",
	CAST(K3_VG2_P13v as decimal(15, 2)) as "П13в (горелка №1), °С [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 2)) as "П14в (горелка №2), °С [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 2)) as "П15в (горелка №3), °С [K3_VG2_P15v]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез на конец суток}
/*ReportName="КА-3 Давление воздуха" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срез на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG2_P12v as decimal(15, 2)) as "П12в (общий короб), °С [K3_VG2_P12v]",
	CAST(K3_VG2_P13v as decimal(15, 2)) as "П13в (горелка №1), °С [K3_VG2_P13v]",
	CAST(K3_VG2_P14v as decimal(15, 2)) as "П14в (горелка №2), °С [K3_VG2_P14v]",
	CAST(K3_VG2_P15v as decimal(15, 2)) as "П15в (горелка №3), °С [K3_VG2_P15v]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG2_P12v,
	K3_VG2_P13v,
	K3_VG2_P14v,
	K3_VG2_P15v
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")