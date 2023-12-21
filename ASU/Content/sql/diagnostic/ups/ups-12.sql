{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 12. ШОС (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P12_EU00S602 as "Состоя- ние [P12_EU00S602]",
	CAST(P12_EU00T001 as decimal(10)) as "Темп-ра, °С  [P12_EU00T001]",
	CAST(P12_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P12_SY00J802]",
	CAST(P12_EU10U001 as decimal(10,0)) as "Uвх., В [P12_EU10U001]",
	CAST(P12_EU20U001 as decimal(10,0)) as "Uвых., В [P12_EU20U001]",
	CAST(P12_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P12_EU20E401]",
	NULL,
	P12_SY00J806 as "Дата само- теста [P12_SY00J806]", 
	P12_EU00S601 as "Итог само- теста [P12_EU00S601]",
	CAST(P12_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P12_EU00U401]",
	null,
	P12_SY00J803   as "Переход на Батарею [P12_SY00J803]",
	P12_EU00S603   as "Причина перех на бат [P12_EU00S603]",
	P12_SY00J804   as "Время раб от бат, сек [P12_SY00J804]",
	P12_SY00J805   as "Переход на Сеть [P12_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P12_EU00S602, P12_EU10U001, P12_EU20U001, P12_EU20E401, P12_SY00J802, P12_EU00T001, 
	P12_SY00J806, P12_EU00S601, P12_EU00U401,
	P12_SY00J803, P12_SY00J805, P12_SY00J804, P12_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 12. ШОС (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P12_EU00T001 as decimal(10)) as "Темп-ра, °С  [P12_EU00T001]",
	CAST(P12_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P12_SY00J802]",
	CAST(P12_EU10U001 as decimal(10,0)) as "Uвх., В [P12_EU10U001]",
	CAST(P12_EU20U001 as decimal(10,0)) as "Uвых., В [P12_EU20U001]",
	CAST(P12_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P12_EU20E401]",
	NULL,
	P12_SY00J806 as "Дата само- теста [P12_SY00J806]", 
	P12_EU00S601 as "Итог само- теста [P12_EU00S601]",
	CAST(P12_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P12_EU00U401]",
	null,
	P12_SY00J803 as "Переход на Батарею [P12_SY00J803]",
	P12_EU00S603 as "Причина перех на бат [P12_EU00S603]",
	P12_SY00J804 as "Время раб от бат, сек [P12_SY00J804]",
	P12_SY00J805 as "Переход на Сеть [P12_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P12_EU00S602, P12_EU10U001, P12_EU20U001, P12_EU20E401, P12_SY00J802, P12_EU00T001, 
	P12_SY00J806, P12_EU00S601, P12_EU00U401,
	P12_SY00J803, P12_SY00J805, P12_SY00J804, P12_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 12. ШОС (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P12_EU00T001 as decimal(10)) as "Темп-ра, °С  [P12_EU00T001]",
	CAST(P12_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P12_SY00J802]",
	CAST(P12_EU10U001 as decimal(10,0)) as "Uвх., В [P12_EU10U001]",
	CAST(P12_EU20U001 as decimal(10,0)) as "Uвых., В [P12_EU20U001]",
	CAST(P12_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P12_EU20E401]",
	NULL,
	P12_SY00J806 as "Дата само- теста [P12_SY00J806]", 
	P12_EU00S601 as "Итог само- теста [P12_EU00S601]",
	CAST(P12_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P12_EU00U401]",
	null,
	P12_SY00J803   as "Переход на Батарею [P12_SY00J803]",
	P12_EU00S603   as "Причина перех на бат [P12_EU00S603]",
	P12_SY00J804   as "Время раб от бат, сек [P12_SY00J804]",
	P12_SY00J805   as "Переход на Сеть [P12_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P12_EU00S602, P12_EU10U001, P12_EU20U001, P12_EU20E401, P12_SY00J802, P12_EU00T001, 
	P12_SY00J806, P12_EU00S601, P12_EU00U401,
	P12_SY00J803, P12_SY00J805, P12_SY00J804, P12_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")