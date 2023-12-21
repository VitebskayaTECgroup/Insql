{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 9. СБК II очереди (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P09_EU00S602 as "Состоя- ние [P09_EU00S602]",
	CAST(P09_EU00T001 as decimal(10)) as "Темп-ра, °С  [P09_EU00T001]",
	CAST(P09_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P09_SY00J802]",
	CAST(P09_EU10U001 as decimal(10,0)) as "Uвх., В [P09_EU10U001]",
	CAST(P09_EU20U001 as decimal(10,0)) as "Uвых., В [P09_EU20U001]",
	CAST(P09_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P09_EU20E401]",
	NULL,
	P09_SY00J806 as "Дата само- теста [P09_SY00J806]", 
	P09_EU00S601 as "Итог само- теста [P09_EU00S601]",
	CAST(P09_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P09_EU00U401]",
	null,
	P09_SY00J803   as "Переход на Батарею [P09_SY00J803]",
	P09_EU00S603   as "Причина перех на бат [P09_EU00S603]",
	P09_SY00J804   as "Время раб от бат, сек [P09_SY00J804]",
	P09_SY00J805   as "Переход на Сеть [P09_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P09_EU00S602, P09_EU10U001, P09_EU20U001, P09_EU20E401, P09_SY00J802, P09_EU00T001, 
	P09_SY00J806, P09_EU00S601, P09_EU00U401,
	P09_SY00J803, P09_SY00J805, P09_SY00J804, P09_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 9. СБК II очереди (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST(P09_EU00T001 as decimal(10)) as "Темп-ра, °С  [P09_EU00T001]",
	CAST(P09_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P09_SY00J802]",
	CAST(P09_EU10U001 as decimal(10,0)) as "Uвх., В [P09_EU10U001]",
	CAST(P09_EU20U001 as decimal(10,0)) as "Uвых., В [P09_EU20U001]",
	CAST(P09_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P09_EU20E401]",
	NULL,
	P09_SY00J806 as "Дата само- теста [P09_SY00J806]", 
	P09_EU00S601 as "Итог само- теста [P09_EU00S601]",
	CAST(P09_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P09_EU00U401]",
	null,
	P09_SY00J803   as "Переход на Батарею [P09_SY00J803]",
	P09_EU00S603   as "Причина перех на бат [P09_EU00S603]",
	P09_SY00J804   as "Время раб от бат, сек [P09_SY00J804]",
	P09_SY00J805   as "Переход на Сеть [P09_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P09_EU00S602, P09_EU10U001, P09_EU20U001, P09_EU20E401, P09_SY00J802, P09_EU00T001, 
	P09_SY00J806, P09_EU00S601, P09_EU00U401,
	P09_SY00J803, P09_SY00J805, P09_SY00J804, P09_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 9. СБК II очереди (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P09_EU00T001 as decimal(10)) as "Темп-ра, °С  [P09_EU00T001]",
	CAST(P09_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P09_SY00J802]",
	CAST(P09_EU10U001 as decimal(10,0)) as "Uвх., В [P09_EU10U001]",
	CAST(P09_EU20U001 as decimal(10,0)) as "Uвых., В [P09_EU20U001]",
	CAST(P09_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P09_EU20E401]",
	NULL,
	P09_SY00J806 as "Дата само- теста [P09_SY00J806]", 
	P09_EU00S601 as "Итог само- теста [P09_EU00S601]",
	CAST(P09_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P09_EU00U401]",
	null,
	P09_SY00J803   as "Переход на Батарею [P09_SY00J803]",
	P09_EU00S603   as "Причина перех на бат [P09_EU00S603]",
	P09_SY00J804   as "Время раб от бат, сек [P09_SY00J804]",
	P09_SY00J805   as "Переход на Сеть [P09_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P09_EU00S602, P09_EU10U001, P09_EU20U001, P09_EU20E401, P09_SY00J802, P09_EU00T001, 
	P09_SY00J806, P09_EU00S601, P09_EU00U401,
	P09_SY00J803, P09_SY00J805, P09_SY00J804, P09_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")