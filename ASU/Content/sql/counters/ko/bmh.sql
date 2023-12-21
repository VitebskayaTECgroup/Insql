{минутные срезы}
/*ReportName="Параметры конденсата с БМХ" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(V04_VK11T001 as decimal(15,2)) as "Температура конденсата с БМХ, °С [V04_VK11T001]",
	CAST(V04_VK11V001 as decimal(15,2)) as "Объем конденсата с БМХ, м. куб. [V04_VK11V001]",
	CAST(V04_VK11M001 as decimal(15,2)) as "Масса конденсата с БМХ, т. [V04_VK11M001]",
	CAST(V04_VK11VF01 as decimal(15,2)) as "Объемный расход конденсата с БМХ, м3/ч. [V04_VK11VF01]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V04_VK11T001, V04_VK11V001, V04_VK11M001, V04_VK11VF01
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{СРЕЗ ЗА ЧАС}
/*ReportName="Параметры конденсата с БМХ" (срез за час)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(V04_VK11T001 as decimal(15,2)) as "Температура конденсата с БМХ, °С [V04_VK11T001]",
	CAST(V04_VK11V001 as decimal(15,2)) as "Объем конденсата с БМХ, м. куб. [V04_VK11V001]",
	CAST(V04_VK11M001 as decimal(15,2)) as "Масса конденсата с БМХ, т. [V04_VK11M001]",
	CAST(V04_VK11VF01 as decimal(15,2)) as "Объемный расход конденсата с БМХ, м3/ч. [V04_VK11VF01]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, V04_VK11T001, V04_VK11V001, V04_VK11M001, V04_VK11VF01
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{СРЕЗ ЗА СУТКИ}
/*ReportName="Параметры конденсата с БМХ" (срез за сутки)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(V04_VK11T001 as decimal(15,2)) as "Температура конденсата с БМХ, °С [V04_VK11T001]",
	CAST(V04_VK11V001 as decimal(15,2)) as "Объем конденсата с БМХ, м. куб. [V04_VK11V001]",
	CAST(V04_VK11M001 as decimal(15,2)) as "Масса конденсата с БМХ, т. [V04_VK11M001]",
	CAST(V04_VK11VF01 as decimal(15,2)) as "Объемный расход конденсата с БМХ, м3/ч. [V04_VK11VF01]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V04_VK11T001, V04_VK11V001, V04_VK11M001, V04_VK11VF01
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")