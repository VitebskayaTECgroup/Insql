{минутные срезы}
/*ReportName="ГРП" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="срез за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(GRP1_P_gaza_do_GRP, 2)     as "Давл. газа до ГРП, МПа [GRP1_P_gaza_do_GRP]",
	Round(GRP1_P_gaza_posle_1rz, 2)  as "Давл. газа после 1рз., МПа [GRP1_P_gaza_posle_1rz]",
	Round(GRP1_P_gaza_posle_GRP, 2)  as "Давл. газа после ГРП, кПа [GRP1_P_gaza_posle_GRP]",
	Round(GRP1_T_gaza, 2)            as "Темп. газа, °С [GRP1_T_gaza]",
	Round(GRP2_Q_gaza_osn, 2)        as "Расход газа, осн., м3/ч [GRP2_Q_gaza_osn]",
	Round(GRP2_Q_gaza_osn_d, 2)      as "Расход газа, осн. (д), м3/ч [GRP2_Q_gaza_osn_d]",
	Round(GRP2_Q_LMR, 2)             as "Расход газа, л.м.р., м3/ч [GRP2_Q_LMR]",
	Round(GRP2_Q_LMR_d, 2)           as "Расход газа, л.м.р. (д), м3/ч [GRP2_Q_LMR_d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	GRP1_P_gaza_do_GRP,
	GRP1_P_gaza_posle_1rz,
	GRP1_P_gaza_posle_GRP,
	GRP1_T_gaza,
	GRP2_Q_gaza_osn,
	GRP2_Q_gaza_osn_d,
	GRP2_Q_LMR,
	GRP2_Q_LMR_d
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез за час}
/*ReportName="ГРП" (срез за час)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="срез за сутки"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(GRP1_P_gaza_do_GRP, 2)     as "Давл. газа до ГРП, МПа [GRP1_P_gaza_do_GRP]",
	Round(GRP1_P_gaza_posle_1rz, 2)  as "Давл. газа после 1рз., МПа [GRP1_P_gaza_posle_1rz]",
	Round(GRP1_P_gaza_posle_GRP, 2)  as "Давл. газа после ГРП, кПа [GRP1_P_gaza_posle_GRP]",
	Round(GRP1_T_gaza, 2)            as "Темп. газа, °С [GRP1_T_gaza]",
	Round(GRP2_Q_gaza_osn, 2)        as "Расход газа, осн., м3/ч [GRP2_Q_gaza_osn]",
	Round(GRP2_Q_gaza_osn_d, 2)      as "Расход газа, осн. (д), м3/ч [GRP2_Q_gaza_osn_d]",
	Round(GRP2_Q_LMR, 2)             as "Расход газа, л.м.р., м3/ч [GRP2_Q_LMR]",
	Round(GRP2_Q_LMR_d, 2)           as "Расход газа, л.м.р. (д), м3/ч [GRP2_Q_LMR_d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	GRP1_P_gaza_do_GRP,
	GRP1_P_gaza_posle_1rz,
	GRP1_P_gaza_posle_GRP,
	GRP1_T_gaza,
	GRP2_Q_gaza_osn,
	GRP2_Q_gaza_osn_d,
	GRP2_Q_LMR,
	GRP2_Q_LMR_d
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез за сутки}
/*ReportName="ГРП" (срез за сутки)*/
/*Mode=суточные-1*/
/*DownQuery="срез за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(GRP1_P_gaza_do_GRP, 2)     as "Давл. газа до ГРП, МПа [GRP1_P_gaza_do_GRP]",
	Round(GRP1_P_gaza_posle_1rz, 2)  as "Давл. газа после 1рз., МПа [GRP1_P_gaza_posle_1rz]",
	Round(GRP1_P_gaza_posle_GRP, 2)  as "Давл. газа после ГРП, кПа [GRP1_P_gaza_posle_GRP]",
	Round(GRP1_T_gaza, 2)            as "Темп. газа, °С [GRP1_T_gaza]",
	Round(GRP2_Q_gaza_osn, 2)        as "Расход газа, осн., м3/ч [GRP2_Q_gaza_osn]",
	Round(GRP2_Q_gaza_osn_d, 2)      as "Расход газа, осн. (д), м3/ч [GRP2_Q_gaza_osn_d]",
	Round(GRP2_Q_LMR, 2)             as "Расход газа, л.м.р., м3/ч [GRP2_Q_LMR]",
	Round(GRP2_Q_LMR_d, 2)           as "Расход газа, л.м.р. (д), м3/ч [GRP2_Q_LMR_d]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	GRP1_P_gaza_do_GRP,
	GRP1_P_gaza_posle_1rz,
	GRP1_P_gaza_posle_GRP,
	GRP1_T_gaza,
	GRP2_Q_gaza_osn,
	GRP2_Q_gaza_osn_d,
	GRP2_Q_LMR,
	GRP2_Q_LMR_d
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")