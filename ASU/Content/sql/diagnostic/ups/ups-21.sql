{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 21. КН 3-1 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P21_EU00S602 as "Состоя- ние [P21_EU00S602]",
	CAST(P21_EU00T001 as decimal(10)) as "Темп-ра, °С  [P21_EU00T001]",
	CAST(P21_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P21_SY00J802]",
	CAST(P21_EU10U001 as decimal(10,0)) as "Uвх., В [P21_EU10U001]",
	CAST(P21_EU20U001 as decimal(10,0)) as "Uвых., В [P21_EU20U001]",
	CAST(P21_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P21_EU20E401]",
	NULL,
	P21_SY00J806 as "Дата само- теста [P21_SY00J806]",
	P21_EU00S601 as "Итог само- теста [P21_EU00S601]",
	CAST(P21_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P21_EU00U401]",
	null,
	P21_SY00J803 as "Переход на Батарею [P21_SY00J803]",
	P21_EU00S603 as "Причина перех на бат [P21_EU00S603]",
	P21_SY00J804 as "Время раб от бат, сек [P21_SY00J804]",
	P21_SY00J805 as "Переход на Сеть [P21_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P21_EU00S602, P21_EU10U001, P21_EU20U001, P21_EU20E401, P21_SY00J802, P21_EU00T001,
	P21_SY00J806, P21_EU00S601, P21_EU00U401,
	P21_SY00J803, P21_SY00J805, P21_SY00J804, P21_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 21. КН 3-1 (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P21_EU00T001 as decimal(10)) as "Темп-ра, °С  [P21_EU00T001]",
	CAST(P21_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P21_SY00J802]",
	CAST(P21_EU10U001 as decimal(10,0)) as "Uвх., В [P21_EU10U001]",
	CAST(P21_EU20U001 as decimal(10,0)) as "Uвых., В [P21_EU20U001]",
	CAST(P21_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P21_EU20E401]",
	NULL,
	P21_SY00J806 as "Дата само- теста [P21_SY00J806]",
	P21_EU00S601 as "Итог само- теста [P21_EU00S601]",
	CAST(P21_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P21_EU00U401]",
	null,
	P21_SY00J803 as "Переход на Батарею [P21_SY00J803]",
	P21_EU00S603 as "Причина перех на бат [P14_EU00S603]",
	P21_SY00J804 as "Время раб от бат, сек [P21_SY00J804]",
	P21_SY00J805 as "Переход на Сеть [P21_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P21_EU00S602, P21_EU10U001, P21_EU20U001, P21_EU20E401, P21_SY00J802, P21_EU00T001,
	P21_SY00J806, P21_EU00S601, P21_EU00U401,
	P21_SY00J803, P21_SY00J805, P21_SY00J804, P21_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 21. КН 3-1 (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST(P21_EU00T001 as decimal(10)) as "Темп-ра, °С  [P21_EU00T001]",
	CAST(P21_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P21_SY00J802]",
	CAST(P21_EU10U001 as decimal(10,0)) as "Uвх., В [P21_EU10U001]",
	CAST(P21_EU20U001 as decimal(10,0)) as "Uвых., В [P21_EU20U001]",
	CAST(P21_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P21_EU20E401]",
	null,
	P21_SY00J806 as "Дата само- теста [P21_SY00J806]",
	P21_EU00S601 as "Итог само- теста [P21_EU00S601]",
	CAST(P21_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P21_EU00U401]",
	null,
	P21_SY00J803 as "Переход на Батарею [P21_SY00J803]",
	P21_EU00S603 as "Причина перех на бат [P21_EU00S603]",
	P21_SY00J804 as "Время раб от бат, сек [P21_SY00J804]",
	P21_SY00J805 as "Переход на Сеть [P21_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P21_EU00S602, P21_EU10U001, P21_EU20U001, P21_EU20E401, P21_SY00J802, P21_EU00T001,
	P21_SY00J806, P21_EU00S601, P21_EU00U401,
	P21_SY00J803, P21_SY00J805, P21_SY00J804, P21_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")