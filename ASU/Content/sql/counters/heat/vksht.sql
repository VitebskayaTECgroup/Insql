{минутные срезы}
/*ReportName=ВКШТ, трубопровод (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	NULL,
	CAST(U11_Steam_qM as decimal(15, 2)) as "Массовый расход пара [U11_Steam_qM]",
	CAST(U11_Steam_P as decimal(15, 2)) as "Избыт. давление пара [U11_Steam_P]",
	CAST(U11_Steam_T as decimal(15, 2)) as "Температура пара [U11_Steam_T]",
	CAST(U11_Steam_W as decimal(15, 2)) as "Тепловая энергия пара [U11_Steam_W]",
	CAST(U11_Steam_H as decimal(15, 2)) as "Энтальпия пара [U11_Steam_H]",
	CAST(U11_Steam_R as decimal(15, 2)) as "Плотность пара [U11_Steam_R]",
	NULL,
	CAST(U11_Condensate_qM as decimal(15, 2)) as "Массовый расход конденсата, т/ч [U11_Condensate_qM]",
	CAST(U11_Condensate_P as decimal(15, 2)) as "Избыт. давление конденсата, КПа [U11_Condensate_P]",
	CAST(U11_Condensate_T as decimal(15, 2)) as "Температура конденсата, °С [U11_Condensate_T]",
	CAST(U11_Condensate_W as decimal(15, 2)) as "Тепловая энергия конденсата, ГКал/ч [U11_Condensate_W]",
	CAST(U11_Condensate_H as decimal(15, 2)) as "Энтальпия конденсата, ГКал/т [U11_Condensate_H]",
	CAST(U11_Condensate_R as decimal(15, 2)) as "Плотность конденсата, кг/м3 [U11_Condensate_R]" 
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		U11_Steam_qM, U11_Steam_P, U11_Steam_T, U11_Steam_W, U11_Steam_H, U11_Steam_R,
		U11_Condensate_qM, U11_Condensate_P, U11_Condensate_T, U11_Condensate_W, U11_Condensate_H, U11_Condensate_R
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ВКШТ, трубопровод (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	NULL,
	CAST(isnull(U11_Steam_qM_Hour, 0) as decimal(15, 2)) as "Суммарный массовый расход пара [U11_Steam_qM_Hour]",
	CAST(isnull(U11_Steam_P_Hour, 0) as decimal(15, 2)) as "Среднее избыт. давление пара [U11_Steam_W_Hour]",
	CAST(isnull(U11_Steam_T_Hour, 0) as decimal(15, 2)) as "Средняя температура пара [U11_Steam_T_Hour]",
	CAST(isnull(U11_Steam_W_Hour, 0) as decimal(15, 2)) as "Общая тепловая энергия пара [U11_Steam_P_Hour]",
	NULL,
	CAST(isnull(U11_Condensate_qM_Hour, 0) as decimal(15, 2)) as "Суммарный массовый расход конденсата [U11_Condensate_qM_Hour]",
	CAST(isnull(U11_Condensate_P_Hour, 0) as decimal(15, 2)) as "Среднее избыт. давление конденсата [U11_Condensate_W_Hour]",
	CAST(isnull(U11_Condensate_T_Hour, 0) as decimal(15, 2)) as "Средняя температура конденсата [U11_Condensate_T_Hour]",
	CAST(isnull(U11_Condensate_W_Hour, 0) as decimal(15, 2)) as "Общая тепловая энергия конденсата [U11_Condensate_P_Hour]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		U11_Steam_qM_Hour, U11_Steam_W_Hour, U11_Steam_T_Hour, U11_Steam_P_Hour,
		U11_Condensate_qM_Hour, U11_Condensate_W_Hour, U11_Condensate_T_Hour, U11_Condensate_P_Hour
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ВКШТ, трубопровод (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(d, -2, DateTime) as "Дата",
	NULL,
	CAST(isnull(U11_Steam_qM_Day, 0) as decimal(15, 2)) as "Суммарный массовый расход пара [U11_Steam_qM_Day]",
	CAST(isnull(U11_Steam_P_Day, 0) as decimal(15, 2)) as "Среднее избыт. давление пара [U11_Steam_W_Day]",
	CAST(isnull(U11_Steam_T_Day, 0) as decimal(15, 2)) as "Средняя температура пара [U11_Steam_T_Day]",
	CAST(isnull(U11_Steam_W_Day, 0) as decimal(15, 2)) as "Общая тепловая энергия пара [U11_Steam_P_Day]",
	NULL,
	CAST(isnull(U11_Condensate_qM_Day, 0) as decimal(15, 2)) as "Суммарный массовый расход конденсата [U11_Condensate_qM_Day]",
	CAST(isnull(U11_Condensate_P_Day, 0) as decimal(15, 2)) as "Среднее избыт. давление конденсата [U11_Condensate_W_Day]",
	CAST(isnull(U11_Condensate_T_Day, 0) as decimal(15, 2)) as "Средняя температура конденсата [U11_Condensate_T_Day]",
	CAST(isnull(U11_Condensate_W_Day, 0) as decimal(15, 2)) as "Общая тепловая энергия конденсата [U11_Condensate_P_Day]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		U11_Steam_qM_Day, U11_Steam_W_Day, U11_Steam_T_Day, U11_Steam_P_Day,
		U11_Condensate_qM_Day, U11_Condensate_W_Day, U11_Condensate_T_Day, U11_Condensate_P_Day
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")