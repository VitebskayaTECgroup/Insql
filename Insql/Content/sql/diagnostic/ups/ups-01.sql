{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 1. Центральная серверная (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P01_EU00S602 as "Состоя- ние [P01_EU00S602]",
	CAST(P01_EU00T001 as decimal(10)) as "Темп-ра, °С  [P01_EU00T001]",
	CAST(P01_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P01_SY00J802]",
	CAST(P01_EU10U001 as decimal(10,0)) as "Uвх., В [P01_EU10U001]",
	CAST(P01_EU20U001 as decimal(10,0)) as "Uвых., В [P01_EU20U001]",
	CAST(P01_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P01_EU20E401]",
	NULL,
	P01_SY00J806 as "Дата само- теста [P01_SY00J806]",
	P01_EU00S601 as "Итог само- теста [P01_EU00S601]",
	CAST(P01_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P01_EU00U401]",
	null,
	P01_SY00J803   as "Переход на Батарею [P01_SY00J803]",
	P01_EU00S603   as "Причина перех на бат [P01_EU00S603]",
	P01_SY00J804   as "Время раб от бат, сек [P01_SY00J804]",
	P01_SY00J805   as "Переход на Сеть [P01_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P01_EU00S602, P01_EU10U001, P01_EU20U001, P01_EU20E401, P01_SY00J802, P01_EU00T001,
	P01_SY00J806, P01_EU00S601, P01_EU00U401,
	P01_SY00J803, P01_SY00J805, P01_SY00J804, P01_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 1. Центральная серверная (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P01_EU00T001 as decimal(10)) as "Темп-ра, °С  [P01_EU00T001]",
	CAST(P01_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P01_SY00J802]",
	CAST(P01_EU10U001 as decimal(10,0)) as "Uвх., В [P01_EU10U001]",
	CAST(P01_EU20U001 as decimal(10,0)) as "Uвых., В [P01_EU20U001]",
	CAST(P01_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P01_EU20E401]",
	NULL,
	P01_SY00J806 as "Дата само- теста [P01_SY00J806]",
	P01_EU00S601 as "Итог само- теста [P01_EU00S601]",
	CAST(P01_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P01_EU00U401]",
	null,
	P01_SY00J803   as "Переход на Батарею [P01_SY00J803]",
	P01_EU00S603   as "Причина перех на бат [P01_EU00S603]",
	P01_SY00J804   as "Время раб от бат, сек [P01_SY00J804]",
	P01_SY00J805   as "Переход на Сеть [P01_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P01_EU00S602, P01_EU10U001, P01_EU20U001, P01_EU20E401, P01_SY00J802, P01_EU00T001,
	P01_SY00J806, P01_EU00S601, P01_EU00U401,
	P01_SY00J803, P01_SY00J805, P01_SY00J804, P01_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 1. Центральная серверная (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST(P01_EU00T001 as decimal(10)) as "Темп-ра, °С  [P01_EU00T001]",
	CAST(P01_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P01_SY00J802]",
	CAST(P01_EU10U001 as decimal(10,0)) as "Uвх., В [P01_EU10U001]",
	CAST(P01_EU20U001 as decimal(10,0)) as "Uвых., В [P01_EU20U001]",
	CAST(P01_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P01_EU20E401]",
	NULL,
	P01_SY00J806 as "Дата само- теста [P01_SY00J806]",
	P01_EU00S601 as "Итог само- теста [P01_EU00S601]",
	CAST(P01_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P01_EU00U401]",
	null,
	P01_SY00J803   as "Переход на Батарею [P01_SY00J803]",
	P01_EU00S603   as "Причина перех на бат [P01_EU00S603]",
	P01_SY00J804   as "Время раб от бат, сек [P01_SY00J804]",
	P01_SY00J805   as "Переход на Сеть [P01_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P01_EU00S602, P01_EU10U001, P01_EU20U001, P01_EU20E401, P01_SY00J802, P01_EU00T001,
	P01_SY00J806, P01_EU00S601, P01_EU00U401,
	P01_SY00J803, P01_SY00J805, P01_SY00J804, P01_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")