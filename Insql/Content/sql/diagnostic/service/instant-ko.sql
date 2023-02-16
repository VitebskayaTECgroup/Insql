{срезы минутные}
/*ReportName=Мгновенные перепады по контурам отопления (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	null,
	CAST(V01_VK11G001 as decimal(6,2)) as "G ПСВ КО1 [V01_VK11G001]",
	CAST(V01_VK21G001 as decimal(6,2)) as "G ОСВ КО1 [V01_VK21G001]",
	null,
	CAST(V02_VK11G001 as decimal(6,2)) as "G ПСВ КО2 [V02_VK11G001]",
	CAST(V02_VK21G001 as decimal(6,2)) as "G ОСВ КО2 [V02_VK21G001]",
	null,
	CAST(V03_VK11G001 as decimal(6,2)) as "G ПСВ ПВК [V03_VK11G001]",
	CAST(V03_VK21G001 as decimal(6,2)) as "G ОСВ ПВК [V03_VK21G001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V01_VK11G001, V01_VK21G001, V02_VK11G001, V02_VK21G001, V03_VK11G001, V03_VK21G001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName=Мгновенные перепады по контурам отопления (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(V01_VK11G001 as decimal(6,2)) as "G ПСВ КО1 [V01_VK11G001]",
	CAST(V01_VK21G001 as decimal(6,2)) as "G ОСВ КО1 [V01_VK21G001]",
	null,
	CAST(V02_VK11G001 as decimal(6,2)) as "G ПСВ КО2 [V02_VK11G001]",
	CAST(V02_VK21G001 as decimal(6,2)) as "G ОСВ КО2 [V02_VK21G001]",
	null,
	CAST(V03_VK11G001 as decimal(6,2)) as "G ПСВ ПВК [V03_VK11G001]",
	CAST(V03_VK21G001 as decimal(6,2)) as "G ОСВ ПВК [V03_VK21G001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V01_VK11G001, V01_VK21G001, V02_VK11G001, V02_VK21G001, V03_VK11G001, V03_VK21G001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName=Мгновенные перепады по контурам отопления (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	null,
	CAST(V01_VK11G001 as decimal(6,2)) as "G ПСВ КО1 [V01_VK11G001]",
	CAST(V01_VK21G001 as decimal(6,2)) as "G ОСВ КО1 [V01_VK21G001]",
	null,
	CAST(V02_VK11G001 as decimal(6,2)) as "G ПСВ КО2 [V02_VK11G001]",
	CAST(V02_VK21G001 as decimal(6,2)) as "G ОСВ КО2 [V02_VK21G001]",
	null,
	CAST(V03_VK11G001 as decimal(6,2)) as "G ПСВ ПВК [V03_VK11G001]",
	CAST(V03_VK21G001 as decimal(6,2)) as "G ОСВ ПВК [V03_VK21G001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V01_VK11G001, V01_VK21G001, V02_VK11G001, V02_VK21G001, V03_VK11G001, V03_VK21G001   FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")