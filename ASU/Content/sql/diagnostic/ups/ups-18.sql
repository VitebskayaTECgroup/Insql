{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 18. ГРП (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P18_EU00S602 as "Состоя- ние [P18_EU00S602]",
	CAST(P18_EU00T001 as decimal(10)) as "Темп-ра, °С  [P18_EU00T001]",
	CAST(P18_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P18_SY00J802]",
	CAST(P18_EU10U001 as decimal(10,0)) as "Uвх., В [P18_EU10U001]",
	CAST(P18_EU20U001 as decimal(10,0)) as "Uвых., В [P18_EU20U001]",
	CAST(P18_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P18_EU20E401]",
	NULL,
	P18_SY00J806 as "Дата само- теста [P18_SY00J806]",
	P18_EU00S601 as "Итог само- теста [P18_EU00S601]",
	CAST(P18_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P18_EU00U401]",
	null,
	P18_SY00J803   as "Переход на Батарею [P18_SY00J803]",
	P18_EU00S603   as "Причина перех на бат [P18_EU00S603]",
	P18_SY00J804   as "Время раб от бат, сек [P18_SY00J804]",
	P18_SY00J805   as "Переход на Сеть [P18_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P18_EU00S602, P18_EU10U001, P18_EU20U001, P18_EU20E401, P18_SY00J802, P18_EU00T001,
	P18_SY00J806, P18_EU00S601, P18_EU00U401,
	P18_SY00J803, P18_SY00J805, P18_SY00J804, P18_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 18. ГРП (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P18_EU00T001 as decimal(10)) as "Темп-ра, °С  [P18_EU00T001]",
	CAST(P18_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P18_SY00J802]",
	CAST(P18_EU10U001 as decimal(10,0)) as "Uвх., В [P18_EU10U001]",
	CAST(P18_EU20U001 as decimal(10,0)) as "Uвых., В [P18_EU20U001]",
	CAST(P18_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P18_EU20E401]",
	NULL,
	P18_SY00J806 as "Дата само- теста [P18_SY00J806]",
	P18_EU00S601 as "Итог само- теста [P18_EU00S601]",
	CAST(P18_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P18_EU00U401]",
	null,
	P18_SY00J803 as "Переход на Батарею [P18_SY00J803]",
	P18_EU00S603 as "Причина перех на бат [P14_EU00S603]",
	P18_SY00J804 as "Время раб от бат, сек [P18_SY00J804]",
	P18_SY00J805 as "Переход на Сеть [P18_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P18_EU00S602, P18_EU10U001, P18_EU20U001, P18_EU20E401, P18_SY00J802, P18_EU00T001,
	P18_SY00J806, P18_EU00S601, P18_EU00U401,
	P18_SY00J803, P18_SY00J805, P18_SY00J804, P18_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 18. ГРП (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(P18_EU00T001 as decimal(10)) as "Темп-ра, °С  [P18_EU00T001]",
	CAST(P18_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P18_SY00J802]",
	CAST(P18_EU10U001 as decimal(10,0)) as "Uвх., В [P18_EU10U001]",
	CAST(P18_EU20U001 as decimal(10,0)) as "Uвых., В [P18_EU20U001]",
	CAST(P18_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P18_EU20E401]",
	NULL,
	P18_SY00J806 as "Дата само- теста [P18_SY00J806]",
	P18_EU00S601 as "Итог само- теста [P18_EU00S601]",
	CAST(P18_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P18_EU00U401]",
	null,
	P18_SY00J803 as "Переход на Батарею [P18_SY00J803]",
	P18_EU00S603 as "Причина перех на бат [P18_EU00S603]",
	P18_SY00J804 as "Время раб от бат, сек [P18_SY00J804]",
	P18_SY00J805 as "Переход на Сеть [P18_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P18_EU00S602, P18_EU10U001, P18_EU20U001, P18_EU20E401, P18_SY00J802, P18_EU00T001,
	P18_SY00J806, P18_EU00S601, P18_EU00U401, P18_SY00J803, P18_SY00J805, P18_SY00J804, P18_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")