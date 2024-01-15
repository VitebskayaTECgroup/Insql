{срезы минутные}
/*ReportName="К/a 4 - уставки" (срезы минутные)*/
/*Mode=минутные*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K4A_SP_F_Dis_PIDOff         as decimal(15, 2)) as "Д4A, Гц [K4A_SP_F_Dis_PIDOff]",
	CAST(K4A_SP_P_Dis_PIDOn          as decimal(15, 2)) as "Д4A, Па [K4A_SP_P_Dis_PIDOn]",
	CAST(K4A_SP_F_Vent_Handle_PIDOff as decimal(15, 2)) as "В4А, Гц [K4A_SP_F_Vent_Handle_PIDOff]",
	CAST(K4AB_FP_SP_PID_On_Dis       as decimal(15, 2)) as "Д4, Па [K4AB_FP_SP_PID_On_Dis]",
	CAST(K4AB_SP_P_Vent_Handle_PIDOn as decimal(15, 2)) as "В4, кПа [K4AB_SP_P_Vent_Handle_PIDOn]",
	CAST(K4B_SP_F_Dis_PIDOff         as decimal(15, 2)) as "Д4Б, Гц [K4B_SP_F_Dis_PIDOff]",
	CAST(K4B_SP_P_Dis_PIDOn          as decimal(15, 2)) as "Д4Б, Па [K4B_SP_P_Dis_PIDOn]",
	CAST(K4B_SP_F_Vent_Handle_PIDOff as decimal(15, 2)) as "В4Б, Па [K4B_SP_F_Vent_Handle_PIDOff]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		K4A_SP_F_Dis_PIDOff,
		K4A_SP_F_Vent_Handle_PIDOff,
		K4A_SP_P_Dis_PIDOn,
		K4AB_FP_SP_PID_On_Dis,
		K4AB_SP_P_Vent_Handle_PIDOn,
		K4B_SP_F_Dis_PIDOff,
		K4B_SP_F_Vent_Handle_PIDOff,
		K4B_SP_P_Dis_PIDOn
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")