{минутные срезы}
/*ReportName=ТС "ДОК" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(U06_UM11F001*U06_SY00A700 as decimal(15,0)) as "G ПСВ, т/ч [U06_UM11F001]",
	CAST(U06_UM11P001*U06_SY00A700 as decimal(15,2)) as "P ПСВ, изб.МПа [U06_UM11P001]",
	CAST(U06_UM11T001*U06_SY00A700 as decimal(15,2)) as "T ПСВ, °С [U06_UM11T001]",
	CAST(U06_UM21F001*U06_SY00A700 as decimal(15,0)) as "G ОСВ1, т/ч [U06_UM21F001]",
	CAST(U06_UM21P001*U06_SY00A700 as decimal(15,2)) as "P ОСВ1, абс.МПа [U06_UM21P001]",
	CAST(U06_UM21T001*U06_SY00A700 as decimal(15,2)) as "T ОСВ1, °С [U06_UM21T001]",
	CAST(U06_UM22F001*U06_SY00A700 as decimal(15,0)) as "G ОСВ2, т/ч [U06_UM22F001]",
	CAST(U06_UM21P002*U06_SY00A700 as decimal(15,2)) as "P ОСВ2, абс.МПа [U06_UM21P002]",
	CAST(U06_UM22T001*U06_SY00A700 as decimal(15,2)) as "T ОСВ2, °С [U06_UM22T001]",
	CAST(U06_VB00T001*U06_SY00A700 as decimal(15,2)) as "Tхв, °С [U06_VB00T001]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U06_VB00T001, U06_SY00A700, U06_UM11P001, U06_UM21P001, U06_UM22P001, U06_UM21P002, U06_UM11T001, U06_UM21T001, U06_UM22T001, U06_UM11F001, U06_UM21F001, U06_UM22F001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ТС "ДОК" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U06_UM11F001_H1 as decimal(15,0)) as "G ПСВ за п/ч, т/ч [U06_UM11F001_H1]",
	CAST(U06_UM11F001_H1*dbo.vst_SafeDIV(U00_UM10F702_H1,U00_UM10F701_H1) as decimal(15,0)) as "корр G ПСВ за п/ч, т/ч",
	CAST(U06_UM11P001_H1 as decimal(15,2)) as "P ПСВ за п/ч, абс.МПа [U06_UM11P001_H1]",
	CAST(U06_UM11T001_H1 as decimal(15,2)) as "T ПСВ за п/ч, °С [U06_UM11T001_H1]",
	CAST(U06_UM21F001_H1 as decimal(15,0)) as "G ОСВ1 за п/ч, т/ч [U06_UM21F001_H1]",
	CAST(U06_UM21F001_H1*dbo.vst_SafeDIV(U00_UM20F702_H1,U00_UM20F701_H1) as decimal(15,0)) as "G ОСВ1 за п/ч, т/ч [U06_UM21F001_H1]",
	CAST(U06_UM21P001_H1 as decimal(15,2)) as "P ОСВ1 за п/ч, абс.МПа [U06_UM21P001_H1]",
	CAST(U06_UM21T001_H1 as decimal(15,2)) as "T ОСВ1 за п/ч, °С [U06_UM21T001_H1]",
	CAST(U06_UM22F001_H1 as decimal(15,0)) as "G ОСВ2 за п/ч, т/ч [U06_UM22F001_H1]",
	CAST(U06_UM22F001_H1*dbo.vst_SafeDIV(U00_UM20F702_H1,U00_UM20F701_H1) as decimal(15,0)) as "G ОСВ2 за п/ч, т/ч [U06_UM22F001_H1]",
	/*CAST(U06_UM22P001_H1 as decimal(15,2)) as "P ОСВ2 за п/ч, абс.МПа [U06_UM22P001_H1]",*/
	CAST(U06_UM22T001_H1 as decimal(15,2)) as "T ОСВ2 за п/ч, °С [U06_UM22T001_H1]",
	CAST(U06_UM11W001_H1 as decimal(15,0)) as "W ПСВ за п/ч, ГДж [U06_UM11W001_H1]",
	CAST(isnull(U06_UM11W002_H1,0) as decimal(15,0)) as "корр W ПСВ за п/ч, ГКал",
	CAST(U06_UM21W001_H1 as decimal(15,0)) as "W ОСВ1 за п/ч, ГДж [U06_UM21W001_H1]",
	CAST(isnull(U06_UM21W002_H1,0) as decimal(15,0)) as "корр W ОСВ за п/ч, ГКал",
	CAST(U06_UM22W001_H1 as decimal(15,0)) as "W ОСВ2 за п/ч, ГДж [U06_UM22W001_H1]",
	CAST(isnull(U06_UM22W002_H1,0) as decimal(15,0)) as "корр W ОСВ за п/ч, ГКал",
	CAST(U06_UM31W001_H1 as decimal(15,0)) as "dW по МАГ за п/ч, ГДж [U06_UM31W001_H1]",
	CAST(isnull(U06_UM11W002_H1,0)-isnull(U06_UM21W002_H1,0)-isnull(U06_UM22W002_H1,0) as decimal(15,0)) as "dW по маг.за п/ч, ГКал",
	CAST(U06_VB00T001*U06_SY00A700 as decimal(15,2)) as "Tхв мгн, °С [Мгновенный срез Т источника на конец часа]",
	CAST(U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1 as decimal(15,0)) as "Бал. G за п/ч, т/ч [Баланс ПСВ-ОСВ1-ОСВ2 за пр. час]",
	CAST((U06_UM11F001_H1*dbo.vst_SafeDIV(U00_UM10F702_H1,U00_UM10F701_H1))-(U06_UM21F001_H1*dbo.vst_SafeDIV(U00_UM20F702_H1,U00_UM20F701_H1))-(U06_UM22F001_H1*dbo.vst_SafeDIV(U00_UM20F702_H1,U00_UM20F701_H1)) as decimal(15,0)) as "корр Бал. G за п/ч, т/ч [Баланс ПСВ-ОСВ1-ОСВ2 за пр. час]",
	CAST(dbo.vst_SafeDIV((U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1),(U06_UM11F001_H1))*100 as decimal(15,2)) as "Бал. G за п/ч, % [Баланс ПСВ-ОСВ1-ОСВ2 за пр. час]",
	CAST(dbo.vst_SafeDIV(((U06_UM11F001_H1*dbo.vst_SafeDIV(U00_UM10F702_H1,U00_UM10F701_H1))-(U06_UM21F001_H1*dbo.vst_SafeDIV(U00_UM20F702_H1,U00_UM20F701_H1))-(U06_UM22F001_H1*dbo.vst_SafeDIV(U00_UM20F702_H1,U00_UM20F701_H1))),(U06_UM11F001_H1))*100 as decimal(15,2)) as "корр Бал. G за п/ч, % [Баланс ПСВ-ОСВ за пр. час]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U06_UM11T001_H1, U06_UM21T001_H1, U06_UM22T001_H1, U06_UM11P001_H1, U06_UM21P001_H1, U06_UM22P001_H1, 
	U06_UM11W002_H1,U06_UM21W002_H1, U06_UM22W002_H1,
	U00_UM10F702_H1,U00_UM10F701_H1,
	U00_UM20F702_H1,U00_UM20F701_H1,
	U06_VB00T001, U06_SY00A700,
	U06_UM11F001_H1, U06_UM21F001_H1, U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ТС "ДОК" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(U06_UM11F001_S1 as decimal(15,0)) as "G ПСВ за п/с, т/ч [U06_UM11F001_S1]",
	CAST(U06_UM11P001_S1 as decimal(15,2)) as "P ПСВ за п/с, абс.МПа [U06_UM11P001_S1]",
	CAST(U06_UM11T001_S1 as decimal(15,2)) as "T ПСВ за п/с, °С [U06_UM11T001_S1]",
	CAST(U06_UM11T002_S1 as decimal(15,2)) as "Tср.взв. ПСВ за п/с, °С [U06_UM11T002_S1]",
	CAST(U06_UM21F001_S1 as decimal(15,0)) as "G ОСВ1 за п/с, т/с [U06_UM21F001_S1]",
	CAST(U06_UM21P001_S1 as decimal(15,2)) as "P ОСВ1 за п/с, абс.МПа [U06_UM21P001_S1]",
	CAST(U06_UM21T001_S1 as decimal(15,2)) as "T ОСВ1 за п/с, °С [U06_UM21T001_S1]",
	CAST(U06_UM21T002_S1 as decimal(15,2)) as "Tср.взв. ОСВ1 за п/с, °С [U06_UM21T002_S1]",
	CAST(U06_UM22F001_S1 as decimal(15,0)) as "G ОСВ2 за п/с, т/ч [U06_UM22F001_S1]",
	/*CAST(U06_UM22P001_S1 as decimal(15,2)) as "P ОСВ2 за п/с, абс.МПа [U06_UM22P001_S1]",*/
	CAST(U06_UM22T001_S1 as decimal(15,2)) as "T ОСВ2 за п/с, °С [U06_UM22T001_S1]",
	CAST(U06_UM22T002_S1 as decimal(15,2)) as "Tср.взв. ОСВ2 за п/с, °С [U06_UM22T002_S1]",
	CAST(U06_UM11W001_S1 as decimal(15,0)) as "W ПСВ за п/ч, ГДж [U06_UM11W001_S1]",
	CAST(U06_UM21W001_S1 as decimal(15,0)) as "W ОСВ1 за п/ч, ГДж [U06_UM21W001_S1]",
	CAST(U06_UM22W001_S1 as decimal(15,0)) as "W ОСВ2 за п/ч, ГДж [U06_UM22W001_S1]",
	CAST(isnull(U06_UM31W001_S1,0) as decimal(15,0)) as "dW по МАГ за п/ч, ГДж [U06_UM31W001_S1]",
	CAST(isnull(U06_VB00T001_S1,0) as decimal(9,2)) as "Tхв за п/с, °С [U06_VB00T001_S1]",
	/*
	CAST(U06_UM11F001_S1-U06_UM21F001_S1-U06_UM22F001_S1 as decimal(15,0)) as "Бал. G за п/c, т/ч [Баланс ПСВ-ОСВ1-ОСВ2 за пр.сут]",
	CAST(dbo.vst_SafeDIV((U06_UM11F001_S1-U06_UM21F001_S1-U06_UM22F001_S1),(U06_UM11F001_S1))*100 as decimal(15,0)) as "Бал. G за п/c, % [Баланс ПСВ-ОСВ1-ОСВ2 за пр. сут]",
	CAST(dbo.vst_SafeDIV((U06_UM11F001_S1),(U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1))*(U04_UM41F001_S1+U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1+U04_UM21F001_S1+U06_UM21F001_S1+U06_UM22F001_S1+/*U07_UM21G001_S1+*/U05_UM21F001_S1)/2 as decimal(15,0)) as "кор G ПСВ",
	CAST(dbo.vst_SafeDIV((U06_UM21F001_S1),(U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1-U04_UM41F001_S1))*(((U04_UM41F001_S1+U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1+U04_UM21F001_S1+U06_UM21F001_S1+U06_UM22F001_S1+/*U07_UM21G001_S1+*/U05_UM21F001_S1)/2)-U04_UM41F001_S1) as decimal(15,0)) as "кор G ОСВ 1",
	CAST(dbo.vst_SafeDIV((U06_UM22F001_S1),(U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1-U04_UM41F001_S1))*(((U04_UM41F001_S1+U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1+U04_UM21F001_S1+U06_UM21F001_S1+U06_UM22F001_S1+/*U07_UM21G001_S1+*/U05_UM21F001_S1)/2)-U04_UM41F001_S1) as decimal(15,0)) as "кор G ОСВ 2",
	*/
	CAST(U06_UM11W002_S1 as decimal(15,0)) as "кор W ПСВ за п/с, Гкал [U04_UM11W002_S1]",
	CAST(isnull(U06_UM21W002_S1,0)+isnull(U06_UM22W002_S1,0) as decimal(15,0)) as "кор W ОСВ за п/с, Гкал [U04_UM21W002_S1]",
	CAST(isnull(U06_UM11W002_S1,0)-(isnull(U06_UM21W002_S1,0)+isnull(U06_UM22W002_S1,0)) as decimal(15,0)) as "кор dW по МАГ за п/с, Гкал "
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U06_UM11T001_S1, U06_UM21T001_S1, U06_UM22T001_S1, U06_UM11P001_S1, U06_UM21P001_S1, U06_UM22P001_S1, 
	U06_VB00T001_S1,
	U06_UM11T002_S1, U06_UM21T002_S1, U06_UM22T002_S1,
	U06_UM11F001_S1, U06_UM21F001_S1, U06_UM22F001_S1, U06_UM11W001_S1, U06_UM21W001_S1, U06_UM22W001_S1, U06_UM31W001_S1,
	U04_UM41F001_S1, U04_UM11F001_S1, U04_UM21F001_S1,
	U05_UM11F001_S1, U05_UM21F001_S1,
	U06_UM11F001_S1, U06_UM21F001_S1, U06_UM22F001_S1,
	U07_UM11G001_S1,
	U06_UM11W002_S1,U06_UM21W002_S1,U06_UM22W002_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName=ТС  "ДОК" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty) as "Cме- на [CLC_ShiftDuty]",
	CAST(U06_UM11F001_H1 as decimal(15,0)) as "G ПСВ за п/ч, т/ч [U06_UM11F001_H1]",
	CAST(U06_UM11P001_H1 as decimal(15,2)) as "P ПСВ за п/ч, абс.МПа [U06_UM11P001_H1]",
	CAST(U06_UM11T001_H1 as decimal(15,2)) as "T ПСВ за п/ч, °С [U06_UM11T001_H1]",
	CAST(U06_UM21F001_H1 as decimal(15,0)) as "G ОСВ1 за п/ч, т/ч [U06_UM21F001_H1]",
	CAST(U06_UM21P001_H1 as decimal(15,2)) as "P ОСВ1 за п/ч, абс.МПа [U06_UM21P001_H1]",
	CAST(U06_UM21T001_H1 as decimal(15,2)) as "T ОСВ1 за п/ч, °С [U06_UM21T001_H1]",
	CAST(U06_UM22F001_H1 as decimal(15,0)) as "G ОСВ2 за п/ч, т/ч [U06_UM22F001_H1]",
	CAST(U06_UM22T001_H1 as decimal(15,2)) as "T ОСВ2 за п/ч, °С [U06_UM22T001_H1]",
	CAST(U06_UM11W001_H1 as decimal(15,0)) as "W ПСВ за п/ч, ГДж [U06_UM11W001_H1]",
	CAST(U06_UM21W001_H1 as decimal(15,0)) as "W ОСВ1 за п/ч, ГДж [U06_UM21W001_H1]",
	CAST(U06_UM22W001_H1 as decimal(15,0)) as "W ОСВ2 за п/ч, ГДж [U06_UM22W001_H1]",
	CAST(U06_UM31W001_H1 as decimal(15,0)) as "dW по МАГ за п/ч, ГДж [U06_UM31W001_H1]",
	CAST(U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1 as decimal(15,0)) as "Бал. G за п/ч, т/ч [Баланс ПСВ-ОСВ1-ОСВ2 за пр. час]",
	CAST(dbo.vst_SafeDIV((U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1),(U06_UM11F001_H1))*100 as decimal(15,2)) as "Бал. G за п/ч, % [Баланс ПСВ-ОСВ1-ОСВ2 за пр. час]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U06_UM11T001_H1, U06_UM21T001_H1, U06_UM22T001_H1, U06_UM11P001_H1, U06_UM21P001_H1, U06_UM22P001_H1, CLC_ShiftDuty,
	U06_UM11F001_H1, U06_UM21F001_H1, U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName=ТС "ДОК"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]",
	CAST(sum(U06_UM11F001_H1) as decimal(15,0)) as "G ПСВ за смену, т/см [U06_UM11F001_H1]",
	CAST(AVG(U06_UM11P001_H1) as decimal(15,2)) as "P ПСВ ср, абс.МПа [U06_UM11P001_H1]",
	CAST(AVG(U06_UM11T001_H1) as decimal(15,2)) as "T ПСВ ср, °С [U06_UM11T001_H1]",
	CAST(sum(U06_UM21F001_H1) as decimal(15,0)) as "G ОСВ1 за смену, т/см [U06_UM21F001_H1]",
	CAST(AVG(U06_UM21P001_H1) as decimal(15,2)) as "P ОСВ1 ср, абс.МПа [U06_UM21P001_H1]",
	CAST(AVG(U06_UM21T001_H1) as decimal(15,2)) as "T ОСВ1 ср, °С [U06_UM21T001_H1]",
	CAST(sum(U06_UM22F001_H1) as decimal(15,0)) as "G ОСВ2 за смену, т/см [U06_UM22F001_H1]",
	CAST(AVG(U06_UM22T001_H1) as decimal(15,2)) as "T ОСВ2 ср, °С [U06_UM22T001_H1]",
	CAST(sum(U06_UM11W001_H1) as decimal(15,0)) as "W ПСВ за смену, ГДж [U06_UM11W001_H1]",
	CAST(sum(U06_UM21W001_H1) as decimal(15,0)) as "W ОСВ1 за смену, ГДж [U06_UM21W001_H1]",
	CAST(sum(U06_UM22W001_H1) as decimal(15,0)) as "W ОСВ2 за смену, ГДж [U06_UM22W001_H1]",
	CAST(sum(U06_UM31W001_H1) as decimal(15,0)) as "dW по МАГ за смену, ГДж [U06_UM31W001_H1]",
	CAST(sum(U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1) as decimal(15,0)) as "Бал. G за смену, т/см [Баланс ПСВ-ОСВ1-ОСВ2 за смену]",
	CAST(AVG(dbo.vst_SafeDIV((U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1),(U06_UM11F001_H1))*100) as decimal(15,2)) as "Бал. G ср, % [Баланс ПСВ-ОСВ1-ОСВ2 за  смену]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U06_UM11T001_H1, U06_UM21T001_H1, U06_UM22T001_H1, U06_UM11P001_H1, U06_UM21P001_H1, U06_UM22P001_H1, CLC_ShiftDuty,
	U06_UM11F001_H1, U06_UM21F001_H1, U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1
	FROM Runtime.dbo.AnalogWideHistory 
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
/*ReportName=ТС "ДОК" (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT 
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]", 
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(U06_UM11F001_H1) as decimal(15,0)) as "G ПСВ сум, т/см [U06_UM11F001_H1]",
	CAST(AVG(U06_UM11P001_H1) as decimal(15,2)) as "P ПСВ ср, абс.МПа [U06_UM11P001_H1]",
	CAST(AVG(U06_UM11T001_H1) as decimal(15,2)) as "T ПСВ ср, °С [U06_UM11T001_H1]",
	CAST(sum(U06_UM21F001_H1) as decimal(15,0)) as "G ОСВ1 сум, т/см [U06_UM21F001_H1]",
	CAST(AVG(U06_UM21P001_H1) as decimal(15,2)) as "P ОСВ1 ср, абс.МПа [U06_UM21P001_H1]",
	CAST(AVG(U06_UM21T001_H1) as decimal(15,2)) as "T ОСВ1 ср, °С [U06_UM21T001_H1]",
	CAST(sum(U06_UM22F001_H1) as decimal(15,0)) as "G ОСВ2 сум, т/см [U06_UM22F001_H1]",
	CAST(AVG(U06_UM22T001_H1) as decimal(15,2)) as "T ОСВ2 ср, °С [U06_UM22T001_H1]",
	CAST(sum(U06_UM11W001_H1) as decimal(15,0)) as "W ПСВ сум, ГДж [U06_UM11W001_H1]",
	CAST(sum(U06_UM21W001_H1) as decimal(15,0)) as "W ОСВ1 сум, ГДж [U06_UM21W001_H1]",
	CAST(sum(U06_UM22W001_H1) as decimal(15,0)) as "W ОСВ2 сум, ГДж [U06_UM22W001_H1]",
	CAST(sum(U06_UM31W001_H1) as decimal(15,0)) as "dW по МАГ сум, ГДж [U06_UM31W001_H1]",
	CAST(sum(U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1) as decimal(15,0)) as "Бал. G сум, т/см [Баланс ПСВ-ОСВ1-ОСВ2 по сменам]",
	CAST(AVG(dbo.vst_SafeDIV((U06_UM11F001_H1-U06_UM21F001_H1-U06_UM22F001_H1),(U06_UM11F001_H1))*100) as decimal(15,2)) as "Бал. G ср, % [Баланс ПСВ-ОСВ1-ОСВ2 по сменам]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U06_UM11T001_H1, U06_UM21T001_H1, U06_UM22T001_H1, U06_UM11P001_H1, U06_UM21P001_H1, U06_UM22P001_H1, CLC_ShiftDuty,
	U06_UM11F001_H1, U06_UM21F001_H1, U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1
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