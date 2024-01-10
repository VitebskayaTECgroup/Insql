{минутные срезы}
/*ReportName=Расхожение по времени (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(E123_SY00J711 as decimal(15,1)) as "ECOM        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(G01_SY00J711  as decimal(15,1)) as "Газ         [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H01_SY00J711  as decimal(15,1)) as "ХВО1        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H02_SY00J711  as decimal(15,1)) as "ХВО2        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H03_SY00J711  as decimal(15,1)) as "Горвода     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H04_SY00J711  as decimal(15,1)) as "Сосна1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H05_SY00J711  as decimal(15,1)) as "Сосна2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H06_SY00J711  as decimal(15,1)) as "Сосна3      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H09_SY00J711  as decimal(15,1)) as "ХВО1-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H10_SY00J711  as decimal(15,1)) as "ХВО2-6-1    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H11_SY00J711  as decimal(15,1)) as "ХВО2-4      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H12_SY00J711  as decimal(15,1)) as "ХВО2-5      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H13_SY00J711  as decimal(15,1)) as "ХВО2-6-2    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H14_SY00J711  as decimal(15,1)) as "ХВО2-1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	--CAST(H15_SY00J711  as decimal(15,1)) as "ХВО2-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H16_SY00J711  as decimal(15,1)) as "Взлёт-10м   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(LH1_SY00J711  as decimal(15,1)) as "ЭКОМ_час.   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(LS1_SY00J711  as decimal(15,1)) as "ЭКОМ_сут.   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U01_SY00J711  as decimal(15,1)) as "Пар_КИМ     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U02_SY00J711  as decimal(15,1)) as "Пар_ДОК     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U03_SY00J711  as decimal(15,1)) as "Пар_ВЗРД    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U04_SY00J711  as decimal(15,1)) as "Вода_Центр  [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U05_SY00J711  as decimal(15,1)) as "Вода_Запад  [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U06_SY00J711  as decimal(15,1)) as "Вода_ДОК    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U07_SY00J711  as decimal(15,1)) as "Вода_ВЗРД   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U08_SY00J711  as decimal(15,1)) as "Вода_Лучёса [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U09_SY00J711  as decimal(15,1)) as "Пар_Рубикон [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U10_SY00J711  as decimal(15,1)) as "Пар_Ковры   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V01_SY00J711  as decimal(15,1)) as "КО-1        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V02_SY00J711  as decimal(15,1)) as "КО-2-1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V03_SY00J711  as decimal(15,1)) as "КО-2-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V04_SY00J711  as decimal(15,1)) as "СВТУ-10м    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		E123_SY00J711,
		G01_SY00J711,
		H01_SY00J711,
		H02_SY00J711,
		H03_SY00J711,
		H04_SY00J711,
		H05_SY00J711,
		H06_SY00J711,
		H09_SY00J711,
		H10_SY00J711,
		H11_SY00J711,
		H12_SY00J711,
		H13_SY00J711,
		H14_SY00J711,
		H15_SY00J711,
		H16_SY00J711,
		LH1_SY00J711,
		LS1_SY00J711,
		U01_SY00J711,
		U02_SY00J711,
		U03_SY00J711,
		U04_SY00J711,
		U05_SY00J711,
		U06_SY00J711,
		U07_SY00J711,
		U08_SY00J711,
		U09_SY00J711,
		U10_SY00J711,
		V01_SY00J711,
		V02_SY00J711,
		V03_SY00J711,
		V04_SY00J711
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Расхожение по времени (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(E123_SY00J711 as decimal(15,1)) as "ECOM        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(G01_SY00J711  as decimal(15,1)) as "Газ         [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H01_SY00J711  as decimal(15,1)) as "ХВО1        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H02_SY00J711  as decimal(15,1)) as "ХВО2        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H03_SY00J711  as decimal(15,1)) as "Горвода     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H04_SY00J711  as decimal(15,1)) as "Сосна1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H05_SY00J711  as decimal(15,1)) as "Сосна2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H06_SY00J711  as decimal(15,1)) as "Сосна3      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H09_SY00J711  as decimal(15,1)) as "ХВО1-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H10_SY00J711  as decimal(15,1)) as "ХВО2-6-1    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H11_SY00J711  as decimal(15,1)) as "ХВО2-4      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H12_SY00J711  as decimal(15,1)) as "ХВО2-5      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H13_SY00J711  as decimal(15,1)) as "ХВО2-6-2    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H14_SY00J711  as decimal(15,1)) as "ХВО2-1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	--CAST(H15_SY00J711  as decimal(15,1)) as "ХВО2-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H16_SY00J711  as decimal(15,1)) as "Взлёт-10м   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(LH1_SY00J711  as decimal(15,1)) as "ЭКОМ_час.   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(LS1_SY00J711  as decimal(15,1)) as "ЭКОМ_сут.   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U01_SY00J711  as decimal(15,1)) as "Пар_КИМ     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U02_SY00J711  as decimal(15,1)) as "Пар_ДОК     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U03_SY00J711  as decimal(15,1)) as "Пар_ВЗРД    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U04_SY00J711  as decimal(15,1)) as "Вода_Центр  [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U05_SY00J711  as decimal(15,1)) as "Вода_Запад  [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U06_SY00J711  as decimal(15,1)) as "Вода_ДОК    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U07_SY00J711  as decimal(15,1)) as "Вода_ВЗРД   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U08_SY00J711  as decimal(15,1)) as "Вода_Лучёса [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U09_SY00J711  as decimal(15,1)) as "Пар_Рубикон [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U10_SY00J711  as decimal(15,1)) as "Пар_Ковры   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V01_SY00J711  as decimal(15,1)) as "КО-1        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V02_SY00J711  as decimal(15,1)) as "КО-2-1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V03_SY00J711  as decimal(15,1)) as "КО-2-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V04_SY00J711  as decimal(15,1)) as "СВТУ-10м    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		E123_SY00J711,
		G01_SY00J711,
		H01_SY00J711,
		H02_SY00J711,
		H03_SY00J711,
		H04_SY00J711,
		H05_SY00J711,
		H06_SY00J711,
		H09_SY00J711,
		H10_SY00J711,
		H11_SY00J711,
		H12_SY00J711,
		H13_SY00J711,
		H14_SY00J711,
		H15_SY00J711,
		H16_SY00J711,
		LH1_SY00J711,
		LS1_SY00J711,
		U01_SY00J711,
		U02_SY00J711,
		U03_SY00J711,
		U04_SY00J711,
		U05_SY00J711,
		U06_SY00J711,
		U07_SY00J711,
		U08_SY00J711,
		U09_SY00J711,
		U10_SY00J711,
		V01_SY00J711,
		V02_SY00J711,
		V03_SY00J711,
		V04_SY00J711
	FROM Runtime.dbo.AnalogWideHistory 
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
	DateTime as "Дата",
	null,
	CAST(E123_SY00J711 as decimal(15,1)) as "ECOM        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(G01_SY00J711  as decimal(15,1)) as "Газ         [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H01_SY00J711  as decimal(15,1)) as "ХВО1        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H02_SY00J711  as decimal(15,1)) as "ХВО2        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H03_SY00J711  as decimal(15,1)) as "Горвода     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H04_SY00J711  as decimal(15,1)) as "Сосна1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H05_SY00J711  as decimal(15,1)) as "Сосна2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H06_SY00J711  as decimal(15,1)) as "Сосна3      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H09_SY00J711  as decimal(15,1)) as "ХВО1-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H10_SY00J711  as decimal(15,1)) as "ХВО2-6-1    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H11_SY00J711  as decimal(15,1)) as "ХВО2-4      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H12_SY00J711  as decimal(15,1)) as "ХВО2-5      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H13_SY00J711  as decimal(15,1)) as "ХВО2-6-2    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H14_SY00J711  as decimal(15,1)) as "ХВО2-1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	--CAST(H15_SY00J711  as decimal(15,1)) as "ХВО2-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(H16_SY00J711  as decimal(15,1)) as "Взлёт-10м   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(LH1_SY00J711  as decimal(15,1)) as "ЭКОМ_час.   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(LS1_SY00J711  as decimal(15,1)) as "ЭКОМ_сут.   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U01_SY00J711  as decimal(15,1)) as "Пар_КИМ     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U02_SY00J711  as decimal(15,1)) as "Пар_ДОК     [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U03_SY00J711  as decimal(15,1)) as "Пар_ВЗРД    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U04_SY00J711  as decimal(15,1)) as "Вода_Центр  [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U05_SY00J711  as decimal(15,1)) as "Вода_Запад  [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U06_SY00J711  as decimal(15,1)) as "Вода_ДОК    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U07_SY00J711  as decimal(15,1)) as "Вода_ВЗРД   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U08_SY00J711  as decimal(15,1)) as "Вода_Лучёса [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U09_SY00J711  as decimal(15,1)) as "Пар_Рубикон [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(U10_SY00J711  as decimal(15,1)) as "Пар_Ковры   [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V01_SY00J711  as decimal(15,1)) as "КО-1        [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V02_SY00J711  as decimal(15,1)) as "КО-2-1      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V03_SY00J711  as decimal(15,1)) as "КО-2-2      [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]",
	CAST(V04_SY00J711  as decimal(15,1)) as "СВТУ-10м    [CHECK:-180,-60,60,180][CLASS:ERROR,WARN,GOOD,WARN,ERROR][VERTICAL]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		E123_SY00J711,
		G01_SY00J711,
		H01_SY00J711,
		H02_SY00J711,
		H03_SY00J711,
		H04_SY00J711,
		H05_SY00J711,
		H06_SY00J711,
		H09_SY00J711,
		H10_SY00J711,
		H11_SY00J711,
		H12_SY00J711,
		H13_SY00J711,
		H14_SY00J711,
		H15_SY00J711,
		H16_SY00J711,
		LH1_SY00J711,
		LS1_SY00J711,
		U01_SY00J711,
		U02_SY00J711,
		U03_SY00J711,
		U04_SY00J711,
		U05_SY00J711,
		U06_SY00J711,
		U07_SY00J711,
		U08_SY00J711,
		U09_SY00J711,
		U10_SY00J711,
		V01_SY00J711,
		V02_SY00J711,
		V03_SY00J711,
		V04_SY00J711
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
