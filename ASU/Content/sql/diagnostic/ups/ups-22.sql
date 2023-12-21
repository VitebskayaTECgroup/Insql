{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 22. КА-4 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P22_EU00S602 as "Состоя- ние [P22_EU00S602]",
	CAST(P22_EU00T001 as decimal(10)) as "Темп-ра, °С  [P22_EU00T001]",
	CAST(P22_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P22_SY00J802]",
	CAST(P22_EU10U001 as decimal(10,0)) as "Uвх., В [P22_EU10U001]",
	CAST(P22_EU20U001 as decimal(10,0)) as "Uвых., В [P22_EU20U001]",
	CAST(P22_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P22_EU20E401]",
	NULL,
	P22_SY00J806 as "Дата само- теста [P22_SY00J806]",
	P22_EU00S601 as "Итог само- теста [P22_EU00S601]",
	CAST(P22_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P22_EU00U401]",
	null,
	P22_SY00J803 as "Переход на Батарею [P22_SY00J803]",
	P22_EU00S603 as "Причина перех на бат [P22_EU00S603]",
	P22_SY00J804 as "Время раб от бат, сек [P22_SY00J804]",
	P22_SY00J805 as "Переход на Сеть [P22_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P22_EU00S602, P22_EU10U001, P22_EU20U001, P22_EU20E401, P22_SY00J802, P22_EU00T001,
	P22_SY00J806, P22_EU00S601, P22_EU00U401,
	P22_SY00J803, P22_SY00J805, P22_SY00J804, P22_EU00S603
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
	CAST(P22_EU00T001 as decimal(10)) as "Темп-ра, °С  [P22_EU00T001]",
	CAST(P22_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P22_SY00J802]",
	CAST(P22_EU10U001 as decimal(10,0)) as "Uвх., В [P22_EU10U001]",
	CAST(P22_EU20U001 as decimal(10,0)) as "Uвых., В [P22_EU20U001]",
	CAST(P22_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P22_EU20E401]",
	NULL,
	P22_SY00J806 as "Дата само- теста [P22_SY00J806]",
	P22_EU00S601 as "Итог само- теста [P22_EU00S601]",
	CAST(P22_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P22_EU00U401]",
	null,
	P22_SY00J803 as "Переход на Батарею [P22_SY00J803]",
	P22_EU00S603 as "Причина перех на бат [P14_EU00S603]",
	P22_SY00J804 as "Время раб от бат, сек [P22_SY00J804]",
	P22_SY00J805 as "Переход на Сеть [P22_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P22_EU00S602, P22_EU10U001, P22_EU20U001, P22_EU20E401, P22_SY00J802, P22_EU00T001,
	P22_SY00J806, P22_EU00S601, P22_EU00U401,
	P22_SY00J803, P22_SY00J805, P22_SY00J804, P22_EU00S603
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
	CAST(P22_EU00T001 as decimal(10)) as "Темп-ра, °С  [P22_EU00T001]",
	CAST(P22_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P22_SY00J802]",
	CAST(P22_EU10U001 as decimal(10,0)) as "Uвх., В [P22_EU10U001]",
	CAST(P22_EU20U001 as decimal(10,0)) as "Uвых., В [P22_EU20U001]",
	CAST(P22_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P22_EU20E401]",
	null,
	P22_SY00J806 as "Дата само- теста [P22_SY00J806]",
	P22_EU00S601 as "Итог само- теста [P22_EU00S601]",
	CAST(P22_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P22_EU00U401]",
	null,
	P22_SY00J803 as "Переход на Батарею [P22_SY00J803]",
	P22_EU00S603 as "Причина перех на бат [P22_EU00S603]",
	P22_SY00J804 as "Время раб от бат, сек [P22_SY00J804]",
	P22_SY00J805 as "Переход на Сеть [P22_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P22_EU00S602, P22_EU10U001, P22_EU20U001, P22_EU20E401, P22_SY00J802, P22_EU00T001,
	P22_SY00J806, P22_EU00S601, P22_EU00U401,
	P22_SY00J803, P22_SY00J805, P22_SY00J804, P22_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")