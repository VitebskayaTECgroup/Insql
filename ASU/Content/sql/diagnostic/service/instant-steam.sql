{минутные срезы}
/*ReportName=Мгновенные перепады по пару (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	null,
	CAST(U01_UN11G001 as decimal(6,2)) as "G КИМ пар [U01_UN11G001]",
	CAST(U01_UN11G002 as decimal(6,3)) as "G дубл [U01_UN11G002]",
	null,
	CAST(U01_UN21G001 as decimal(6,2)) as "G КИМ конд [U01_UN21G001]",
	CAST(U01_UN21G002 as decimal(6,3)) as "G дубл  [U01_UN21G002]",
	null,
	CAST(U02_UN12G001 as decimal(6,2)) as "G ДОК 28 [U02_UN12G001]",
	CAST(U02_UN12G002 as decimal(6,3)) as "G дубл  [U02_UN12G002]",
	null,
	CAST(U02_UN11G001 as decimal(6,2)) as "G ДОК 18 [U02_UN11G001]",
	CAST(U02_UN11G002 as decimal(6,3)) as "G дубл  [U02_UN11G002]",
	null,
	CAST(U02_UN21G001 as decimal(6,3)) as "G ДОК конд [U02_UN21G001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11G001, U01_UN21G001, U01_UN11G002, U01_UN21G002, U01_UN21G002, U02_UN12G001, U02_UN11G001, U02_UN21G001, U02_UN12G002, U02_UN11G002
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мгновенные перепады по пару (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U01_UN11G001 as decimal(6,2)) as "G КИМ пар [U01_UN11G001]",
	CAST(U01_UN11G002 as decimal(6,3)) as "G дубл [U01_UN11G002]",
	null,
	CAST(U01_UN21G001 as decimal(6,2)) as "G КИМ конд [U01_UN21G001]",
	CAST(U01_UN21G002 as decimal(6,3)) as "G дубл  [U01_UN21G002]",
	null,
	CAST(U02_UN12G001 as decimal(6,2)) as "G ДОК 28 [U02_UN12G001]",
	CAST(U02_UN12G002 as decimal(6,3)) as "G дубл  [U02_UN12G002]",
	null,
	CAST(U02_UN11G001 as decimal(6,2)) as "G ДОК 18 [U02_UN11G001]",
	CAST(U02_UN11G002 as decimal(6,3)) as "G дубл  [U02_UN11G002]",
	null,
	CAST(U02_UN21G001 as decimal(6,3)) as "G ДОК конд [U02_UN21G001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  U01_UN11G001, U01_UN21G001, U01_UN11G002, U01_UN21G002, U01_UN21G002, U02_UN12G001, U02_UN11G001, U02_UN21G001, U02_UN12G002, U02_UN11G002   FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мгновенные перепады по пару (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	CAST(U01_UN11G001 as decimal(6,2)) as "G КИМ пар [U01_UN11G001]",
	CAST(U01_UN11G002 as decimal(6,3)) as "G дубл [U01_UN11G002]",
	null,
	CAST(U01_UN21G001 as decimal(6,2)) as "G КИМ конд [U01_UN21G001]",
	CAST(U01_UN21G002 as decimal(6,3)) as "G дубл  [U01_UN21G002]",
	null,
	CAST(U02_UN12G001 as decimal(6,2)) as "G ДОК 28 [U02_UN12G001]",
	CAST(U02_UN12G002 as decimal(6,3)) as "G дубл  [U02_UN12G002]",
	null,
	CAST(U02_UN11G001 as decimal(6,2)) as "G ДОК 18 [U02_UN11G001]",
	CAST(U02_UN11G002 as decimal(6,3)) as "G дубл  [U02_UN11G002]",
	null,
	CAST(U02_UN21G001 as decimal(6,3)) as "G ДОК конд [U02_UN21G001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  U01_UN11G001, U01_UN21G001, U01_UN11G002, U01_UN21G002, U01_UN21G002, U02_UN12G001, U02_UN11G001, U02_UN21G001, U02_UN12G002, U02_UN11G002   FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")