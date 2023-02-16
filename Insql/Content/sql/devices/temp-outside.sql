{минутные срезы}
/*ReportName=Температура наружного воздуха (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Температура наружного воздуха (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Температура наружного воздуха (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	null,
	CAST(M2_T4 as decimal(15,1)) as "T нар. маз. емк.№ 2, °С [M2_T4]",
	CAST(M4_T4 as decimal(15,1)) as "T нар. маз. емк.№ 4, °С [M4_T4]",
	CAST(U1_Tnv_3_4 as decimal(15,2)) as "T нар. т/о II оч., °С [U1_Tnv_3_4]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, M2_T4, M4_T4, U1_Tnv_3_4
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")