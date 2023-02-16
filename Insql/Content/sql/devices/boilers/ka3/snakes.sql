{минутные срезы}
/*ReportName="КА-3 Змеевики" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="срез на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	-- 1. Змеевики необогреваемой зоны
	CAST(K3_VG1_P71b as decimal(15, 2)) as "П71б, °С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 2)) as "П72б, °С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 2)) as "П73б, °С [K3_VG1_P73b]",
	null,
	-- 2. Змеевики прочие
	CAST(K3_VG1_P49b as decimal(15, 2)) as "П49б, °С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 2)) as "П50б, °С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 2)) as "П51б, °С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 2)) as "П52б, °С [K3_VG1_P52b]",
	CAST(K3_VG1_P65b as decimal(15, 2)) as "П65б, °С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 2)) as "П66б, °С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 2)) as "П67б, °С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 2)) as "П68б, °С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 2)) as "П69б, °С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 2)) as "П70б, °С [K3_VG1_P70b]",
	CAST(K3_VG1_P81b as decimal(15, 2)) as "П81б, °С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 2)) as "П82б, °С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 2)) as "П83б, °С [K3_VG1_P83b]",
	null,
	-- 3. Ширмы
	CAST(K3_VG1_P53b as decimal(15, 2)) as "П53б, °С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 2)) as "П54б, °С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 2)) as "П55б, °С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 2)) as "П56б, °С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 2)) as "П57б, °С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 2)) as "П58б, °С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 2)) as "П59б, °С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 2)) as "П60б, °С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 2)) as "П61б, °С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 2)) as "П62б, °С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 2)) as "П63б, °С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 2)) as "П64б, °С [K3_VG1_P64b]",
	null,
	-- 4. 3ст
	CAST(K3_VG1_P74b as decimal(15, 2)) as "П74б, °С [K3_VG1_P74b]",
	CAST(K3_VG1_P75b as decimal(15, 2)) as "П75б, °С [K3_VG1_P75b]",
	CAST(K3_VG1_P76b as decimal(15, 2)) as "П76б, °С [K3_VG1_P76b]",
	CAST(K3_VG2_P77b as decimal(15, 2)) as "П77б, °С [K3_VG2_P77b]",
	CAST(K3_VG2_P78b as decimal(15, 2)) as "П78б, °С [K3_VG2_P78b]",
	CAST(K3_VG2_P79b as decimal(15, 2)) as "П79б, °С [K3_VG2_P79b]",
	CAST(K3_VG2_P80b as decimal(15, 2)) as "П80б, °С [K3_VG2_P80b]"
	-- 5. 4ст
FROM
	OpenQuery(INSQL,
	"SELECT
	DateTime, K3_VG1_P49b, K3_VG1_P50b, K3_VG1_P51b,
	K3_VG1_P52b, K3_VG1_P53b, K3_VG1_P54b, K3_VG1_P55b,
	K3_VG1_P56b, K3_VG1_P57b, K3_VG1_P58b, K3_VG1_P59b,
	K3_VG1_P60b, K3_VG1_P61b, K3_VG1_P62b, K3_VG1_P63b,
	K3_VG1_P64b, K3_VG1_P65b, K3_VG1_P66b, K3_VG1_P67b,
	K3_VG1_P68b, K3_VG1_P69b, K3_VG1_P70b, K3_VG1_P71b,
	K3_VG1_P72b, K3_VG1_P73b, K3_VG1_P74b, K3_VG1_P75b,
	K3_VG1_P76b, K3_VG1_P81b, K3_VG1_P82b, K3_VG1_P83b,
	K3_VG2_P77b, K3_VG2_P78b, K3_VG2_P79b, K3_VG2_P80b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез на конец часа}
/*ReportName="КА-3 Змеевики" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="срез на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	-- 1. Змеевики необогреваемой зоны
	CAST(K3_VG1_P71b as decimal(15, 2)) as "П71б, °С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 2)) as "П72б, °С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 2)) as "П73б, °С [K3_VG1_P73b]",
	null,
	-- 2. Змеевики прочие
	CAST(K3_VG1_P49b as decimal(15, 2)) as "П49б, °С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 2)) as "П50б, °С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 2)) as "П51б, °С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 2)) as "П52б, °С [K3_VG1_P52b]",
	CAST(K3_VG1_P65b as decimal(15, 2)) as "П65б, °С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 2)) as "П66б, °С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 2)) as "П67б, °С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 2)) as "П68б, °С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 2)) as "П69б, °С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 2)) as "П70б, °С [K3_VG1_P70b]",
	CAST(K3_VG1_P81b as decimal(15, 2)) as "П81б, °С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 2)) as "П82б, °С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 2)) as "П83б, °С [K3_VG1_P83b]",
	null,
	-- 3. Ширмы
	CAST(K3_VG1_P53b as decimal(15, 2)) as "П53б, °С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 2)) as "П54б, °С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 2)) as "П55б, °С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 2)) as "П56б, °С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 2)) as "П57б, °С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 2)) as "П58б, °С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 2)) as "П59б, °С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 2)) as "П60б, °С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 2)) as "П61б, °С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 2)) as "П62б, °С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 2)) as "П63б, °С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 2)) as "П64б, °С [K3_VG1_P64b]",
	null,
	-- 4. 3ст
	CAST(K3_VG1_P74b as decimal(15, 2)) as "П74б, °С [K3_VG1_P74b]",
	CAST(K3_VG1_P75b as decimal(15, 2)) as "П75б, °С [K3_VG1_P75b]",
	CAST(K3_VG1_P76b as decimal(15, 2)) as "П76б, °С [K3_VG1_P76b]",
	CAST(K3_VG2_P77b as decimal(15, 2)) as "П77б, °С [K3_VG2_P77b]",
	CAST(K3_VG2_P78b as decimal(15, 2)) as "П78б, °С [K3_VG2_P78b]",
	CAST(K3_VG2_P79b as decimal(15, 2)) as "П79б, °С [K3_VG2_P79b]",
	CAST(K3_VG2_P80b as decimal(15, 2)) as "П80б, °С [K3_VG2_P80b]"
	-- 5. 4ст
FROM
	OpenQuery(INSQL,
	"SELECT
	DateTime, K3_VG1_P49b, K3_VG1_P50b, K3_VG1_P51b,
	K3_VG1_P52b, K3_VG1_P53b, K3_VG1_P54b, K3_VG1_P55b,
	K3_VG1_P56b, K3_VG1_P57b, K3_VG1_P58b, K3_VG1_P59b,
	K3_VG1_P60b, K3_VG1_P61b, K3_VG1_P62b, K3_VG1_P63b,
	K3_VG1_P64b, K3_VG1_P65b, K3_VG1_P66b, K3_VG1_P67b,
	K3_VG1_P68b, K3_VG1_P69b, K3_VG1_P70b, K3_VG1_P71b,
	K3_VG1_P72b, K3_VG1_P73b, K3_VG1_P74b, K3_VG1_P75b,
	K3_VG1_P76b, K3_VG1_P81b, K3_VG1_P82b, K3_VG1_P83b,
	K3_VG2_P77b, K3_VG2_P78b, K3_VG2_P79b, K3_VG2_P80b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срез на конец суток}
/*ReportName="КА-3 Змеевики" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срез на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,null,
	-- 1. Змеевики необогреваемой зоны
	CAST(K3_VG1_P71b as decimal(15, 2)) as "П71б, °С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 2)) as "П72б, °С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 2)) as "П73б, °С [K3_VG1_P73b]",
	null,null,
	-- 2. Змеевики прочие
	CAST(K3_VG1_P49b as decimal(15, 2)) as "П49б, °С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 2)) as "П50б, °С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 2)) as "П51б, °С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 2)) as "П52б, °С [K3_VG1_P52b]",
	CAST(K3_VG1_P65b as decimal(15, 2)) as "П65б, °С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 2)) as "П66б, °С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 2)) as "П67б, °С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 2)) as "П68б, °С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 2)) as "П69б, °С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 2)) as "П70б, °С [K3_VG1_P70b]",
	CAST(K3_VG1_P81b as decimal(15, 2)) as "П81б, °С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 2)) as "П82б, °С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 2)) as "П83б, °С [K3_VG1_P83b]",
	null,null,
	-- 3. Ширмы
	CAST(K3_VG1_P53b as decimal(15, 2)) as "П53б, °С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 2)) as "П54б, °С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 2)) as "П55б, °С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 2)) as "П56б, °С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 2)) as "П57б, °С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 2)) as "П58б, °С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 2)) as "П59б, °С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 2)) as "П60б, °С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 2)) as "П61б, °С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 2)) as "П62б, °С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 2)) as "П63б, °С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 2)) as "П64б, °С [K3_VG1_P64b]",
	null,null,
	-- 4. 3ст
	CAST(K3_VG1_P74b as decimal(15, 2)) as "П74б, °С [K3_VG1_P74b]",
	CAST(K3_VG1_P75b as decimal(15, 2)) as "П75б, °С [K3_VG1_P75b]",
	CAST(K3_VG1_P76b as decimal(15, 2)) as "П76б, °С [K3_VG1_P76b]",
	CAST(K3_VG2_P77b as decimal(15, 2)) as "П77б, °С [K3_VG2_P77b]",
	CAST(K3_VG2_P78b as decimal(15, 2)) as "П78б, °С [K3_VG2_P78b]",
	CAST(K3_VG2_P79b as decimal(15, 2)) as "П79б, °С [K3_VG2_P79b]",
	CAST(K3_VG2_P80b as decimal(15, 2)) as "П80б, °С [K3_VG2_P80b]"
	-- 5. 4ст
FROM
	OpenQuery(INSQL,
	"SELECT
	DateTime, K3_VG1_P49b, K3_VG1_P50b, K3_VG1_P51b,
	K3_VG1_P52b, K3_VG1_P53b, K3_VG1_P54b, K3_VG1_P55b,
	K3_VG1_P56b, K3_VG1_P57b, K3_VG1_P58b, K3_VG1_P59b,
	K3_VG1_P60b, K3_VG1_P61b, K3_VG1_P62b, K3_VG1_P63b,
	K3_VG1_P64b, K3_VG1_P65b, K3_VG1_P66b, K3_VG1_P67b,
	K3_VG1_P68b, K3_VG1_P69b, K3_VG1_P70b, K3_VG1_P71b,
	K3_VG1_P72b, K3_VG1_P73b, K3_VG1_P74b, K3_VG1_P75b,
	K3_VG1_P76b, K3_VG1_P81b, K3_VG1_P82b, K3_VG1_P83b,
	K3_VG2_P77b, K3_VG2_P78b, K3_VG2_P79b, K3_VG2_P80b
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")