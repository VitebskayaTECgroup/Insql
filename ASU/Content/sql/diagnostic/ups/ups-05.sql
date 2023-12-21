{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 5. ЛМЗ-97, Инелт-2, линия Б (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P05_EU00S602 as "Состоя- ние [P05_EU00S602]",
	CAST(P05_EU00T001 as decimal(10)) as "Темп-ра, °С  [P05_EU00T001]",
	CAST(P05_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P05_SY00J802]",
	CAST(P05_EU10U001 as decimal(10,0)) as "Uвх., В [P05_EU10U001]",
	CAST(P05_EU20U001 as decimal(10,0)) as "Uвых., В [P05_EU20U001]",
	CAST(P05_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P05_EU20E401]",
	NULL,
	P05_SY00J806 as "Дата само- теста [P05_SY00J806]", 
	P05_EU00S601 as "Итог само- теста [P05_EU00S601]",
	CAST(P05_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P05_EU00U401]",
	null,
	P05_SY00J803   as "Переход на Батарею [P05_SY00J803]",
	P05_EU00S603   as "Причина перех на бат [P05_EU00S603]",
	P05_SY00J804   as "Время раб от бат, сек [P05_SY00J804]",
	P05_SY00J805   as "Переход на Сеть [P05_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P05_EU00S602, P05_EU10U001, P05_EU20U001, P05_EU20E401, P05_SY00J802, P05_EU00T001, 
	P05_SY00J806, P05_EU00S601, P05_EU00U401,
	P05_SY00J803, P05_SY00J805, P05_SY00J804, P05_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 5. ЛМЗ-97, Инелт-2, линия Б (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P05_EU00T001 as decimal(10)) as "Темп-ра, °С  [P05_EU00T001]",
	CAST(P05_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P05_SY00J802]",
	CAST(P05_EU10U001 as decimal(10,0)) as "Uвх., В [P05_EU10U001]",
	CAST(P05_EU20U001 as decimal(10,0)) as "Uвых., В [P05_EU20U001]",
	CAST(P05_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P05_EU20E401]",
	NULL,
	P05_SY00J806 as "Дата само- теста [P05_SY00J806]", 
	P05_EU00S601 as "Итог само- теста [P05_EU00S601]",
	CAST(P05_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P05_EU00U401]",
	null,
	P05_SY00J803   as "Переход на Батарею [P05_SY00J803]",
	P05_EU00S603   as "Причина перех на бат [P05_EU00S603]",
	P05_SY00J804   as "Время раб от бат, сек [P05_SY00J804]",
	P05_SY00J805   as "Переход на Сеть [P05_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P05_EU00S602, P05_EU10U001, P05_EU20U001, P05_EU20E401, P05_SY00J802, P05_EU00T001, 
	P05_SY00J806, P05_EU00S601, P05_EU00U401,
	P05_SY00J803, P05_SY00J805, P05_SY00J804, P05_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 5. ЛМЗ-97, Инелт-2, линия Б (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата", 
	CAST(P05_EU00T001 as decimal(10)) as "Темп-ра, °С  [P05_EU00T001]",
	CAST(P05_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P05_SY00J802]",
	CAST(P05_EU10U001 as decimal(10,0)) as "Uвх., В [P05_EU10U001]",
	CAST(P05_EU20U001 as decimal(10,0)) as "Uвых., В [P05_EU20U001]",
	CAST(P05_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P05_EU20E401]",
	NULL,
	P05_SY00J806 as "Дата само- теста [P05_SY00J806]", 
	P05_EU00S601 as "Итог само- теста [P05_EU00S601]",
	CAST(P05_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P05_EU00U401]",
	null,
	P05_SY00J803   as "Переход на Батарею [P05_SY00J803]",
	P05_EU00S603   as "Причина перех на бат [P05_EU00S603]",
	P05_SY00J804   as "Время раб от бат, сек [P05_SY00J804]",
	P05_SY00J805   as "Переход на Сеть [P05_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P05_EU00S602, P05_EU10U001, P05_EU20U001, P05_EU20E401, P05_SY00J802, P05_EU00T001, 
	P05_SY00J806, P05_EU00S601, P05_EU00U401,
	P05_SY00J803, P05_SY00J805, P05_SY00J804, P05_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")