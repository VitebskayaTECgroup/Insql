{минутные срезы}
/*ReportName=Параметр состояния СПТ*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	null,
	/* CAST(SUBSTRING(U05_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ЗАПАД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(U06_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ДОК][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null, 
	CAST(SUBSTRING(U07_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ВЗРД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,*/
	CAST(SUBSTRING(U01_SY00A600, 1, 1) as decimal(1)) as "1-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 2, 1) as decimal(1)) as "2-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 3, 1) as decimal(1)) as "3-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 4, 1) as decimal(1)) as "4-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 5, 1) as decimal(1)) as "5-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 6, 1) as decimal(1)) as "1-12 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 7, 1) as decimal(1)) as "2-12 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 8, 1) as decimal(1)) as "с-11 [Hint:ПАР КИМ][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,/*
	CAST(SUBSTRING(U02_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ПАР ДОК][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,*/
	CAST(SUBSTRING(U03_SY00A600, 1, 1) as decimal(1)) as "1-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 2, 1) as decimal(1)) as "2-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 3, 1) as decimal(1)) as "3-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 4, 1) as decimal(1)) as "4-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 5, 1) as decimal(1)) as "5-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 6, 1) as decimal(1)) as "1-22 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 7, 1) as decimal(1)) as "2-22 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 8, 1) as decimal(1)) as "с-21 [Hint:ПАР ВЗРД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H01_SY00A600, 1, 1) as decimal(1)) as "1-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 2, 1) as decimal(1)) as "2-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 3, 1) as decimal(1)) as "3-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 4, 1) as decimal(1)) as "4-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 5, 1) as decimal(1)) as "5-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 6, 1) as decimal(1)) as "1-32 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 7, 1) as decimal(1)) as "2-32 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 8, 1) as decimal(1)) as "с-31 [Hint:ХВО1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H02_SY00A600, 1, 1) as decimal(1)) as "1-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 2, 1) as decimal(1)) as "2-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 3, 1) as decimal(1)) as "3-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 4, 1) as decimal(1)) as "4-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 5, 1) as decimal(1)) as "5-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 6, 1) as decimal(1)) as "1-42 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 7, 1) as decimal(1)) as "2-42 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 8, 1) as decimal(1)) as "с-41 [Hint:ХВО2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H03_SY00A600, 1, 1) as decimal(1)) as "1-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 2, 1) as decimal(1)) as "2-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 3, 1) as decimal(1)) as "3-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 4, 1) as decimal(1)) as "4-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 5, 1) as decimal(1)) as "5-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 6, 1) as decimal(1)) as "1-52 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 7, 1) as decimal(1)) as "2-52 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 8, 1) as decimal(1)) as "с-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(V01_SY00A600, 1, 1) as decimal(1)) as "1-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 2, 1) as decimal(1)) as "2-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 3, 1) as decimal(1)) as "3-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 4, 1) as decimal(1)) as "4-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 5, 1) as decimal(1)) as "5-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 6, 1) as decimal(1)) as "1-62 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 7, 1) as decimal(1)) as "2-62 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 8, 1) as decimal(1)) as "с-61 [Hint:КО1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(V02_SY00A600, 1, 1) as decimal(1)) as "1-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 2, 1) as decimal(1)) as "2-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 3, 1) as decimal(1)) as "3-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 4, 1) as decimal(1)) as "4-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 5, 1) as decimal(1)) as "5-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 6, 1) as decimal(1)) as "1-72 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 7, 1) as decimal(1)) as "2-72 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 8, 1) as decimal(1)) as "с-71 [Hint:КО2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime,  H01_SY00A600, H02_SY00A600, H03_SY00A600, U01_SY00A600, U03_SY00A600, 
	V01_SY00A600, V02_SY00A600
	FROM Runtime.dbo.StringWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СЧЕТЧИКОВ (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	/* CAST(SUBSTRING(U05_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ЗАПАД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(U06_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ДОК][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null, 
	CAST(SUBSTRING(U07_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ВЗРД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,*/
	CAST(SUBSTRING(U01_SY00A600, 1, 1) as decimal(1)) as "1-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 2, 1) as decimal(1)) as "2-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 3, 1) as decimal(1)) as "3-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 4, 1) as decimal(1)) as "4-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 5, 1) as decimal(1)) as "5-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 6, 1) as decimal(1)) as "1-12 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 7, 1) as decimal(1)) as "2-12 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 8, 1) as decimal(1)) as "с-11 [Hint:ПАР КИМ][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,/*
	CAST(SUBSTRING(U02_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ПАР ДОК][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,*/
	CAST(SUBSTRING(U03_SY00A600, 1, 1) as decimal(1)) as "1-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 2, 1) as decimal(1)) as "2-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 3, 1) as decimal(1)) as "3-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 4, 1) as decimal(1)) as "4-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 5, 1) as decimal(1)) as "5-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 6, 1) as decimal(1)) as "1-22 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 7, 1) as decimal(1)) as "2-22 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 8, 1) as decimal(1)) as "с-21 [Hint:ПАР ВЗРД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H01_SY00A600, 1, 1) as decimal(1)) as "1-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 2, 1) as decimal(1)) as "2-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 3, 1) as decimal(1)) as "3-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 4, 1) as decimal(1)) as "4-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 5, 1) as decimal(1)) as "5-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 6, 1) as decimal(1)) as "1-32 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 7, 1) as decimal(1)) as "2-32 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 8, 1) as decimal(1)) as "с-31 [Hint:ХВО1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H02_SY00A600, 1, 1) as decimal(1)) as "1-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 2, 1) as decimal(1)) as "2-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 3, 1) as decimal(1)) as "3-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 4, 1) as decimal(1)) as "4-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 5, 1) as decimal(1)) as "5-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 6, 1) as decimal(1)) as "1-42 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 7, 1) as decimal(1)) as "2-42 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 8, 1) as decimal(1)) as "с-41 [Hint:ХВО2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H03_SY00A600, 1, 1) as decimal(1)) as "1-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 2, 1) as decimal(1)) as "2-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 3, 1) as decimal(1)) as "3-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 4, 1) as decimal(1)) as "4-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 5, 1) as decimal(1)) as "5-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 6, 1) as decimal(1)) as "1-52 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 7, 1) as decimal(1)) as "2-52 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 8, 1) as decimal(1)) as "с-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(V01_SY00A600, 1, 1) as decimal(1)) as "1-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 2, 1) as decimal(1)) as "2-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 3, 1) as decimal(1)) as "3-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 4, 1) as decimal(1)) as "4-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 5, 1) as decimal(1)) as "5-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 6, 1) as decimal(1)) as "1-62 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 7, 1) as decimal(1)) as "2-62 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 8, 1) as decimal(1)) as "с-61 [Hint:КО1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(V02_SY00A600, 1, 1) as decimal(1)) as "1-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 2, 1) as decimal(1)) as "2-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 3, 1) as decimal(1)) as "3-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 4, 1) as decimal(1)) as "4-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 5, 1) as decimal(1)) as "5-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 6, 1) as decimal(1)) as "1-72 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 7, 1) as decimal(1)) as "2-72 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 8, 1) as decimal(1)) as "с-71 [Hint:КО2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_SY00A600, H02_SY00A600, H03_SY00A600, U01_SY00A600, U03_SY00A600, 
	V01_SY00A600, V02_SY00A600
	FROM Runtime.dbo.StringWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Расхожение по времени (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	/* CAST(SUBSTRING(U05_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ЗАПАД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U05_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ЗАПАД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(U06_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U06_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ДОК][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null, 
	CAST(SUBSTRING(U07_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ВОДА ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U07_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ВОДА ВЗРД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,*/
	CAST(SUBSTRING(U01_SY00A600, 1, 1) as decimal(1)) as "1-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 2, 1) as decimal(1)) as "2-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 3, 1) as decimal(1)) as "3-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 4, 1) as decimal(1)) as "4-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 5, 1) as decimal(1)) as "5-11 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 6, 1) as decimal(1)) as "1-12 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 7, 1) as decimal(1)) as "2-12 [Hint:ПАР КИМ][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U01_SY00A600, 8, 1) as decimal(1)) as "с-11 [Hint:ПАР КИМ][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,/*
	CAST(SUBSTRING(U02_SY00A600, 1, 1) as decimal(1)) as "1 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 2, 1) as decimal(1)) as "2 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 3, 1) as decimal(1)) as "3 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 4, 1) as decimal(1)) as "4 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 5, 1) as decimal(1)) as "5 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 6, 1) as decimal(1)) as "1 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 7, 1) as decimal(1)) as "2 [Hint:ПАР ДОК][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U02_SY00A600, 8, 1) as decimal(1)) as "с [Hint:ПАР ДОК][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,*/
	CAST(SUBSTRING(U03_SY00A600, 1, 1) as decimal(1)) as "1-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 2, 1) as decimal(1)) as "2-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 3, 1) as decimal(1)) as "3-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 4, 1) as decimal(1)) as "4-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 5, 1) as decimal(1)) as "5-21 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 6, 1) as decimal(1)) as "1-22 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 7, 1) as decimal(1)) as "2-22 [Hint:ПАР ВЗРД][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(U03_SY00A600, 8, 1) as decimal(1)) as "с-21 [Hint:ПАР ВЗРД][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H01_SY00A600, 1, 1) as decimal(1)) as "1-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 2, 1) as decimal(1)) as "2-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 3, 1) as decimal(1)) as "3-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 4, 1) as decimal(1)) as "4-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 5, 1) as decimal(1)) as "5-31 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 6, 1) as decimal(1)) as "1-32 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 7, 1) as decimal(1)) as "2-32 [Hint:ХВО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H01_SY00A600, 8, 1) as decimal(1)) as "с-31 [Hint:ХВО1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H02_SY00A600, 1, 1) as decimal(1)) as "1-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 2, 1) as decimal(1)) as "2-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 3, 1) as decimal(1)) as "3-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 4, 1) as decimal(1)) as "4-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 5, 1) as decimal(1)) as "5-41 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 6, 1) as decimal(1)) as "1-42 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 7, 1) as decimal(1)) as "2-42 [Hint:ХВО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H02_SY00A600, 8, 1) as decimal(1)) as "с-41 [Hint:ХВО2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(H03_SY00A600, 1, 1) as decimal(1)) as "1-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 2, 1) as decimal(1)) as "2-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 3, 1) as decimal(1)) as "3-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 4, 1) as decimal(1)) as "4-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 5, 1) as decimal(1)) as "5-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 6, 1) as decimal(1)) as "1-52 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 7, 1) as decimal(1)) as "2-52 [Hint:РЕЧ.ГОР.ВОДА][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(H03_SY00A600, 8, 1) as decimal(1)) as "с-51 [Hint:РЕЧ.ГОР.ВОДА][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(V01_SY00A600, 1, 1) as decimal(1)) as "1-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 2, 1) as decimal(1)) as "2-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 3, 1) as decimal(1)) as "3-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 4, 1) as decimal(1)) as "4-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 5, 1) as decimal(1)) as "5-61 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 6, 1) as decimal(1)) as "1-62 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 7, 1) as decimal(1)) as "2-62 [Hint:КО1][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V01_SY00A600, 8, 1) as decimal(1)) as "с-61 [Hint:КО1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]",
	null,
	CAST(SUBSTRING(V02_SY00A600, 1, 1) as decimal(1)) as "1-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 2, 1) as decimal(1)) as "2-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 3, 1) as decimal(1)) as "3-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 4, 1) as decimal(1)) as "4-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 5, 1) as decimal(1)) as "5-71 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 6, 1) as decimal(1)) as "1-72 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 7, 1) as decimal(1)) as "2-72 [Hint:КО2][CHECK:4,4,2,-1][CLASS:,,ALARM_TD_N_CC1,,]",
	CAST(SUBSTRING(V02_SY00A600, 8, 1) as decimal(1)) as "с-71 [Hint:КО2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC1,,]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, H01_SY00A600, H02_SY00A600, H03_SY00A600, U01_SY00A600, U03_SY00A600, 
	V01_SY00A600, V02_SY00A600
	FROM Runtime.dbo.StringWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")