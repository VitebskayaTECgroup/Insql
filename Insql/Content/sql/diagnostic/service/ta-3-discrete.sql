{Посекундный}
/*ReportName=Параметры ТА-3 (секундные данные)*/
/*ReportRefresh=dd.MM.yyyy HH:mm:01.000*/
/*StartDate=dd.MM.yyyy HH:mm:00.000*/
/*DeltaDate=00.00.0000 00:00:59.000*/
/*Step=00.00.0000 00:00:01.000*/
/*Resolution=1000*/
/*UpQuery="минутные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST (S3_A395 as decimal(15,0)) as "Стопорный клапан закрыт [S3_A395]",
	CAST (S3_A351_A301_Out as decimal(15,0)) as "Быстрое закрытие МУТ [S3_A351_A301_Out]",
	CAST (S3_KPO_KTO_SAP as decimal(15,0)) as "Закрытие регуляторов отборов [S3_KPO_KTO_SAP]",
	CAST (S3_A383_1 as decimal(15,0)) as "РК ЦВД закрыты [S3_A383_1]",
	CAST (S3_1G3_13 as decimal(15,0)) as "Сигнал реле обратной мощности об отр. мощности 1к [S3_1G3_13]",
	CAST (S3_2G3_13 as decimal(15,0)) as "Сигнал реле обратной мощности об отр. мощности 2к [S3_2G3_13]",
	CAST (S3_A377 as decimal(15,0)) as "МУТ на нуле [S3_A377]",
	CAST (S3_RA10S101_A19 as decimal(15,0)) as "Не закрыта задвижка на подводе свежего пара к турбине (ГПЗ) [S3_RA10S101_A19]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_A395, S3_A351_A301_Out, S3_KPO_KTO_SAP, S3_A383_1, S3_1G3_13, S3_2G3_13, S3_A377, S3_RA10S101_A19
	FROM Runtime.dbo.DiscreteWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = 1000
	AND DateTime >= @start
	AND DateTime <= @finish")


{минутные срезы}
/*ReportName=Параметры ТА-3 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="Посекундный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	CAST (S3_A395 as decimal(15,0)) as "Стопорный клапан закрыт [S3_A395]",
	CAST (S3_A351_A301_Out as decimal(15,0)) as "Быстрое закрытие МУТ [S3_A351_A301_Out]",
	CAST (S3_KPO_KTO_SAP as decimal(15,0)) as "Закрытие регуляторов отборов [S3_KPO_KTO_SAP]",
	CAST (S3_A383_1 as decimal(15,0)) as "РК ЦВД закрыты [S3_A383_1]",
	CAST (S3_1G3_13 as decimal(15,0)) as "Сигнал реле обратной мощности об отр. мощности 1к [S3_1G3_13]",
	CAST (S3_2G3_13 as decimal(15,0)) as "Сигнал реле обратной мощности об отр. мощности 2к [S3_2G3_13]",
	CAST (S3_A377 as decimal(15,0)) as "МУТ на нуле [S3_A377]",
	CAST (S3_RA10S101_A19 as decimal(15,0)) as "Не закрыта задвижка на подводе свежего пара к турбине (ГПЗ) [S3_RA10S101_A19]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_A395, S3_A351_A301_Out, S3_KPO_KTO_SAP, S3_A383_1, S3_1G3_13, S3_2G3_13, S3_A377, S3_RA10S101_A19
	FROM Runtime.dbo.DiscreteWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = 1000
	AND DateTime >= @start
	AND DateTime <= @finish")