{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 17. ШКУ (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P17_EU00S602 as "Состоя- ние [P17_EU00S602]",
	CAST(P17_EU00T001 as decimal(10)) as "Темп-ра, °С  [P17_EU00T001]",
	CAST(P17_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P17_SY00J802]",
	CAST(P17_EU10U001 as decimal(10,0)) as "Uвх., В [P17_EU10U001]",
	CAST(P17_EU20U001 as decimal(10,0)) as "Uвых., В [P17_EU20U001]",
	CAST(P17_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P17_EU20E401]",
	NULL,
	P17_SY00J806 as "Дата само- теста [P17_SY00J806]",
	P17_EU00S601 as "Итог само- теста [P17_EU00S601]",
	CAST(P17_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P17_EU00U401]",
	null,
	P17_SY00J803   as "Переход на Батарею [P17_SY00J803]",
	P17_EU00S603   as "Причина перех на бат [P17_EU00S603]",
	P17_SY00J804   as "Время раб от бат, сек [P17_SY00J804]",
	P17_SY00J805   as "Переход на Сеть [P17_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P17_EU00S602, P17_EU10U001, P17_EU20U001, P17_EU20E401, P17_SY00J802, P17_EU00T001,
	P17_SY00J806, P17_EU00S601, P17_EU00U401,
	P17_SY00J803, P17_SY00J805, P17_SY00J804, P17_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 17. ШКУ (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P17_EU00T001 as decimal(10)) as "Темп-ра, °С  [P17_EU00T001]",
	CAST(P17_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P17_SY00J802]",
	CAST(P17_EU10U001 as decimal(10,0)) as "Uвх., В [P17_EU10U001]",
	CAST(P17_EU20U001 as decimal(10,0)) as "Uвых., В [P17_EU20U001]",
	CAST(P17_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P17_EU20E401]",
	NULL,
	P17_SY00J806 as "Дата само- теста [P17_SY00J806]",
	P17_EU00S601 as "Итог само- теста [P17_EU00S601]",
	CAST(P17_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P17_EU00U401]",
	null,
	P17_SY00J803   as "Переход на Батарею [P17_SY00J803]",
	P17_EU00S603   as "Причина перех на бат [P14_EU00S603]",
	P17_SY00J804   as "Время раб от бат, сек [P17_SY00J804]",
	P17_SY00J805   as "Переход на Сеть [P17_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P17_EU00S602, P17_EU10U001, P17_EU20U001, P17_EU20E401, P17_SY00J802, P17_EU00T001,
	P17_SY00J806, P17_EU00S601, P17_EU00U401,
	P17_SY00J803, P17_SY00J805, P17_SY00J804, P17_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 17. ШКУ (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST(P17_EU00T001 as decimal(10)) as "Темп-ра, °С  [P17_EU00T001]",
	CAST(P17_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P17_SY00J802]",
	CAST(P17_EU10U001 as decimal(10,0)) as "Uвх., В [P17_EU10U001]",
	CAST(P17_EU20U001 as decimal(10,0)) as "Uвых., В [P17_EU20U001]",
	CAST(P17_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P17_EU20E401]",
	NULL,
	P17_SY00J806 as "Дата само- теста [P17_SY00J806]",
	P17_EU00S601 as "Итог само- теста [P17_EU00S601]",
	CAST(P17_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P17_EU00U401]",
	null,
	P17_SY00J803   as "Переход на Батарею [P17_SY00J803]",
	P17_EU00S603   as "Причина перех на бат [P17_EU00S603]",
	P17_SY00J804   as "Время раб от бат, сек [P17_SY00J804]",
	P17_SY00J805   as "Переход на Сеть [P17_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P17_EU00S602, P17_EU10U001, P17_EU20U001, P17_EU20E401, P17_SY00J802, P17_EU00T001,
	P17_SY00J806, P17_EU00S601, P17_EU00U401,
	P17_SY00J803, P17_SY00J805, P17_SY00J804, P17_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")