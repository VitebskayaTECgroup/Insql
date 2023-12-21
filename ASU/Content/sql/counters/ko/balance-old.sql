{суточные срезы}
/*ReportName="БАЛАНС - Контура отопления " (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="суточные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1 as decimal(15,2))
		as "G  сум ПСВ КО за п/с, т/сут [hint: Суммарная масса ПСВ по КО1+КО2+КО пвк]",
	CAST(V01_VK21F001_S1+V02_VK21F001_S1+V03_VK21F001_S1 as decimal(15,2))
		as "G сум ОСВ КО за п/с, т/сут [hint: Суммарная масса ОСВ по КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_S1*V01_VK11T001_S1+V02_VK11F001_S1*V02_VK11T001_S1+V03_VK11F001_S1*V03_VK11T001_S1),(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1)) as decimal(15,2))
		as "T ср/взв ПСВ за п/сут, °С  [hint: Температура средневзвешенная ПСВ КО1+КО2+КО пвк]",
	CAST(dbo.vst_SafeDIV((V01_VK11F001_S1*V01_VK21T001_S1+V02_VK11F001_S1*V02_VK21T001_S1+V03_VK11F001_S1*V03_VK21T001_S1),(V01_VK11F001_S1+V02_VK11F001_S1+V03_VK11F001_S1)) as decimal(15,2))
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
	V01_VK12T001_S1, V01_VK21T001_S1, V02_VK11T001_S1, V02_VK21T001_S1, V03_VK11T001_S1, V03_VK21T001_S1,  V01_VK11T001_S1,
	V02_VK11W001_S1, V02_VK21W001_S1, V02_VK31W001_S1, V03_VK11F001_S1, V03_VK21F001_S1, V03_VK11W001_S1, V03_VK21W001_S1, V03_VK31W001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")