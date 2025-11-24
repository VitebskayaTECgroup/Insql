{срезы минутные}
/*ReportName="Отчёт КА-5 VG1. Экран 2" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K037 as decimal(15, 1)) as "Т1<br>°С [KA5_VG1_K037]",
	CAST(KA5_VG1_K038 as decimal(15, 1)) as "Т2<br>°С [KA5_VG1_K038]",
	CAST(KA5_VG1_K039 as decimal(15, 1)) as "Т3<br>°С [KA5_VG1_K039]",
	CAST(KA5_VG1_K040 as decimal(15, 1)) as "Т4<br>°С [KA5_VG1_K040]",
	CAST(KA5_VG1_K041 as decimal(15, 1)) as "Т5<br>°С [KA5_VG1_K041]",
	CAST(KA5_VG1_K042 as decimal(15, 1)) as "Т6<br>°С [KA5_VG1_K042]",
	CAST(KA5_VG1_K043 as decimal(15, 1)) as "Т7<br>°С [KA5_VG1_K043]",
	CAST(KA5_VG1_K044 as decimal(15, 1)) as "Т8<br>°С [KA5_VG1_K044]",
	CAST(KA5_VG1_K045 as decimal(15, 1)) as "Т9<br>°С [KA5_VG1_K045]",
	CAST(KA5_VG1_K046 as decimal(15, 1)) as "Т10<br>°С [KA5_VG1_K046]",
	CAST(KA5_VG1_K047 as decimal(15, 1)) as "Т11<br>°С [KA5_VG1_K047]",
	CAST(KA5_VG1_K048 as decimal(15, 1)) as "Т12<br>°С [KA5_VG1_K048]",
	CAST(KA5_VG1_K049 as decimal(15, 1)) as "Т13<br>°С [KA5_VG1_K049]",
	CAST(KA5_VG1_K050 as decimal(15, 1)) as "Т14<br>°С [KA5_VG1_K050]",
	CAST(KA5_VG1_K051 as decimal(15, 1)) as "Т15<br>°С [KA5_VG1_K051]",
	CAST(KA5_VG1_K052 as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K052]",
	CAST(KA5_VG1_K053 as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K053]",
	CAST(KA5_VG1_K054 as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K054]",
	CAST(KA5_VG1_K055 as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K055]",
	CAST(KA5_VG1_K056 as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K056]",
	CAST(KA5_VG1_K057 as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K057]",
	CAST(KA5_VG1_K058 as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K058]",
	CAST(KA5_VG1_K059 as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K059]",
	CAST(KA5_VG1_K060 as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K060]",
	CAST(KA5_VG1_K061 as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K061]",
	CAST(KA5_VG1_K062 as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K062]",
	CAST(KA5_VG1_K063 as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K063]",
	CAST(KA5_VG1_K064 as decimal(15, 1)) as "Т28<br>°С [KA5_VG1_K064]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K037,
	KA5_VG1_K038,
	KA5_VG1_K039,
	KA5_VG1_K040,
	KA5_VG1_K041,
	KA5_VG1_K042,
	KA5_VG1_K043,
	KA5_VG1_K044,
	KA5_VG1_K045,
	KA5_VG1_K046,
	KA5_VG1_K047,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057,
	KA5_VG1_K058,
	KA5_VG1_K059,
	KA5_VG1_K060,
	KA5_VG1_K061,
	KA5_VG1_K062,
	KA5_VG1_K063,
	KA5_VG1_K064
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-5 VG1. Экран 2" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K037 as decimal(15, 1)) as "Т1<br>°С [KA5_VG1_K037]",
	CAST(KA5_VG1_K038 as decimal(15, 1)) as "Т2<br>°С [KA5_VG1_K038]",
	CAST(KA5_VG1_K039 as decimal(15, 1)) as "Т3<br>°С [KA5_VG1_K039]",
	CAST(KA5_VG1_K040 as decimal(15, 1)) as "Т4<br>°С [KA5_VG1_K040]",
	CAST(KA5_VG1_K041 as decimal(15, 1)) as "Т5<br>°С [KA5_VG1_K041]",
	CAST(KA5_VG1_K042 as decimal(15, 1)) as "Т6<br>°С [KA5_VG1_K042]",
	CAST(KA5_VG1_K043 as decimal(15, 1)) as "Т7<br>°С [KA5_VG1_K043]",
	CAST(KA5_VG1_K044 as decimal(15, 1)) as "Т8<br>°С [KA5_VG1_K044]",
	CAST(KA5_VG1_K045 as decimal(15, 1)) as "Т9<br>°С [KA5_VG1_K045]",
	CAST(KA5_VG1_K046 as decimal(15, 1)) as "Т10<br>°С [KA5_VG1_K046]",
	CAST(KA5_VG1_K047 as decimal(15, 1)) as "Т11<br>°С [KA5_VG1_K047]",
	CAST(KA5_VG1_K048 as decimal(15, 1)) as "Т12<br>°С [KA5_VG1_K048]",
	CAST(KA5_VG1_K049 as decimal(15, 1)) as "Т13<br>°С [KA5_VG1_K049]",
	CAST(KA5_VG1_K050 as decimal(15, 1)) as "Т14<br>°С [KA5_VG1_K050]",
	CAST(KA5_VG1_K051 as decimal(15, 1)) as "Т15<br>°С [KA5_VG1_K051]",
	CAST(KA5_VG1_K052 as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K052]",
	CAST(KA5_VG1_K053 as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K053]",
	CAST(KA5_VG1_K054 as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K054]",
	CAST(KA5_VG1_K055 as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K055]",
	CAST(KA5_VG1_K056 as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K056]",
	CAST(KA5_VG1_K057 as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K057]",
	CAST(KA5_VG1_K058 as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K058]",
	CAST(KA5_VG1_K059 as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K059]",
	CAST(KA5_VG1_K060 as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K060]",
	CAST(KA5_VG1_K061 as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K061]",
	CAST(KA5_VG1_K062 as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K062]",
	CAST(KA5_VG1_K063 as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K063]",
	CAST(KA5_VG1_K064 as decimal(15, 1)) as "Т28<br>°С [KA5_VG1_K064]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K037,
	KA5_VG1_K038,
	KA5_VG1_K039,
	KA5_VG1_K040,
	KA5_VG1_K041,
	KA5_VG1_K042,
	KA5_VG1_K043,
	KA5_VG1_K044,
	KA5_VG1_K045,
	KA5_VG1_K046,
	KA5_VG1_K047,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057,
	KA5_VG1_K058,
	KA5_VG1_K059,
	KA5_VG1_K060,
	KA5_VG1_K061,
	KA5_VG1_K062,
	KA5_VG1_K063,
	KA5_VG1_K064
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-5 VG1. Экран 2" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K037 as decimal(15, 1)) as "Т1<br>°С [KA5_VG1_K037]",
	CAST(KA5_VG1_K038 as decimal(15, 1)) as "Т2<br>°С [KA5_VG1_K038]",
	CAST(KA5_VG1_K039 as decimal(15, 1)) as "Т3<br>°С [KA5_VG1_K039]",
	CAST(KA5_VG1_K040 as decimal(15, 1)) as "Т4<br>°С [KA5_VG1_K040]",
	CAST(KA5_VG1_K041 as decimal(15, 1)) as "Т5<br>°С [KA5_VG1_K041]",
	CAST(KA5_VG1_K042 as decimal(15, 1)) as "Т6<br>°С [KA5_VG1_K042]",
	CAST(KA5_VG1_K043 as decimal(15, 1)) as "Т7<br>°С [KA5_VG1_K043]",
	CAST(KA5_VG1_K044 as decimal(15, 1)) as "Т8<br>°С [KA5_VG1_K044]",
	CAST(KA5_VG1_K045 as decimal(15, 1)) as "Т9<br>°С [KA5_VG1_K045]",
	CAST(KA5_VG1_K046 as decimal(15, 1)) as "Т10<br>°С [KA5_VG1_K046]",
	CAST(KA5_VG1_K047 as decimal(15, 1)) as "Т11<br>°С [KA5_VG1_K047]",
	CAST(KA5_VG1_K048 as decimal(15, 1)) as "Т12<br>°С [KA5_VG1_K048]",
	CAST(KA5_VG1_K049 as decimal(15, 1)) as "Т13<br>°С [KA5_VG1_K049]",
	CAST(KA5_VG1_K050 as decimal(15, 1)) as "Т14<br>°С [KA5_VG1_K050]",
	CAST(KA5_VG1_K051 as decimal(15, 1)) as "Т15<br>°С [KA5_VG1_K051]",
	CAST(KA5_VG1_K052 as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K052]",
	CAST(KA5_VG1_K053 as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K053]",
	CAST(KA5_VG1_K054 as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K054]",
	CAST(KA5_VG1_K055 as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K055]",
	CAST(KA5_VG1_K056 as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K056]",
	CAST(KA5_VG1_K057 as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K057]",
	CAST(KA5_VG1_K058 as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K058]",
	CAST(KA5_VG1_K059 as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K059]",
	CAST(KA5_VG1_K060 as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K060]",
	CAST(KA5_VG1_K061 as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K061]",
	CAST(KA5_VG1_K062 as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K062]",
	CAST(KA5_VG1_K063 as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K063]",
	CAST(KA5_VG1_K064 as decimal(15, 1)) as "Т28<br>°С [KA5_VG1_K064]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K037,
	KA5_VG1_K038,
	KA5_VG1_K039,
	KA5_VG1_K040,
	KA5_VG1_K041,
	KA5_VG1_K042,
	KA5_VG1_K043,
	KA5_VG1_K044,
	KA5_VG1_K045,
	KA5_VG1_K046,
	KA5_VG1_K047,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057,
	KA5_VG1_K058,
	KA5_VG1_K059,
	KA5_VG1_K060,
	KA5_VG1_K061,
	KA5_VG1_K062,
	KA5_VG1_K063,
	KA5_VG1_K064
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-5 VG1. Экран 2" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(KA5_VG1_K037) as decimal(15, 1)) as "Т1<br>°С [KA5_VG1_K037]",
	CAST(AVG(KA5_VG1_K038) as decimal(15, 1)) as "Т2<br>°С [KA5_VG1_K038]",
	CAST(AVG(KA5_VG1_K039) as decimal(15, 1)) as "Т3<br>°С [KA5_VG1_K039]",
	CAST(AVG(KA5_VG1_K040) as decimal(15, 1)) as "Т4<br>°С [KA5_VG1_K040]",
	CAST(AVG(KA5_VG1_K041) as decimal(15, 1)) as "Т5<br>°С [KA5_VG1_K041]",
	CAST(AVG(KA5_VG1_K042) as decimal(15, 1)) as "Т6<br>°С [KA5_VG1_K042]",
	CAST(AVG(KA5_VG1_K043) as decimal(15, 1)) as "Т7<br>°С [KA5_VG1_K043]",
	CAST(AVG(KA5_VG1_K044) as decimal(15, 1)) as "Т8<br>°С [KA5_VG1_K044]",
	CAST(AVG(KA5_VG1_K045) as decimal(15, 1)) as "Т9<br>°С [KA5_VG1_K045]",
	CAST(AVG(KA5_VG1_K046) as decimal(15, 1)) as "Т10<br>°С [KA5_VG1_K046]",
	CAST(AVG(KA5_VG1_K047) as decimal(15, 1)) as "Т11<br>°С [KA5_VG1_K047]",
	CAST(AVG(KA5_VG1_K048) as decimal(15, 1)) as "Т12<br>°С [KA5_VG1_K048]",
	CAST(AVG(KA5_VG1_K049) as decimal(15, 1)) as "Т13<br>°С [KA5_VG1_K049]",
	CAST(AVG(KA5_VG1_K050) as decimal(15, 1)) as "Т14<br>°С [KA5_VG1_K050]",
	CAST(AVG(KA5_VG1_K051) as decimal(15, 1)) as "Т15<br>°С [KA5_VG1_K051]",
	CAST(AVG(KA5_VG1_K052) as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K052]",
	CAST(AVG(KA5_VG1_K053) as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K053]",
	CAST(AVG(KA5_VG1_K054) as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K054]",
	CAST(AVG(KA5_VG1_K055) as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K055]",
	CAST(AVG(KA5_VG1_K056) as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K056]",
	CAST(AVG(KA5_VG1_K057) as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K057]",
	CAST(AVG(KA5_VG1_K058) as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K058]",
	CAST(AVG(KA5_VG1_K059) as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K059]",
	CAST(AVG(KA5_VG1_K060) as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K060]",
	CAST(AVG(KA5_VG1_K061) as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K061]",
	CAST(AVG(KA5_VG1_K062) as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K062]",
	CAST(AVG(KA5_VG1_K063) as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K063]",
	CAST(AVG(KA5_VG1_K064) as decimal(15, 1)) as "Т28<br>°С [KA5_VG1_K064]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
	KA5_VG1_K037,
	KA5_VG1_K038,
	KA5_VG1_K039,
	KA5_VG1_K040,
	KA5_VG1_K041,
	KA5_VG1_K042,
	KA5_VG1_K043,
	KA5_VG1_K044,
	KA5_VG1_K045,
	KA5_VG1_K046,
	KA5_VG1_K047,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057,
	KA5_VG1_K058,
	KA5_VG1_K059,
	KA5_VG1_K060,
	KA5_VG1_K061,
	KA5_VG1_K062,
	KA5_VG1_K063,
	KA5_VG1_K064
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
/*ReportName="Отчёт КА-5 VG1. Экран 2" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K037) as decimal(15, 1)) as "Т1<br>°С [KA5_VG1_K037]",
	CAST(AVG(KA5_VG1_K038) as decimal(15, 1)) as "Т2<br>°С [KA5_VG1_K038]",
	CAST(AVG(KA5_VG1_K039) as decimal(15, 1)) as "Т3<br>°С [KA5_VG1_K039]",
	CAST(AVG(KA5_VG1_K040) as decimal(15, 1)) as "Т4<br>°С [KA5_VG1_K040]",
	CAST(AVG(KA5_VG1_K041) as decimal(15, 1)) as "Т5<br>°С [KA5_VG1_K041]",
	CAST(AVG(KA5_VG1_K042) as decimal(15, 1)) as "Т6<br>°С [KA5_VG1_K042]",
	CAST(AVG(KA5_VG1_K043) as decimal(15, 1)) as "Т7<br>°С [KA5_VG1_K043]",
	CAST(AVG(KA5_VG1_K044) as decimal(15, 1)) as "Т8<br>°С [KA5_VG1_K044]",
	CAST(AVG(KA5_VG1_K045) as decimal(15, 1)) as "Т9<br>°С [KA5_VG1_K045]",
	CAST(AVG(KA5_VG1_K046) as decimal(15, 1)) as "Т10<br>°С [KA5_VG1_K046]",
	CAST(AVG(KA5_VG1_K047) as decimal(15, 1)) as "Т11<br>°С [KA5_VG1_K047]",
	CAST(AVG(KA5_VG1_K048) as decimal(15, 1)) as "Т12<br>°С [KA5_VG1_K048]",
	CAST(AVG(KA5_VG1_K049) as decimal(15, 1)) as "Т13<br>°С [KA5_VG1_K049]",
	CAST(AVG(KA5_VG1_K050) as decimal(15, 1)) as "Т14<br>°С [KA5_VG1_K050]",
	CAST(AVG(KA5_VG1_K051) as decimal(15, 1)) as "Т15<br>°С [KA5_VG1_K051]",
	CAST(AVG(KA5_VG1_K052) as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K052]",
	CAST(AVG(KA5_VG1_K053) as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K053]",
	CAST(AVG(KA5_VG1_K054) as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K054]",
	CAST(AVG(KA5_VG1_K055) as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K055]",
	CAST(AVG(KA5_VG1_K056) as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K056]",
	CAST(AVG(KA5_VG1_K057) as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K057]",
	CAST(AVG(KA5_VG1_K058) as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K058]",
	CAST(AVG(KA5_VG1_K059) as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K059]",
	CAST(AVG(KA5_VG1_K060) as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K060]",
	CAST(AVG(KA5_VG1_K061) as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K061]",
	CAST(AVG(KA5_VG1_K062) as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K062]",
	CAST(AVG(KA5_VG1_K063) as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K063]",
	CAST(AVG(KA5_VG1_K064) as decimal(15, 1)) as "Т28<br>°С [KA5_VG1_K064]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K037,
	KA5_VG1_K038,
	KA5_VG1_K039,
	KA5_VG1_K040,
	KA5_VG1_K041,
	KA5_VG1_K042,
	KA5_VG1_K043,
	KA5_VG1_K044,
	KA5_VG1_K045,
	KA5_VG1_K046,
	KA5_VG1_K047,
	KA5_VG1_K048,
	KA5_VG1_K049,
	KA5_VG1_K050,
	KA5_VG1_K051,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057,
	KA5_VG1_K058,
	KA5_VG1_K059,
	KA5_VG1_K060,
	KA5_VG1_K061,
	KA5_VG1_K062,
	KA5_VG1_K063,
	KA5_VG1_K064
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
