{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 2. Серверная АСУТП, линия А (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P02_EU00S602 as "Состоя- ние [P02_EU00S602]",
	CAST(P02_EU00T001 as decimal(10)) as "Темп-ра, °С  [P02_EU00T001]",
	CAST(P02_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P02_SY00J802]",
	CAST(P02_EU10U001 as decimal(10,0)) as "Uвх., В [P02_EU10U001]",
	CAST(P02_EU20U001 as decimal(10,0)) as "Uвых., В [P02_EU20U001]",
	CAST(P02_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P02_EU20E401]",
	NULL,
	P02_SY00J806 as "Дата само- теста [P02_SY00J806]", 
	P02_EU00S601 as "Итог само- теста [P02_EU00S601]",
	CAST(P02_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P02_EU00U401]",
	null,
	P02_SY00J803   as "Переход на Батарею [P02_SY00J803]",
	P02_EU00S603   as "Причина перех на бат [P02_EU00S603]",
	P02_SY00J804   as "Время раб от бат, сек [P02_SY00J804]",
	P02_SY00J805   as "Переход на Сеть [P02_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P02_EU00S602, P02_EU10U001, P02_EU20U001, P02_EU20E401, P02_SY00J802, P02_EU00T001, 
	P02_SY00J806, P02_EU00S601, P02_EU00U401,
	P02_SY00J803, P02_SY00J805, P02_SY00J804, P02_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 2. Серверная АСУТП, линия А (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P02_EU00T001 as decimal(10)) as "Темп-ра, °С  [P02_EU00T001]",
	CAST(P02_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P02_SY00J802]",
	CAST(P02_EU10U001 as decimal(10,0)) as "Uвх., В [P02_EU10U001]",
	CAST(P02_EU20U001 as decimal(10,0)) as "Uвых., В [P02_EU20U001]",
	CAST(P02_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P02_EU20E401]",
	NULL,
	P02_SY00J806 as "Дата само- теста [P02_SY00J806]", 
	P02_EU00S601 as "Итог само- теста [P02_EU00S601]",
	CAST(P02_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P02_EU00U401]",
	null,
	P02_SY00J803   as "Переход на Батарею [P02_SY00J803]",
	P02_EU00S603   as "Причина перех на бат [P02_EU00S603]",
	P02_SY00J804   as "Время раб от бат, сек [P02_SY00J804]",
	P02_SY00J805   as "Переход на Сеть [P02_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P02_EU00S602, P02_EU10U001, P02_EU20U001, P02_EU20E401, P02_SY00J802, P02_EU00T001, 
	P02_SY00J806, P02_EU00S601, P02_EU00U401,
	P02_SY00J803, P02_SY00J805, P02_SY00J804, P02_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 2. Серверная АСУТП, линия А (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P02_EU00T001 as decimal(10)) as "Темп-ра, °С  [P02_EU00T001]",
	CAST(P02_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P02_SY00J802]",
	CAST(P02_EU10U001 as decimal(10,0)) as "Uвх., В [P02_EU10U001]",
	CAST(P02_EU20U001 as decimal(10,0)) as "Uвых., В [P02_EU20U001]",
	CAST(P02_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P02_EU20E401]",
	NULL,
	P02_SY00J806 as "Дата само- теста [P02_SY00J806]", 
	P02_EU00S601 as "Итог само- теста [P02_EU00S601]",
	CAST(P02_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P02_EU00U401]",
	null,
	P02_SY00J803   as "Переход на Батарею [P02_SY00J803]",
	P02_EU00S603   as "Причина перех на бат [P02_EU00S603]",
	P02_SY00J804   as "Время раб от бат, сек [P02_SY00J804]",
	P02_SY00J805   as "Переход на Сеть [P02_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P02_EU00S602, P02_EU10U001, P02_EU20U001, P02_EU20E401, P02_SY00J802, P02_EU00T001, 
	P02_SY00J806, P02_EU00S601, P02_EU00U401,
	P02_SY00J803, P02_SY00J805, P02_SY00J804, P02_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")