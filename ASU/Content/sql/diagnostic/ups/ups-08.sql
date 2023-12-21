{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 8. АПУ ТА-3, ЦТЩУ (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P08_EU00S602 as "Состоя- ние [P08_EU00S602]",
	CAST(P08_EU00T001 as decimal(10)) as "Темп-ра, °С  [P08_EU00T001]",
	CAST(P08_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P08_SY00J802]",
	CAST(P08_EU10U001 as decimal(10,0)) as "Uвх., В [P08_EU10U001]",
	CAST(P08_EU20U001 as decimal(10,0)) as "Uвых., В [P08_EU20U001]",
	CAST(P08_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P08_EU20E401]",
	NULL,
	P08_SY00J806 as "Дата само- теста [P08_SY00J806]", 
	P08_EU00S601 as "Итог само- теста [P08_EU00S601]",
	CAST(P08_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P08_EU00U401]",
	null,
	P08_SY00J803   as "Переход на Батарею [P08_SY00J803]",
	P08_EU00S603   as "Причина перех на бат [P08_EU00S603]",
	P08_SY00J804   as "Время раб от бат, сек [P08_SY00J804]",
	P08_SY00J805   as "Переход на Сеть [P08_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P08_EU00S602, P08_EU10U001, P08_EU20U001, P08_EU20E401, P08_SY00J802, P08_EU00T001, 
	P08_SY00J806, P08_EU00S601, P08_EU00U401,
	P08_SY00J803, P08_SY00J805, P08_SY00J804, P08_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 8. АПУ ТА-3, ЦТЩУ (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST(P08_EU00T001 as decimal(10)) as "Темп-ра, °С  [P08_EU00T001]",
	CAST(P08_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P08_SY00J802]",
	CAST(P08_EU10U001 as decimal(10,0)) as "Uвх., В [P08_EU10U001]",
	CAST(P08_EU20U001 as decimal(10,0)) as "Uвых., В [P08_EU20U001]",
	CAST(P08_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P08_EU20E401]",
	NULL,
	P08_SY00J806 as "Дата само- теста [P08_SY00J806]", 
	P08_EU00S601 as "Итог само- теста [P08_EU00S601]",
	CAST(P08_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P08_EU00U401]",
	null,
	P08_SY00J803   as "Переход на Батарею [P08_SY00J803]",
	P08_EU00S603   as "Причина перех на бат [P08_EU00S603]",
	P08_SY00J804   as "Время раб от бат, сек [P08_SY00J804]",
	P08_SY00J805   as "Переход на Сеть [P08_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P08_EU00S602, P08_EU10U001, P08_EU20U001, P08_EU20E401, P08_SY00J802, P08_EU00T001, 
	P08_SY00J806, P08_EU00S601, P08_EU00U401,
	P08_SY00J803, P08_SY00J805, P08_SY00J804, P08_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 8. АПУ ТА-3, ЦТЩУ (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P08_EU00T001 as decimal(10)) as "Темп-ра, °С  [P08_EU00T001]",
	CAST(P08_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P08_SY00J802]",
	CAST(P08_EU10U001 as decimal(10,0)) as "Uвх., В [P08_EU10U001]",
	CAST(P08_EU20U001 as decimal(10,0)) as "Uвых., В [P08_EU20U001]",
	CAST(P08_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P08_EU20E401]",
	NULL,
	P08_SY00J806 as "Дата само- теста [P08_SY00J806]", 
	P08_EU00S601 as "Итог само- теста [P08_EU00S601]",
	CAST(P08_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P08_EU00U401]",
	null,
	P08_SY00J803   as "Переход на Батарею [P08_SY00J803]",
	P08_EU00S603   as "Причина перех на бат [P08_EU00S603]",
	P08_SY00J804   as "Время раб от бат, сек [P08_SY00J804]",
	P08_SY00J805   as "Переход на Сеть [P08_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P08_EU00S602, P08_EU10U001, P08_EU20U001, P08_EU20E401, P08_SY00J802, P08_EU00T001, 
	P08_SY00J806, P08_EU00S601, P08_EU00U401,
	P08_SY00J803, P08_SY00J805, P08_SY00J804, P08_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")