{минутные срезы}
/*ReportName="ВЕДОМОСТЬ ПТ-35/40-8.8 ст.№3" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые агрегированные"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	null,
	CAST(S3_STKER_Y1 as decimal(15,2)) as " Р акт., МВт [S3_STKER_Y1]",
	CAST(S3_RA10F001g as decimal(15,2)) as "G пара на т/а 3, т/ч [S3_RA10F001G]",
	CAST(S3_SA01P001 as decimal(15,2)) as "P пара перед стоп. клап., МПа [S3_SA01P001]",
	CAST(S3_SA01T001 as decimal(15,2)) as "Т пара в стоп. клапа-не, °С [S3_SA01T001]", 
	null,
	CAST(S3_UP10F001 as decimal(15,2)) as "G пара в произ-ный отб. №1, т/ч [S3_UP10F001]",
	CAST(S3_UP10F002 as decimal(15,2)) as "G пара в произ-ный отб. №2, т/ч  [S3_UP10F002]",
	CAST(S3_UP10P001 as decimal(15,2)) as "P пара в кам. произв. отб. т.1, МПа [S3_UP10P001]",
	CAST(S3_UP10P002 as decimal(15,2)) as "P пара в кам. произв. отб. т.2, МПа [S3_UP10P002]",
	null,
	CAST(S3_UP10P003 as decimal(15,2)) as "P пара в кам. произв. отб. т.3, МПа[S3_UP10P003]",
	CAST(S3_UP10P006 as decimal(15,2)) as "P пара на пр-во т.1, МПа [S3_UP10P006]",
	CAST(S3_UP10P007 as decimal(15,2)) as "P пара на пр-во т.2, МПа[S3_UP10P007]",
	CAST(S3_UP10T001 as decimal(15,2)) as "Т пара в камере пр-го отбора, °С [S3_UP10T001]",
	null,
	CAST(S3_UP10T006 as decimal(15,2)) as "Т пара в отб. на пр-во №1, °С[S3_UP10T006]",
	CAST(S3_UP10T007 as decimal(15,2)) as "Т пара в отб. на пр-во №2, °С[S3_UP10T007]",
	CAST(S3_UN10P001 as decimal(15,2)) as "P пара в камере теплоф-го отб. т.1, кПа[S3_UN10P001]",
	CAST(S3_UN10P002 as decimal(15,2)) as "P пара в камере теплоф-го отб. т.2, кПа[S3_UN10P002]",
	null,
	CAST(S3_UN10P003 as decimal(15,2)) as "P пара в камере теплоф-го отб. т.3, кПа[S3_UN10P003]",
	CAST(S3_UN10P006 as decimal(15,2)) as "P пара на теплоф-ю, кПа [S3_UN10P006]",
	CAST(S3_UN10T001 as decimal(15,2)) as "Т пара в камере теплоф-го отб., °С [S3_UN10T001]",
	CAST(S3_UN10T006 as decimal(15,2)) as "Т пара на теплоф-ю, °С[S3_UN10T006]",
	null,
	CAST(S3_SA10T003 as decimal(15,2)) as "Т пара на выхло-пе т.1, °С [S3_SA10T003]",
	CAST(S3_SA10T004 as decimal(15,2)) as "Т пара на выхло-пе т.2, °С [S3_SA10T004]",
	CAST(S3_SD10P001 as decimal(15,2)) as "P пара в конд-ре, кПа [S3_SD10P001]",
	CAST(S3_RM10F001 as decimal(15,2)) as "G осн. конд. в нап. кол-ре КЭНов, т/ч [S3_RM10F001]",
	null,
	CAST(S3_RK210T001 as decimal(15,2)) as "Т химобес-ой воды в рассечку ПНД-2, ПНД-3, °С [S3_RK210T001]",
	CAST(S3_RM30F001 as decimal(15,2)) as "G осн. конд. от ПНД-3 к Д-6, т/ч[S3_RM30F001]",
	CAST(S3_RM30P001 as decimal(15,2)) as "P осн. конд. после ПНД-3, кПа [S3_RM30P001]",
	CAST(S3_RM30T001 as decimal(15,2)) as "Т осн. конд. на вых. ПНД-3 [S3_RM30T001]",
	null,
	CAST(S3_RL40F001 as decimal(15,2)) as "G пит. воды после ПВД, т/ч [S3_RL40F001]",
	CAST(S3_RL40P002 as decimal(15,2)) as "P пит. воды на вых. ПВД, МПа [S3_RL40P002]",
	CAST(S3_RL40T003 as decimal(15,2)) as "Т пит. воды за груп-пой ПВД, °С [S3_RL40T003]",
	CAST(S3_VC01T001 as decimal(15,2)) as "Т охл-й воды на вх. в конд Нитка №1, °С [S3_VC01T001]",
	null,
	CAST(S3_VC02T001 as decimal(15,2)) as "Т охл-й воды на вх. в конд Нитка №2, °С [S3_VC02T001]",
	CAST(S3_VC01T002 as decimal(15,2)) as "Т охл-й воды на вых. из конд Нитка №1, °С [S3_VC01T002]",
	CAST(S3_VC02T002 as decimal(15,2)) as "Т охл-й воды на вых. из конд Нитка №2, °С [S3_VC02T002]",
	CAST(S3_UM01T001 as decimal(15,2)) as "Т сет-й воды на вх. в конд Нитка №1, °С [S3_UM01T001]",
	null,
	CAST(S3_UM02T001 as decimal(15,2)) as "Т сет-й воды на вх. в конд Нитка №2, °С [S3_UM02T001]",
	CAST(S3_UM01T002 as decimal(15,2)) as "Т сет-й воды на вых. из конд Нитка №1, °С [S3_UM01T002]",
	CAST(S3_UM02T002 as decimal(15,2)) as "Т сет-й воды на вых. из конд Нитка №2, °С [S3_UM02T002]",
	null,
	CAST(S3_UM10T001 as decimal(15,2)) as "Т сет-й воды на вых. из под-ля №1, °С [S3_UM10T001]",
	CAST(S3_UM10T002 as decimal(15,2)) as "Т сет-й воды на вых. из под-ля №2, °С [S3_UM10T002]",
	CAST(S3_UM10T003 as decimal(15,2)) as "Т сет-й воды в общ. под. кол-ре СП, °С [S3_UM10T003]",
	null,
	CAST(S3_UM20T001 as decimal(15,2)) as "Т сет-й воды на вых. из пикового ПСВ, °С [S3_UM20T001]",
	CAST(S3_UM20T002 as decimal(15,2)) as "Т сет-й воды в общ. тр/пр. от СП, °С [S3_UM20T002]",
	CAST(S3_RP10F001 as decimal(15,2)) as "G конд. осн-х бойл-в, т/ч [S3_RP10F001]",
	CAST(S3_RM00T001 as decimal(15,2)) as "Т конд. на сливе из конд-ра, °С [S3_RM00T001]"
FROM
	OpenQuery(INSQL, 
"SELECT DateTime, 
S3_STKER_Y1, S3_RA10F001g, S3_SA01P001, S3_SA01T001,
S3_UP10F001, S3_UP10F002, S3_UP10P001, S3_UP10P002,
S3_UP10P003, S3_UP10P006, S3_UP10P007, S3_UP10T001,
S3_UP10T006, S3_UP10T007, S3_UN10P001, S3_UN10P002,
S3_UN10P003, S3_UN10P006, S3_UN10T001, S3_UN10T006,
S3_SA10T003, S3_SA10T004, S3_SD10P001, S3_RM10F001,
S3_RK210T001, S3_RM30F001, S3_RM30P001, S3_RM30T001, 
S3_RL40F001, S3_RL40P002, S3_RL40T003, S3_VC01T001,
S3_VC02T001, S3_VC01T002, S3_VC02T002, S3_UM01T001,
S3_UM01T002, S3_UM02T001, S3_UM02T002, 
S3_UM10T001, S3_UM10T002, S3_UM10T003,
S3_UM20T001, S3_UM20T002, S3_RP10F001, S3_RM00T001
FROM Runtime.dbo.AnalogWideHistory 
WHERE wwVersion = 'Latest'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish")


{часовые агрегированные}
/*ReportName="ВЕДОМОСТЬ ПТ-35/40-8.8 ст.№3" (часовые агрегированные)*/
/*Mode=часовые-1*/
/*DownQuery=минутные срезы*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0) as "Дата",
	null,
	CAST(AVG(S3_STKER_Y1) as decimal(15,2)) as " Р акт., МВт [S3_STKER_Y1]",
	CAST(AVG(S3_RA10F001g) as decimal(15,2)) as "G пара на т/а 3, т/ч [S3_RA10F001G]",
	CAST(AVG(S3_SA01P001) as decimal(15,2)) as "P пара перед стоп. клап., МПа [S3_SA01P001]",
	CAST(AVG(S3_SA01T001) as decimal(15,2)) as "Т пара в стоп. клапа-не, °С [S3_SA01T001]", 
	null,
	CAST(AVG(S3_UP10F001) as decimal(15,2)) as "G пара в произ-ный отб. №1, т/ч [S3_UP10F001]",
	CAST(AVG(S3_UP10F002) as decimal(15,2)) as "G пара в произ-ный отб. №2, т/ч  [S3_UP10F002]",
	CAST(AVG(S3_UP10P001) as decimal(15,2)) as "P пара в кам. произв. отб. т.1, МПа [S3_UP10P001]",
	CAST(AVG(S3_UP10P002) as decimal(15,2)) as "P пара в кам. произв. отб. т.2, МПа [S3_UP10P002]",
	null,
	CAST(AVG(S3_UP10P003) as decimal(15,2)) as "P пара в кам. произв. отб. т.3, МПа[S3_UP10P003]",
	CAST(AVG(S3_UP10P006) as decimal(15,2)) as "P пара на пр-во т.1, МПа [S3_UP10P006]",
	CAST(AVG(S3_UP10P007) as decimal(15,2)) as "P пара на пр-во т.2, МПа[S3_UP10P007]",
	CAST(AVG(S3_UP10T001) as decimal(15,2)) as "Т пара в камере пр-го отбора, °С [S3_UP10T001]",
	null,
	CAST(AVG(S3_UP10T006) as decimal(15,2)) as "Т пара в отб. на пр-во №1, °С[S3_UP10T006]",
	CAST(AVG(S3_UP10T007) as decimal(15,2)) as "Т пара в отб. на пр-во №2, °С[S3_UP10T007]",
	CAST(AVG(S3_UN10P001) as decimal(15,2)) as "P пара в камере теплоф-го отб. т.1, кПа[S3_UN10P001]",
	CAST(AVG(S3_UN10P002) as decimal(15,2)) as "P пара в камере теплоф-го отб. т.2, кПа[S3_UN10P002]",
	null,
	CAST(AVG(S3_UN10P003) as decimal(15,2)) as "P пара в камере теплоф-го отб. т.3, кПа[S3_UN10P003]",
	CAST(AVG(S3_UN10P006) as decimal(15,2)) as "P пара на теплоф-ю, кПа [S3_UN10P006]",
	CAST(AVG(S3_UN10T001) as decimal(15,2)) as "Т пара в камере теплоф-го отб., °С [S3_UN10T001]",
	CAST(AVG(S3_UN10T006) as decimal(15,2)) as "Т пара на теплоф-ю, °С[S3_UN10T006]",
	null,
	CAST(AVG(S3_SA10T003) as decimal(15,2)) as "Т пара на выхло-пе т.1, °С [S3_SA10T003]",
	CAST(AVG(S3_SA10T004) as decimal(15,2)) as "Т пара на выхло-пе т.2, °С [S3_SA10T004]",
	CAST(AVG(S3_SD10P001) as decimal(15,2)) as "P пара в конд-ре, кПа [S3_SD10P001]",
	CAST(AVG(S3_RM10F001) as decimal(15,2)) as "G осн. конд. в нап. кол-ре КЭНов, т/ч [S3_RM10F001]",
	null,
	CAST(AVG(S3_RK210T001) as decimal(15,2)) as "Т химобес-ой воды в рассечку ПНД-2, ПНД-3, °С [S3_RK210T001]",
	CAST(AVG(S3_RM30F001) as decimal(15,2)) as "G осн. конд. от ПНД-3 к Д-6, т/ч[S3_RM30F001]",
	CAST(AVG(S3_RM30P001) as decimal(15,2)) as "P осн. конд. после ПНД-3, кПа [S3_RM30P001]",
	CAST(AVG(S3_RM30T001) as decimal(15,2)) as "Т осн. конд. на вых. ПНД-3 [S3_RM30T001]",
	null,
	CAST(AVG(S3_RL40F001) as decimal(15,2)) as "G пит. воды после ПВД, т/ч [S3_RL40F001]",
	CAST(AVG(S3_RL40P002) as decimal(15,2)) as "P пит. воды на вых. ПВД, МПа [S3_RL40P002]",
	CAST(AVG(S3_RL40T003) as decimal(15,2)) as "Т пит. воды за груп-пой ПВД, °С [S3_RL40T003]",
	CAST(AVG(S3_VC01T001) as decimal(15,2)) as "Т охл-й воды на вх. в конд Нитка №1, °С [S3_VC01T001]",
	null,
	CAST(AVG(S3_VC02T001) as decimal(15,2)) as "Т охл-й воды на вх. в конд Нитка №2, °С [S3_VC02T001]",
	CAST(AVG(S3_VC01T002) as decimal(15,2)) as "Т охл-й воды на вых. из конд Нитка №1, °С [S3_VC01T002]",
	CAST(AVG(S3_VC02T002) as decimal(15,2)) as "Т охл-й воды на вых. из конд Нитка №2, °С [S3_VC02T002]",
	CAST(AVG(S3_UM01T001) as decimal(15,2)) as "Т сет-й воды на вх. в конд Нитка №1, °С [S3_UM01T001]",
	null,
	CAST(AVG(S3_UM02T001) as decimal(15,2)) as "Т сет-й воды на вх. в конд Нитка №2, °С [S3_UM02T001]",
	CAST(AVG(S3_UM01T002) as decimal(15,2)) as "Т сет-й воды на вых. из конд Нитка №1, °С [S3_UM01T002]",
	CAST(AVG(S3_UM02T002) as decimal(15,2)) as "Т сет-й воды на вых. из конд Нитка №2, °С [S3_UM02T002]",
	null,
	CAST(AVG(S3_UM10T001) as decimal(15,2)) as "Т сет-й воды на вых. из под-ля №1, °С [S3_UM10T001]",
	CAST(AVG(S3_UM10T002) as decimal(15,2)) as "Т сет-й воды на вых. из под-ля №2, °С [S3_UM10T002]",
	CAST(AVG(S3_UM10T003) as decimal(15,2)) as "Т сет-й воды в общ. под. кол-ре СП, °С [S3_UM10T003]",
	null,
	CAST(AVG(S3_UM20T001) as decimal(15,2)) as "Т сет-й воды на вых. из пикового ПСВ, °С [S3_UM20T001]",
	CAST(AVG(S3_UM20T002) as decimal(15,2)) as "Т сет-й воды в общ. тр/пр. от СП, °С [S3_UM20T002]",
	CAST(AVG(S3_RP10F001) as decimal(15,2)) as "G конд. осн-х бойл-в, т/ч [S3_RP10F001]",
	CAST(AVG(S3_RM00T001) as decimal(15,2)) as "Т конд. на сливе из конд-ра, °С [S3_RM00T001]"
FROM
	OpenQuery(INSQL,
	"Select DateTime,
	S3_STKER_Y1, S3_RA10F001g, S3_SA01P001, S3_SA01T001,
	S3_UP10F001, S3_UP10F002, S3_UP10P001, S3_UP10P002,
	S3_UP10P003, S3_UP10P006, S3_UP10P007, S3_UP10T001,
	S3_UP10T006, S3_UP10T007, S3_UN10P001, S3_UN10P002,
	S3_UN10P003, S3_UN10P006, S3_UN10T001, S3_UN10T006,
	S3_SA10T003, S3_SA10T004, S3_SD10P001, S3_RM10F001,
	S3_RK210T001, S3_RM30F001, S3_RM30P001, S3_RM30T001, 
	S3_RL40F001, S3_RL40P002, S3_RL40T003, S3_VC01T001,
	S3_VC02T001, S3_VC01T002, S3_VC02T002, S3_UM01T001,
	S3_UM01T002, S3_UM02T001, S3_UM02T002, 
	S3_UM10T001, S3_UM10T002, S3_UM10T003,
	S3_UM20T001, S3_UM20T002, S3_RP10F001, S3_RM00T001
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0)
Order By
	DateAdd(hour, DateDiff(hour, 0, DateTime), 0)