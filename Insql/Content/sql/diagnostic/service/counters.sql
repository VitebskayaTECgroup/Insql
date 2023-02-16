{минутные срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СЧЕТЧИКОВ (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата", 
	null,
	CAST(H01_KB21F001 as decimal(15)) as "ХВО №1 [H01_KB21F001]",
	CAST(H02_KB11F001 as decimal(15)) as "ХВО №2 [H02_KB11F001]",
	CAST(H03_VR11F001 as decimal(15)) as "ХВО №3 [H03_VR11F001]",
	null,
	CAST(U02_UN12F001 as decimal(15)) as "ПАР ДОК [U02_UN12F001]",
	CAST(V01_VK11F001 as decimal(15)) as "КО 1 ОЧ. [V01_VK11F001]",
	CAST(G01_AM31Q001 as decimal(15)) as "ГАЗ [G01_AM31Q001]",
	null,
	CAST(U04_UM11F001 as decimal(15)) as "ВОД ЦЕН [U04_UM11F001]",
	CAST(U05_UM11F001 as decimal(15)) as "ВОД ЗАП [U05_UM11F001]",
	CAST(U06_UM11F001 as decimal(15)) as "ВОД ДОК [U06_UM11F001]",
	CAST(U07_UM11F001 as decimal(15)) as "ВОД МОН [U07_UM11F001]",
	CAST(U01_UN11F001 as decimal(15)) as "ПАР КИМ [U01_UN11F001]",
	CAST(isnull(U03_UN11F001,0) as decimal(15)) as "ПАР МОН [U03_UN11F001]",
	CAST(V02_VK11F001 as decimal(15)) as "КО 2 ОЧ.[V02_VK11F001]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	U04_UM11F001,
	U06_UM11F001,
	U07_UM11F001,
	U05_UM11F001,
	U03_UN11F001,
	U01_UN11F001,
	U02_UN12F001,
	V01_VK11F001,
	V02_VK11F001,
	H01_KB21F001,
	H02_KB11F001,
	H03_VR11F001,
	G01_AM31Q001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СЧЕТЧИКОВ (за прошедший час)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(H01_KB21F001_H1 as decimal(15)) as "ХВО №1 [H01_KB21F001_H1]",
	CAST(H02_KB11F001_H1 as decimal(15)) as "ХВО №2 [H02_KB11F001_H1]",
	CAST(H03_VR11F001_H1 as decimal(15)) as "ХВО №3 [H03_VR11F001_H1]",
	null,
	CAST(U02_UN12F001_H1 as decimal(15)) as "ПАР ДОК [U02_UN12F001_H1]",
	CAST(V01_VK11F001_H1 as decimal(15)) as "КО 1 ОЧ. [V01_VK11F001_H1]",
	CAST(G01_AM31Q001_H1 as decimal(15)) as "ГАЗ [G01_AM31Q001_H1]",
	null,
	CAST(U04_UM11F001_H1 as decimal(15)) as "ВОД ЦЕН [U04_UM11F001_H1]",
	CAST(U05_UM11F001_H1 as decimal(15)) as "ВОД ЗАП [U05_UM11F001_H1]",
	CAST(U06_UM11F001_H1 as decimal(15)) as "ВОД ДОК [U06_UM11F001_H1]",
	CAST(U07_UM11G001_H1 as decimal(15)) as "ВОД МОН [U07_UM11G001_H1]",
	CAST(U01_UN11F001_H1 as decimal(15)) as "ПАР КИМ [U01_UN11F001_H1]",
	CAST(isnull(U03_UN11F001_H1,0) as decimal(15)) as "ПАР МОН [U03_UN11F001_H1]",
	CAST(V02_VK11F001_H1 as decimal(15)) as "КО 2 ОЧ.[V02_VK11F001_H1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	U04_UM11F001_H1,
	U06_UM11F001_H1,
	U07_UM11G001_H1,
	U05_UM11F001_H1,
	U03_UN11F001_H1,
	U01_UN11F001_H1,
	U02_UN12F001_H1,
	V01_VK11F001_H1,
	V02_VK11F001_H1,
	H01_KB21F001_H1,
	H02_KB11F001_H1,
	H03_VR11F001_H1,
	G01_AM31Q001_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СЧЕТЧИКОВ (за прошедшие сутки)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	CAST(H01_KB21F001_S1 as decimal(15)) as "ХВО №1 [H01_KB21F001_S1]",
	CAST(H02_KB11F001_S1 as decimal(15)) as "ХВО №2 [H02_KB11F001_S1]",
	CAST(H03_VR11F001_S1 as decimal(15)) as "ХВО №3 [H03_VR11F001_S1]",
	null,
	CAST(U02_UN12F001_S1 as decimal(15)) as "ПАР ДОК [U02_UN12F001_S1]",
	CAST(V01_VK11F001_S1 as decimal(15)) as "КО 1 ОЧ. [V01_VK11F001_S1]",
	CAST(G01_AM11Q001_S1 as decimal(15)) as "ГАЗ [G01_AM11Q001_S1]",
	null,
	CAST(U04_UM11F001_S1 as decimal(15)) as "ВОД ЦЕН [U04_UM11F001_S1]",
	CAST(U05_UM11F001_S1 as decimal(15)) as "ВОД ЗАП [U05_UM11F001_S1]",
	CAST(U06_UM11F001_S1 as decimal(15)) as "ВОД ДОК [U06_UM11F001_S1]",
	CAST(U07_UM11G001_S1 as decimal(15)) as "ВОД МОН [U07_UM11G001_S1]",
	CAST(U01_UN11F001_S1 as decimal(15)) as "ПАР КИМ [U01_UN11F001_S1]",
	CAST(isnull(U03_UN11F001_S1,0) as decimal(15)) as "ПАР МОН [U03_UN11F001_S1]",
	CAST(V02_VK11F001_S1 as decimal(15)) as "КО 2 ОЧ.[V02_VK11F001_S1]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	U04_UM11F001_S1,
	U06_UM11F001_S1,
	U07_UM11G001_S1,
	U05_UM11F001_S1,
	U03_UN11F001_S1,
	U01_UN11F001_S1,
	U02_UN12F001_S1,
	V01_VK11F001_S1,
	V02_VK11F001_S1,
	H01_KB21F001_S1,
	H02_KB11F001_S1,
	H03_VR11F001_S1,
	G01_AM11Q001_S1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")