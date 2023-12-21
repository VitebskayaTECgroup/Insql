{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 22. КА-4 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P23_EU00S602 as "Состоя- ние [P23_EU00S602]",
	CAST(P23_EU00T001 as decimal(10)) as "Темп-ра, °С  [P23_EU00T001]",
	CAST(P23_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P23_SY00J802]",
	CAST(P23_EU10U001 as decimal(10,0)) as "Uвх., В [P23_EU10U001]",
	CAST(P23_EU20U001 as decimal(10,0)) as "Uвых., В [P23_EU20U001]",
	CAST(P23_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P23_EU20E401]",
	NULL,
	P23_SY00J806 as "Дата само- теста [P23_SY00J806]",
	P23_EU00S601 as "Итог само- теста [P23_EU00S601]",
	CAST(P23_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P23_EU00U401]",
	null,
	P23_SY00J803 as "Переход на Батарею [P23_SY00J803]",
	P23_EU00S603 as "Причина перех на бат [P23_EU00S603]",
	P23_SY00J804 as "Время раб от бат, сек [P23_SY00J804]",
	P23_SY00J805 as "Переход на Сеть [P23_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P23_EU00S602, P23_EU10U001, P23_EU20U001, P23_EU20E401, P23_SY00J802, P23_EU00T001,
	P23_SY00J806, P23_EU00S601, P23_EU00U401,
	P23_SY00J803, P23_SY00J805, P23_SY00J804, P23_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 22. КА-4 (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P23_EU00T001 as decimal(10)) as "Темп-ра, °С  [P23_EU00T001]",
	CAST(P23_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P23_SY00J802]",
	CAST(P23_EU10U001 as decimal(10,0)) as "Uвх., В [P23_EU10U001]",
	CAST(P23_EU20U001 as decimal(10,0)) as "Uвых., В [P23_EU20U001]",
	CAST(P23_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P23_EU20E401]",
	NULL,
	P23_SY00J806 as "Дата само- теста [P23_SY00J806]",
	P23_EU00S601 as "Итог само- теста [P23_EU00S601]",
	CAST(P23_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P23_EU00U401]",
	null,
	P23_SY00J803 as "Переход на Батарею [P23_SY00J803]",
	P23_EU00S603 as "Причина перех на бат [P14_EU00S603]",
	P23_SY00J804 as "Время раб от бат, сек [P23_SY00J804]",
	P23_SY00J805 as "Переход на Сеть [P23_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P23_EU00S602, P23_EU10U001, P23_EU20U001, P23_EU20E401, P23_SY00J802, P23_EU00T001,
	P23_SY00J806, P23_EU00S601, P23_EU00U401,
	P23_SY00J803, P23_SY00J805, P23_SY00J804, P23_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 22. КА-4 (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST(P23_EU00T001 as decimal(10)) as "Темп-ра, °С  [P23_EU00T001]",
	CAST(P23_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P23_SY00J802]",
	CAST(P23_EU10U001 as decimal(10,0)) as "Uвх., В [P23_EU10U001]",
	CAST(P23_EU20U001 as decimal(10,0)) as "Uвых., В [P23_EU20U001]",
	CAST(P23_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P23_EU20E401]",
	null,
	P23_SY00J806 as "Дата само- теста [P23_SY00J806]",
	P23_EU00S601 as "Итог само- теста [P23_EU00S601]",
	CAST(P23_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P23_EU00U401]",
	null,
	P23_SY00J803 as "Переход на Батарею [P23_SY00J803]",
	P23_EU00S603 as "Причина перех на бат [P23_EU00S603]",
	P23_SY00J804 as "Время раб от бат, сек [P23_SY00J804]",
	P23_SY00J805 as "Переход на Сеть [P23_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P23_EU00S602, P23_EU10U001, P23_EU20U001, P23_EU20E401, P23_SY00J802, P23_EU00T001,
	P23_SY00J806, P23_EU00S601, P23_EU00U401,
	P23_SY00J803, P23_SY00J805, P23_SY00J804, P23_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")