{минутные срезы}
/*ReportName=Уровни воды в барабанах котлоагрегатов (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(L_water_KA1L as decimal(15, 2)) as "Уровень воды<br>в барабане К1 (слева),<br> мм [L_water_KA1L]",
	CAST(L_water_KA1R as decimal(15, 2)) as "Уровень воды<br>в барабане К1 (справа),<br> мм [L_water_KA1R]",
	null,
	CAST(L_water_KA2L as decimal(15, 2)) as "Уровень воды<br>в барабане К2 (слева),<br> мм [L_water_KA2L]",
	CAST(L_water_KA2R as decimal(15, 2)) as "Уровень воды<br>в барабане К2 (справа),<br> мм [L_water_KA2R]",
	null,
	CAST(L_water_KA3L as decimal(15, 2)) as "Уровень воды<br>в барабане К3 (слева),<br> мм [L_water_KA3L]",
	CAST(L_water_KA3R as decimal(15, 2)) as "Уровень воды<br>в барабане К3 (справа),<br> мм [L_water_KA3R]",
	null,
	CAST(L_water_KA4L as decimal(15, 2)) as "Уровень воды<br>в барабане КА4 (слева),<br> мм [L_water_KA4L]",
	CAST(L_water_KA4R as decimal(15, 2)) as "Уровень воды<br>в барабане КА4 (справа),<br> мм [L_water_KA4R]",
	null,
	CAST(L_water_KA5L as decimal(15, 2)) as "Уровень воды<br>в барабане К5 (слева),<br> мм [L_water_KA5L]",
	CAST(L_water_KA5R as decimal(15, 2)) as "Уровень воды<br>в барабане К5 (справа),<br> мм [L_water_KA5R]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, L_water_KA1L, L_water_KA1R, L_water_KA2L, L_water_KA2R, L_water_KA3L, L_water_KA3R, L_water_KA4L, L_water_KA4R, L_water_KA5L, L_water_KA5R
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{часовые срезы}
/*ReportName=Уровни воды в барабанах котлоагрегатов (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(L_water_KA1L as decimal(15, 2)) as "Уровень воды<br>в барабане К1 (слева),<br> мм [L_water_KA1L]",
	CAST(L_water_KA1R as decimal(15, 2)) as "Уровень воды<br>в барабане К1 (справа),<br> мм [L_water_KA1R]",
	null,
	CAST(L_water_KA2L as decimal(15, 2)) as "Уровень воды<br>в барабане К2 (слева),<br> мм [L_water_KA2L]",
	CAST(L_water_KA2R as decimal(15, 2)) as "Уровень воды<br>в барабане К2 (справа),<br> мм [L_water_KA2R]",
	null,
	CAST(L_water_KA3L as decimal(15, 2)) as "Уровень воды<br>в барабане К3 (слева),<br> мм [L_water_KA3L]",
	CAST(L_water_KA3R as decimal(15, 2)) as "Уровень воды<br>в барабане К3 (справа),<br> мм [L_water_KA3R]",
	null,
	CAST(L_water_KA4L as decimal(15, 2)) as "Уровень воды<br>в барабане КА4 (слева),<br> мм [L_water_KA4L]",
	CAST(L_water_KA4R as decimal(15, 2)) as "Уровень воды<br>в барабане КА4 (справа),<br> мм [L_water_KA4R]",
	null,
	CAST(L_water_KA5L as decimal(15, 2)) as "Уровень воды<br>в барабане К5 (слева),<br> мм [L_water_KA5L]",
	CAST(L_water_KA5R as decimal(15, 2)) as "Уровень воды<br>в барабане К5 (справа),<br> мм [L_water_KA5R]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, L_water_KA1L, L_water_KA1R, L_water_KA2L, L_water_KA2R, L_water_KA3L, L_water_KA3R, L_water_KA4L, L_water_KA4R, L_water_KA5L, L_water_KA5R
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{суточные срезы}
/*ReportName=Уровни воды в барабанах котлоагрегатов (суточные срезы)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	CAST(L_water_KA1L as decimal(15, 2)) as "Уровень воды<br>в барабане К1 (слева),<br> мм [L_water_KA1L]",
	CAST(L_water_KA1R as decimal(15, 2)) as "Уровень воды<br>в барабане К1 (справа),<br> мм [L_water_KA1R]",
	null,
	CAST(L_water_KA2L as decimal(15, 2)) as "Уровень воды<br>в барабане К2 (слева),<br> мм [L_water_KA2L]",
	CAST(L_water_KA2R as decimal(15, 2)) as "Уровень воды<br>в барабане К2 (справа),<br> мм [L_water_KA2R]",
	null,
	CAST(L_water_KA3L as decimal(15, 2)) as "Уровень воды<br>в барабане К3 (слева),<br> мм [L_water_KA3L]",
	CAST(L_water_KA3R as decimal(15, 2)) as "Уровень воды<br>в барабане К3 (справа),<br> мм [L_water_KA3R]",
	null,
	CAST(L_water_KA4L as decimal(15, 2)) as "Уровень воды<br>в барабане КА4 (слева),<br> мм [L_water_KA4L]",
	CAST(L_water_KA4R as decimal(15, 2)) as "Уровень воды<br>в барабане КА4 (справа),<br> мм [L_water_KA4R]",
	null,
	CAST(L_water_KA5L as decimal(15, 2)) as "Уровень воды<br>в барабане К5 (слева),<br> мм [L_water_KA5L]",
	CAST(L_water_KA5R as decimal(15, 2)) as "Уровень воды<br>в барабане К5 (справа),<br> мм [L_water_KA5R]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, L_water_KA1L, L_water_KA1R, L_water_KA2L, L_water_KA2R, L_water_KA3L, L_water_KA3R, L_water_KA4L, L_water_KA4R, L_water_KA5L, L_water_KA5R
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")