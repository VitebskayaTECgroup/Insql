{срезы минутные}
/*ReportName="Отчёт КА-3 VG1. Экран 2" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P49b as decimal(15, 1)) as "П49б<br>°С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 1)) as "П50б<br>°С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 1)) as "П51б<br>°С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 1)) as "П52б<br>°С [K3_VG1_P52b]",
	CAST(K3_VG1_P53b as decimal(15, 1)) as "П53б<br>°С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 1)) as "П54б<br>°С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 1)) as "П55б<br>°С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 1)) as "П56б<br>°С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 1)) as "П57б<br>°С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 1)) as "П58б<br>°С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 1)) as "П59б<br>°С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 1)) as "П60б<br>°С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 1)) as "П61б<br>°С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 1)) as "П62б<br>°С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 1)) as "П63б<br>°С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 1)) as "П64б<br>°С [K3_VG1_P64b]",
	CAST(K3_VG1_P65b as decimal(15, 1)) as "П65б<br>°С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 1)) as "П66б<br>°С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 1)) as "П67б<br>°С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 1)) as "П68б<br>°С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 1)) as "П69б<br>°С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 1)) as "П70б<br>°С [K3_VG1_P70b]",
	CAST(K3_VG1_P71b as decimal(15, 1)) as "П71б<br>°С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 1)) as "П72б<br>°С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 1)) as "П73б<br>°С [K3_VG1_P73b]",
	CAST(K3_VG1_P74b as decimal(15, 1)) as "П74б<br>°С [K3_VG1_P74b]",
	CAST(K3_VG1_P75b as decimal(15, 1)) as "П75б<br>°С [K3_VG1_P75b]",
	CAST(K3_VG1_P76b as decimal(15, 1)) as "П76б<br>°С [K3_VG1_P76b]",
	null,
	CAST(K3_VG1_P81b as decimal(15, 1)) as "П81б<br>°С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 1)) as "П82б<br>°С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 1)) as "П83б<br>°С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b,
	K3_VG1_P53b,
	K3_VG1_P54b,
	K3_VG1_P55b,
	K3_VG1_P56b,
	K3_VG1_P57b,
	K3_VG1_P58b,
	K3_VG1_P59b,
	K3_VG1_P60b,
	K3_VG1_P61b,
	K3_VG1_P62b,
	K3_VG1_P63b,
	K3_VG1_P64b,
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P74b,
	K3_VG1_P75b,
	K3_VG1_P76b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-3 VG1. Экран 2" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG1_P49b as decimal(15, 1)) as "П49б<br>°С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 1)) as "П50б<br>°С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 1)) as "П51б<br>°С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 1)) as "П52б<br>°С [K3_VG1_P52b]",
	CAST(K3_VG1_P53b as decimal(15, 1)) as "П53б<br>°С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 1)) as "П54б<br>°С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 1)) as "П55б<br>°С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 1)) as "П56б<br>°С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 1)) as "П57б<br>°С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 1)) as "П58б<br>°С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 1)) as "П59б<br>°С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 1)) as "П60б<br>°С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 1)) as "П61б<br>°С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 1)) as "П62б<br>°С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 1)) as "П63б<br>°С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 1)) as "П64б<br>°С [K3_VG1_P64b]",
	CAST(K3_VG1_P65b as decimal(15, 1)) as "П65б<br>°С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 1)) as "П66б<br>°С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 1)) as "П67б<br>°С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 1)) as "П68б<br>°С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 1)) as "П69б<br>°С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 1)) as "П70б<br>°С [K3_VG1_P70b]",
	CAST(K3_VG1_P71b as decimal(15, 1)) as "П71б<br>°С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 1)) as "П72б<br>°С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 1)) as "П73б<br>°С [K3_VG1_P73b]",
	CAST(K3_VG1_P74b as decimal(15, 1)) as "П74б<br>°С [K3_VG1_P74b]",
	CAST(K3_VG1_P75b as decimal(15, 1)) as "П75б<br>°С [K3_VG1_P75b]",
	CAST(K3_VG1_P76b as decimal(15, 1)) as "П76б<br>°С [K3_VG1_P76b]",
	null,
	CAST(K3_VG1_P81b as decimal(15, 1)) as "П81б<br>°С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 1)) as "П82б<br>°С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 1)) as "П83б<br>°С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b,
	K3_VG1_P53b,
	K3_VG1_P54b,
	K3_VG1_P55b,
	K3_VG1_P56b,
	K3_VG1_P57b,
	K3_VG1_P58b,
	K3_VG1_P59b,
	K3_VG1_P60b,
	K3_VG1_P61b,
	K3_VG1_P62b,
	K3_VG1_P63b,
	K3_VG1_P64b,
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P74b,
	K3_VG1_P75b,
	K3_VG1_P76b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-3 VG1. Экран 2" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG1_P49b as decimal(15, 1)) as "П49б<br>°С [K3_VG1_P49b]",
	CAST(K3_VG1_P50b as decimal(15, 1)) as "П50б<br>°С [K3_VG1_P50b]",
	CAST(K3_VG1_P51b as decimal(15, 1)) as "П51б<br>°С [K3_VG1_P51b]",
	CAST(K3_VG1_P52b as decimal(15, 1)) as "П52б<br>°С [K3_VG1_P52b]",
	CAST(K3_VG1_P53b as decimal(15, 1)) as "П53б<br>°С [K3_VG1_P53b]",
	CAST(K3_VG1_P54b as decimal(15, 1)) as "П54б<br>°С [K3_VG1_P54b]",
	CAST(K3_VG1_P55b as decimal(15, 1)) as "П55б<br>°С [K3_VG1_P55b]",
	CAST(K3_VG1_P56b as decimal(15, 1)) as "П56б<br>°С [K3_VG1_P56b]",
	CAST(K3_VG1_P57b as decimal(15, 1)) as "П57б<br>°С [K3_VG1_P57b]",
	CAST(K3_VG1_P58b as decimal(15, 1)) as "П58б<br>°С [K3_VG1_P58b]",
	CAST(K3_VG1_P59b as decimal(15, 1)) as "П59б<br>°С [K3_VG1_P59b]",
	CAST(K3_VG1_P60b as decimal(15, 1)) as "П60б<br>°С [K3_VG1_P60b]",
	CAST(K3_VG1_P61b as decimal(15, 1)) as "П61б<br>°С [K3_VG1_P61b]",
	CAST(K3_VG1_P62b as decimal(15, 1)) as "П62б<br>°С [K3_VG1_P62b]",
	CAST(K3_VG1_P63b as decimal(15, 1)) as "П63б<br>°С [K3_VG1_P63b]",
	CAST(K3_VG1_P64b as decimal(15, 1)) as "П64б<br>°С [K3_VG1_P64b]",
	CAST(K3_VG1_P65b as decimal(15, 1)) as "П65б<br>°С [K3_VG1_P65b]",
	CAST(K3_VG1_P66b as decimal(15, 1)) as "П66б<br>°С [K3_VG1_P66b]",
	CAST(K3_VG1_P67b as decimal(15, 1)) as "П67б<br>°С [K3_VG1_P67b]",
	CAST(K3_VG1_P68b as decimal(15, 1)) as "П68б<br>°С [K3_VG1_P68b]",
	CAST(K3_VG1_P69b as decimal(15, 1)) as "П69б<br>°С [K3_VG1_P69b]",
	CAST(K3_VG1_P70b as decimal(15, 1)) as "П70б<br>°С [K3_VG1_P70b]",
	CAST(K3_VG1_P71b as decimal(15, 1)) as "П71б<br>°С [K3_VG1_P71b]",
	CAST(K3_VG1_P72b as decimal(15, 1)) as "П72б<br>°С [K3_VG1_P72b]",
	CAST(K3_VG1_P73b as decimal(15, 1)) as "П73б<br>°С [K3_VG1_P73b]",
	CAST(K3_VG1_P74b as decimal(15, 1)) as "П74б<br>°С [K3_VG1_P74b]",
	CAST(K3_VG1_P75b as decimal(15, 1)) as "П75б<br>°С [K3_VG1_P75b]",
	CAST(K3_VG1_P76b as decimal(15, 1)) as "П76б<br>°С [K3_VG1_P76b]",
	null,
	CAST(K3_VG1_P81b as decimal(15, 1)) as "П81б<br>°С [K3_VG1_P81b]",
	CAST(K3_VG1_P82b as decimal(15, 1)) as "П82б<br>°С [K3_VG1_P82b]",
	CAST(K3_VG1_P83b as decimal(15, 1)) as "П83б<br>°С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b,
	K3_VG1_P53b,
	K3_VG1_P54b,
	K3_VG1_P55b,
	K3_VG1_P56b,
	K3_VG1_P57b,
	K3_VG1_P58b,
	K3_VG1_P59b,
	K3_VG1_P60b,
	K3_VG1_P61b,
	K3_VG1_P62b,
	K3_VG1_P63b,
	K3_VG1_P64b,
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P74b,
	K3_VG1_P75b,
	K3_VG1_P76b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-3 VG1. Экран 2" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(K3_VG1_P49b) as decimal(15, 1)) as "П49б<br>°С [K3_VG1_P49b]",
	CAST(AVG(K3_VG1_P50b) as decimal(15, 1)) as "П50б<br>°С [K3_VG1_P50b]",
	CAST(AVG(K3_VG1_P51b) as decimal(15, 1)) as "П51б<br>°С [K3_VG1_P51b]",
	CAST(AVG(K3_VG1_P52b) as decimal(15, 1)) as "П52б<br>°С [K3_VG1_P52b]",
	CAST(AVG(K3_VG1_P53b) as decimal(15, 1)) as "П53б<br>°С [K3_VG1_P53b]",
	CAST(AVG(K3_VG1_P54b) as decimal(15, 1)) as "П54б<br>°С [K3_VG1_P54b]",
	CAST(AVG(K3_VG1_P55b) as decimal(15, 1)) as "П55б<br>°С [K3_VG1_P55b]",
	CAST(AVG(K3_VG1_P56b) as decimal(15, 1)) as "П56б<br>°С [K3_VG1_P56b]",
	CAST(AVG(K3_VG1_P57b) as decimal(15, 1)) as "П57б<br>°С [K3_VG1_P57b]",
	CAST(AVG(K3_VG1_P58b) as decimal(15, 1)) as "П58б<br>°С [K3_VG1_P58b]",
	CAST(AVG(K3_VG1_P59b) as decimal(15, 1)) as "П59б<br>°С [K3_VG1_P59b]",
	CAST(AVG(K3_VG1_P60b) as decimal(15, 1)) as "П60б<br>°С [K3_VG1_P60b]",
	CAST(AVG(K3_VG1_P61b) as decimal(15, 1)) as "П61б<br>°С [K3_VG1_P61b]",
	CAST(AVG(K3_VG1_P62b) as decimal(15, 1)) as "П62б<br>°С [K3_VG1_P62b]",
	CAST(AVG(K3_VG1_P63b) as decimal(15, 1)) as "П63б<br>°С [K3_VG1_P63b]",
	CAST(AVG(K3_VG1_P64b) as decimal(15, 1)) as "П64б<br>°С [K3_VG1_P64b]",
	CAST(AVG(K3_VG1_P65b) as decimal(15, 1)) as "П65б<br>°С [K3_VG1_P65b]",
	CAST(AVG(K3_VG1_P66b) as decimal(15, 1)) as "П66б<br>°С [K3_VG1_P66b]",
	CAST(AVG(K3_VG1_P67b) as decimal(15, 1)) as "П67б<br>°С [K3_VG1_P67b]",
	CAST(AVG(K3_VG1_P68b) as decimal(15, 1)) as "П68б<br>°С [K3_VG1_P68b]",
	CAST(AVG(K3_VG1_P69b) as decimal(15, 1)) as "П69б<br>°С [K3_VG1_P69b]",
	CAST(AVG(K3_VG1_P70b) as decimal(15, 1)) as "П70б<br>°С [K3_VG1_P70b]",
	CAST(AVG(K3_VG1_P71b) as decimal(15, 1)) as "П71б<br>°С [K3_VG1_P71b]",
	CAST(AVG(K3_VG1_P72b) as decimal(15, 1)) as "П72б<br>°С [K3_VG1_P72b]",
	CAST(AVG(K3_VG1_P73b) as decimal(15, 1)) as "П73б<br>°С [K3_VG1_P73b]",
	CAST(AVG(K3_VG1_P74b) as decimal(15, 1)) as "П74б<br>°С [K3_VG1_P74b]",
	CAST(AVG(K3_VG1_P75b) as decimal(15, 1)) as "П75б<br>°С [K3_VG1_P75b]",
	CAST(AVG(K3_VG1_P76b) as decimal(15, 1)) as "П76б<br>°С [K3_VG1_P76b]",
	null,
	CAST(AVG(K3_VG1_P81b) as decimal(15, 1)) as "П81б<br>°С [K3_VG1_P81b]",
	CAST(AVG(K3_VG1_P82b) as decimal(15, 1)) as "П82б<br>°С [K3_VG1_P82b]",
	CAST(AVG(K3_VG1_P83b) as decimal(15, 1)) as "П83б<br>°С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
		"SELECT DateTime, 
		K3_VG1_P49b,
		K3_VG1_P50b,
		K3_VG1_P51b,
		K3_VG1_P52b,
		K3_VG1_P53b,
		K3_VG1_P54b,
		K3_VG1_P55b,
		K3_VG1_P56b,
		K3_VG1_P57b,
		K3_VG1_P58b,
		K3_VG1_P59b,
		K3_VG1_P60b,
		K3_VG1_P61b,
		K3_VG1_P62b,
		K3_VG1_P63b,
		K3_VG1_P64b,
		K3_VG1_P65b,
		K3_VG1_P66b,
		K3_VG1_P67b,
		K3_VG1_P68b,
		K3_VG1_P69b,
		K3_VG1_P70b,
		K3_VG1_P71b,
		K3_VG1_P72b,
		K3_VG1_P73b,
		K3_VG1_P74b,
		K3_VG1_P75b,
		K3_VG1_P76b,
		K3_VG1_P81b,
		K3_VG1_P82b,
		K3_VG1_P83b
		FROM Runtime.dbo.AnalogWideHistory
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime

{агрегированные за сутки}
/*ReportName="Отчёт КА-3 VG1. Экран 2" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(K3_VG1_P49b) as decimal(15, 1)) as "П49б<br>°С [K3_VG1_P49b]",
	CAST(AVG(K3_VG1_P50b) as decimal(15, 1)) as "П50б<br>°С [K3_VG1_P50b]",
	CAST(AVG(K3_VG1_P51b) as decimal(15, 1)) as "П51б<br>°С [K3_VG1_P51b]",
	CAST(AVG(K3_VG1_P52b) as decimal(15, 1)) as "П52б<br>°С [K3_VG1_P52b]",
	CAST(AVG(K3_VG1_P53b) as decimal(15, 1)) as "П53б<br>°С [K3_VG1_P53b]",
	CAST(AVG(K3_VG1_P54b) as decimal(15, 1)) as "П54б<br>°С [K3_VG1_P54b]",
	CAST(AVG(K3_VG1_P55b) as decimal(15, 1)) as "П55б<br>°С [K3_VG1_P55b]",
	CAST(AVG(K3_VG1_P56b) as decimal(15, 1)) as "П56б<br>°С [K3_VG1_P56b]",
	CAST(AVG(K3_VG1_P57b) as decimal(15, 1)) as "П57б<br>°С [K3_VG1_P57b]",
	CAST(AVG(K3_VG1_P58b) as decimal(15, 1)) as "П58б<br>°С [K3_VG1_P58b]",
	CAST(AVG(K3_VG1_P59b) as decimal(15, 1)) as "П59б<br>°С [K3_VG1_P59b]",
	CAST(AVG(K3_VG1_P60b) as decimal(15, 1)) as "П60б<br>°С [K3_VG1_P60b]",
	CAST(AVG(K3_VG1_P61b) as decimal(15, 1)) as "П61б<br>°С [K3_VG1_P61b]",
	CAST(AVG(K3_VG1_P62b) as decimal(15, 1)) as "П62б<br>°С [K3_VG1_P62b]",
	CAST(AVG(K3_VG1_P63b) as decimal(15, 1)) as "П63б<br>°С [K3_VG1_P63b]",
	CAST(AVG(K3_VG1_P64b) as decimal(15, 1)) as "П64б<br>°С [K3_VG1_P64b]",
	CAST(AVG(K3_VG1_P65b) as decimal(15, 1)) as "П65б<br>°С [K3_VG1_P65b]",
	CAST(AVG(K3_VG1_P66b) as decimal(15, 1)) as "П66б<br>°С [K3_VG1_P66b]",
	CAST(AVG(K3_VG1_P67b) as decimal(15, 1)) as "П67б<br>°С [K3_VG1_P67b]",
	CAST(AVG(K3_VG1_P68b) as decimal(15, 1)) as "П68б<br>°С [K3_VG1_P68b]",
	CAST(AVG(K3_VG1_P69b) as decimal(15, 1)) as "П69б<br>°С [K3_VG1_P69b]",
	CAST(AVG(K3_VG1_P70b) as decimal(15, 1)) as "П70б<br>°С [K3_VG1_P70b]",
	CAST(AVG(K3_VG1_P71b) as decimal(15, 1)) as "П71б<br>°С [K3_VG1_P71b]",
	CAST(AVG(K3_VG1_P72b) as decimal(15, 1)) as "П72б<br>°С [K3_VG1_P72b]",
	CAST(AVG(K3_VG1_P73b) as decimal(15, 1)) as "П73б<br>°С [K3_VG1_P73b]",
	CAST(AVG(K3_VG1_P74b) as decimal(15, 1)) as "П74б<br>°С [K3_VG1_P74b]",
	CAST(AVG(K3_VG1_P75b) as decimal(15, 1)) as "П75б<br>°С [K3_VG1_P75b]",
	CAST(AVG(K3_VG1_P76b) as decimal(15, 1)) as "П76б<br>°С [K3_VG1_P76b]",
	null,
	CAST(AVG(K3_VG1_P81b) as decimal(15, 1)) as "П81б<br>°С [K3_VG1_P81b]",
	CAST(AVG(K3_VG1_P82b) as decimal(15, 1)) as "П82б<br>°С [K3_VG1_P82b]",
	CAST(AVG(K3_VG1_P83b) as decimal(15, 1)) as "П83б<br>°С [K3_VG1_P83b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P49b,
	K3_VG1_P50b,
	K3_VG1_P51b,
	K3_VG1_P52b,
	K3_VG1_P53b,
	K3_VG1_P54b,
	K3_VG1_P55b,
	K3_VG1_P56b,
	K3_VG1_P57b,
	K3_VG1_P58b,
	K3_VG1_P59b,
	K3_VG1_P60b,
	K3_VG1_P61b,
	K3_VG1_P62b,
	K3_VG1_P63b,
	K3_VG1_P64b,
	K3_VG1_P65b,
	K3_VG1_P66b,
	K3_VG1_P67b,
	K3_VG1_P68b,
	K3_VG1_P69b,
	K3_VG1_P70b,
	K3_VG1_P71b,
	K3_VG1_P72b,
	K3_VG1_P73b,
	K3_VG1_P74b,
	K3_VG1_P75b,
	K3_VG1_P76b,
	K3_VG1_P81b,
	K3_VG1_P82b,
	K3_VG1_P83b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime
