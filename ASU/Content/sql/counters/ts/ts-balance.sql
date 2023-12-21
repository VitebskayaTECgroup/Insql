{минутные срезы}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST((U04_UM11F001 + U06_UM11F001 + U07_UM11f001 + U05_UM11F001 + U08_UM11F001) * U04_SY00A700 * U05_SY00A700 * U06_SY00A700 * U07_SY00A700 * U08_SY00A700 as decimal(15, 0))
		as "G сум ПСВ, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001 * U04_UM11T001 + U06_UM11F001 * U06_UM11T001 + U07_UM11F001 * U07_UM11T001 + U05_UM11F001 * U05_UM11T001 + U08_UM11F001 * U08_UM11T001), (U04_UM11F001 + U06_UM11F001 + U07_UM11F001 + U05_UM11F001 + U08_UM11F001)) as decimal(12, 2))
		as "T ср/взв ПСВ, °С [hint: Температура средневзвешенная ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST((U04_UM21F001 + U06_UM21F001 + U06_UM22F001 + U07_UM21f001 + U05_UM21F001 + U08_UM21F001) * U04_SY00A700 * U05_SY00A700 * U06_SY00A700 * U07_SY00A700 * U08_SY00A700 as decimal(15, 0))
		as "G сум ОСВ, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(dbo.vst_SafeDIV((U04_UM21F001 * U04_UM21T001 + U06_UM21F001 * U06_UM21T001 + U06_UM22F001 * U06_UM22T001 + U07_UM21F001 * U07_UM21T001 + U05_UM21F001 * U05_UM21T001 + U08_UM21F001 * U08_UM21T001), (U04_UM21F001 + U06_UM21F001 + U06_UM22F001 + U07_UM21F001 + U05_UM21F001 + U08_UM21F001)) as decimal(15, 2))
		as "T ср/взв ОСВ, °С [hint: Температура средневзвешенная ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST((U04_UM41F001) * U04_SY00A700 * U05_SY00A700 * U06_SY00A700 * U07_SY00A700 * U08_SY00A700 as decimal(15, 0))
		as "G Подп.ТС, т/ч [U04_UM41F001]",
	CAST((U04_UM11F001 + U06_UM11F001 + U07_UM11f001 + U05_UM11F001 + U08_UM11F001 - (U04_UM21F001 + U06_UM21F001 + U06_UM22F001 + U07_UM21f001 + U05_UM21F001 + U08_UM21F001) - U04_UM41F001) * U04_SY00A700 * U05_SY00A700 * U06_SY00A700 * U07_SY00A700 * U08_SY00A700 as decimal(15, 0))
		as "Баланс по СВ, т/ч [hint: Баланс по сетевой воде с подпиткой]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001 + U06_UM11F001 + U07_UM11f001 + U05_UM11F001 + U08_UM11F001 - (U04_UM21F001 + U06_UM21F001 + U06_UM22F001 + U07_UM21f001 + U05_UM21F001 + U08_UM21F001) - U04_UM41F001), (U04_UM11F001 + U06_UM11F001 + U07_UM11f001 + U05_UM11F001 + U08_UM11F001)) * 100 * U04_SY00A700 * U05_SY00A700 * U06_SY00A700 * U07_SY00A700 * U08_SY00A700 as decimal(15, 2))
		as "Баланс по СВ, % [hint: Баланс по сетевой воде с подпиткой]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11F001, U04_UM21F001, U06_UM11F001, U06_UM21F001, U06_UM22F001,
	U07_UM21F001, U05_UM11F001, U08_UM11F001, U08_UM21F001, U08_SY00A700, U07_UM11f001,
	U04_UM11T001, U06_UM11T001, U07_UM11T001, U05_UM11T001, U04_UM41T001, U08_UM11T001,
	U04_UM21T001, U06_UM21T001, U06_UM22T001, U07_UM21T001, U05_UM21T001, U08_UM21T001,
	U05_UM21F001, U04_SY00A700, U05_SY00A700, U06_SY00A700, U07_SY00A700, U04_UM41F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 as decimal(15, 0))
		as "G сум ПСВ за п/ч, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(U00_UM10F702_H1 as decimal(15, 0))
		as "корр G сум ПСВ за п/ч, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001_h1 * U04_UM11T001_h1 + U06_UM11F001_h1 * U06_UM11T001_h1 + U07_UM11G001_h1 * U07_UM11T001_h1 + U05_UM11F001_h1 * U05_UM11T001_h1 + U08_UM11F001_h1 * U08_UM11T001_h1), (U04_UM11F001_h1 + U06_UM11F001_h1 + U07_UM11G001_h1 + U05_UM11F001_h1 + U08_UM11F001_h1)) as decimal(12, 2))
		as "T ср/взв ПСВ за п/ч, °С  [hint: Температура средневзвешенная ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1 as decimal(15, 0))
		as "G сум ОСВ за п/ч, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(U00_UM20F702_H1 as decimal(15, 0))
		as "корр G сум ОСВ за п/ч, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(dbo.vst_SafeDIV((U04_UM21F001_h1 * U04_UM21T001_h1 + U06_UM21F001_h1 * U06_UM21T001_h1 + U06_UM22F001_h1 * U06_UM22T001_h1 + U07_UM21G001_h1 * U07_UM21T001_h1 + U05_UM21F001_h1 * U05_UM21T001_h1 + U08_UM21F001_h1 * U08_UM21T001_h1), (U04_UM21F001_h1 + U06_UM21F001_h1 + U06_UM22F001_h1 + U07_UM21G001_h1 + U05_UM21F001_h1 + U08_UM21F001_h1)) as decimal(15, 2))
		as "T ср/взв ОСВ за п/ч, °С  [hint: Температура средневзвешенная ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(U04_UM41F001_H1 as decimal(15, 0))
		as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
	CAST(U04_UM41T001 * U04_SY00A700 as decimal(15, 2))
		as "T Подп. мгн, °С [hint: Мгновенный срез Т источника на конец часа]",
	CAST(isnull(U04_UM11W001_H1,0) + isnull(U06_UM11W001_H1,0) + isnull(U07_UM11W001_H1,0) + isnull(U05_UM11W001_H1,0) + isnull(U08_UM11W001_H1,0) as decimal(15, 0))
		as "W сум ПСВ за п/ч, ГДж [hint: Энергия ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(isnull(U04_UM11W002_H1,0) + isnull(U06_UM11W002_H1,0) + isnull(U07_UM11W002_H1,0) + isnull(U05_UM11W002_H1,0) + isnull(U08_UM11W002_H1,0) as decimal(15, 0))
		as "корр W сум ПСВ за п/ч, ГКал [hint: Энергия ПСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(isnull(U04_UM21W001_H1,0) + isnull(U06_UM21W001_H1,0) + isnull(U06_UM22W001_H1,0) + isnull(U07_UM21W001_H1,0) + isnull(U05_UM21W001_H1,0) + isnull(U08_UM21W001_H1,0) as decimal(15, 0))
		as "W сум ОСВ за п/ч, ГДж [hint: Энергия ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(isnull(U04_UM21W002_H1,0) + isnull(U06_UM21W002_H1,0) + isnull(U06_UM22W002_H1,0) + isnull(U07_UM21W002_H1,0) + isnull(U05_UM21W002_H1,0) + isnull(U08_UM21W002_H1,0) as decimal(15, 0))
		as "корр W сум ОСВ за п/ч, ГКал [hint: Энергия ОСВ Центр + Док + запад + ВЗРД + лучеса]",
	CAST(U04_UM11W001_H1 - U04_UM21W001_H1 + U06_UM31W001_H1 + U07_UM31W001_H1 + U05_UM31W001_H1 + U08_UM31W001_H1 as decimal(15, 0))
		as "dW сум по маг. за п/ч, ГДж [hint: Энергия по магистралям Центр + Док + запад + ВЗРД + лучеса]",
	CAST((isnull(U04_UM11W002_H1,0) + isnull(U06_UM11W002_H1,0) + isnull(U07_UM11W002_H1,0) + isnull(U05_UM11W002_H1,0) + isnull(U08_UM11W002_H1,0)) - (isnull(U04_UM21W002_H1,0) + isnull(U06_UM21W002_H1,0) + isnull(U06_UM22W002_H1,0) + isnull(U07_UM21W002_H1,0) + isnull(U05_UM21W002_H1,0) + isnull(U08_UM21W002_H1,0)) as decimal(15, 0))
		as "корр dW сум по маг. за п/ч, ГКал [hint: Энергия по магистралям Центр + Док + запад + ВЗРД + лучеса]",
	CAST(U04_UM41W001_H1 as decimal(15, 0))
		as "W Подп.ТС за п/ч, ГДж [U04_UM41W001_H1]",
	CAST(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1 as decimal(15, 0))
		as "Баланс по СВ за п/ч, т/ч [hint: Баланс по сетевой воде с подпиткой за пред.час]",
	CAST((U00_UM10F702_H1) - (U00_UM20F702_H1) - U04_UM41F001_H1 as decimal(15, 0))
		as "корр Баланс по СВ за п/ч, т/ч [hint: Баланс по сетевой воде с подпиткой за пред.час]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1), (U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1)) * 100 as decimal(6, 2))
		as "Баланс по СВ за п/ч, % [hint: Баланс по сетевой воде с подпиткой за пред.час]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11F001_H1, U04_UM21F001_H1, U04_UM11W001_H1, U04_UM21W001_H1, U04_UM31W001_H1, U06_UM11F001_H1, U06_UM21F001_H1, 
	U08_UM11F001_H1,U08_UM11T001_H1,U08_UM21F001_H1,U08_UM21T001_H1, U08_UM11W001_H1,  U08_UM21W001_H1, U08_UM21W002_H1, U08_UM31W001_H1,U08_UM11W002_H1,
	U00_UM10F702_H1, U00_UM20F702_H1,
	U04_UM11W002_H1,U06_UM11W002_H1,U07_UM11W002_H1,U05_UM11W002_H1,
	U04_UM21W002_H1,U06_UM21W002_H1,U06_UM22W002_H1,U07_UM21W002_H1,U05_UM21W002_H1,
	U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1, 
	U04_UM21T001_H1, U06_UM21T001_H1, U06_UM22T001_H1 ,  U07_UM21T001_H1, U05_UM21T001_H1,
	U04_UM41T001, U04_SY00A700,
	U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1, U07_UM11G001_H1, U07_UM21G001_H1, U07_UM11W001_H1, U07_UM21W001_H1, U07_UM31W001_H1, U05_UM11F001_H1, U05_UM21F001_H1, U05_UM11W001_H1, U05_UM21W001_H1, U05_UM31W001_H1, U04_UM41F001_H1,  U04_UM41W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1 as decimal(15,0))
		as "G сум ПСВ за п/c, т/сут [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001_S1 * U04_UM11T001_S1 + U06_UM11F001_S1 * U06_UM11T001_S1 + U07_UM11G001_S1 * U07_UM11T001_S1 + U05_UM11F001_S1 * U05_UM11T001_S1 + U08_UM11F001_S1 * isnull(U08_UM11T001_S1,0)), (U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1)) as decimal(15,2))
		as "T ср/взв ПСВ за п/c, °С  [hint: Температура средневзвешенная ПСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM21F001_S1 + U06_UM21F001_S1 + U06_UM22F001_S1 + U07_UM21G001_S1 + U05_UM21F001_S1 + U08_UM21F001_S1 as decimal(15,0))
		as "G сум ОСВ за п/с, т/сут [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(dbo.vst_SafeDIV((isnull(U04_UM21F001_S1,0) * isnull(U04_UM21T001_S1,0) + isnull(U06_UM21F001_S1,0) * isnull(U06_UM21T001_S1,0) + isnull(U06_UM22F001_S1,0) * isnull(U06_UM22T001_S1,0) + isnull(U07_UM21G001_S1,0) * isnull(U07_UM21T001_S1,0) + isnull(U05_UM21F001_S1,0) * isnull(U05_UM21T001_S1,0) + isnull(U08_UM21F001_S1,0) * isnull(U08_UM21T001_S1,0)), (U04_UM21F001_S1 + U06_UM21F001_S1 + U06_UM22F001_S1 + U07_UM21G001_S1 + U05_UM21F001_S1 + U08_UM21F001_S1)) as decimal(15,2))
		as "T ср/взв ОСВ за п/c, °С  [hint: Температура средневзвешенная ОСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM41F001_S1 as decimal(15,0))
		as "G Подп.ТС за п/с, т/сут [U04_UM41F001_S1]",
	CAST(U04_UM41T001_S1 as decimal(15,0))
		as "T Потп.ТС за п/с, °С [U04_UM41T001_S1]",
	CAST(U04_UM11W001_S1 + U06_UM11W001_S1 + U07_UM11W001_S1 + U05_UM11W001_S1 + U08_UM11W001_S1 as decimal(15,0))
		as "W сум ПСВ за п/с, ГДж [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM21W001_S1 + U06_UM21W001_S1 + U06_UM22W001_S1 + U07_UM21W001_S1 + U05_UM21W001_S1 + U08_UM21W001_S1 as decimal(15,0))
		as "W сум ОСВ за п/с, ГДж [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM11W001_S1 - U04_UM21W001_S1 + U06_UM31W001_S1 + U07_UM31W001_S1 + U05_UM31W001_S1 + U08_UM31W001_S1 as decimal(15,0))
		as "dW сум по маг. за п/с, ГДж [hint: Энергия по магистралям Центр + Док + запад + ВЗРД]",
	CAST(U04_UM41W001_S1 as decimal(15,0))
		as "W Подп.ТС за п/с, ГДж [U04_UM41W001_S1]",
	CAST(U04_VB01T001_S1 as decimal(15,2))
		as "Tхв за п/с, °С [U04_VB01T001_S1]",
	CAST(U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1 - (U04_UM21F001_S1 + U06_UM21F001_S1 + U06_UM22F001_S1 + U07_UM21G001_S1 + U05_UM21F001_S1 + U08_UM21F001_S1) - U04_UM41F001_S1 as decimal(15,0))
		as "Баланс по СВ за п/c, т/c [hint: Баланс по сетевой воде с подпиткой за пред. сутки]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1 - (U04_UM21F001_S1 + U06_UM21F001_S1 + U06_UM22F001_S1 + U07_UM21G001_S1 + U05_UM21F001_S1 + U08_UM21F001_S1) - U04_UM41F001_S1), (U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1)) * 100 as decimal(15,2))
		as "Баланс по СВ за п/c, % [hint: Баланс по сетевой воде с подпиткой за пред. сутки]",
	CAST((U04_UM41F001_S1 + U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1 + U04_UM21F001_S1 + U06_UM21F001_S1 + U06_UM22F001_S1 + U07_UM21G001_S1 + U05_UM21F001_S1 + U08_UM21F001_S1)/2 as decimal(15,0))
		as "кор Gсум ПСВ",
	CAST(((U04_UM41F001_S1 + U04_UM11F001_S1 + U06_UM11F001_S1 + U07_UM11G001_S1 + U05_UM11F001_S1 + U08_UM11F001_S1 + U04_UM21F001_S1 + U06_UM21F001_S1 + U06_UM22F001_S1 + U07_UM21G001_S1 + U05_UM21F001_S1 + U08_UM21F001_S1)/2) - U04_UM41F001_S1 as decimal(15,0))
		as "кор Gсум ОСВ",
	CAST(isnull(U04_UM11W002_S1,0) + isnull(U05_UM11W002_S1,0) + isnull(U06_UM11W002_S1,0) + isnull(U07_UM11W002_S1,0) as decimal(15,0))
		as "кор Wсум ПСВ",
	CAST(isnull(U04_UM21W002_S1,0) + isnull(U05_UM21W002_S1,0) + isnull(U06_UM21W002_S1,0) + isnull(U06_UM22W002_S1,0) + isnull(U07_UM21W002_S1,0) + isnull(U08_UM21W002_S1,0) as decimal(15,0))
		as "кор Wсум ОСВ",
	CAST((isnull(U04_UM11W002_S1,0) + isnull(U05_UM11W002_S1,0) + isnull(U06_UM11W002_S1,0) + isnull(U07_UM11W002_S1,0)) - (isnull(U04_UM21W002_S1,0) + isnull(U05_UM21W002_S1,0) + isnull(U08_UM21W002_S1,0) + isnull(U06_UM21W002_S1,0) + isnull(U06_UM22W002_S1,0) + isnull(U07_UM21W002_S1,0)) as decimal(15,0))
		as "кор dWсум"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11F001_S1, U04_UM21F001_S1, U04_UM11W001_S1, U04_UM21W001_S1, U04_UM31W001_S1, U06_UM11F001_S1, U06_UM21F001_S1,
	U08_UM11F001_S1,U08_UM21W002_S1,U08_UM21F001_S1,U08_UM11F001_S1,U08_UM31W001_S1,U08_UM11W001_S1, U08_UM21W001_S1, U08_UM21T001_S1, U08_UM11T001_S1,
	U04_UM11T001_S1, U06_UM11T001_S1, U07_UM11T001_S1, U05_UM11T001_S1, U04_UM41T001_S1, U04_VB01T001_S1,
	U04_UM21T001_S1, U06_UM21T001_S1, U06_UM22T001_S1, U07_UM21T001_S1, U05_UM21T001_S1,
	U06_UM22F001_S1, U06_UM11W001_S1, U06_UM21W001_S1, U06_UM22W001_S1, U06_UM31W001_S1, U07_UM11G001_S1, U07_UM21G001_S1, U07_UM11W001_S1, U07_UM21W001_S1, U07_UM31W001_S1, U05_UM11F001_S1, U05_UM21F001_S1, U05_UM11W001_S1, U05_UM21W001_S1, U05_UM31W001_S1, U04_UM41F001_S1, U04_UM41W001_S1,
	U04_UM11W002_S1, U05_UM11W002_S1, U06_UM11W002_S1, U07_UM11W002_S1,
	U04_UM21W002_S1, U05_UM21W002_S1, U06_UM21W002_S1, U06_UM22W002_S1, U07_UM21W002_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 as decimal(15, 0))
		as "G сум ПСВ за п/ч, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(U00_UM10F702_H1 as decimal(15, 0))
		as "корр G сум ПСВ за п/ч, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001_h1 * U04_UM11T001_h1 + U06_UM11F001_h1 * U06_UM11T001_h1 + U07_UM11G001_h1 * U07_UM11T001_h1 + U05_UM11F001_h1 * U05_UM11T001_h1 + U08_UM11F001_h1 * U08_UM11T001_h1), (U04_UM11F001_h1 + U06_UM11F001_h1 + U07_UM11G001_h1 + U05_UM11F001_h1 + U08_UM11F001_h1)) as decimal(12, 2))
		as "T ср/взв ПСВ за п/ч, °С  [hint: Температура средневзвешенная ПСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1 as decimal(15, 0))
		as "G сум ОСВ за п/ч, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(U00_UM20F702_H1 as decimal(15, 0))
		as "корр G сум ОСВ за п/ч, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(dbo.vst_SafeDIV((U04_UM21F001_h1 * U04_UM21T001_h1 + U06_UM21F001_h1 * U06_UM21T001_h1 + U06_UM22F001_h1 * U06_UM22T001_h1 + U07_UM21G001_h1 * U07_UM21T001_h1 + U05_UM21F001_h1 * U05_UM21T001_h1 + U08_UM21F001_h1 * U08_UM21T001_h1), (U04_UM21F001_h1 + U06_UM21F001_h1 + U06_UM22F001_h1 + U07_UM21G001_h1 + U05_UM21F001_h1 + U08_UM21F001_h1)) as decimal(15, 2))
		as "T ср/взв ОСВ за п/ч, °С [hint: Температура средневзвешенная ОСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM41F001_H1 as decimal(15, 0))
		as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
	CAST(U04_UM41T001 * U04_SY00A700 as decimal(15, 2))
		as "T Подп. мгн, °С [hint: Мгновенный срез Т источника на конец часа]",
	CAST(U04_UM11W001_H1 + U06_UM11W001_H1 + U07_UM11W001_H1 + U05_UM11W001_H1 + U08_UM11W001_H1 as decimal(15, 0))
		as "W сум ПСВ за п/ч, ГДж [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(isnull(U04_UM11W002_H1,0) + isnull(U06_UM11W002_H1,0) + isnull(U07_UM11W002_H1,0) + isnull(U05_UM11W002_H1,0) + isnull(U08_UM11W002_H1,0) as decimal(15, 0))
		as "корр W сум ПСВ за п/ч, ГКал [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM21W001_H1 + U06_UM21W001_H1 + U06_UM22W001_H1 + U07_UM21W001_H1 + U05_UM21W001_H1 + U08_UM21W001_H1 as decimal(15, 0))
		as "W сум ОСВ за п/ч, ГДж [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(isnull(U04_UM21W002_H1,0) + isnull(U06_UM21W002_H1,0) + isnull(U06_UM22W002_H1,0) + isnull(U07_UM21W002_H1,0) + isnull(U05_UM21W002_H1,0) + isnull(U08_UM21W002_H1,0) as decimal(15, 0))
		as "корр W сум ОСВ за п/ч, ГКал [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(U04_UM11W001_H1 - U04_UM21W001_H1 + U06_UM31W001_H1 + U07_UM31W001_H1 + U05_UM31W001_H1 + U08_UM31W001_H1 as decimal(15, 0))
		as "dW сум по маг. за п/ч, ГДж [hint: Энергия по магистралям Центр + Док + запад + ВЗРД]",
	CAST((isnull(U04_UM11W002_H1,0) + isnull(U06_UM11W002_H1,0) + isnull(U07_UM11W002_H1,0) + isnull(U05_UM11W002_H1,0) + isnull(U08_UM11W002_H1,0)) - (isnull(U04_UM21W002_H1,0) + isnull(U06_UM21W002_H1,0) + isnull(U06_UM22W002_H1,0) + isnull(U07_UM21W002_H1,0) + isnull(U05_UM21W002_H1,0) + isnull(U08_UM21W002_H1,0)) as decimal(15, 0))
		as "корр dW сум по маг. за п/ч, ГКал [hint: Энергия по магистралям Центр + Док + запад + ВЗРД]",
	CAST(U04_UM41W001_H1 as decimal(15, 0))
		as "W Подп.ТС за п/ч, ГДж [U04_UM41W001_H1]",
	CAST(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1 as decimal(15, 0))
		as "Баланс по СВ за п/ч, т/ч [hint: Баланс по сетевой воде с подпиткой за пред.час]",
	CAST((U00_UM10F702_H1) - (U00_UM20F702_H1) - U04_UM41F001_H1 as decimal(15, 0))
		as "корр Баланс по СВ за п/ч, т/ч [hint: Баланс по сетевой воде с подпиткой за пред.час]",
	CAST(dbo.vst_SafeDIV((U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1), (U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1)) * 100 as decimal(6, 2))
		as "Баланс по СВ за п/ч, % [hint: Баланс по сетевой воде с подпиткой за пред.час]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11F001_H1, U04_UM21F001_H1, U04_UM11W001_H1, U04_UM21W001_H1, U04_UM31W001_H1, U06_UM11F001_H1, U06_UM21F001_H1,
	U04_UM41T001, U04_SY00A700,
	U00_UM10F702_H1, U00_UM20F702_H1,
	U04_UM11W002_H1, U06_UM11W002_H1, U07_UM11W002_H1, U05_UM11W002_H1,
	U04_UM21W002_H1, U06_UM21W002_H1, U06_UM22W002_H1, U07_UM21W002_H1, U05_UM21W002_H1,
	U08_UM11F001_H1, U08_UM11T001_H1, U08_UM21F001_H1, U08_UM21T001_H1, U08_UM11W001_H1, U08_UM21W001_H1, U08_UM21W002_H1, U08_UM31W001_H1, U08_UM11W002_H1,
	U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1,
	U04_UM21T001_H1, U06_UM21T001_H1, U06_UM22T001_H1 , U07_UM21T001_H1, U05_UM21T001_H1,
	CLC_ShiftDuty,
	U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1, U07_UM11G001_H1, U07_UM21G001_H1, U07_UM11W001_H1, U07_UM21W001_H1, U07_UM31W001_H1, U05_UM11F001_H1, U05_UM21F001_H1, U05_UM11W001_H1, U05_UM21W001_H1, U05_UM31W001_H1, U04_UM41F001_H1, U04_UM41W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi, 480, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, DateTime)) * 2, 0, 1) / 2)) as 'Дата',
	null, 
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(MIN(DateTime)))
		as "Cмена [CLC_ShiftDuty,0]",
	CAST(sum(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1) as decimal(15, 0))
		as "G сум ПСВ за смену, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U00_UM10F702_H1) as decimal(15, 0))
		as "корр G сум ПСВ за смену, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(avg(dbo.vst_SafeDIV((U04_UM11F001_h1 * U04_UM11T001_h1 + U06_UM11F001_h1 * U06_UM11T001_h1 + U07_UM11G001_h1 * U07_UM11T001_h1 + U05_UM11F001_h1 * U05_UM11T001_h1 + U08_UM11F001_h1 * U08_UM11T001_h1), (U04_UM11F001_h1 + U06_UM11F001_h1 + U07_UM11G001_h1 + U05_UM11F001_h1 + U08_UM11F001_h1))) as decimal(12, 2))
		as "T ср/взв ПСВ ср, °С  [hint: Температура средневзвешенная ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) as decimal(15, 0))
		as "G сум ОСВ за смену, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U00_UM20F702_H1) as decimal(15, 0))
		as "корр G сум ОСВ за смену, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(avg(dbo.vst_SafeDIV((U04_UM21F001_h1 * U04_UM21T001_h1 + U06_UM21F001_h1 * U06_UM21T001_h1 + U06_UM22F001_h1 * U06_UM22T001_h1 + U07_UM21G001_h1 * U07_UM21T001_h1 + U05_UM21F001_h1 * U05_UM21T001_h1 + U08_UM21F001_h1 * U08_UM21T001_h1), (U04_UM21F001_h1 + U06_UM21F001_h1 + U06_UM22F001_h1 + U07_UM21G001_h1 + U05_UM21F001_h1 + U08_UM21F001_h1))) as decimal(15, 2))
		as "T ср/взв ОСВ ср, °С  [hint: Температура средневзвешенная ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM41F001_H1) as decimal(15, 0))
		as "G Подп.ТС за смену, т/ч [U04_UM41F001_H1]",
	CAST(sum(U04_UM11W001_H1 + U06_UM11W001_H1 + U07_UM11W001_H1 + U05_UM11W001_H1 + U08_UM11W001_H1) as decimal(15, 0))
		as "W сум ПСВ за смену, ГДж [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM11W002_H1 + U06_UM11W002_H1 + U07_UM11W002_H1 + U05_UM11W002_H1 + U08_UM11W002_H1) as decimal(15, 0))
		as "корр W сум ПСВ за смену, ГКал [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM21W001_H1 + U06_UM21W001_H1 + U06_UM22W001_H1 + U07_UM21W001_H1 + U05_UM21W001_H1 + U08_UM21W001_H1) as decimal(15, 0))
		as "W сум ОСВ за смену, ГДж [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM21W002_H1 + U06_UM21W002_H1 + U06_UM22W002_H1 + U07_UM21W002_H1 + U05_UM21W002_H1 + U08_UM21W002_H1) as decimal(15, 0))
		as "корр W сум ОСВ за смену, ГКал [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM31W001_H1 + U06_UM31W001_H1 + U07_UM31W001_H1 + U05_UM31W001_H1 + U08_UM31W001_H1) as decimal(15, 0))
		as "dW сум по маг. за смену, ГДж [hint: Энергия по магистралям Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM41W001_H1) as decimal(15, 0))
		as "W Подп.ТС за смену, ГДж [U04_UM41W001_H1]",
	CAST(sum(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1) as decimal(15, 0))
		as "Баланс по СВ за смену, т/ч [hint: Баланс по сетевой воде с подпиткой за смену]",
	CAST(sum(U00_UM10F702_H1) - SUM(U00_UM20F702_H1) - SUM(U04_UM41F001_H1) as decimal(15, 0))
		as "корр Баланс по СВ за смену, т/ч [hint: Баланс по сетевой воде с подпиткой за смену]",
	CAST(avg(dbo.vst_SafeDIV((U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1), (U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1)) * 100) as decimal(6, 2))
		as "Баланс по СВ ср, % [hint: Баланс по сетевой воде с подпиткой за смену]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11F001_H1, U04_UM21F001_H1, U04_UM11W001_H1, U04_UM21W001_H1, U04_UM31W001_H1, U06_UM11F001_H1, U06_UM21F001_H1,
	U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1,
	U04_UM21T001_H1, U06_UM21T001_H1, U06_UM22T001_H1 ,  U07_UM21T001_H1, U05_UM21T001_H1,
	CLC_ShiftDuty,
	U00_UM10F702_H1, U00_UM20F702_H1,
	U04_UM11W002_H1,U06_UM11W002_H1,U07_UM11W002_H1,U05_UM11W002_H1,
	U04_UM21W002_H1,U06_UM21W002_H1,U06_UM22W002_H1,U07_UM21W002_H1,U05_UM21W002_H1,
	U08_UM11F001_H1,U08_UM11T001_H1,U08_UM21F001_H1,U08_UM21T001_H1, U08_UM11W001_H1,  U08_UM21W001_H1, U08_UM21W002_H1, U08_UM31W001_H1,U08_UM11W002_H1,
	U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1, U07_UM11G001_H1, U07_UM21G001_H1, U07_UM11W001_H1, U07_UM21W001_H1, U07_UM31W001_H1, U05_UM11F001_H1, U05_UM21F001_H1, U05_UM11W001_H1, U05_UM21W001_H1, U05_UM31W001_H1, U04_UM41F001_H1,  U04_UM41W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(mi, 480, Convert(DateTime, Round(Convert(float, DateAdd(mi, - 500, DateTime)) * 2, 0, 1) / 2))
Order By
	DateAdd(mi, 480, Convert(DateTime, Round(Convert(float, DateAdd(mi, - 500, DateTime)) * 2, 0, 1) / 2))


{смены за месяц}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ" (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime)) + ' ' + DateName(yyyy,MIN(DateTime)) as 'Дата',
	null,
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))
		as "Cмена [CLC_ShiftDuty]", 
	CAST(sum(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1) as decimal(15, 0))
		as "G сум ПСВ за смену, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U00_UM10F702_H1) as decimal(15, 0))
		as "корр G сум ПСВ за смену, т/ч [hint: Масса ПСВ Центр + Док + запад + ВЗРД]",
	CAST(avg(dbo.vst_SafeDIV((U04_UM11F001_h1 * U04_UM11T001_h1 + U06_UM11F001_h1 * U06_UM11T001_h1 + U07_UM11G001_h1 * U07_UM11T001_h1 + U05_UM11F001_h1 * U05_UM11T001_h1 + U08_UM11F001_h1 * U08_UM11T001_h1), (U04_UM11F001_h1 + U06_UM11F001_h1 + U07_UM11G001_h1 + U05_UM11F001_h1 + U08_UM11F001_h1))) as decimal(12, 2))
		as "T ср/взв ПСВ ср, °С  [hint: Температура средневзвешенная ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) as decimal(15, 0))
		as "G сум ОСВ за смену, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U00_UM20F702_H1) as decimal(15, 0))
		as "корр G сум ОСВ за смену, т/ч [hint: Масса ОСВ Центр + Док + запад + ВЗРД]",
	CAST(avg(dbo.vst_SafeDIV((U04_UM21F001_h1 * U04_UM21T001_h1 + U06_UM21F001_h1 * U06_UM21T001_h1 + U06_UM22F001_h1 * U06_UM22T001_h1 + U07_UM21G001_h1 * U07_UM21T001_h1 + U05_UM21F001_h1 * U05_UM21T001_h1 + U08_UM21F001_h1 * U08_UM21T001_h1), (U04_UM21F001_h1 + U06_UM21F001_h1 + U06_UM22F001_h1 + U07_UM21G001_h1 + U05_UM21F001_h1 + U08_UM21F001_h1))) as decimal(15, 2))
		as "T ср/взв ОСВ ср, °С  [hint: Температура средневзвешенная ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM41F001_H1) as decimal(15, 0))
		as "G Подп.ТС за смену, т/ч [U04_UM41F001_H1]",
	CAST(sum(U04_UM11W001_H1 + U06_UM11W001_H1 + U07_UM11W001_H1 + U05_UM11W001_H1 + U08_UM11W001_H1) as decimal(15, 0))
		as "W сум ПСВ за смену, ГДж [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM11W002_H1 + U06_UM11W002_H1 + U07_UM11W002_H1 + U05_UM11W002_H1 + U08_UM11W002_H1) as decimal(15, 0))
		as "корр W сум ПСВ за смену, ГКал [hint: Энергия ПСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM21W001_H1 + U06_UM21W001_H1 + U06_UM22W001_H1 + U07_UM21W001_H1 + U05_UM21W001_H1 + U08_UM21W001_H1) as decimal(15, 0))
		as "W сум ОСВ за смену, ГДж [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM21W002_H1 + U06_UM21W002_H1 + U06_UM22W002_H1 + U07_UM21W002_H1 + U05_UM21W002_H1 + U08_UM21W002_H1) as decimal(15, 0))
		as "корр W сум ОСВ за смену, ГКал [hint: Энергия ОСВ Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM31W001_H1 + U06_UM31W001_H1 + U07_UM31W001_H1 + U05_UM31W001_H1 + U08_UM31W001_H1) as decimal(15, 0))
		as "dW сум по маг. за смену, ГДж [hint: Энергия по магистралям Центр + Док + запад + ВЗРД]",
	CAST(sum(U04_UM41W001_H1) as decimal(15, 0))
		as "W Подп.ТС за смену, ГДж [U04_UM41W001_H1]",
	CAST(sum(U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1) as decimal(15, 0))
		as "Баланс по СВ за смену, т/ч [hint: Баланс по сетевой воде с подпиткой за смену]",
	CAST(sum(U00_UM10F702_H1) - SUM(U00_UM20F702_H1) - SUM(U04_UM41F001_H1) as decimal(15, 0))
		as "корр Баланс по СВ за смену, т/ч [hint: Баланс по сетевой воде с подпиткой за смену]",
	CAST(avg(dbo.vst_SafeDIV((U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1 - (U04_UM21F001_H1 + U06_UM21F001_H1 + U06_UM22F001_H1 + U07_UM21G001_H1 + U05_UM21F001_H1 + U08_UM21F001_H1) - U04_UM41F001_H1), (U04_UM11F001_H1 + U06_UM11F001_H1 + U07_UM11G001_H1 + U05_UM11F001_H1 + U08_UM11F001_H1)) * 100) as decimal(6, 2))
		as "Баланс по СВ ср, % [hint: Баланс по сетевой воде с подпиткой за смену]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U04_UM11F001_H1, U04_UM21F001_H1, U04_UM11W001_H1, U04_UM21W001_H1, U04_UM31W001_H1, U06_UM11F001_H1, U06_UM21F001_H1,
	U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1,
	U04_UM21T001_H1, U06_UM21T001_H1, U06_UM22T001_H1 ,  U07_UM21T001_H1, U05_UM21T001_H1,
	CLC_ShiftDuty,
	U00_UM10F702_H1, U00_UM20F702_H1,
	U04_UM11W002_H1, U06_UM11W002_H1, U07_UM11W002_H1, U05_UM11W002_H1,
	U04_UM21W002_H1, U06_UM21W002_H1, U06_UM22W002_H1, U07_UM21W002_H1, U05_UM21W002_H1,
	U08_UM11F001_H1, U08_UM11T001_H1, U08_UM21F001_H1, U08_UM21T001_H1, U08_UM11W001_H1, U08_UM21W001_H1, U08_UM21W002_H1, U08_UM31W001_H1, U08_UM11W002_H1,
	U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1, U07_UM11G001_H1, U07_UM21G001_H1, U07_UM11W001_H1, U07_UM21W001_H1, U07_UM31W001_H1, U05_UM11F001_H1, U05_UM21F001_H1, U05_UM11W001_H1, U05_UM21W001_H1, U05_UM31W001_H1, U04_UM41F001_H1, U04_UM41W001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192 + Runtime.dbo.vst_GetShiftNumber(DateTime))