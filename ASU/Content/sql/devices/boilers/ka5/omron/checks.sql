{срезы минутные}
/*ReportName="К/a 5 - уставки" (срезы минутные)*/
/*Mode=минутные*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K5A_SP_Air_Vent             as decimal(15, 2)) as "В5А, кПа [K5A_SP_Air_Vent]",
	CAST(K5A_SP_F_Vent_Handle_PIDOff as decimal(15, 2)) as "В5A ручной, Гц [K5A_SP_F_Vent_Handle_PIDOff]",
	CAST(K5A_SP_F_Dis_PIDOff         as decimal(15, 2)) as "Д5A вкл, Гц [K5A_SP_F_Dis_PIDOff]",
	CAST(K5A_SP_P_Dis_PIDOn          as decimal(15, 2)) as "Д5A выкл, Гц [K5A_SP_P_Dis_PIDOn]",
	CAST(K5AB_SP_P_Vent_Automat      as decimal(15, 2)) as "Воздух (автомат) [K5AB_SP_P_Vent_Automat]",
	CAST(K5AB_SP_P_Vent_Handle_PIDOn as decimal(15, 2)) as "В5A и В5Б ручной, кПа [K5AB_SP_P_Vent_Handle_PIDOn]",
	CAST(K5B_SP_F_Vent_Handle_PIDOff as decimal(15, 2)) as "В5Б, Гц [K5B_SP_F_Vent_Handle_PIDOff]",
	CAST(K5B_SP_P_Dis_PIDOn          as decimal(15, 2)) as "Д5Б, Па [K5B_SP_P_Dis_PIDOn]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		K5A_SP_Air_Vent,
		K5A_SP_F_Vent_Handle_PIDOff,
		K5A_SP_F_Dis_PIDOff,
		K5A_SP_P_Dis_PIDOn,
		K5AB_SP_P_Vent_Automat,
		K5AB_SP_P_Vent_Handle_PIDOn,
		K5B_SP_F_Vent_Handle_PIDOff,
		K5B_SP_P_Dis_PIDOn
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")