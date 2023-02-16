{минутные срезы}
/*ReportName=Уставки по теплосети и пару (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	null,
	CAST(U04_UM11P001_Lo as decimal(15,5)) as "Давление ПСВ сетевой воды (min)  [Edit:m1|U04_UM11P001_Lo]",
	CAST(U04_UM11P001_Hi as decimal(15,5)) as "Давление ПСВ сетевой воды (max) [Edit:m1|U04_UM11P001_Hi]",
	CAST(U04_UM11T001_Lo as decimal(15,5)) as "Температура ПСВ сетевой воды (min)  [Edit:m1|U04_UM11T001_Lo]",
	CAST(U04_UM11T001_Hi as decimal(15,5)) as "Температура ПСВ сетевой воды (max) [Edit:m1|U04_UM11T001_Hi]",
	null,
	CAST(U04_UM21P001_Lo as decimal(15,5)) as "Давление ОСВ сетевой воды (min)  [Edit:m1|U04_UM11P001_Lo]",
	CAST(U04_UM21P001_Hi as decimal(15,5)) as "Давление ОСВ сетевой воды (max) [Edit:m1|U04_UM11P001_Hi]",
	CAST(U04_UM21T001_Lo as decimal(15,5)) as "Температура ОСВ сетевой воды (min)  [Edit:m1|U04_UM11T001_Lo]",
	CAST(U04_UM21T001_Hi as decimal(15,5)) as "Температура ОСВ сетевой воды (max) [Edit:m1|U04_UM11T001_Hi]",
	null,
	CAST(U02_UN12P001_Lo as decimal(15,5)) as "Давление пара ДОК-28 (min) [Edit:m1|U02_UN12P001_Lo]",
	CAST(U02_UN12P001_Hi as decimal(15,5)) as "Давление пара ДОК-28 (max) [Edit:m1|U02_UN12P001_Hi]",
	CAST(U02_UN12T001_Lo as decimal(15,5)) as "Температура пара ДОК-28 (min) [Edit:m1|U02_UN12T001_Lo]",
	CAST(U02_UN12T001_Hi as decimal(15,5)) as "Температура пара ДОК-28 (max) [Edit:m1|U02_UN12T001_Hi]",
	null,
	CAST(U02_UN11P001_Lo as decimal(15,5)) as "Давление пара ДОК-19 (min) [Edit:m1|U02_UN11P001_Lo]",
	CAST(U02_UN11P001_Hi as decimal(15,5)) as "Давление пара ДОК-19 (max) [Edit:m1|U02_UN11P001_Hi]",
	CAST(U02_UN11T001_Lo as decimal(15,5)) as "Температура пара ДОК-19 (min) [Edit:m1|U02_UN11T001_lo]",
	CAST(U02_UN11T001_Hi as decimal(15,5)) as "Температура пара ДОК-19 (max) [Edit:m1|U02_UN11T001_Hi]",
	null,
	CAST(U01_UN11P001_Lo as decimal(15,5)) as "Давление пара КИМ (min) [Edit:m1|U01_UN11P001_Lo]",
	CAST(U01_UN11P001_Hi as decimal(15,5)) as "Давление пара КИМ (max) [Edit:m1|U01_UN11P001_Hi]",
	CAST(U01_UN11T001_Lo as decimal(15,5)) as "Температура пара КИМ (min) [Edit:m1|U01_UN11T001_Lo]",
	CAST(U01_UN11T001_Hi as decimal(15,5)) as "Температура пара КИМ (max) [Edit:m1|U01_UN11T001_Hi]",
	null,
	CAST(U1_Ppar_3_1_lO as decimal(15,5)) as "Давление пара ВЗРД (min) [Edit:m1|U1_Ppar_3_1_lO]",
	CAST(U1_Ppar_3_1_Hi as decimal(15,5)) as "Давление пара ВЗРД (max) [Edit:m1|U1_Ppar_3_1_Hi]",
	CAST(U1_Tpar_3_1_lO as decimal(15,5)) as "Температура пара ВЗРД (min) [Edit:m1|U1_Tpar_3_1_lO]",
	CAST(U1_Tpar_3_1_Hi as decimal(15,5)) as "Температура пара ВЗРД (max) [Edit:m1|U1_Tpar_3_1_Hi]",
	null,
	CAST(H03_VR11F001_Hi as decimal(15,5)) as "Расход речной воды (max) [Edit:m1|H03_VR11F001_Hi]",
	null,
	CAST(H03_VG11F001_Hi as decimal(15,5)) as "Расход городской воды (max) [Edit:m1|H03_VG11F001_Hi]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	U04_UM11P001_Hi, U04_UM11T001_Hi, U04_UM11P001_Lo, U04_UM11T001_Lo,
	U04_UM21P001_Hi, U04_UM21T001_Hi, U04_UM21P001_Lo, U04_UM21T001_Lo,
	U01_UN11T001_Hi, U01_UN11T001_Lo, U01_UN11P001_Hi, U01_UN11P001_Lo,
	U02_UN11T001_Hi, U02_UN11T001_Lo, U02_UN11P001_Hi, U02_UN11P001_Lo,
	U02_UN12T001_Hi, U02_UN12T001_Lo, U02_UN12P001_Hi, U02_UN12P001_Lo,
	U1_Ppar_3_1_Hi, U1_Ppar_3_1_lO, U1_Tpar_3_1_Hi, U1_Tpar_3_1_lO,
	H03_VR11F001_Hi,H03_VG11F001_Hi
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Уставки по теплосети и пару (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(U04_UM11P001_Lo as decimal(15,5)) as "Давление ПСВ сетевой воды (min)  [Edit:m1|U04_UM11P001_Lo]",
	CAST(U04_UM11P001_Hi as decimal(15,5)) as "Давление ПСВ сетевой воды (max) [Edit:m1|U04_UM11P001_Hi]",
	CAST(U04_UM11T001_Lo as decimal(15,5)) as "Температура ПСВ сетевой воды (min)  [Edit:m1|U04_UM11T001_Lo]",
	CAST(U04_UM11T001_Hi as decimal(15,5)) as "Температура ПСВ сетевой воды (max) [Edit:m1|U04_UM11T001_Hi]",
	null,
	CAST(U04_UM21P001_Lo as decimal(15,5)) as "Давление ОСВ сетевой воды (min)  [Edit:m1|U04_UM11P001_Lo]",
	CAST(U04_UM21P001_Hi as decimal(15,5)) as "Давление ОСВ сетевой воды (max) [Edit:m1|U04_UM11P001_Hi]",
	CAST(U04_UM21T001_Lo as decimal(15,5)) as "Температура ОСВ сетевой воды (min)  [Edit:m1|U04_UM11T001_Lo]",
	CAST(U04_UM21T001_Hi as decimal(15,5)) as "Температура ОСВ сетевой воды (max) [Edit:m1|U04_UM11T001_Hi]",
	null,
	CAST(U02_UN12P001_Lo as decimal(15,5)) as "Давление пара ДОК-28 (min) [Edit:m1|U02_UN12P001_Lo]",
	CAST(U02_UN12P001_Hi as decimal(15,5)) as "Давление пара ДОК-28 (max) [Edit:m1|U02_UN12P001_Hi]",
	CAST(U02_UN12T001_Lo as decimal(15,5)) as "Температура пара ДОК-28 (min) [Edit:m1|U02_UN12T001_Lo]",
	CAST(U02_UN12T001_Hi as decimal(15,5)) as "Температура пара ДОК-28 (max) [Edit:m1|U02_UN12T001_Hi]",
	null,
	CAST(U02_UN11P001_Lo as decimal(15,5)) as "Давление пара ДОК-19 (min) [Edit:m1|U02_UN11P001_Lo]",
	CAST(U02_UN11P001_Hi as decimal(15,5)) as "Давление пара ДОК-19 (max) [Edit:m1|U02_UN11P001_Hi]",
	CAST(U02_UN11T001_Lo as decimal(15,5)) as "Температура пара ДОК-19 (min) [Edit:m1|U02_UN11T001_lo]",
	CAST(U02_UN11T001_Hi as decimal(15,5)) as "Температура пара ДОК-19 (max) [Edit:m1|U02_UN11T001_Hi]",
	null,
	CAST(U01_UN11P001_Lo as decimal(15,5)) as "Давление пара КИМ (min) [Edit:m1|U01_UN11P001_Lo]",
	CAST(U01_UN11P001_Hi as decimal(15,5)) as "Давление пара КИМ (max) [Edit:m1|U01_UN11P001_Hi]",
	CAST(U01_UN11T001_Lo as decimal(15,5)) as "Температура пара КИМ (min) [Edit:m1|U01_UN11T001_Lo]",
	CAST(U01_UN11T001_Hi as decimal(15,5)) as "Температура пара КИМ (max) [Edit:m1|U01_UN11T001_Hi]",
	null,
	CAST(U1_Ppar_3_1_lO as decimal(15,5)) as "Давление пара ВЗРД (min) [Edit:m1|U1_Ppar_3_1_lO]",
	CAST(U1_Ppar_3_1_Hi as decimal(15,5)) as "Давление пара ВЗРД (max) [Edit:m1|U1_Ppar_3_1_Hi]",
	CAST(U1_Tpar_3_1_lO as decimal(15,5)) as "Температура пара ВЗРД (min) [Edit:m1|U1_Tpar_3_1_lO]",
	CAST(U1_Tpar_3_1_Hi as decimal(15,5)) as "Температура пара ВЗРД (max) [Edit:m1|U1_Tpar_3_1_Hi]",
	null,
	CAST(H03_VR11F001_Hi as decimal(15,5)) as "Расход речной воды (max) [Edit:m1|H03_VR11F001_Hi]",
	null,
	CAST(H03_VG11F001_Hi as decimal(15,5)) as "Расход городской воды (max) [Edit:m1|H03_VG11F001_Hi]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	U04_UM11P001_Hi, U04_UM11T001_Hi, U04_UM11P001_Lo, U04_UM11T001_Lo,
	U04_UM21P001_Hi, U04_UM21T001_Hi, U04_UM21P001_Lo, U04_UM21T001_Lo,
	U01_UN11T001_Hi, U01_UN11T001_Lo, U01_UN11P001_Hi, U01_UN11P001_Lo,
	U02_UN11T001_Hi, U02_UN11T001_Lo, U02_UN11P001_Hi, U02_UN11P001_Lo,
	U02_UN12T001_Hi, U02_UN12T001_Lo, U02_UN12P001_Hi, U02_UN12P001_Lo,
	U1_Ppar_3_1_Hi, U1_Ppar_3_1_lO, U1_Tpar_3_1_Hi, U1_Tpar_3_1_lO,
	H03_VR11F001_Hi,H03_VG11F001_Hi
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Уставки по теплосети и пару (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(U04_UM11P001_Lo as decimal(15,5)) as "Давление ПСВ сетевой воды (min)  [Edit:m1|U04_UM11P001_Lo]",
	CAST(U04_UM11P001_Hi as decimal(15,5)) as "Давление ПСВ сетевой воды (max) [Edit:m1|U04_UM11P001_Hi]",
	CAST(U04_UM11T001_Lo as decimal(15,5)) as "Температура ПСВ сетевой воды (min)  [Edit:m1|U04_UM11T001_Lo]",
	CAST(U04_UM11T001_Hi as decimal(15,5)) as "Температура ПСВ сетевой воды (max) [Edit:m1|U04_UM11T001_Hi]",
	null,
	CAST(U04_UM21P001_Lo as decimal(15,5)) as "Давление ОСВ сетевой воды (min)  [Edit:m1|U04_UM11P001_Lo]",
	CAST(U04_UM21P001_Hi as decimal(15,5)) as "Давление ОСВ сетевой воды (max) [Edit:m1|U04_UM11P001_Hi]",
	CAST(U04_UM21T001_Lo as decimal(15,5)) as "Температура ОСВ сетевой воды (min)  [Edit:m1|U04_UM11T001_Lo]",
	CAST(U04_UM21T001_Hi as decimal(15,5)) as "Температура ОСВ сетевой воды (max) [Edit:m1|U04_UM11T001_Hi]",
	null,
	CAST(U02_UN12P001_Lo as decimal(15,5)) as "Давление пара ДОК-28 (min) [Edit:m1|U02_UN12P001_Lo]",
	CAST(U02_UN12P001_Hi as decimal(15,5)) as "Давление пара ДОК-28 (max) [Edit:m1|U02_UN12P001_Hi]",
	CAST(U02_UN12T001_Lo as decimal(15,5)) as "Температура пара ДОК-28 (min) [Edit:m1|U02_UN12T001_Lo]",
	CAST(U02_UN12T001_Hi as decimal(15,5)) as "Температура пара ДОК-28 (max) [Edit:m1|U02_UN12T001_Hi]",
	null,
	CAST(U02_UN11P001_Lo as decimal(15,5)) as "Давление пара ДОК-19 (min) [Edit:m1|U02_UN11P001_Lo]",
	CAST(U02_UN11P001_Hi as decimal(15,5)) as "Давление пара ДОК-19 (max) [Edit:m1|U02_UN11P001_Hi]",
	CAST(U02_UN11T001_Lo as decimal(15,5)) as "Температура пара ДОК-19 (min) [Edit:m1|U02_UN11T001_lo]",
	CAST(U02_UN11T001_Hi as decimal(15,5)) as "Температура пара ДОК-19 (max) [Edit:m1|U02_UN11T001_Hi]",
	null,
	CAST(U01_UN11P001_Lo as decimal(15,5)) as "Давление пара КИМ (min) [Edit:m1|U01_UN11P001_Lo]",
	CAST(U01_UN11P001_Hi as decimal(15,5)) as "Давление пара КИМ (max) [Edit:m1|U01_UN11P001_Hi]",
	CAST(U01_UN11T001_Lo as decimal(15,5)) as "Температура пара КИМ (min) [Edit:m1|U01_UN11T001_Lo]",
	CAST(U01_UN11T001_Hi as decimal(15,5)) as "Температура пара КИМ (max) [Edit:m1|U01_UN11T001_Hi]",
	null,
	CAST(U1_Ppar_3_1_lO as decimal(15,5)) as "Давление пара ВЗРД (min) [Edit:m1|U1_Ppar_3_1_lO]",
	CAST(U1_Ppar_3_1_Hi as decimal(15,5)) as "Давление пара ВЗРД (max) [Edit:m1|U1_Ppar_3_1_Hi]",
	CAST(U1_Tpar_3_1_lO as decimal(15,5)) as "Температура пара ВЗРД (min) [Edit:m1|U1_Tpar_3_1_lO]",
	CAST(U1_Tpar_3_1_Hi as decimal(15,5)) as "Температура пара ВЗРД (max) [Edit:m1|U1_Tpar_3_1_Hi]",
	null,
	CAST(H03_VR11F001_Hi as decimal(15,5)) as "Расход речной воды (max) [Edit:m1|H03_VR11F001_Hi]",
	null,
	CAST(H03_VG11F001_Hi as decimal(15,5)) as "Расход городской воды (max) [Edit:m1|H03_VG11F001_Hi]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	U04_UM11P001_Hi, U04_UM11T001_Hi, U04_UM11P001_Lo, U04_UM11T001_Lo,
	U04_UM21P001_Hi, U04_UM21T001_Hi, U04_UM21P001_Lo, U04_UM21T001_Lo,
	U01_UN11T001_Hi, U01_UN11T001_Lo, U01_UN11P001_Hi, U01_UN11P001_Lo,
	U02_UN11T001_Hi, U02_UN11T001_Lo, U02_UN11P001_Hi, U02_UN11P001_Lo,
	U02_UN12T001_Hi, U02_UN12T001_Lo, U02_UN12P001_Hi, U02_UN12P001_Lo,
	U1_Ppar_3_1_Hi, U1_Ppar_3_1_lO, U1_Tpar_3_1_Hi, U1_Tpar_3_1_lO,
	H03_VR11F001_Hi,H03_VG11F001_Hi
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")