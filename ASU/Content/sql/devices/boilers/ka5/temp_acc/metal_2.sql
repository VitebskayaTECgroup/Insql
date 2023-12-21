{минутные срезы}
/*ReportName="Контроль металла II ступени пароперегревателя к/а БК5-160-100 ст.№5 минутные срезы"*/
/*Mode=минутные*/
/*UpQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K094 as decimal(15, 2)) as "Ширма №1<br>выход, °С [KA5_VG1_K094]",
	CAST(KA5_VG1_K098 as decimal(15, 2)) as "Ширма №2<br>выход, °С [KA5_VG1_K098]",
	CAST(KA5_VG1_K113 as decimal(15, 2)) as "Ширма №3<br>выход, °С [KA5_VG1_K113]",
	CAST(KA5_VG1_K114 as decimal(15, 2)) as "Ширма №4<br>выход, °С [KA5_VG1_K114]",
	CAST(KA5_VG1_K115 as decimal(15, 2)) as "Ширма №5<br>выход, °С [KA5_VG1_K115]",
	CAST(KA5_VG1_K116 as decimal(15, 2)) as "Ширма №6<br>выход, °С [KA5_VG1_K116]",
	null,
	CAST(KA5_VG1_K052 as decimal(15, 2)) as "Ширма №1<br>вход, °С [KA5_VG1_K052]",
	CAST(KA5_VG1_K053 as decimal(15, 2)) as "Ширма №2<br>вход, °С [KA5_VG1_K053]",
	CAST(KA5_VG1_K054 as decimal(15, 2)) as "Ширма №3<br>вход, °С [KA5_VG1_K054]",
	CAST(KA5_VG1_K055 as decimal(15, 2)) as "Ширма №4<br>вход, °С [KA5_VG1_K055]",
	CAST(KA5_VG1_K056 as decimal(15, 2)) as "Ширма №5<br>вход, °С [KA5_VG1_K056]",
	CAST(KA5_VG1_K057 as decimal(15, 2)) as "Ширма №6<br>вход, °С [KA5_VG1_K057]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K094,
	KA5_VG1_K098,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Контроль металла II ступени пароперегревателя к/а БК5-160-100 ст.№5 агрегированные за час"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*UpQuery="агрегированные за сутки"*/
/*DownQuery="минутные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K094) as decimal(15, 2)) as "Ширма №1<br>выход, °С [KA5_VG1_K094]",
	CAST(AVG(KA5_VG1_K098) as decimal(15, 2)) as "Ширма №2<br>выход, °С [KA5_VG1_K098]",
	CAST(AVG(KA5_VG1_K113) as decimal(15, 2)) as "Ширма №3<br>выход, °С [KA5_VG1_K113]",
	CAST(AVG(KA5_VG1_K114) as decimal(15, 2)) as "Ширма №4<br>выход, °С [KA5_VG1_K114]",
	CAST(AVG(KA5_VG1_K115) as decimal(15, 2)) as "Ширма №5<br>выход, °С [KA5_VG1_K115]",
	CAST(AVG(KA5_VG1_K116) as decimal(15, 2)) as "Ширма №6<br>выход, °С [KA5_VG1_K116]",
	null,
	CAST(AVG(KA5_VG1_K052) as decimal(15, 2)) as "Ширма №1<br>вход, °С [KA5_VG1_K052]",
	CAST(AVG(KA5_VG1_K053) as decimal(15, 2)) as "Ширма №2<br>вход, °С [KA5_VG1_K053]",
	CAST(AVG(KA5_VG1_K054) as decimal(15, 2)) as "Ширма №3<br>вход, °С [KA5_VG1_K054]",
	CAST(AVG(KA5_VG1_K055) as decimal(15, 2)) as "Ширма №4<br>вход, °С [KA5_VG1_K055]",
	CAST(AVG(KA5_VG1_K056) as decimal(15, 2)) as "Ширма №5<br>вход, °С [KA5_VG1_K056]",
	CAST(AVG(KA5_VG1_K057) as decimal(15, 2)) as "Ширма №6<br>вход, °С [KA5_VG1_K057]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K094,
	KA5_VG1_K098,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0)
ORDER BY
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0)


{агрегированные за сутки}
/*ReportName="Контроль металла II ступени пароперегревателя к/а БК5-160-100 ст.№5 агрегированные за сутки"*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=60000*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, DateDiff(day, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K094) as decimal(15, 2)) as "Ширма №1<br>выход<br>среднее, °С [KA5_VG1_K094]",
	CAST(AVG(KA5_VG1_K098) as decimal(15, 2)) as "Ширма №2<br>выход<br>среднее, °С [KA5_VG1_K098]",
	CAST(AVG(KA5_VG1_K113) as decimal(15, 2)) as "Ширма №3<br>выход<br>среднее, °С [KA5_VG1_K113]",
	CAST(AVG(KA5_VG1_K114) as decimal(15, 2)) as "Ширма №4<br>выход<br>среднее, °С [KA5_VG1_K114]",
	CAST(AVG(KA5_VG1_K115) as decimal(15, 2)) as "Ширма №5<br>выход<br>среднее, °С [KA5_VG1_K115]",
	CAST(AVG(KA5_VG1_K116) as decimal(15, 2)) as "Ширма №6<br>выход<br>среднее, °С [KA5_VG1_K116]",
	null,
	CAST(AVG(KA5_VG1_K052) as decimal(15, 2)) as "Ширма №1<br>вход<br>среднее, °С [KA5_VG1_K052]",
	CAST(AVG(KA5_VG1_K053) as decimal(15, 2)) as "Ширма №2<br>вход<br>среднее, °С [KA5_VG1_K053]",
	CAST(AVG(KA5_VG1_K054) as decimal(15, 2)) as "Ширма №3<br>вход<br>среднее, °С [KA5_VG1_K054]",
	CAST(AVG(KA5_VG1_K055) as decimal(15, 2)) as "Ширма №4<br>вход<br>среднее, °С [KA5_VG1_K055]",
	CAST(AVG(KA5_VG1_K056) as decimal(15, 2)) as "Ширма №5<br>вход<br>среднее, °С [KA5_VG1_K056]",
	CAST(AVG(KA5_VG1_K057) as decimal(15, 2)) as "Ширма №6<br>вход<br>среднее, °С [KA5_VG1_K057]",
	null,
	CAST(MAX(KA5_VG1_K094) as decimal(15, 2)) as "Ширма №1<br>выход<br>макс., °С [KA5_VG1_K094]",
	CAST(MAX(KA5_VG1_K098) as decimal(15, 2)) as "Ширма №2<br>выход<br>макс., °С [KA5_VG1_K098]",
	CAST(MAX(KA5_VG1_K113) as decimal(15, 2)) as "Ширма №3<br>выход<br>макс., °С [KA5_VG1_K113]",
	CAST(MAX(KA5_VG1_K114) as decimal(15, 2)) as "Ширма №4<br>выход<br>макс., °С [KA5_VG1_K114]",
	CAST(MAX(KA5_VG1_K115) as decimal(15, 2)) as "Ширма №5<br>выход<br>макс., °С [KA5_VG1_K115]",
	CAST(MAX(KA5_VG1_K116) as decimal(15, 2)) as "Ширма №6<br>выход<br>макс., °С [KA5_VG1_K116]",
	null,
	CAST(AVG(KA5_VG1_K052) as decimal(15, 2)) as "Ширма №1<br>вход<br>макс., °С [KA5_VG1_K052]",
	CAST(AVG(KA5_VG1_K053) as decimal(15, 2)) as "Ширма №2<br>вход<br>макс., °С [KA5_VG1_K053]",
	CAST(AVG(KA5_VG1_K054) as decimal(15, 2)) as "Ширма №3<br>вход<br>макс., °С [KA5_VG1_K054]",
	CAST(AVG(KA5_VG1_K055) as decimal(15, 2)) as "Ширма №4<br>вход<br>макс., °С [KA5_VG1_K055]",
	CAST(AVG(KA5_VG1_K056) as decimal(15, 2)) as "Ширма №5<br>вход<br>макс., °С [KA5_VG1_K056]",
	CAST(AVG(KA5_VG1_K057) as decimal(15, 2)) as "Ширма №6<br>вход<br>макс., °С [KA5_VG1_K057]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K094,
	KA5_VG1_K098,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116,
	KA5_VG1_K052,
	KA5_VG1_K053,
	KA5_VG1_K054,
	KA5_VG1_K055,
	KA5_VG1_K056,
	KA5_VG1_K057
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(day, DateDiff(day, 0, DateTime), 0)
ORDER BY
	DateAdd(day, DateDiff(day, 0, DateTime), 0)