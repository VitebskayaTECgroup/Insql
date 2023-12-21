{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 15. Центральная серверная, ЭКОМ-3000 (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P15_EU00S602 as "Состоя- ние [P15_EU00S602]",
	CAST(P15_EU00T001 as decimal(10)) as "Темп-ра, °С  [P15_EU00T001]",
	CAST(P15_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P15_SY00J802]",
	CAST(P15_EU10U001 as decimal(10,0)) as "Uвх., В [P15_EU10U001]",
	CAST(P15_EU20U001 as decimal(10,0)) as "Uвых., В [P15_EU20U001]",
	CAST(P15_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P15_EU20E401]",
	NULL,
	P15_SY00J806 as "Дата само- теста [P15_SY00J806]",
	P15_EU00S601 as "Итог само- теста [P15_EU00S601]",
	CAST(P15_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P15_EU00U401]",
	null,
	P15_SY00J803   as "Переход на Батарею [P15_SY00J803]",
	P15_EU00S603   as "Причина перех на бат [P15_EU00S603]",
	P15_SY00J804   as "Время раб от бат, сек [P15_SY00J804]",
	P15_SY00J805   as "Переход на Сеть [P15_SY00J805]"
FROM
	OpenQuery(INSQL,
"SELECT DateTime, P15_EU00S602, P15_EU10U001, P15_EU20U001, P15_EU20E401, P15_SY00J802, P15_EU00T001,
P15_SY00J806, P15_EU00S601, P15_EU00U401,
P15_SY00J803, P15_SY00J805, P15_SY00J804, P15_EU00S603
FROM Runtime.dbo.WideHistory
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 15. Центральная серверная, ЭКОМ-3000 (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P15_EU00T001 as decimal(10)) as "Темп-ра, °С  [P15_EU00T001]",
	CAST(P15_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P15_SY00J802]",
	CAST(P15_EU10U001 as decimal(10,0)) as "Uвх., В [P15_EU10U001]",
	CAST(P15_EU20U001 as decimal(10,0)) as "Uвых., В [P15_EU20U001]",
	CAST(P15_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P15_EU20E401]",
	NULL,
	P15_SY00J806 as "Дата само- теста [P15_SY00J806]",
	P15_EU00S601 as "Итог само- теста [P15_EU00S601]",
	CAST(P15_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P15_EU00U401]",
	null,
	P15_SY00J803   as "Переход на Батарею [P15_SY00J803]",
	P15_EU00S603   as "Причина перех на бат [P14_EU00S603]",
	P15_SY00J804   as "Время раб от бат, сек [P15_SY00J804]",
	P15_SY00J805   as "Переход на Сеть [P15_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P15_EU00S602, P15_EU10U001, P15_EU20U001, P15_EU20E401, P15_SY00J802, P15_EU00T001,
	P15_SY00J806, P15_EU00S601, P15_EU00U401,
	P15_SY00J803, P15_SY00J805, P15_SY00J804, P15_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 15. Центральная серверная, ЭКОМ-3000 (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(P15_EU00T001 as decimal(10)) as "Темп-ра, °С  [P15_EU00T001]",
	CAST(P15_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P15_SY00J802]",
	CAST(P15_EU10U001 as decimal(10,0)) as "Uвх., В [P15_EU10U001]",
	CAST(P15_EU20U001 as decimal(10,0)) as "Uвых., В [P15_EU20U001]",
	CAST(P15_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P15_EU20E401]",
	NULL,
	P15_SY00J806 as "Дата само- теста [P15_SY00J806]",
	P15_EU00S601 as "Итог само- теста [P15_EU00S601]",
	CAST(P15_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P15_EU00U401]",
	null,
	P15_SY00J803   as "Переход на Батарею [P15_SY00J803]",
	P15_EU00S603   as "Причина перех на бат [P15_EU00S603]",
	P15_SY00J804   as "Время раб от бат, сек [P15_SY00J804]",
	P15_SY00J805   as "Переход на Сеть [P15_SY00J805]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, P15_EU00S602, P15_EU10U001, P15_EU20U001, P15_EU20E401, P15_SY00J802, P15_EU00T001,
	P15_SY00J806, P15_EU00S601, P15_EU00U401,
	P15_SY00J803, P15_SY00J805, P15_SY00J804, P15_EU00S603
	FROM Runtime.dbo.WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")