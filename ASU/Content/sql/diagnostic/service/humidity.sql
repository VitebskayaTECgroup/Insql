{минутные срезы}
/*ReportName=Температура в шкафах (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(S2_T_PLC as decimal(15,1)) as "Температура в шкафу контроллеров т/т ст. №2, °С[S2_T_PLC]",
	CAST(S2_AH_PLC as decimal(15,1)) as "Влажность в шкафу контроллеров т/ г ст. 2, °С[S2_AH_PLC]",
	CAST(S2_T_STKR as decimal(15,1)) as "Tемпература в шкафу СТКЭР т/г ст. №2, °С [S2_T_STKR]",
	CAST(S2_AH_STKR as decimal(15,1)) as "Влажность в шкафу СТКЭР т/г ст. №2, °С [S2_AH_STKR]",
	CAST(S3_T_PLC as decimal(15,1)) as "Температура в шкафу контроллеров т/т ст. №3, °С[S3_T_PLC]",
	CAST(S3_AH_PLC as decimal(15,1)) as "Влажность в шкафу контроллеров т/ г ст. 3, °С[S3_AH_PLC]",
	CAST(S3_T_STKR as decimal(15,1)) as "Tемпература в шкафу СТКЭР т/г ст. №3, °С [S3_T_STKR]",
	CAST(S3_AH_STKR as decimal(15,1)) as "Влажность в шкафу СТКЭР т/г ст. №3, °С [S3_AH_STKR]"

	--[CHECK:0, 50, 10, 20] какая то хрень с порогами срабатывания
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S2_T_PLC, S2_AH_PLC, S2_T_STKR, S2_AH_STKR, S3_T_PLC, S3_AH_PLC, S3_T_STKR , S3_AH_STKR
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Температура в шкафах (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(S2_T_PLC as decimal(15,1)) as "Температура в шкафу контроллеров т/т ст. №2, °С[S2_T_PLC]",
	CAST(S2_AH_PLC as decimal(15,1)) as "Влажность в шкафу контроллеров т/ г ст. 2, °С[S2_AH_PLC]",
	CAST(S2_T_STKR as decimal(15,1)) as "Tемпература в шкафу СТКЭР т/г ст. №2, °С [S2_T_STKR]",
	CAST(S2_AH_STKR as decimal(15,1)) as "Влажность в шкафу СТКЭР т/г ст. №2, °С [S2_AH_STKR]",
	CAST(S3_T_PLC as decimal(15,1)) as "Температура в шкафу контроллеров т/т ст. №3, °С[S3_T_PLC]",
	CAST(S3_AH_PLC as decimal(15,1)) as "Влажность в шкафу контроллеров т/ г ст. 3, °С[S3_AH_PLC]",
	CAST(S3_T_STKR as decimal(15,1)) as "Tемпература в шкафу СТКЭР т/г ст. №3, °С [S3_T_STKR]",
	CAST(S3_AH_STKR as decimal(15,1)) as "Влажность в шкафу СТКЭР т/г ст. №3, °С [S3_AH_STKR]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S2_T_PLC, S2_AH_PLC, S2_T_STKR, S2_AH_STKR, S3_T_PLC, S3_AH_PLC, S3_T_STKR , S3_AH_STKR
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Температура в шкафах (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(S2_T_PLC as decimal(15,1)) as "Температура в шкафу контроллеров т/т ст. №2, °С[S2_T_PLC]",
	CAST(S2_AH_PLC as decimal(15,1)) as "Влажность в шкафу контроллеров т/ г ст. 2, °С[S2_AH_PLC]",
	CAST(S2_T_STKR as decimal(15,1)) as "Tемпература в шкафу СТКЭР т/г ст. №2, °С [S2_T_STKR]",
	CAST(S2_AH_STKR as decimal(15,1)) as "Влажность в шкафу СТКЭР т/г ст. №2, °С [S2_AH_STKR]",
	CAST(S3_T_PLC as decimal(15,1)) as "Температура в шкафу контроллеров т/т ст. №3, °С[S3_T_PLC]",
	CAST(S3_AH_PLC as decimal(15,1)) as "Влажность в шкафу контроллеров т/ г ст. 3, °С[S3_AH_PLC]",
	CAST(S3_T_STKR as decimal(15,1)) as "Tемпература в шкафу СТКЭР т/г ст. №3, °С [S3_T_STKR]",
	CAST(S3_AH_STKR as decimal(15,1)) as "Влажность в шкафу СТКЭР т/г ст. №3, °С [S3_AH_STKR]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S2_T_PLC, S2_AH_PLC, S2_T_STKR, S2_AH_STKR, S3_T_PLC, S3_AH_PLC, S3_T_STKR , S3_AH_STKR
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")