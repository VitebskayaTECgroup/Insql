{минутные срезы}
/*ReportName=РЭП СН №4 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(N01_UM10P001 as decimal(10,2)) as "P задание, МПа [N01_UM10P001]",
	CAST(N01_UM10P002 as decimal(10,2)) as "P текущее, МПа [N01_UM10P002]",
	CAST(N01_UM10E001 as decimal(10,2)) as "f частота Гц [N01_UM10E001]",
	CAST(N01_UM10Y001 as decimal(10,0)) as "Обороты, об/мин [N01_UM10Y001]",
	CAST(N01_UM10T001 as decimal(10,1)) as "T в шкафу, °С [N01_UM10T001]",
	CAST(N01_UM10E002 as decimal(10,0)) as "Входная мощность, KVA [N01_UM10E002]",
	CAST(N01_UM10E003 as decimal(10,0)) as "Входное напряжение, V [N01_UM10E003]",
	CAST(N01_UM10E004 as decimal(10,1)) as "Входной ток, A [N01_UM10E004]",
	CAST(N01_UM20E002 as decimal(10,0)) as "Выходная мощность, KVA [N01_UM20E002]",
	CAST(N01_UM20E003 as decimal(10,0)) as "Выходное напряжение, V [N01_UM20E003]",
	CAST(N01_UM20E004 as decimal(10,1)) as "Выходной ток, A [N01_UM20E004]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, N01_UM10P001,
	N01_UM10P002, N01_UM10E001, N01_UM10Y001, N01_UM10T001, N01_UM10E002,
	N01_UM10E003, N01_UM10E004, N01_UM20E002, N01_UM20E003, N01_UM20E004
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=РЭП СН №4 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(N01_UM10P001 as decimal(10,2)) as "P задание, МПа [N01_UM10P001]",
	CAST(N01_UM10P002 as decimal(10,2)) as "P текущее, МПа [N01_UM10P002]",
	CAST(N01_UM10E001 as decimal(10,2)) as "f частота Гц [N01_UM10E001]",
	CAST(N01_UM10Y001 as decimal(10,0)) as "Обороты, об/мин [N01_UM10Y001]",
	CAST(N01_UM10T001 as decimal(10,1)) as "T в шкафу, °С [N01_UM10T001]",
	CAST(N01_UM10E002 as decimal(10,0)) as "Входная мощность, KVA [N01_UM10E002]",
	CAST(N01_UM10E003 as decimal(10,0)) as "Входное напряжение, V [N01_UM10E003]",
	CAST(N01_UM10E004 as decimal(10,1)) as "Входной ток, A [N01_UM10E004]",
	CAST(N01_UM20E002 as decimal(10,0)) as "Выходная мощность, KVA [N01_UM20E002]",
	CAST(N01_UM20E003 as decimal(10,0)) as "Выходное напряжение, V [N01_UM20E003]",
	CAST(N01_UM20E004 as decimal(10,1)) as "Выходной ток, A [N01_UM20E004]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, N01_UM10P001,
	N01_UM10P002, N01_UM10E001, N01_UM10Y001, N01_UM10T001, N01_UM10E002,
	N01_UM10E003, N01_UM10E004, N01_UM20E002, N01_UM20E003, N01_UM20E004
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=РЭП - СН №4 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	null,
	CAST(N01_UM10P001 as decimal(10,2)) as "P задание, МПа [N01_UM10P001]",
	CAST(N01_UM10P002 as decimal(10,2)) as "P текущее, МПа [N01_UM10P002]",
	CAST(N01_UM10E001 as decimal(10,2)) as "f частота Гц [N01_UM10E001]",
	CAST(N01_UM10Y001 as decimal(10,0)) as "Обороты, об/мин [N01_UM10Y001]",
	CAST(N01_UM10T001 as decimal(10,1)) as "T в шкафу, °С [N01_UM10T001]",
	CAST(N01_UM10E002 as decimal(10,0)) as "Входная мощность, KVA [N01_UM10E002]",
	CAST(N01_UM10E003 as decimal(10,0)) as "Входное напряжение, V [N01_UM10E003]",
	CAST(N01_UM10E004 as decimal(10,1)) as "Входной ток, A [N01_UM10E004]",
	CAST(N01_UM20E002 as decimal(10,0)) as "Выходная мощность, KVA [N01_UM20E002]",
	CAST(N01_UM20E003 as decimal(10,0)) as "Выходное напряжение, V [N01_UM20E003]",
	CAST(N01_UM20E004 as decimal(10,1)) as "Выходной ток, A [N01_UM20E004]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, N01_UM10P001,
	N01_UM10P002, N01_UM10E001, N01_UM10Y001, N01_UM10T001, N01_UM10E002,
	N01_UM10E003, N01_UM10E004, N01_UM20E002, N01_UM20E003, N01_UM20E004
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")