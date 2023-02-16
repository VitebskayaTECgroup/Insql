{минутные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 4. ЛМЗ-97, Инелт-1, линия А (минутный опрос данных)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	P04_EU00S602 as "Состоя- ние [P04_EU00S602]",
	CAST(P04_EU00T001 as decimal(10)) as "Темп-ра, °С  [P04_EU00T001]",
	CAST(P04_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P04_SY00J802]",
	CAST(P04_EU10U001 as decimal(10,0)) as "Uвх., В [P04_EU10U001]",
	CAST(P04_EU20U001 as decimal(10,0)) as "Uвых., В [P04_EU20U001]",
	CAST(P04_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P04_EU20E401]",
	NULL,
	P04_SY00J806 as "Дата само- теста [P04_SY00J806]", 
	P04_EU00S601 as "Итог само- теста [P04_EU00S601]",
	CAST(P04_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P04_EU00U401]",
	null,
	P04_SY00J803   as "Переход на Батарею [P04_SY00J803]",
	P04_EU00S603   as "Причина перех на бат [P04_EU00S603]",
	P04_SY00J804   as "Время раб от бат, сек [P04_SY00J804]",
	P04_SY00J805   as "Переход на Сеть [P04_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P04_EU00S602, P04_EU10U001, P04_EU20U001, P04_EU20E401, P04_SY00J802, P04_EU00T001, 
	P04_SY00J806, P04_EU00S601, P04_EU00U401,
	P04_SY00J803, P04_SY00J805, P04_SY00J804, P04_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 4. ЛМЗ-97, Инелт-1, линия А (часовой опрос данных)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(P04_EU00T001 as decimal(10)) as "Темп-ра, °С  [P04_EU00T001]",
	CAST(P04_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P04_SY00J802]",
	CAST(P04_EU10U001 as decimal(10,0)) as "Uвх., В [P04_EU10U001]",
	CAST(P04_EU20U001 as decimal(10,0)) as "Uвых., В [P04_EU20U001]",
	CAST(P04_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P04_EU20E401]",
	NULL,
	P04_SY00J806 as "Дата само- теста [P04_SY00J806]", 
	P04_EU00S601 as "Итог само- теста [P04_EU00S601]",
	CAST(P04_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P04_EU00U401]",
	null,
	P04_SY00J803   as "Переход на Батарею [P04_SY00J803]",
	P04_EU00S603   as "Причина перех на бат [P04_EU00S603]",
	P04_SY00J804   as "Время раб от бат, сек [P04_SY00J804]",
	P04_SY00J805   as "Переход на Сеть [P04_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P04_EU00S602, P04_EU10U001, P04_EU20U001, P04_EU20E401, P04_SY00J802, P04_EU00T001, 
	P04_SY00J806, P04_EU00S601, P04_EU00U401,
	P04_SY00J803, P04_SY00J805, P04_SY00J804, P04_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Мониторинг состояния источника бесперебойного питания ИБП № 4. ЛМЗ-97, Инелт-1, линия А (суточный опрос данных)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST(P04_EU00T001 as decimal(10)) as "Темп-ра, °С  [P04_EU00T001]",
	CAST(P04_SY00J802 as decimal(10,0)) as "Время до откл-я, мин [P04_SY00J802]",
	CAST(P04_EU10U001 as decimal(10,0)) as "Uвх., В [P04_EU10U001]",
	CAST(P04_EU20U001 as decimal(10,0)) as "Uвых., В [P04_EU20U001]",
	CAST(P04_EU20E401 as decimal(10,0)) as "Загруз -ка, % [P04_EU20E401]",
	NULL,
	P04_SY00J806 as "Дата само- теста [P04_SY00J806]", 
	P04_EU00S601 as "Итог само- теста [P04_EU00S601]",
	CAST(P04_EU00U401 as decimal(10,1)) as "Заряд ба- тареи, % [P04_EU00U401]",
	null,
	P04_SY00J803   as "Переход на Батарею [P04_SY00J803]",
	P04_EU00S603   as "Причина перех на бат [P04_EU00S603]",
	P04_SY00J804   as "Время раб от бат, сек [P04_SY00J804]",
	P04_SY00J805   as "Переход на Сеть [P04_SY00J805]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, P04_EU00S602, P04_EU10U001, P04_EU20U001, P04_EU20E401, P04_SY00J802, P04_EU00T001, 
	P04_SY00J806, P04_EU00S601, P04_EU00U401,
	P04_SY00J803, P04_SY00J805, P04_SY00J804, P04_EU00S603
	FROM Runtime.dbo.WideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")