{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 20. РЭП СН-4 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P20_EU00S602 as "Состоя- ние [P20_EU00S602]",
	CAST(P20_EU00T001 as decimal(10)) as "Темп-ра, °С  [P20_EU00T001]",
	CAST(P20_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P20_SY00J802]",
	CAST(P20_EU10U001 as decimal(10,0)) as "Uвх., В [P20_EU10U001]",
	CAST(P20_EU20U001 as decimal(10,0)) as "Uвых., В [P20_EU20U001]",
	CAST(P20_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P20_EU20E401]",
	NULL,
	P20_SY00J806 as "Дата само- теста [P20_SY00J806]",
	P20_EU00S601 as "Итог само- теста [P20_EU00S601]",
	CAST(P20_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P20_EU00U401]",
	null,
	P20_SY00J803 as "Переход на Батарею [P20_SY00J803]",
	P20_EU00S603 as "Причина перех на бат [P20_EU00S603]",
	P20_SY00J804 as "Время раб от бат, сек [P20_SY00J804]",
	P20_SY00J805 as "Переход на Сеть [P20_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P20_EU00S602, P20_EU10U001, P20_EU20U001, P20_EU20E401, P20_SY00J802, P20_EU00T001,
	P20_SY00J806, P20_EU00S601, P20_EU00U401,
	P20_SY00J803, P20_SY00J805, P20_SY00J804, P20_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 20. РЭП СН-4 (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P20_EU00T001 as decimal(10)) as "Темп-ра, °С  [P20_EU00T001]",
	CAST(P20_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P20_SY00J802]",
	CAST(P20_EU10U001 as decimal(10,0)) as "Uвх., В [P20_EU10U001]",
	CAST(P20_EU20U001 as decimal(10,0)) as "Uвых., В [P20_EU20U001]",
	CAST(P20_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P20_EU20E401]",
	NULL,
	P20_SY00J806 as "Дата само- теста [P20_SY00J806]",
	P20_EU00S601 as "Итог само- теста [P20_EU00S601]",
	CAST(P20_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P20_EU00U401]",
	null,
	P20_SY00J803 as "Переход на Батарею [P20_SY00J803]",
	P20_EU00S603 as "Причина перех на бат [P14_EU00S603]",
	P20_SY00J804 as "Время раб от бат, сек [P20_SY00J804]",
	P20_SY00J805 as "Переход на Сеть [P20_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P20_EU00S602, P20_EU10U001, P20_EU20U001, P20_EU20E401, P20_SY00J802, P20_EU00T001,
	P20_SY00J806, P20_EU00S601, P20_EU00U401,
	P20_SY00J803, P20_SY00J805, P20_SY00J804, P20_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 20. РЭП СН-4 (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST(P20_EU00T001 as decimal(10)) as "Темп-ра, °С  [P20_EU00T001]",
	CAST(P20_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P20_SY00J802]",
	CAST(P20_EU10U001 as decimal(10,0)) as "Uвх., В [P20_EU10U001]",
	CAST(P20_EU20U001 as decimal(10,0)) as "Uвых., В [P20_EU20U001]",
	CAST(P20_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P20_EU20E401]",
	null,
	P20_SY00J806 as "Дата само- теста [P20_SY00J806]",
	P20_EU00S601 as "Итог само- теста [P20_EU00S601]",
	CAST(P20_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P20_EU00U401]",
	null,
	P20_SY00J803 as "Переход на Батарею [P20_SY00J803]",
	P20_EU00S603 as "Причина перех на бат [P20_EU00S603]",
	P20_SY00J804 as "Время раб от бат, сек [P20_SY00J804]",
	P20_SY00J805 as "Переход на Сеть [P20_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P20_EU00S602, P20_EU10U001, P20_EU20U001, P20_EU20E401, P20_SY00J802, P20_EU00T001,
	P20_SY00J806, P20_EU00S601, P20_EU00U401,
	P20_SY00J803, P20_SY00J805, P20_SY00J804, P20_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")