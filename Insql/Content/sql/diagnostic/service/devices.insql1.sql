{минутные срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ ПРИБОРОВ (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ISNULL(Topic_16_Rate , 0) as "S3_PLC1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_17_Rate , 0) as "S3_PLC2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_18_Rate , 0) as "S2_PLC1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_19_Rate , 0) as "S2_PLC2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_21_Rate , 0) as "K31 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_10_Rate , 0) as "EKOM [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_7_Rate  , 0) as "REP [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_8_Rate  , 0) as "KO1_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_6_Rate  , 0) as "KO2_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_13_Rate , 0) as "KO3_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_11_Rate , 0) as "KO4_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_9_Rate  , 0) as "KO5_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_47_Rate , 0) as "HVO1_VR06 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_24_Rate , 0) as "DA2_VR18 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_12_Rate , 0) as "Istok_DDE [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_23_Rate , 0) as "MAZUT_1_2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_22_Rate , 0) as "MAZUT_3_4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_63_Rate , 0) as "KA3_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_64_Rate , 0) as "KA3_VG2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_85_Rate , 0) as "KA5_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_73_Rate , 0) as "HVO2_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_87_Rate , 0) as "iNOPC_KO3 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_88_Rate , 0) as "iNOPC_KO4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_89_Rate , 0) as "iNOPC_Sosna [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_91_Rate , 0) as "iNOPC_MARK602 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_92_Rate , 0) as "iNOPC_MARK902 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_93_Rate , 0) as "iNOPC_METRAN900 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_96_Rate , 0) as "iNOPC_EMIS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_97_Rate , 0) as "iNOPC_Elemer [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_98_Rate , 0) as "iNOPC_UPS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_99_Rate , 0) as "iNOPC_INELT [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_100_Rate, 0) as "iNOPC_Kovry [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_103_Rate, 0) as "iNOPC_Rubicon [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_111_Rate, 0) as "iNOPC_ALPHA [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_112_Rate, 0) as "OMRON_KA4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_113_Rate, 0) as "OMRON_SN1-2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_1_Rate   as "System [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_2_Rate   as "MDAS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_5_Rate   as "SPT961 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_52_Rate  as "VST_OPC_SVTU_10M [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_53_Rate  as "VST_OPC_VZLET [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_101_Rate as "iNOPC_Gidrozatvor [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_102_Rate as "iNOPC_Ballon [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_109_Rate as "iNOPC_ECOM [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	null,
	ISNULL(E123_SY00A700, 0) as "ЭКОМ_мин. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(G01_SY00A700, 0)  as "Газ_Исток [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H01_SY00A700, 0)  as "ХВО1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H02_SY00A700, 0)  as "ХВО2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H03_SY00A700, 0)  as "Горвода [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H04_SY00A700, 0)  as "Сосна_кислота [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H05_SY00A700, 0)  as "Сосна_щёлочь_L [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H06_SY00A700, 0)  as "Сосна_щёлочь_Т [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H09_SY00A700, 0)  as "ХВО1_№2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H10_SY00A700, 0)  as "ХВО2_№6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H11_SY00A700, 0)  as "ХВО2_№4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H12_SY00A700, 0)  as "ХВО2_№5 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H13_SY00A700, 0)  as "ХВО2_№3 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H14_SY00A700, 0)  as "ХВО2_№1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H16_SY00A700, 0)  as "Взлёт-10м [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(LH1_SY00A700, 0)  as "ЭКОМ_час. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(LS1_SY00A700, 0)  as "ЭКОМ_сут. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(M01_SY00A700, 0)  as "Мазут_1,2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(M03_SY00A700, 0)  as "Мазут_3,4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U01_SY00A700, 0)  as "Пар_КИМ [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U02_SY00A700, 0)  as "Пар_ДОК [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U03_SY00A700, 0)  as "Пар_ВЗРД [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U04_SY00A700, 0)  as "Вода_центр. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U05_SY00A700, 0)  as "Вода_запад. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U06_SY00A700, 0)  as "Вода_ДОК [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U07_SY00A700, 0)  as "Вода_ВЗРД [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U08_SY00A700, 0)  as "Вода_Лучёса [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U09_SY00A700, 0)  as "Пар_Рубикон [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U10_SY00A700, 0)  as "Пар_Ковры [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V01_SY00A700, 0)  as "СПТ_КО1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V02_SY00A700, 0)  as "СПТ_КО2_1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V03_SY00A700, 0)  as "СПТ_КО2_2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V04_SY00A700, 0)  as "СВТУ-0_БМХ [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--H15_SY00A700  as "Метран900 ХВО2 №2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	null,
	SysSpaceMain as "Сервер Мбайт [Vertical][CHECK:3000,6000][CLASS:ERROR,WARN,GOOD][hint: Место на сервере]",
	SysSpacePerm as "Резерв Мбайт [Vertical][CHECK:400,800][CLASS:ERROR,WARN,GOOD][hint: Место на хранилище]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		SysSpaceMain,
		SysSpacePerm,
		Topic_1_Rate,
		Topic_10_Rate,
		Topic_100_Rate,
		Topic_101_Rate,
		Topic_102_Rate,
		Topic_103_Rate,
		Topic_109_Rate,
		Topic_11_Rate,
		Topic_111_Rate,
		Topic_112_Rate,
		Topic_113_Rate,
		Topic_12_Rate,
		Topic_13_Rate,
		Topic_16_Rate,
		Topic_17_Rate,
		Topic_18_Rate,
		Topic_19_Rate,
		Topic_2_Rate,
		Topic_21_Rate,
		Topic_22_Rate,
		Topic_23_Rate,
		Topic_24_Rate,
		Topic_47_Rate,
		Topic_5_Rate,
		Topic_52_Rate,
		Topic_53_Rate,
		Topic_6_Rate,
		Topic_63_Rate,
		Topic_64_Rate,
		Topic_7_Rate,
		Topic_73_Rate,
		Topic_8_Rate,
		Topic_85_Rate,
		Topic_87_Rate,
		Topic_88_Rate,
		Topic_89_Rate,
		Topic_9_Rate,
		Topic_91_Rate,
		Topic_92_Rate,
		Topic_93_Rate,
		Topic_96_Rate,
		Topic_97_Rate,
		Topic_98_Rate,
		Topic_99_Rate,
		E123_SY00A700,
		G01_SY00A700,
		H01_SY00A700,
		H02_SY00A700,
		H03_SY00A700,
		H04_SY00A700,
		H05_SY00A700,
		H06_SY00A700,
		H09_SY00A700,
		H10_SY00A700,
		H11_SY00A700,
		H12_SY00A700,
		H13_SY00A700,
		H14_SY00A700,
		H15_SY00A700,
		H16_SY00A700,
		LH1_SY00A700,
		LS1_SY00A700,
		M01_SY00A700,
		M03_SY00A700,
		U01_SY00A700,
		U02_SY00A700,
		U03_SY00A700,
		U04_SY00A700,
		U05_SY00A700,
		U06_SY00A700,
		U07_SY00A700,
		U08_SY00A700,
		U09_SY00A700,
		U10_SY00A700,
		V01_SY00A700,
		V02_SY00A700,
		V03_SY00A700,
		V04_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{часовые срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ ПРИБОРОВ (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ISNULL(Topic_16_Rate , 0) as "S3_PLC1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_17_Rate , 0) as "S3_PLC2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_18_Rate , 0) as "S2_PLC1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_19_Rate , 0) as "S2_PLC2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_21_Rate , 0) as "K31 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_10_Rate , 0) as "EKOM [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_7_Rate  , 0) as "REP [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_8_Rate  , 0) as "KO1_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_6_Rate  , 0) as "KO2_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_13_Rate , 0) as "KO3_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_11_Rate , 0) as "KO4_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_9_Rate  , 0) as "KO5_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_47_Rate , 0) as "HVO1_VR06 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_24_Rate , 0) as "DA2_VR18 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_12_Rate , 0) as "Istok_DDE [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_23_Rate , 0) as "MAZUT_1_2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_22_Rate , 0) as "MAZUT_3_4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_63_Rate , 0) as "KA3_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_64_Rate , 0) as "KA3_VG2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_85_Rate , 0) as "KA5_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_73_Rate , 0) as "HVO2_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_87_Rate , 0) as "iNOPC_KO3 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_88_Rate , 0) as "iNOPC_KO4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_89_Rate , 0) as "iNOPC_Sosna [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_91_Rate , 0) as "iNOPC_MARK602 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_92_Rate , 0) as "iNOPC_MARK902 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_93_Rate , 0) as "iNOPC_METRAN900 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_96_Rate , 0) as "iNOPC_EMIS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_97_Rate , 0) as "iNOPC_Elemer [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_98_Rate , 0) as "iNOPC_UPS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_99_Rate , 0) as "iNOPC_INELT [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_100_Rate, 0) as "iNOPC_Kovry [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_103_Rate, 0) as "iNOPC_Rubicon [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_111_Rate, 0) as "iNOPC_ALPHA [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_112_Rate, 0) as "OMRON_KA4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_113_Rate, 0) as "OMRON_SN1-2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_1_Rate   as "System [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_2_Rate   as "MDAS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_5_Rate   as "SPT961 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_52_Rate  as "VST_OPC_SVTU_10M [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_53_Rate  as "VST_OPC_VZLET [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_101_Rate as "iNOPC_Gidrozatvor [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_102_Rate as "iNOPC_Ballon [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_109_Rate as "iNOPC_ECOM [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	null,
	ISNULL(E123_SY00A700, 0) as "ЭКОМ_мин. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(G01_SY00A700, 0)  as "Газ_Исток [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H01_SY00A700, 0)  as "ХВО1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H02_SY00A700, 0)  as "ХВО2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H03_SY00A700, 0)  as "Горвода [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H04_SY00A700, 0)  as "Сосна_кислота [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H05_SY00A700, 0)  as "Сосна_щёлочь_L [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H06_SY00A700, 0)  as "Сосна_щёлочь_Т [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H09_SY00A700, 0)  as "ХВО1_№2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H10_SY00A700, 0)  as "ХВО2_№6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H11_SY00A700, 0)  as "ХВО2_№4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H12_SY00A700, 0)  as "ХВО2_№5 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H13_SY00A700, 0)  as "ХВО2_№3 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H14_SY00A700, 0)  as "ХВО2_№1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H16_SY00A700, 0)  as "Взлёт-10м [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(LH1_SY00A700, 0)  as "ЭКОМ_час. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(LS1_SY00A700, 0)  as "ЭКОМ_сут. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(M01_SY00A700, 0)  as "Мазут_1,2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(M03_SY00A700, 0)  as "Мазут_3,4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U01_SY00A700, 0)  as "Пар_КИМ [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U02_SY00A700, 0)  as "Пар_ДОК [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U03_SY00A700, 0)  as "Пар_ВЗРД [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U04_SY00A700, 0)  as "Вода_центр. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U05_SY00A700, 0)  as "Вода_запад. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U06_SY00A700, 0)  as "Вода_ДОК [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U07_SY00A700, 0)  as "Вода_ВЗРД [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U08_SY00A700, 0)  as "Вода_Лучёса [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U09_SY00A700, 0)  as "Пар_Рубикон [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U10_SY00A700, 0)  as "Пар_Ковры [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V01_SY00A700, 0)  as "СПТ_КО1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V02_SY00A700, 0)  as "СПТ_КО2_1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V03_SY00A700, 0)  as "СПТ_КО2_2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V04_SY00A700, 0)  as "СВТУ-0_БМХ [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--H15_SY00A700  as "Метран900 ХВО2 №2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	null,
	SysSpaceMain as "Сервер Мбайт [Vertical][CHECK:3000,6000][CLASS:ERROR,WARN,GOOD][hint: Место на сервере]",
	SysSpacePerm as "Резерв Мбайт [Vertical][CHECK:400,800][CLASS:ERROR,WARN,GOOD][hint: Место на хранилище]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		SysSpaceMain,
		SysSpacePerm,
		Topic_1_Rate,
		Topic_10_Rate,
		Topic_100_Rate,
		Topic_101_Rate,
		Topic_102_Rate,
		Topic_103_Rate,
		Topic_109_Rate,
		Topic_11_Rate,
		Topic_111_Rate,
		Topic_112_Rate,
		Topic_113_Rate,
		Topic_12_Rate,
		Topic_13_Rate,
		Topic_16_Rate,
		Topic_17_Rate,
		Topic_18_Rate,
		Topic_19_Rate,
		Topic_2_Rate,
		Topic_21_Rate,
		Topic_22_Rate,
		Topic_23_Rate,
		Topic_24_Rate,
		Topic_47_Rate,
		Topic_5_Rate,
		Topic_52_Rate,
		Topic_53_Rate,
		Topic_6_Rate,
		Topic_63_Rate,
		Topic_64_Rate,
		Topic_7_Rate,
		Topic_73_Rate,
		Topic_8_Rate,
		Topic_85_Rate,
		Topic_87_Rate,
		Topic_88_Rate,
		Topic_89_Rate,
		Topic_9_Rate,
		Topic_91_Rate,
		Topic_92_Rate,
		Topic_93_Rate,
		Topic_96_Rate,
		Topic_97_Rate,
		Topic_98_Rate,
		Topic_99_Rate,
		E123_SY00A700,
		G01_SY00A700,
		H01_SY00A700,
		H02_SY00A700,
		H03_SY00A700,
		H04_SY00A700,
		H05_SY00A700,
		H06_SY00A700,
		H09_SY00A700,
		H10_SY00A700,
		H11_SY00A700,
		H12_SY00A700,
		H13_SY00A700,
		H14_SY00A700,
		H15_SY00A700,
		H16_SY00A700,
		LH1_SY00A700,
		LS1_SY00A700,
		M01_SY00A700,
		M03_SY00A700,
		U01_SY00A700,
		U02_SY00A700,
		U03_SY00A700,
		U04_SY00A700,
		U05_SY00A700,
		U06_SY00A700,
		U07_SY00A700,
		U08_SY00A700,
		U09_SY00A700,
		U10_SY00A700,
		V01_SY00A700,
		V02_SY00A700,
		V03_SY00A700,
		V04_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")

{суточные срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ ПРИБОРОВ (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ISNULL(Topic_16_Rate , 0) as "S3_PLC1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_17_Rate , 0) as "S3_PLC2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_18_Rate , 0) as "S2_PLC1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_19_Rate , 0) as "S2_PLC2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_21_Rate , 0) as "K31 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_10_Rate , 0) as "EKOM [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_7_Rate  , 0) as "REP [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_8_Rate  , 0) as "KO1_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_6_Rate  , 0) as "KO2_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_13_Rate , 0) as "KO3_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_11_Rate , 0) as "KO4_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_9_Rate  , 0) as "KO5_VR6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_47_Rate , 0) as "HVO1_VR06 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_24_Rate , 0) as "DA2_VR18 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_12_Rate , 0) as "Istok_DDE [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_23_Rate , 0) as "MAZUT_1_2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_22_Rate , 0) as "MAZUT_3_4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_63_Rate , 0) as "KA3_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_64_Rate , 0) as "KA3_VG2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_85_Rate , 0) as "KA5_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_73_Rate , 0) as "HVO2_VG1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_87_Rate , 0) as "iNOPC_KO3 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_88_Rate , 0) as "iNOPC_KO4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_89_Rate , 0) as "iNOPC_Sosna [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_91_Rate , 0) as "iNOPC_MARK602 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_92_Rate , 0) as "iNOPC_MARK902 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_93_Rate , 0) as "iNOPC_METRAN900 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_96_Rate , 0) as "iNOPC_EMIS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_97_Rate , 0) as "iNOPC_Elemer [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_98_Rate , 0) as "iNOPC_UPS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_99_Rate , 0) as "iNOPC_INELT [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_100_Rate, 0) as "iNOPC_Kovry [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_103_Rate, 0) as "iNOPC_Rubicon [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_111_Rate, 0) as "iNOPC_ALPHA [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_112_Rate, 0) as "OMRON_KA4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(Topic_113_Rate, 0) as "OMRON_SN1-2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_1_Rate   as "System [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_2_Rate   as "MDAS [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_5_Rate   as "SPT961 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_52_Rate  as "VST_OPC_SVTU_10M [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_53_Rate  as "VST_OPC_VZLET [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_101_Rate as "iNOPC_Gidrozatvor [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_102_Rate as "iNOPC_Ballon [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--Topic_109_Rate as "iNOPC_ECOM [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	null,
	ISNULL(E123_SY00A700, 0) as "ЭКОМ_мин. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(G01_SY00A700, 0)  as "Газ_Исток [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H01_SY00A700, 0)  as "ХВО1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H02_SY00A700, 0)  as "ХВО2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H03_SY00A700, 0)  as "Горвода [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H04_SY00A700, 0)  as "Сосна_кислота [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H05_SY00A700, 0)  as "Сосна_щёлочь_L [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H06_SY00A700, 0)  as "Сосна_щёлочь_Т [Vertical][CHECK:0][CLASS:ERROR,GOOD]",   
	ISNULL(H09_SY00A700, 0)  as "ХВО1_№2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H10_SY00A700, 0)  as "ХВО2_№6 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H11_SY00A700, 0)  as "ХВО2_№4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H12_SY00A700, 0)  as "ХВО2_№5 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H13_SY00A700, 0)  as "ХВО2_№3 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H14_SY00A700, 0)  as "ХВО2_№1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(H16_SY00A700, 0)  as "Взлёт-10м [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(LH1_SY00A700, 0)  as "ЭКОМ_час. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(LS1_SY00A700, 0)  as "ЭКОМ_сут. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(M01_SY00A700, 0)  as "Мазут_1,2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(M03_SY00A700, 0)  as "Мазут_3,4 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U01_SY00A700, 0)  as "Пар_КИМ [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U02_SY00A700, 0)  as "Пар_ДОК [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U03_SY00A700, 0)  as "Пар_ВЗРД [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U04_SY00A700, 0)  as "Вода_центр. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U05_SY00A700, 0)  as "Вода_запад. [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U06_SY00A700, 0)  as "Вода_ДОК [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U07_SY00A700, 0)  as "Вода_ВЗРД [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U08_SY00A700, 0)  as "Вода_Лучёса [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U09_SY00A700, 0)  as "Пар_Рубикон [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(U10_SY00A700, 0)  as "Пар_Ковры [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V01_SY00A700, 0)  as "СПТ_КО1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V02_SY00A700, 0)  as "СПТ_КО2_1 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V03_SY00A700, 0)  as "СПТ_КО2_2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	ISNULL(V04_SY00A700, 0)  as "СВТУ-0_БМХ [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	--H15_SY00A700  as "Метран900 ХВО2 №2 [Vertical][CHECK:0][CLASS:ERROR,GOOD]",
	null,
	SysSpaceMain as "Сервер Мбайт [Vertical][CHECK:3000,6000][CLASS:ERROR,WARN,GOOD][hint: Место на сервере]",
	SysSpacePerm as "Резерв Мбайт [Vertical][CHECK:400,800][CLASS:ERROR,WARN,GOOD][hint: Место на хранилище]"
FROM
	OpenQuery(INSQL,
	"SELECT
		DateTime,
		SysSpaceMain,
		SysSpacePerm,
		Topic_1_Rate,
		Topic_10_Rate,
		Topic_100_Rate,
		Topic_101_Rate,
		Topic_102_Rate,
		Topic_103_Rate,
		Topic_109_Rate,
		Topic_11_Rate,
		Topic_111_Rate,
		Topic_112_Rate,
		Topic_113_Rate,
		Topic_12_Rate,
		Topic_13_Rate,
		Topic_16_Rate,
		Topic_17_Rate,
		Topic_18_Rate,
		Topic_19_Rate,
		Topic_2_Rate,
		Topic_21_Rate,
		Topic_22_Rate,
		Topic_23_Rate,
		Topic_24_Rate,
		Topic_47_Rate,
		Topic_5_Rate,
		Topic_52_Rate,
		Topic_53_Rate,
		Topic_6_Rate,
		Topic_63_Rate,
		Topic_64_Rate,
		Topic_7_Rate,
		Topic_73_Rate,
		Topic_8_Rate,
		Topic_85_Rate,
		Topic_87_Rate,
		Topic_88_Rate,
		Topic_89_Rate,
		Topic_9_Rate,
		Topic_91_Rate,
		Topic_92_Rate,
		Topic_93_Rate,
		Topic_96_Rate,
		Topic_97_Rate,
		Topic_98_Rate,
		Topic_99_Rate,
		E123_SY00A700,
		G01_SY00A700,
		H01_SY00A700,
		H02_SY00A700,
		H03_SY00A700,
		H04_SY00A700,
		H05_SY00A700,
		H06_SY00A700,
		H09_SY00A700,
		H10_SY00A700,
		H11_SY00A700,
		H12_SY00A700,
		H13_SY00A700,
		H14_SY00A700,
		H15_SY00A700,
		H16_SY00A700,
		LH1_SY00A700,
		LS1_SY00A700,
		M01_SY00A700,
		M03_SY00A700,
		U01_SY00A700,
		U02_SY00A700,
		U03_SY00A700,
		U04_SY00A700,
		U05_SY00A700,
		U06_SY00A700,
		U07_SY00A700,
		U08_SY00A700,
		U09_SY00A700,
		U10_SY00A700,
		V01_SY00A700,
		V02_SY00A700,
		V03_SY00A700,
		V04_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")