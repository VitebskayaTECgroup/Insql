{минутные срезы}
/*ReportName=Мгновенные перепады по теплосети (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U04_UM11G001 as decimal(6,2)) as "G ПСВ Центр [U04_UM11G001]",
	CAST(U04_UM11G002 as decimal(6,3)) as "G дубл [U04_UM11G002]",
	null,
	CAST(U04_UM41G001 as decimal(6,2)) as "G Подп [U04_UM41G001]",
	CAST(U04_UM41G002 as decimal(6,3)) as "G дубл [U04_UM41G002]",
	null,
	CAST(U05_UM11G001 as decimal(6,2)) as "G ПСВ Запад [U05_UM11G001]",
	CAST(U05_UM11G002 as decimal(6,3)) as "G дубл [U05_UM11G002]",
	null,
	CAST(U05_UM21G001 as decimal(6,2)) as "G ОСВ Запад [U05_UM21G001]",
	CAST(U05_UM21G002 as decimal(6,3)) as "G дубл [U05_UM21G002]",
	null, 
	CAST(U06_UM11G001 as decimal(6,2)) as "G ПСВ ДОК [U06_UM11G001]",
	CAST(U06_UM11G002 as decimal(6,3)) as "G дубл [U06_UM11G002]",
	null,
	CAST(U06_UM21G001 as decimal(6,2)) as "G ОСВ1 ДОК [U06_UM21G001]",
	CAST(U06_UM21G002 as decimal(6,3)) as "G дубл [U06_UM21G002]",
	null,
	CAST(U06_UM22G001 as decimal(6,2)) as "G ОСВ2 ДОК [U06_UM22G001]",
	CAST(U06_UM22G002 as decimal(6,3)) as "G дубл [U06_UM22G002]",
	null,
	CAST(U07_UM11G001 as decimal(6,2)) as "G ПСВ ВЗРД [U07_UM11G001]",
	CAST(U07_UM11G002 as decimal(6,3)) as "G дубл [U07_UM11G002]",
	null,
	CAST(U07_UM21G001 as decimal(6,2)) as "G ОСВ ВЗРД [U07_UM21G001]",
	CAST(U07_UM21G002 as decimal(6,3)) as "G дубл [U07_UM21G002]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11G001, U04_UM41G001, U04_UM11G002, U04_UM41G002, U05_UM11G001, U05_UM21G001, U05_UM11G002, U05_UM21G002, U06_UM11G001, U06_UM21G001, U06_UM22G001, U06_UM11G002, U06_UM21G002, U06_UM22G002, U07_UM11G001, U07_UM21G001, U07_UM11G002, U07_UM21G002
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мгновенные перепады по теплосети (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U04_UM11G001 as decimal(6,2)) as "G ПСВ Центр [U04_UM11G001]",
	CAST(U04_UM11G002 as decimal(6,3)) as "G дубл [U04_UM11G002]",
	null,
	CAST(U04_UM41G001 as decimal(6,2)) as "G Подп [U04_UM41G001]",
	CAST(U04_UM41G002 as decimal(6,3)) as "G дубл [U04_UM41G002]",
	null,
	CAST(U05_UM11G001 as decimal(6,2)) as "G ПСВ Запад [U05_UM11G001]",
	CAST(U05_UM11G002 as decimal(6,3)) as "G дубл [U05_UM11G002]",
	null,
	CAST(U05_UM21G001 as decimal(6,2)) as "G ОСВ Запад [U05_UM21G001]",
	CAST(U05_UM21G002 as decimal(6,3)) as "G дубл [U05_UM21G002]",
	null, 
	CAST(U06_UM11G001 as decimal(6,2)) as "G ПСВ ДОК [U06_UM11G001]",
	CAST(U06_UM11G002 as decimal(6,3)) as "G дубл [U06_UM11G002]",
	null,
	CAST(U06_UM21G001 as decimal(6,2)) as "G ОСВ1 ДОК [U06_UM21G001]",
	CAST(U06_UM21G002 as decimal(6,3)) as "G дубл [U06_UM21G002]",
	null,
	CAST(U06_UM22G001 as decimal(6,2)) as "G ОСВ2 ДОК [U06_UM22G001]",
	CAST(U06_UM22G002 as decimal(6,3)) as "G дубл [U06_UM22G002]",
	null,
	CAST(U07_UM11G001 as decimal(6,2)) as "G ПСВ ВЗРД [U07_UM11G001]",
	CAST(U07_UM11G002 as decimal(6,3)) as "G дубл [U07_UM11G002]",
	null,
	CAST(U07_UM21G001 as decimal(6,2)) as "G ОСВ ВЗРД [U07_UM21G001]",
	CAST(U07_UM21G002 as decimal(6,3)) as "G дубл [U07_UM21G002]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U04_UM11G001, U04_UM41G001, U04_UM11G002, U04_UM41G002, U05_UM11G001, U05_UM21G001, U05_UM11G002, U05_UM21G002, U06_UM11G001, U06_UM21G001, U06_UM22G001, U06_UM11G002, U06_UM21G002, U06_UM22G002, U07_UM11G001, U07_UM21G001, U07_UM11G002, U07_UM21G002
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мгновенные перепады по теплосети (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	null,
	CAST(U04_UM11G001 as decimal(6,2)) as "G ПСВ Центр [U04_UM11G001]",
	CAST(U04_UM11G002 as decimal(6,3)) as "G дубл [U04_UM11G002]",
	null,
	CAST(U04_UM41G001 as decimal(6,2)) as "G Подп [U04_UM41G001]",
	CAST(U04_UM41G002 as decimal(6,3)) as "G дубл [U04_UM41G002]",
	null,
	CAST(U05_UM11G001 as decimal(6,2)) as "G ПСВ Запад [U05_UM11G001]",
	CAST(U05_UM11G002 as decimal(6,3)) as "G дубл [U05_UM11G002]",
	null,
	CAST(U05_UM21G001 as decimal(6,2)) as "G ОСВ Запад [U05_UM21G001]",
	CAST(U05_UM21G002 as decimal(6,3)) as "G дубл [U05_UM21G002]",
	null, 
	CAST(U06_UM11G001 as decimal(6,2)) as "G ПСВ ДОК [U06_UM11G001]",
	CAST(U06_UM11G002 as decimal(6,3)) as "G дубл [U06_UM11G002]",
	null,
	CAST(U06_UM21G001 as decimal(6,2)) as "G ОСВ1 ДОК [U06_UM21G001]",
	CAST(U06_UM21G002 as decimal(6,3)) as "G дубл [U06_UM21G002]",
	null,
	CAST(U06_UM22G001 as decimal(6,2)) as "G ОСВ2 ДОК [U06_UM22G001]",
	CAST(U06_UM22G002 as decimal(6,3)) as "G дубл [U06_UM22G002]",
	null,
	CAST(U07_UM11G001 as decimal(6,2)) as "G ПСВ ВЗРД [U07_UM11G001]",
	CAST(U07_UM11G002 as decimal(6,3)) as "G дубл [U07_UM11G002]",
	null,
	CAST(U07_UM21G001 as decimal(6,2)) as "G ОСВ ВЗРД [U07_UM21G001]",
	CAST(U07_UM21G002 as decimal(6,3)) as "G дубл [U07_UM21G002]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11G001, U04_UM41G001, U04_UM11G002, U04_UM41G002, U05_UM11G001, U05_UM21G001, U05_UM11G002, U05_UM21G002, U06_UM11G001, U06_UM21G001, U06_UM22G001, U06_UM11G002, U06_UM21G002, U06_UM22G002, U07_UM11G001, U07_UM21G001, U07_UM11G002, U07_UM21G002
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")