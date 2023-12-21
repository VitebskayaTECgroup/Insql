{минутные срезы}
/*ReportName="Гидрозатвор" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="срез за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(V05_Q1 as decimal(15,2)) as "Массовый расход 1, т/ч [V05_Q1]",
	CAST(V05_Q2 as decimal(15,2)) as "Массовый расход 2, т/ч [V05_Q2]",
	CAST(V05_P1 as decimal(15,2)) as "Давление 1, МПА [V05_P1]",
	CAST(V05_P2 as decimal(15,2)) as "Давление 2, МПА [V05_P2]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V05_Q1, V05_Q2, V05_P1, V05_P2
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез за час}
/*ReportName="Гидрозатвор" (срез за час)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="срез за сутки"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(V05_Q1 as decimal(15,2)) as "Массовый расход 1, т/ч [V05_Q1]",
	CAST(V05_Q2 as decimal(15,2)) as "Массовый расход 2, т/ч [V05_Q2]",
	CAST(V05_P1 as decimal(15,2)) as "Давление 1, МПА [V05_P1]",
	CAST(V05_P2 as decimal(15,2)) as "Давление 2, МПА [V05_P2]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V05_Q1, V05_Q2, V05_P1, V05_P2
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез за сутки}
/*ReportName="Гидрозатвор" (срез за сутки)*/
/*Mode=суточные-1*/
/*DownQuery="срез за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(V05_Q1 as decimal(15,2)) as "Массовый расход 1, т/ч [V05_Q1]",
	CAST(V05_Q2 as decimal(15,2)) as "Массовый расход 2, т/ч [V05_Q2]",
	CAST(V05_P1 as decimal(15,2)) as "Давление 1, МПА [V05_P1]",
	CAST(V05_P2 as decimal(15,2)) as "Давление 2, МПА [V05_P2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V05_Q1, V05_Q2, V05_P1, V05_P2
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")