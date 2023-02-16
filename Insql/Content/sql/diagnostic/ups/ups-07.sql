{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 7. Гидромуфта ПЭН-6 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P07_EU00S602 as "Состоя- ние [P07_EU00S602]",
	CAST(P07_EU00T001 as decimal(10)) as "Темп-ра, °С  [P07_EU00T001]",
	CAST(P07_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P07_SY00J802]",
	CAST(P07_EU10U001 as decimal(10,0)) as "Uвх., В [P07_EU10U001]",
	CAST(P07_EU20U001 as decimal(10,0)) as "Uвых., В [P07_EU20U001]",
	CAST(P07_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P07_EU20E401]",
	NULL,
	P07_SY00J806 as "Дата само- теста [P07_SY00J806]", 
	P07_EU00S601 as "Итог само- теста [P07_EU00S601]",
	CAST(P07_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P07_EU00U401]",
	null,
	P07_SY00J803   as "Переход на Батарею [P07_SY00J803]",
	P07_EU00S603   as "Причина перех на бат [P07_EU00S603]",
	P07_SY00J804   as "Время раб от бат, сек [P07_SY00J804]",
	P07_SY00J805   as "Переход на Сеть [P07_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P07_EU00S602, P07_EU10U001, P07_EU20U001, P07_EU20E401, P07_SY00J802, P07_EU00T001, 
	P07_SY00J806, P07_EU00S601, P07_EU00U401,
	P07_SY00J803, P07_SY00J805, P07_SY00J804, P07_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 7. Гидромуфта ПЭН-6 (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST(P07_EU00T001 as decimal(10)) as "Темп-ра, °С  [P07_EU00T001]",
	CAST(P07_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P07_SY00J802]",
	CAST(P07_EU10U001 as decimal(10,0)) as "Uвх., В [P07_EU10U001]",
	CAST(P07_EU20U001 as decimal(10,0)) as "Uвых., В [P07_EU20U001]",
	CAST(P07_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P07_EU20E401]",
	NULL,
	P07_SY00J806 as "Дата само- теста [P07_SY00J806]", 
	P07_EU00S601 as "Итог само- теста [P07_EU00S601]",
	CAST(P07_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P07_EU00U401]",
	null,
	P07_SY00J803   as "Переход на Батарею [P07_SY00J803]",
	P07_EU00S603   as "Причина перех на бат [P07_EU00S603]",
	P07_SY00J804   as "Время раб от бат, сек [P07_SY00J804]",
	P07_SY00J805   as "Переход на Сеть [P07_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P07_EU00S602, P07_EU10U001, P07_EU20U001, P07_EU20E401, P07_SY00J802, P07_EU00T001, 
	P07_SY00J806, P07_EU00S601, P07_EU00U401,
	P07_SY00J803, P07_SY00J805, P07_SY00J804, P07_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 7. Гидромуфта ПЭН-6 (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P07_EU00T001 as decimal(10)) as "Темп-ра, °С  [P07_EU00T001]",
	CAST(P07_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P07_SY00J802]",
	CAST(P07_EU10U001 as decimal(10,0)) as "Uвх., В [P07_EU10U001]",
	CAST(P07_EU20U001 as decimal(10,0)) as "Uвых., В [P07_EU20U001]",
	CAST(P07_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P07_EU20E401]",
	NULL,
	P07_SY00J806 as "Дата само- теста [P07_SY00J806]", 
	P07_EU00S601 as "Итог само- теста [P07_EU00S601]",
	CAST(P07_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P07_EU00U401]",
	null,
	P07_SY00J803   as "Переход на Батарею [P07_SY00J803]",
	P07_EU00S603   as "Причина перех на бат [P07_EU00S603]",
	P07_SY00J804   as "Время раб от бат, сек [P07_SY00J804]",
	P07_SY00J805   as "Переход на Сеть [P07_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P07_EU00S602, P07_EU10U001, P07_EU20U001, P07_EU20E401, P07_SY00J802, P07_EU00T001, 
	P07_SY00J806, P07_EU00S601, P07_EU00U401,
	P07_SY00J803, P07_SY00J805, P07_SY00J804, P07_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")