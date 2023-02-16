{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 6. РЭП ТДМ к/а ст. № 3 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P06_EU00S602 as "Состоя- ние [P06_EU00S602]",
	CAST(P06_EU00T001 as decimal(10)) as "Темп-ра, °С  [P06_EU00T001]",
	CAST(P06_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P06_SY00J802]",
	CAST(P06_EU10U001 as decimal(10,0)) as "Uвх., В [P06_EU10U001]",
	CAST(P06_EU20U001 as decimal(10,0)) as "Uвых., В [P06_EU20U001]",
	CAST(P06_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P06_EU20E401]",
	NULL,
	P06_SY00J806 as "Дата само- теста [P06_SY00J806]", 
	P06_EU00S601 as "Итог само- теста [P06_EU00S601]",
	CAST(P06_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P06_EU00U401]",
	null,
	P06_SY00J803   as "Переход на Батарею [P06_SY00J803]",
	P06_EU00S603   as "Причина перех на бат [P06_EU00S603]",
	P06_SY00J804   as "Время раб от бат, сек [P06_SY00J804]",
	P06_SY00J805   as "Переход на Сеть [P06_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P06_EU00S602, P06_EU10U001, P06_EU20U001, P06_EU20E401, P06_SY00J802, P06_EU00T001, 
	P06_SY00J806, P06_EU00S601, P06_EU00U401,
	P06_SY00J803, P06_SY00J805, P06_SY00J804, P06_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 6. РЭП ТДМ к/а ст. № 3 (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST(P06_EU00T001 as decimal(10)) as "Темп-ра, °С  [P06_EU00T001]",
	CAST(P06_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P06_SY00J802]",
	CAST(P06_EU10U001 as decimal(10,0)) as "Uвх., В [P06_EU10U001]",
	CAST(P06_EU20U001 as decimal(10,0)) as "Uвых., В [P06_EU20U001]",
	CAST(P06_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P06_EU20E401]",
	NULL,
	P06_SY00J806 as "Дата само- теста [P06_SY00J806]", 
	P06_EU00S601 as "Итог само- теста [P06_EU00S601]",
	CAST(P06_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P06_EU00U401]",
	null,
	P06_SY00J803   as "Переход на Батарею [P06_SY00J803]",
	P06_EU00S603   as "Причина перех на бат [P06_EU00S603]",
	P06_SY00J804   as "Время раб от бат, сек [P06_SY00J804]",
	P06_SY00J805   as "Переход на Сеть [P06_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P06_EU00S602, P06_EU10U001, P06_EU20U001, P06_EU20E401, P06_SY00J802, P06_EU00T001, 
	P06_SY00J806, P06_EU00S601, P06_EU00U401,
	P06_SY00J803, P06_SY00J805, P06_SY00J804, P06_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 6. РЭП ТДМ к/а ст. № 3 (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P06_EU00T001 as decimal(10)) as "Темп-ра, °С  [P06_EU00T001]",
	CAST(P06_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P06_SY00J802]",
	CAST(P06_EU10U001 as decimal(10,0)) as "Uвх., В [P06_EU10U001]",
	CAST(P06_EU20U001 as decimal(10,0)) as "Uвых., В [P06_EU20U001]",
	CAST(P06_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P06_EU20E401]",
	NULL,
	P06_SY00J806 as "Дата само- теста [P06_SY00J806]", 
	P06_EU00S601 as "Итог само- теста [P06_EU00S601]",
	CAST(P06_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P06_EU00U401]",
	null,
	P06_SY00J803   as "Переход на Батарею [P06_SY00J803]",
	P06_EU00S603   as "Причина перех на бат [P06_EU00S603]",
	P06_SY00J804   as "Время раб от бат, сек [P06_SY00J804]",
	P06_SY00J805   as "Переход на Сеть [P06_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P06_EU00S602, P06_EU10U001, P06_EU20U001, P06_EU20E401, P06_SY00J802, P06_EU00T001, 
	P06_SY00J806, P06_EU00S601, P06_EU00U401,
	P06_SY00J803, P06_SY00J805, P06_SY00J804, P06_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")