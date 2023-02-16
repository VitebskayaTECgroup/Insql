{минутные срезы}
/*ReportName=Удельный расход топлива (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(MI_URT_OE as decimal(7,3)) as "Уд. расх. топл. [MI_URT_OE][Edit:m1|MI_URT_OE]",
	CAST(G00_AF00W102 as decimal(7,3)) as "Калорийность газа (кКал/тыс. м3) [G00_AF00W102][Edit:m1|G00_AF00W102]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, MI_URT_OE, G00_AF00W102
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Удельный расход топлива (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	CAST(MI_URT_OE as decimal(7,3)) as "Уд. расх. топл. [Edit:m1|MI_URT_OE]",
	CAST(G00_AF00W102 as decimal(7,3)) as "Калорийность газа (кКал/тыс. м3) [Edit:m1|G00_AF00W102]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, MI_URT_OE, G00_AF00W102
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Удельный расход топлива (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	CAST(MI_URT_OE as decimal(7,3)) as "Уд. расх. топл. [Edit:m1|MI_URT_OE]",
	CAST(G00_AF00W102 as decimal(7,3)) as "Калорийность газа (кКал/тыс. м3) [Edit:m1|G00_AF00W102]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, MI_URT_OE, G00_AF00W102
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")