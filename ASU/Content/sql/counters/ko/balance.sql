{минутные срезы}
/*ReportName="БАЛАНС - Контура отопления" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST((V01_VK11F001+V02_VK11F001+V03_VK11F001)*V01_SY00A700*V02_SY00A700*V02_SY00A700 as decimal(15,2))
		as "G  сум ПСВ КО, т/ч [hint:  Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST((V01_VK21F001+V02_VK21F001+V03_VK21F001)*V01_SY00A700*V02_SY00A700*V02_SY00A700 as decimal(15,2))
		as "G сум ОСВ КО, т/ч [hint: Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001*V01_VK12T001+V02_VK11F001*V02_VK11T001+V03_VK11F001*V03_VK11T001),(V01_VK11F001+V02_VK11F001+V03_VK11F001)) as decimal(15,2))
		as "T ср/взв ПСВ, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001*V01_VK22T001+V02_VK11F001*V02_VK21T001+V03_VK11F001*V03_VK21T001),(V01_VK11F001+V02_VK11F001+V03_VK11F001)) as decimal(15,2))
		as "T ср/взв ОСВ, °С  [hint: Температура средневзвешенная ОСВ КО1+КО2+КО пвк (по расходам ПСВ)]",
	CAST((V01_VK11F001+V02_VK11F001+V03_VK11F001-(V01_VK21F001+V02_VK21F001+V03_VK21F001))*V01_SY00A700*V02_SY00A700*V02_SY00A700 as decimal(15,2))
		as "Баланс по КО, т/ч [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]",
	CAST((dbo.vst_SafeDIV((V01_VK11F001+V02_VK11F001+V03_VK11F001-(V01_VK21F001+V02_VK21F001+V03_VK21F001)),(V01_VK11F001+V02_VK11F001+V03_VK11F001))*100)*V01_SY00A700*V02_SY00A700*V02_SY00A700 as decimal(15,2))
		as "Баланс по КО, % [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11F001, V01_VK21F001, V02_VK11F001, V02_VK21F001, V03_VK11F001, V03_VK21F001, V01_SY00A700, V01_VK12T001, V01_VK22T001, V02_VK11T001, V02_VK21T001, V03_VK11T001, V03_VK21T001, V02_SY00A700 ,V02_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="БАЛАНС - Контура отопления" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1 as decimal(15,2))
		as "G  сум ПСВ КО за п/ч, т/ч [hint: Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1 as decimal(15,2))
		as "G сум ОСВ КО за п/ч, т/ч [hint:  Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK12T001_H1+V02_VK11F001_H1*V02_VK11T001_H1+V03_VK11F001_H1*V03_VK11T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1)) as decimal(15,2))
		as "T ср/взв ПСВ за п/ч, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK22T001_H1+V02_VK11F001_H1*V02_VK21T001_h1+V03_VK11F001_H1*V03_VK21T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))  as decimal(15,2))
		as "T ср/взв ОСВ за п/ч, °С  [hint: Температура средневзвешенная ОСВ КО1+КО2+КО пвк (по расходам ПСВ)]",
	CAST(V01_VK11W001_H1+V02_VK11W001_H1+V03_VK11W001_H1 as decimal(15,2))
		as "W сум ПСВ КО за п/ч, ГДж [hint: Суммарная энергия ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21W001_H1+V02_VK21W001_H1+V03_VK21W001_H1 as decimal(15,2))
		as "W сум ОСВ КО за п/ч, ГДж [hint: Суммарная энергия ОСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK31W001_H1+V02_VK31W001_H1+V03_VK31W001_H1 as decimal(15,2))
		as "W сум по МАГ.КО за п/ч, ГДж [hint: Суммарная энергия по магистралям КО1+КО2+КО пвк]" ,
	CAST((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1)-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1) as decimal(15,2))
		as "Баланс по КО за п/ч, т/ч [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1)),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))*100 as decimal(15,2))
		as "Баланс по КО за п/ч, % [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1, V02_VK11F001_H1, V02_VK21F001_H1, 
	V01_VK12T001_H1, V01_VK22T001_H1, V02_VK11T001_H1, V02_VK21T001_h1, V03_VK11T001_H1, V03_VK21T001_H1, 
	V02_VK11W001_H1, V02_VK21W001_H1, V02_VK31W001_H1, V03_VK11F001_H1, V03_VK21F001_H1, V03_VK11W001_H1, V03_VK21W001_H1, V03_VK31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="БАЛАНС - Контура отопления" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1 as decimal(15,2))
		as "G  сум ПСВ КО за п/с, т/сут [hint: Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21F001_S1+V02_VK21F001_S1+V03_VK21F001_S1 as decimal(15,2))
		as "G сум ОСВ КО за п/с, т/сут [hint: Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_S1*V01_VK12T001_S1+V02_VK11F001_S1*V02_VK11T001_S1+V03_VK11F001_S1*V03_VK11T001_S1),(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1)) as decimal(15,2))
		as "T ср/взв ПСВ за п/сут, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_S1*V01_VK22T001_S1+V02_VK11F001_S1*V02_VK21T001_S1+V03_VK11F001_S1*V03_VK21T001_S1),(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1))  as decimal(15,2))
		as "T ср/взв ОСВ за п/сут, °С  [hint: Температура средневзвешенная ОСВ КО1+КО2+КО пвк (по расходам ПСВ)]",
	CAST(V01_VK11W001_S1+V02_VK11W001_S1+V03_VK11W001_S1 as decimal(15,2))
		as "W сум ПСВ КО за п/с, ГДж [hint: Суммарная энергия ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21W001_S1+V02_VK21W001_S1+V03_VK21W001_S1 as decimal(15,2))
		as "W сум ОСВ КО за п/с, ГДж [hint: Суммарная энергия ОСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK31W001_S1+V02_VK31W001_S1+V03_VK31W001_S1 as decimal(15,2))
		as "W сум по МАГ.КО за п/с, ГДж [hint: Суммарная энергия по магистралям КО1+КО2+КО пвк]",
	CAST(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1-(V01_VK21F001_S1+V02_VK21F001_S1+V03_VK21F001_S1) as decimal(15,2))
		as "Баланс по КО за п/с, т/сут [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1-(V01_VK21F001_S1+V02_VK21F001_S1+V03_VK21F001_S1)),(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1))*100 as decimal(15,2))
		as "Баланс по КО за п/с, % [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11F001_S1, V01_VK21F001_S1, V01_VK11W001_S1, V01_VK21W001_S1, V01_VK31W001_S1, V02_VK11F001_S1, V02_VK21F001_S1, 
	V01_VK12T001_S1, V01_VK22T001_S1, V02_VK11T001_S1, V02_VK21T001_S1, V03_VK11T001_S1, V03_VK21T001_S1, 
	V02_VK11W001_S1, V02_VK21W001_S1, V02_VK31W001_S1, V03_VK11F001_S1, V03_VK21F001_S1, V03_VK11W001_S1, V03_VK21W001_S1, V03_VK31W001_S1 FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="БАЛАНС - Контура отопления " (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty) as "Cме- на [hint: CLC_ShiftDuty]",
	CAST(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1 as decimal(15,2))
		as "G  сум ПСВ КО за п/ч, т/ч [hint: Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1 as decimal(15,2))
		as "G сум ОСВ КО за п/ч, т/ч [hint: Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK12T001_H1+V02_VK11F001_H1*V02_VK11T001_H1+V03_VK11F001_H1*V03_VK11T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1)) as decimal(15,2))
		as "T ср/взв ПСВ за п/ч, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK22T001_H1+V02_VK11F001_H1*V02_VK21T001_h1+V03_VK11F001_H1*V03_VK21T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))  as decimal(15,2))
		as "T ср/взв ОСВ за п/ч, °С  [hint: Температура средневзвешенная ОСВ КО1+КО2+КО пвк (по расходам ПСВ)]",
	CAST(V01_VK11W001_H1+V02_VK11W001_H1+V03_VK11W001_H1 as decimal(15,2))
		as "W сум ПСВ КО за п/ч, ГДж [hint: Суммарная энергия ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21W001_H1+V02_VK21W001_H1+V03_VK21W001_H1 as decimal(15,2))
		as "W сум ОСВ КО за п/ч, ГДж [hint: Суммарная энергия ОСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK31W001_H1+V02_VK31W001_H1+V03_VK31W001_H1 as decimal(15,2))
		as "W сум по МАГ.КО за п/ч, ГДж [hint: Суммарная энергия по магистралям КО1+КО2+КО пвк]",
	CAST((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1)-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1) as decimal(15,2))
		as "Баланс по КО за п/ч, т/ч [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1)),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))*100 as decimal(15,2))
		as "Баланс по КО за п/ч, % [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1, V02_VK11F001_H1, V02_VK21F001_H1, CLC_ShiftDuty,
	V01_VK12T001_H1, V01_VK22T001_H1, V02_VK11T001_H1, V02_VK21T001_h1, V03_VK11T001_H1, V03_VK21T001_H1, 
	V02_VK11W001_H1, V02_VK21W001_H1, V02_VK31W001_H1, V03_VK11F001_H1, V03_VK21F001_H1, V03_VK11W001_H1, V03_VK21W001_H1, V03_VK31W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="БАЛАНС - Контура отопления "(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [hint: CLC_ShiftDuty]",
	CAST(sum(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1) as decimal(15,2)) as "G  сум ПСВ КО за смену, т/см [hint: Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST(sum(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1) as decimal(15,2)) as "G сум ОСВ КО за смену, т/см [hint: Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(avg(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK12T001_H1+V02_VK11F001_H1*V02_VK11T001_H1+V03_VK11F001_H1*V03_VK11T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))) as decimal(15,2)) as "T ср/взв ПСВ за смену, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(avg(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK22T001_H1+V02_VK11F001_H1*V02_VK21T001_h1+V03_VK11F001_H1*V03_VK21T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))) as decimal(15,2)) as "T ср/взв ОСВ за смену, °С  [hint: Температура средневзвешенная ОСВ КО1+КО2+КО пвк (по расходам ПСВ)]",
	CAST(sum(V01_VK11W001_H1+V02_VK11W001_H1+V03_VK11W001_H1) as decimal(15,2)) as "W сум ПСВ КО за смену, ГДж [hint: Суммарная энергия ПСВ по КО1+КО2+КО пвк]",
	CAST(sum(V01_VK21W001_H1+V02_VK21W001_H1+V03_VK21W001_H1) as decimal(15,2)) as "W сум ОСВ КО за смену, ГДж [hint: Суммарная энергия ОСВ по КО1+КО2+КО пвк]",
	CAST(sum(V01_VK31W001_H1+V02_VK31W001_H1+V03_VK31W001_H1) as decimal(15,2)) as "W сум по МАГ.КО за смену, ГДж [hint: Суммарная энергия по магистралям КО1+КО2+КО пвк]",
	CAST(SUM((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1)-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1)) as decimal(15,2)) as "Баланс по КО за смену, т/см [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]",
	CAST(AVG(dbo.vst_SafeDIV((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1)),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))*100) as decimal(15,2)) as "Баланс ср. по КО за смену, % [hint: Баланс средний ПСВ-ОСВ  по КО1+КО2+КО пвк]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1, V02_VK11F001_H1, V02_VK21F001_H1, CLC_ShiftDuty,
	V01_VK12T001_H1, V01_VK22T001_H1, V02_VK11T001_H1, V02_VK21T001_h1, V03_VK11T001_H1, V03_VK21T001_H1, 
	V02_VK11W001_H1, V02_VK21W001_H1, V02_VK31W001_H1, V03_VK11F001_H1, V03_VK21F001_H1, V03_VK11W001_H1, V03_VK21W001_H1, V03_VK31W001_H1 FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))
Order By
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2))


{смены за месяц}
/*ReportName="БАЛАНС - Контура отопления " (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [hint: CLC_ShiftDuty]",
	Count(*) as "Час [hint: Время, отработанное сменой за месяц, час]",
	CAST(sum(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1) as decimal(15,2))
		as "G сум ПСВ, т/см [hint: Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST(sum(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1) as decimal(15,2))
		as "G сум ОСВ КО, т/см [hint: Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(avg(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK12T001_H1+V02_VK11F001_H1*V02_VK11T001_H1+V03_VK11F001_H1*V03_VK11T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))) as decimal(15,2))
		as "T ср/взв ПСВ за смену, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(avg(dbo.vst_SafeDIV((V01_VK11F001_H1*V01_VK22T001_H1+V02_VK11F001_H1*V02_VK21T001_h1+V03_VK11F001_H1*V03_VK21T001_H1),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))) as decimal(15,2))
		as "T ср/взв ОСВ, °С  [hint: Температура средневзвешенная ОСВ КО1+КО2+КО пвк (по расходам ПСВ)]",
	CAST(sum(V01_VK11W001_H1+V02_VK11W001_H1+V03_VK11W001_H1) as decimal(15,2))
		as "W сум ПСВ КО, ГДж [hint: Суммарная энергия ПСВ по КО1+КО2+КО пвк]",
	CAST(sum(V01_VK21W001_H1+V02_VK21W001_H1+V03_VK21W001_H1) as decimal(15,2))
		as "W сум ОСВ КО, ГДж [hint: Суммарная энергия ОСВ по КО1+КО2+КО пвк]",
	CAST(sum(V01_VK31W001_H1+V02_VK31W001_H1+V03_VK31W001_H1) as decimal(15,2))
		as "W сум по МАГ.КО, ГДж [hint: Суммарная энергия по магистралям КО1+КО2+КО пвк]",
	CAST(SUM((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1)-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1)) as decimal(15,2))
		as "Баланс по КО, т/см [hint: Баланс ПСВ-ОСВ  по КО1+КО2+КО пвк]",
	CAST(AVG(dbo.vst_SafeDIV((V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1-(V01_VK21F001_H1+V02_VK21F001_H1+V03_VK21F001_H1)),(V01_VK11F001_H1+V02_VK11F001_H1+V03_VK11F001_H1))*100) as decimal(15,2))
		as "Баланс ср. по КО, % [hint: Баланс средний ПСВ-ОСВ  по КО1+КО2+КО пвк]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, V01_VK11F001_H1, V01_VK21F001_H1, V01_VK11W001_H1, V01_VK21W001_H1, V01_VK31W001_H1, V02_VK11F001_H1, V02_VK21F001_H1, CLC_ShiftDuty,
	V01_VK12T001_H1, V01_VK22T001_H1, V02_VK11T001_H1, V02_VK21T001_h1, V03_VK11T001_H1, V03_VK21T001_H1, 
	V02_VK11W001_H1, V02_VK21W001_H1, V02_VK31W001_H1, V03_VK11F001_H1, V03_VK21F001_H1, V03_VK11W001_H1, V03_VK21W001_H1, V03_VK31W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))