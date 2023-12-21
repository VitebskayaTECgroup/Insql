{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 16. ИТ-14, ЦТЩУ (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P16_EU00S602 as "Состоя- ние [P16_EU00S602]",
	CAST(P16_EU00T001 as decimal(10)) as "Темп-ра, °С  [P16_EU00T001]",
	CAST(P16_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P16_SY00J802]",
	CAST(P16_EU10U001 as decimal(10,0)) as "Uвх., В [P16_EU10U001]",
	CAST(P16_EU20U001 as decimal(10,0)) as "Uвых., В [P16_EU20U001]",
	CAST(P16_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P16_EU20E401]",
	NULL,
	P16_SY00J806 as "Дата само- теста [P16_SY00J806]",
	P16_EU00S601 as "Итог само- теста [P16_EU00S601]",
	CAST(P16_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P16_EU00U401]",
	null,
	P16_SY00J803   as "Переход на Батарею [P16_SY00J803]",
	P16_EU00S603   as "Причина перех на бат [P16_EU00S603]",
	P16_SY00J804   as "Время раб от бат, сек [P16_SY00J804]",
	P16_SY00J805   as "Переход на Сеть [P16_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P16_EU00S602, P16_EU10U001, P16_EU20U001, P16_EU20E401, P16_SY00J802, P16_EU00T001,
	P16_SY00J806, P16_EU00S601, P16_EU00U401,
	P16_SY00J803, P16_SY00J805, P16_SY00J804, P16_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 16. ИТ-14, ЦТЩУ (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P16_EU00T001 as decimal(10)) as "Темп-ра, °С  [P16_EU00T001]",
	CAST(P16_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P16_SY00J802]",
	CAST(P16_EU10U001 as decimal(10,0)) as "Uвх., В [P16_EU10U001]",
	CAST(P16_EU20U001 as decimal(10,0)) as "Uвых., В [P16_EU20U001]",
	CAST(P16_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P16_EU20E401]",
	NULL,
	P16_SY00J806 as "Дата само- теста [P16_SY00J806]",
	P16_EU00S601 as "Итог само- теста [P16_EU00S601]",
	CAST(P16_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P16_EU00U401]",
	null,
	P16_SY00J803   as "Переход на Батарею [P16_SY00J803]",
	P16_EU00S603   as "Причина перех на бат [P14_EU00S603]",
	P16_SY00J804   as "Время раб от бат, сек [P16_SY00J804]",
	P16_SY00J805   as "Переход на Сеть [P16_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P16_EU00S602, P16_EU10U001, P16_EU20U001, P16_EU20E401, P16_SY00J802, P16_EU00T001,
	P16_SY00J806, P16_EU00S601, P16_EU00U401,
	P16_SY00J803, P16_SY00J805, P16_SY00J804, P16_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 16. ИТ-14, ЦТЩУ (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(P16_EU00T001 as decimal(10)) as "Темп-ра, °С  [P16_EU00T001]",
	CAST(P16_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P16_SY00J802]",
	CAST(P16_EU10U001 as decimal(10,0)) as "Uвх., В [P16_EU10U001]",
	CAST(P16_EU20U001 as decimal(10,0)) as "Uвых., В [P16_EU20U001]",
	CAST(P16_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P16_EU20E401]",
	NULL,
	P16_SY00J806 as "Дата само- теста [P16_SY00J806]",
	P16_EU00S601 as "Итог само- теста [P16_EU00S601]",
	CAST(P16_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P16_EU00U401]",
	null,
	P16_SY00J803   as "Переход на Батарею [P16_SY00J803]",
	P16_EU00S603   as "Причина перех на бат [P16_EU00S603]",
	P16_SY00J804   as "Время раб от бат, сек [P16_SY00J804]",
	P16_SY00J805   as "Переход на Сеть [P16_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P16_EU00S602, P16_EU10U001, P16_EU20U001, P16_EU20E401, P16_SY00J802, P16_EU00T001,
	P16_SY00J806, P16_EU00S601, P16_EU00U401,
	P16_SY00J803, P16_SY00J805, P16_SY00J804, P16_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")