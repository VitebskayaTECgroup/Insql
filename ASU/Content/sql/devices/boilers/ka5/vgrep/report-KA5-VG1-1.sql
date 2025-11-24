{срезы минутные}
/*ReportName="Отчёт КА-5 VG1. Экран 1" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K001 as decimal(15, 1)) as "К1<br>% [KA5_VG1_K001]",
	CAST(KA5_VG1_K002 as decimal(15, 1)) as "К2<br>% [KA5_VG1_K002]",
	CAST(KA5_VG1_K003 as decimal(15, 1)) as "К3<br>ppm [KA5_VG1_K003]",
	CAST(KA5_VG1_K004 as decimal(15, 1)) as "К4<br>ppm [KA5_VG1_K004]",
	CAST(KA5_VG1_K005 as decimal(15, 1)) as "К5 [KA5_VG1_K005]",
	CAST(KA5_VG1_K006 as decimal(15, 1)) as "К6 [KA5_VG1_K006]",
	CAST(KA5_VG1_K007 as decimal(15, 1)) as "К7 [KA5_VG1_K007]",
	CAST(KA5_VG1_K008 as decimal(15, 1)) as "К8 [KA5_VG1_K008]",
	CAST(KA5_VG1_K009 as decimal(15, 1)) as "К9 [KA5_VG1_K009]",
	CAST(KA5_VG1_K010 as decimal(15, 1)) as "К10 [KA5_VG1_K010]",
	CAST(KA5_VG1_K011 as decimal(15, 1)) as "К11 [KA5_VG1_K011]",
	CAST(KA5_VG1_K012 as decimal(15, 1)) as "К12 [KA5_VG1_K012]",
	CAST(KA5_VG1_K013 as decimal(15, 1)) as "К13 [KA5_VG1_K013]",
	CAST(KA5_VG1_K014 as decimal(15, 1)) as "К14 [KA5_VG1_K014]",
	CAST(KA5_VG1_K015 as decimal(15, 1)) as "К15 [KA5_VG1_K015]",
	CAST(KA5_VG1_K016 as decimal(15, 1)) as "К16 [KA5_VG1_K016]",
	CAST(KA5_VG1_K017 as decimal(15, 1)) as "К17 [KA5_VG1_K017]",
	CAST(KA5_VG1_K018 as decimal(15, 1)) as "К18 [KA5_VG1_K018]",
	CAST(KA5_VG1_K019 as decimal(15, 1)) as "К19 [KA5_VG1_K019]",
	CAST(KA5_VG1_K020 as decimal(15, 1)) as "К20 [KA5_VG1_K020]",
	CAST(KA5_VG1_K021 as decimal(15, 1)) as "К21 [KA5_VG1_K021]",
	CAST(KA5_VG1_K022 as decimal(15, 1)) as "К22 [KA5_VG1_K022]",
	CAST(KA5_VG1_K023 as decimal(15, 1)) as "К23 [KA5_VG1_K023]",
	CAST(KA5_VG1_K024 as decimal(15, 1)) as "К24 [KA5_VG1_K024]",
	null,
	CAST(KA5_VG1_K031 as decimal(15, 1)) as "К31 [KA5_VG1_K031]",
	CAST(KA5_VG1_K032 as decimal(15, 1)) as "К32 [KA5_VG1_K032]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K001,
	KA5_VG1_K002,
	KA5_VG1_K003,
	KA5_VG1_K004,
	KA5_VG1_K005,
	KA5_VG1_K006,
	KA5_VG1_K007,
	KA5_VG1_K008,
	KA5_VG1_K009,
	KA5_VG1_K010,
	KA5_VG1_K011,
	KA5_VG1_K012,
	KA5_VG1_K013,
	KA5_VG1_K014,
	KA5_VG1_K015,
	KA5_VG1_K016,
	KA5_VG1_K017,
	KA5_VG1_K018,
	KA5_VG1_K019,
	KA5_VG1_K020,
	KA5_VG1_K021,
	KA5_VG1_K022,
	KA5_VG1_K023,
	KA5_VG1_K024,
	KA5_VG1_K031,
	KA5_VG1_K032
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-5 VG1. Экран 1" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K001 as decimal(15, 1)) as "К1<br>% [KA5_VG1_K001]",
	CAST(KA5_VG1_K002 as decimal(15, 1)) as "К2<br>% [KA5_VG1_K002]",
	CAST(KA5_VG1_K003 as decimal(15, 1)) as "К3<br>ppm [KA5_VG1_K003]",
	CAST(KA5_VG1_K004 as decimal(15, 1)) as "К4<br>ppm [KA5_VG1_K004]",
	CAST(KA5_VG1_K005 as decimal(15, 1)) as "К5 [KA5_VG1_K005]",
	CAST(KA5_VG1_K006 as decimal(15, 1)) as "К6 [KA5_VG1_K006]",
	CAST(KA5_VG1_K007 as decimal(15, 1)) as "К7 [KA5_VG1_K007]",
	CAST(KA5_VG1_K008 as decimal(15, 1)) as "К8 [KA5_VG1_K008]",
	CAST(KA5_VG1_K009 as decimal(15, 1)) as "К9 [KA5_VG1_K009]",
	CAST(KA5_VG1_K010 as decimal(15, 1)) as "К10 [KA5_VG1_K010]",
	CAST(KA5_VG1_K011 as decimal(15, 1)) as "К11 [KA5_VG1_K011]",
	CAST(KA5_VG1_K012 as decimal(15, 1)) as "К12 [KA5_VG1_K012]",
	CAST(KA5_VG1_K013 as decimal(15, 1)) as "К13 [KA5_VG1_K013]",
	CAST(KA5_VG1_K014 as decimal(15, 1)) as "К14 [KA5_VG1_K014]",
	CAST(KA5_VG1_K015 as decimal(15, 1)) as "К15 [KA5_VG1_K015]",
	CAST(KA5_VG1_K016 as decimal(15, 1)) as "К16 [KA5_VG1_K016]",
	CAST(KA5_VG1_K017 as decimal(15, 1)) as "К17 [KA5_VG1_K017]",
	CAST(KA5_VG1_K018 as decimal(15, 1)) as "К18 [KA5_VG1_K018]",
	CAST(KA5_VG1_K019 as decimal(15, 1)) as "К19 [KA5_VG1_K019]",
	CAST(KA5_VG1_K020 as decimal(15, 1)) as "К20 [KA5_VG1_K020]",
	CAST(KA5_VG1_K021 as decimal(15, 1)) as "К21 [KA5_VG1_K021]",
	CAST(KA5_VG1_K022 as decimal(15, 1)) as "К22 [KA5_VG1_K022]",
	CAST(KA5_VG1_K023 as decimal(15, 1)) as "К23 [KA5_VG1_K023]",
	CAST(KA5_VG1_K024 as decimal(15, 1)) as "К24 [KA5_VG1_K024]",
	null,
	CAST(KA5_VG1_K031 as decimal(15, 1)) as "К31 [KA5_VG1_K031]",
	CAST(KA5_VG1_K032 as decimal(15, 1)) as "К32 [KA5_VG1_K032]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K001,
	KA5_VG1_K002,
	KA5_VG1_K003,
	KA5_VG1_K004,
	KA5_VG1_K005,
	KA5_VG1_K006,
	KA5_VG1_K007,
	KA5_VG1_K008,
	KA5_VG1_K009,
	KA5_VG1_K010,
	KA5_VG1_K011,
	KA5_VG1_K012,
	KA5_VG1_K013,
	KA5_VG1_K014,
	KA5_VG1_K015,
	KA5_VG1_K016,
	KA5_VG1_K017,
	KA5_VG1_K018,
	KA5_VG1_K019,
	KA5_VG1_K020,
	KA5_VG1_K021,
	KA5_VG1_K022,
	KA5_VG1_K023,
	KA5_VG1_K024,
	KA5_VG1_K031,
	KA5_VG1_K032
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-5 VG1. Экран 1" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные Кочасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K001 as decimal(15, 1)) as "К1<br>% [KA5_VG1_K001]",
	CAST(KA5_VG1_K002 as decimal(15, 1)) as "К2<br>% [KA5_VG1_K002]",
	CAST(KA5_VG1_K003 as decimal(15, 1)) as "К3<br>ppm [KA5_VG1_K003]",
	CAST(KA5_VG1_K004 as decimal(15, 1)) as "К4<br>ppm [KA5_VG1_K004]",
	CAST(KA5_VG1_K005 as decimal(15, 1)) as "К5 [KA5_VG1_K005]",
	CAST(KA5_VG1_K006 as decimal(15, 1)) as "К6 [KA5_VG1_K006]",
	CAST(KA5_VG1_K007 as decimal(15, 1)) as "К7 [KA5_VG1_K007]",
	CAST(KA5_VG1_K008 as decimal(15, 1)) as "К8 [KA5_VG1_K008]",
	CAST(KA5_VG1_K009 as decimal(15, 1)) as "К9 [KA5_VG1_K009]",
	CAST(KA5_VG1_K010 as decimal(15, 1)) as "К10 [KA5_VG1_K010]",
	CAST(KA5_VG1_K011 as decimal(15, 1)) as "К11 [KA5_VG1_K011]",
	CAST(KA5_VG1_K012 as decimal(15, 1)) as "К12 [KA5_VG1_K012]",
	CAST(KA5_VG1_K013 as decimal(15, 1)) as "К13 [KA5_VG1_K013]",
	CAST(KA5_VG1_K014 as decimal(15, 1)) as "К14 [KA5_VG1_K014]",
	CAST(KA5_VG1_K015 as decimal(15, 1)) as "К15 [KA5_VG1_K015]",
	CAST(KA5_VG1_K016 as decimal(15, 1)) as "К16 [KA5_VG1_K016]",
	CAST(KA5_VG1_K017 as decimal(15, 1)) as "К17 [KA5_VG1_K017]",
	CAST(KA5_VG1_K018 as decimal(15, 1)) as "К18 [KA5_VG1_K018]",
	CAST(KA5_VG1_K019 as decimal(15, 1)) as "К19 [KA5_VG1_K019]",
	CAST(KA5_VG1_K020 as decimal(15, 1)) as "К20 [KA5_VG1_K020]",
	CAST(KA5_VG1_K021 as decimal(15, 1)) as "К21 [KA5_VG1_K021]",
	CAST(KA5_VG1_K022 as decimal(15, 1)) as "К22 [KA5_VG1_K022]",
	CAST(KA5_VG1_K023 as decimal(15, 1)) as "К23 [KA5_VG1_K023]",
	CAST(KA5_VG1_K024 as decimal(15, 1)) as "К24 [KA5_VG1_K024]",
	null,
	CAST(KA5_VG1_K031 as decimal(15, 1)) as "К31 [KA5_VG1_K031]",
	CAST(KA5_VG1_K032 as decimal(15, 1)) as "К32 [KA5_VG1_K032]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K001,
	KA5_VG1_K002,
	KA5_VG1_K003,
	KA5_VG1_K004,
	KA5_VG1_K005,
	KA5_VG1_K006,
	KA5_VG1_K007,
	KA5_VG1_K008,
	KA5_VG1_K009,
	KA5_VG1_K010,
	KA5_VG1_K011,
	KA5_VG1_K012,
	KA5_VG1_K013,
	KA5_VG1_K014,
	KA5_VG1_K015,
	KA5_VG1_K016,
	KA5_VG1_K017,
	KA5_VG1_K018,
	KA5_VG1_K019,
	KA5_VG1_K020,
	KA5_VG1_K021,
	KA5_VG1_K022,
	KA5_VG1_K023,
	KA5_VG1_K024,
	KA5_VG1_K031,
	KA5_VG1_K032
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-5 VG1. Экран 1" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(KA5_VG1_K001) as decimal(15, 1)) as "К1<br>% [KA5_VG1_K001]",
	CAST(AVG(KA5_VG1_K002) as decimal(15, 1)) as "К2<br>% [KA5_VG1_K002]",
	CAST(AVG(KA5_VG1_K003) as decimal(15, 1)) as "К3<br>ppm [KA5_VG1_K003]",
	CAST(AVG(KA5_VG1_K004) as decimal(15, 1)) as "К4<br>ppm [KA5_VG1_K004]",
	CAST(AVG(KA5_VG1_K005) as decimal(15, 1)) as "К5 [KA5_VG1_K005]",
	CAST(AVG(KA5_VG1_K006) as decimal(15, 1)) as "К6 [KA5_VG1_K006]",
	CAST(AVG(KA5_VG1_K007) as decimal(15, 1)) as "К7 [KA5_VG1_K007]",
	CAST(AVG(KA5_VG1_K008) as decimal(15, 1)) as "К8 [KA5_VG1_K008]",
	CAST(AVG(KA5_VG1_K009) as decimal(15, 1)) as "К9 [KA5_VG1_K009]",
	CAST(AVG(KA5_VG1_K010) as decimal(15, 1)) as "К10 [KA5_VG1_K010]",
	CAST(AVG(KA5_VG1_K011) as decimal(15, 1)) as "К11 [KA5_VG1_K011]",
	CAST(AVG(KA5_VG1_K012) as decimal(15, 1)) as "К12 [KA5_VG1_K012]",
	CAST(AVG(KA5_VG1_K013) as decimal(15, 1)) as "К13 [KA5_VG1_K013]",
	CAST(AVG(KA5_VG1_K014) as decimal(15, 1)) as "К14 [KA5_VG1_K014]",
	CAST(AVG(KA5_VG1_K015) as decimal(15, 1)) as "К15 [KA5_VG1_K015]",
	CAST(AVG(KA5_VG1_K016) as decimal(15, 1)) as "К16 [KA5_VG1_K016]",
	CAST(AVG(KA5_VG1_K017) as decimal(15, 1)) as "К17 [KA5_VG1_K017]",
	CAST(AVG(KA5_VG1_K018) as decimal(15, 1)) as "К18 [KA5_VG1_K018]",
	CAST(AVG(KA5_VG1_K019) as decimal(15, 1)) as "К19 [KA5_VG1_K019]",
	CAST(AVG(KA5_VG1_K020) as decimal(15, 1)) as "К20 [KA5_VG1_K020]",
	CAST(AVG(KA5_VG1_K021) as decimal(15, 1)) as "К21 [KA5_VG1_K021]",
	CAST(AVG(KA5_VG1_K022) as decimal(15, 1)) as "К22 [KA5_VG1_K022]",
	CAST(AVG(KA5_VG1_K023) as decimal(15, 1)) as "К23 [KA5_VG1_K023]",
	CAST(AVG(KA5_VG1_K024) as decimal(15, 1)) as "К24 [KA5_VG1_K024]",
	null,
	CAST(AVG(KA5_VG1_K031) as decimal(15, 1)) as "К31 [KA5_VG1_K031]",
	CAST(AVG(KA5_VG1_K032) as decimal(15, 1)) as "К32 [KA5_VG1_K032]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
	KA5_VG1_K001,
	KA5_VG1_K002,
	KA5_VG1_K003,
	KA5_VG1_K004,
	KA5_VG1_K005,
	KA5_VG1_K006,
	KA5_VG1_K007,
	KA5_VG1_K008,
	KA5_VG1_K009,
	KA5_VG1_K010,
	KA5_VG1_K011,
	KA5_VG1_K012,
	KA5_VG1_K013,
	KA5_VG1_K014,
	KA5_VG1_K015,
	KA5_VG1_K016,
	KA5_VG1_K017,
	KA5_VG1_K018,
	KA5_VG1_K019,
	KA5_VG1_K020,
	KA5_VG1_K021,
	KA5_VG1_K022,
	KA5_VG1_K023,
	KA5_VG1_K024,
	KA5_VG1_K031,
	KA5_VG1_K032
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
/*ReportName="Отчёт КА-5 VG1. Экран 1" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K001) as decimal(15, 1)) as "К1<br>% [KA5_VG1_K001]",
	CAST(AVG(KA5_VG1_K002) as decimal(15, 1)) as "К2<br>% [KA5_VG1_K002]",
	CAST(AVG(KA5_VG1_K003) as decimal(15, 1)) as "К3<br>ppm [KA5_VG1_K003]",
	CAST(AVG(KA5_VG1_K004) as decimal(15, 1)) as "К4<br>ppm [KA5_VG1_K004]",
	CAST(AVG(KA5_VG1_K005) as decimal(15, 1)) as "К5 [KA5_VG1_K005]",
	CAST(AVG(KA5_VG1_K006) as decimal(15, 1)) as "К6 [KA5_VG1_K006]",
	CAST(AVG(KA5_VG1_K007) as decimal(15, 1)) as "К7 [KA5_VG1_K007]",
	CAST(AVG(KA5_VG1_K008) as decimal(15, 1)) as "К8 [KA5_VG1_K008]",
	CAST(AVG(KA5_VG1_K009) as decimal(15, 1)) as "К9 [KA5_VG1_K009]",
	CAST(AVG(KA5_VG1_K010) as decimal(15, 1)) as "К10 [KA5_VG1_K010]",
	CAST(AVG(KA5_VG1_K011) as decimal(15, 1)) as "К11 [KA5_VG1_K011]",
	CAST(AVG(KA5_VG1_K012) as decimal(15, 1)) as "К12 [KA5_VG1_K012]",
	CAST(AVG(KA5_VG1_K013) as decimal(15, 1)) as "К13 [KA5_VG1_K013]",
	CAST(AVG(KA5_VG1_K014) as decimal(15, 1)) as "К14 [KA5_VG1_K014]",
	CAST(AVG(KA5_VG1_K015) as decimal(15, 1)) as "К15 [KA5_VG1_K015]",
	CAST(AVG(KA5_VG1_K016) as decimal(15, 1)) as "К16 [KA5_VG1_K016]",
	CAST(AVG(KA5_VG1_K017) as decimal(15, 1)) as "К17 [KA5_VG1_K017]",
	CAST(AVG(KA5_VG1_K018) as decimal(15, 1)) as "К18 [KA5_VG1_K018]",
	CAST(AVG(KA5_VG1_K019) as decimal(15, 1)) as "К19 [KA5_VG1_K019]",
	CAST(AVG(KA5_VG1_K020) as decimal(15, 1)) as "К20 [KA5_VG1_K020]",
	CAST(AVG(KA5_VG1_K021) as decimal(15, 1)) as "К21 [KA5_VG1_K021]",
	CAST(AVG(KA5_VG1_K022) as decimal(15, 1)) as "К22 [KA5_VG1_K022]",
	CAST(AVG(KA5_VG1_K023) as decimal(15, 1)) as "К23 [KA5_VG1_K023]",
	CAST(AVG(KA5_VG1_K024) as decimal(15, 1)) as "К24 [KA5_VG1_K024]",
	null,
	CAST(AVG(KA5_VG1_K031) as decimal(15, 1)) as "К31 [KA5_VG1_K031]",
	CAST(AVG(KA5_VG1_K032) as decimal(15, 1)) as "К32 [KA5_VG1_K032]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K001,
	KA5_VG1_K002,
	KA5_VG1_K003,
	KA5_VG1_K004,
	KA5_VG1_K005,
	KA5_VG1_K006,
	KA5_VG1_K007,
	KA5_VG1_K008,
	KA5_VG1_K009,
	KA5_VG1_K010,
	KA5_VG1_K011,
	KA5_VG1_K012,
	KA5_VG1_K013,
	KA5_VG1_K014,
	KA5_VG1_K015,
	KA5_VG1_K016,
	KA5_VG1_K017,
	KA5_VG1_K018,
	KA5_VG1_K019,
	KA5_VG1_K020,
	KA5_VG1_K021,
	KA5_VG1_K022,
	KA5_VG1_K023,
	KA5_VG1_K024,
	KA5_VG1_K031,
	KA5_VG1_K032
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
