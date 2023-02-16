{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 3. Серверная АСУТП, линия Б (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P03_EU00S602 as "Состоя- ние [P03_EU00S602]",
	CAST(P03_EU00T001 as decimal(10)) as "Темп-ра, °С  [P03_EU00T001]",
	CAST(P03_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P03_SY00J802]",
	CAST(P03_EU10U001 as decimal(10,0)) as "Uвх., В [P03_EU10U001]",
	CAST(P03_EU20U001 as decimal(10,0)) as "Uвых., В [P03_EU20U001]",
	CAST(P03_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P03_EU20E401]",
	NULL,
	P03_SY00J806 as "Дата само- теста [P03_SY00J806]", 
	P03_EU00S601 as "Итог само- теста [P03_EU00S601]",
	CAST(P03_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P03_EU00U401]",
	null,
	P03_SY00J803   as "Переход на Батарею [P03_SY00J803]",
	P03_EU00S603   as "Причина перех на бат [P03_EU00S603]",
	P03_SY00J804   as "Время раб от бат, сек [P03_SY00J804]",
	P03_SY00J805   as "Переход на Сеть [P03_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P03_EU00S602, P03_EU10U001, P03_EU20U001, P03_EU20E401, P03_SY00J802, P03_EU00T001, 
	P03_SY00J806, P03_EU00S601, P03_EU00U401,
	P03_SY00J803, P03_SY00J805, P03_SY00J804, P03_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 3. Серверная АСУТП, линия Б (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P03_EU00T001 as decimal(10)) as "Темп-ра, °С  [P03_EU00T001]",
	CAST(P03_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P03_SY00J802]",
	CAST(P03_EU10U001 as decimal(10,0)) as "Uвх., В [P03_EU10U001]",
	CAST(P03_EU20U001 as decimal(10,0)) as "Uвых., В [P03_EU20U001]",
	CAST(P03_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P03_EU20E401]",
	NULL,
	P03_SY00J806 as "Дата само- теста [P03_SY00J806]", 
	P03_EU00S601 as "Итог само- теста [P03_EU00S601]",
	CAST(P03_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P03_EU00U401]",
	null,
	P03_SY00J803   as "Переход на Батарею [P03_SY00J803]",
	P03_EU00S603   as "Причина перех на бат [P03_EU00S603]",
	P03_SY00J804   as "Время раб от бат, сек [P03_SY00J804]",
	P03_SY00J805   as "Переход на Сеть [P03_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P03_EU00S602, P03_EU10U001, P03_EU20U001, P03_EU20E401, P03_SY00J802, P03_EU00T001, 
	P03_SY00J806, P03_EU00S601, P03_EU00U401,
	P03_SY00J803, P03_SY00J805, P03_SY00J804, P03_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 3. Серверная АСУТП, линия Б (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P03_EU00T001 as decimal(10)) as "Темп-ра, °С  [P03_EU00T001]",
	CAST(P03_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P03_SY00J802]",
	CAST(P03_EU10U001 as decimal(10,0)) as "Uвх., В [P03_EU10U001]",
	CAST(P03_EU20U001 as decimal(10,0)) as "Uвых., В [P03_EU20U001]",
	CAST(P03_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P03_EU20E401]",
	NULL,
	P03_SY00J806 as "Дата само- теста [P03_SY00J806]", 
	P03_EU00S601 as "Итог само- теста [P03_EU00S601]",
	CAST(P03_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P03_EU00U401]",
	null,
	P03_SY00J803   as "Переход на Батарею [P03_SY00J803]",
	P03_EU00S603   as "Причина перех на бат [P03_EU00S603]",
	P03_SY00J804   as "Время раб от бат, сек [P03_SY00J804]",
	P03_SY00J805   as "Переход на Сеть [P03_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P03_EU00S602, P03_EU10U001, P03_EU20U001, P03_EU20E401, P03_SY00J802, P03_EU00T001, 
	P03_SY00J806, P03_EU00S601, P03_EU00U401,
	P03_SY00J803, P03_SY00J805, P03_SY00J804, P03_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")