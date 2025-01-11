{срезы минутные}
/*ReportName="К-4 РМТ-19" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(K4_Qgas_osn, 2) as "Расход газа (осн) [K4_Qgas_osn]",
	Round(K4_Qgas_pb, 2) as "Расход газа (байпас) [K4_Qgas_pb]",
	Round(K4_Pgas, 2) as "Давление газа [K4_Pgas]",
	null,
	Round(K4_Qmaz, 2) as "Расход мазута [K4_Qmaz]",
	Round(K4_Pmaz, 2) as "Давление мазута [K4_Pmaz]",
	null,
	Round(K4_Pwater, 2) as "Давление питательной воды [K4_Pwater]",
	Round(K4_Ppar, 2) as "Давление перегретого пара за котлом [K4_Ppar]",
	Round(K4_Pbar, 2) as "Давление в барабане [K4_Pbar]",
	Round(K4_Gwat_1, 2) as "Расход питательной воды на впрыск 1 ст [K4_Gwat_1]",
	Round(K4_Gwat_2, 2) as "Расход питательной воды на впрыск 2 ст [K4_Gwat_2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz, K4_Pmaz, K4_Pwater, K4_Ppar, K4_Pbar, K4_Gwat_1, K4_Gwat_2
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы часовые}
/*ReportName="К-4 РМТ-19" (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы суточные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(K4_Qgas_osn, 2) as "Расход газа (осн) [K4_Qgas_osn]",
	Round(K4_Qgas_pb, 2) as "Расход газа (байпас) [K4_Qgas_pb]",
	Round(K4_Pgas, 2) as "Давление газа [K4_Pgas]",
	null,
	Round(K4_Qmaz, 2) as "Расход мазута [K4_Qmaz]",
	Round(K4_Pmaz, 2) as "Давление мазута [K4_Pmaz]",
	null,
	Round(K4_Pwater, 2) as "Давление питательной воды [K4_Pwater]",
	Round(K4_Ppar, 2) as "Давление перегретого пара за котлом [K4_Ppar]",
	Round(K4_Pbar, 2) as "Давление в барабане [K4_Pbar]",
	Round(K4_Gwat_1, 2) as "Расход питательной воды на впрыск 1 ст [K4_Gwat_1]",
	Round(K4_Gwat_2, 2) as "Расход питательной воды на впрыск 2 ст [K4_Gwat_2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz, K4_Pmaz, K4_Pwater, K4_Ppar, K4_Pbar, K4_Gwat_1, K4_Gwat_2
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы суточные}
/*ReportName="К-4 РМТ-19" (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="срезы часовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(K4_Qgas_osn, 2) as "Расход газа (осн) [K4_Qgas_osn]",
	Round(K4_Qgas_pb, 2) as "Расход газа (байпас) [K4_Qgas_pb]",
	Round(K4_Pgas, 2) as "Давление газа [K4_Pgas]",
	null,
	Round(K4_Qmaz, 2) as "Расход мазута [K4_Qmaz]",
	Round(K4_Pmaz, 2) as "Давление мазута [K4_Pmaz]",
	null,
	Round(K4_Pwater, 2) as "Давление питательной воды [K4_Pwater]",
	Round(K4_Ppar, 2) as "Давление перегретого пара за котлом [K4_Ppar]",
	Round(K4_Pbar, 2) as "Давление в барабане [K4_Pbar]",
	Round(K4_Gwat_1, 2) as "Расход питательной воды на впрыск 1 ст [K4_Gwat_1]",
	Round(K4_Gwat_2, 2) as "Расход питательной воды на впрыск 2 ст [K4_Gwat_2]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, K4_Qgas_osn, K4_Qgas_pb, K4_Pgas, K4_Qmaz, K4_Pmaz, K4_Pwater, K4_Ppar, K4_Pbar, K4_Gwat_1, K4_Gwat_2
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
