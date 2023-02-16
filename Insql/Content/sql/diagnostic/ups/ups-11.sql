{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 11. ШОС (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P11_EU00S602 as "Состоя- ние [P11_EU00S602]",
	CAST(P11_EU00T001 as decimal(10)) as "Темп-ра, °С  [P11_EU00T001]",
	CAST(P11_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P11_SY00J802]",
	CAST(P11_EU10U001 as decimal(10,0)) as "Uвх., В [P11_EU10U001]",
	CAST(P11_EU20U001 as decimal(10,0)) as "Uвых., В [P11_EU20U001]",
	CAST(P11_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P11_EU20E401]",
	NULL,
	P11_SY00J806 as "Дата само- теста [P11_SY00J806]", 
	P11_EU00S601 as "Итог само- теста [P11_EU00S601]",
	CAST(P11_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P11_EU00U401]",
	null,
	P11_SY00J803   as "Переход на Батарею [P11_SY00J803]",
	P11_EU00S603   as "Причина перех на бат [P11_EU00S603]",
	P11_SY00J804   as "Время раб от бат, сек [P11_SY00J804]",
	P11_SY00J805   as "Переход на Сеть [P11_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P11_EU00S602, P11_EU10U001, P11_EU20U001, P11_EU20E401, P11_SY00J802, P11_EU00T001, 
	P11_SY00J806, P11_EU00S601, P11_EU00U401,
	P11_SY00J803, P11_SY00J805, P11_SY00J804, P11_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 11. ШОС (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST(P11_EU00T001 as decimal(10)) as "Темп-ра, °С  [P11_EU00T001]",
	CAST(P11_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P11_SY00J802]",
	CAST(P11_EU10U001 as decimal(10,0)) as "Uвх., В [P11_EU10U001]",
	CAST(P11_EU20U001 as decimal(10,0)) as "Uвых., В [P11_EU20U001]",
	CAST(P11_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P11_EU20E401]",
	NULL,
	P11_SY00J806 as "Дата само- теста [P11_SY00J806]", 
	P11_EU00S601 as "Итог само- теста [P11_EU00S601]",
	CAST(P11_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P11_EU00U401]",
	null,
	P11_SY00J803   as "Переход на Батарею [P11_SY00J803]",
	P11_EU00S603   as "Причина перех на бат [P11_EU00S603]",
	P11_SY00J804   as "Время раб от бат, сек [P11_SY00J804]",
	P11_SY00J805   as "Переход на Сеть [P11_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P11_EU00S602, P11_EU10U001, P11_EU20U001, P11_EU20E401, P11_SY00J802, P11_EU00T001, 
	P11_SY00J806, P11_EU00S601, P11_EU00U401,
	P11_SY00J803, P11_SY00J805, P11_SY00J804, P11_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 11. ШОС (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(P11_EU00T001 as decimal(10)) as "Темп-ра, °С  [P11_EU00T001]",
	CAST(P11_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P11_SY00J802]",
	CAST(P11_EU10U001 as decimal(10,0)) as "Uвх., В [P11_EU10U001]",
	CAST(P11_EU20U001 as decimal(10,0)) as "Uвых., В [P11_EU20U001]",
	CAST(P11_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P11_EU20E401]",
	NULL,
	P11_SY00J806 as "Дата само- теста [P11_SY00J806]", 
	P11_EU00S601 as "Итог само- теста [P11_EU00S601]",
	CAST(P11_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P11_EU00U401]",
	null,
	P11_SY00J803   as "Переход на Батарею [P11_SY00J803]",
	P11_EU00S603   as "Причина перех на бат [P11_EU00S603]",
	P11_SY00J804   as "Время раб от бат, сек [P11_SY00J804]",
	P11_SY00J805   as "Переход на Сеть [P11_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P11_EU00S602, P11_EU10U001, P11_EU20U001, P11_EU20E401, P11_SY00J802, P11_EU00T001, 
	P11_SY00J806, P11_EU00S601, P11_EU00U401,
	P11_SY00J803, P11_SY00J805, P11_SY00J804, P11_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")