{минутные срезы}
/*ReportName="Уровни баков кислоты и щёлочи" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H04_AK03L001 as decimal(15,3)) as "L кислоты №3, м [H04_AK03L001] [CHECK:2.7,2,0.4,0]",
	CAST(H04_AK04L001 as decimal(15,3)) as "L кислоты №4, м [H04_AK04L001] [CHECK:2.7,2,0.4,0]",
	CAST(H04_AK05L001 as decimal(15,3)) as "L кислоты №5, м [H04_AK05L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL03L001 as decimal(15,3)) as "L щёлочи №3, м [H05_AL03L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL04L001 as decimal(15,3)) as "L щёлочи №4, м [H05_AL04L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL05L001 as decimal(15,3)) as "L щёлочи №5, м [H05_AL05L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL06L001 as decimal(15,3)) as "L щёлочи №6, м [H05_AL06L001] [CHECK:2.7,2,0.4,0]",
	CAST(H06_AL03T001 as decimal(15,3)) as "T щёлочи №3, м [H06_AL03T001]",
	CAST(H06_AL04T001 as decimal(15,3)) as "T щёлочи №4, м [H06_AL04T001]",
	CAST(H06_AL05T001 as decimal(15,3)) as "T щёлочи №5, м [H06_AL05T001]",
	CAST(H06_AL06T001 as decimal(15,3)) as "T щёлочи №6, м [H06_AL06T001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H04_AK03L001, H04_AK04L001, H04_AK05L001, H05_AL03L001, H05_AL04L001, H05_AL05L001, H05_AL06L001, H06_AL03T001, H06_AL04T001, H06_AL05T001, H06_AL06T001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Уровни баков кислоты и щёлочи" (почасовые)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(H04_AK03L001 as decimal(15,3)) as "L кислоты №3, м [H04_AK03L001] [CHECK:2.7,2,0.4,0]",
	CAST(H04_AK04L001 as decimal(15,3)) as "L кислоты №4, м [H04_AK04L001] [CHECK:2.7,2,0.4,0]",
	CAST(H04_AK05L001 as decimal(15,3)) as "L кислоты №5, м [H04_AK05L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL03L001 as decimal(15,3)) as "L щёлочи №3, м [H05_AL03L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL04L001 as decimal(15,3)) as "L щёлочи №4, м [H05_AL04L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL05L001 as decimal(15,3)) as "L щёлочи №5, м [H05_AL05L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL06L001 as decimal(15,3)) as "L щёлочи №6, м [H05_AL06L001] [CHECK:2.7,2,0.4,0]",
	CAST(H06_AL03T001 as decimal(15,3)) as "T щёлочи №3, м [H06_AL03T001]",
	CAST(H06_AL04T001 as decimal(15,3)) as "T щёлочи №4, м [H06_AL04T001]",
	CAST(H06_AL05T001 as decimal(15,3)) as "T щёлочи №5, м [H06_AL05T001]",
	CAST(H06_AL06T001 as decimal(15,3)) as "T щёлочи №6, м [H06_AL06T001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H04_AK03L001, H04_AK04L001, H04_AK05L001, H05_AL03L001, H05_AL04L001, H05_AL05L001, H05_AL06L001, H06_AL03T001, H06_AL04T001, H06_AL05T001, H06_AL06T001 FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Уровни баков кислоты и щёлочи" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null, 
	CAST(H04_AK03L001 as decimal(15,3)) as "L кислоты №3, м [H04_AK03L001] [CHECK:2.7,2,0.4,0]",
	CAST(H04_AK04L001 as decimal(15,3)) as "L кислоты №4, м [H04_AK04L001] [CHECK:2.7,2,0.4,0]",
	CAST(H04_AK05L001 as decimal(15,3)) as "L кислоты №5, м [H04_AK05L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL03L001 as decimal(15,3)) as "L щёлочи №3, м [H05_AL03L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL04L001 as decimal(15,3)) as "L щёлочи №4, м [H05_AL04L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL05L001 as decimal(15,3)) as "L щёлочи №5, м [H05_AL05L001] [CHECK:2.7,2,0.4,0]",
	CAST(H05_AL06L001 as decimal(15,3)) as "L щёлочи №6, м [H05_AL06L001] [CHECK:2.7,2,0.4,0]",
	CAST(H06_AL03T001 as decimal(15,3)) as "T щёлочи №3, м [H06_AL03T001]",
	CAST(H06_AL04T001 as decimal(15,3)) as "T щёлочи №4, м [H06_AL04T001]",
	CAST(H06_AL05T001 as decimal(15,3)) as "T щёлочи №5, м [H06_AL05T001]",
	CAST(H06_AL06T001 as decimal(15,3)) as "T щёлочи №6, м [H06_AL06T001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, H04_AK03L001, H04_AK04L001, H04_AK05L001, H05_AL03L001, H05_AL04L001, H05_AL05L001, H05_AL06L001, H06_AL03T001, H06_AL04T001, H06_AL05T001, H06_AL06T001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")