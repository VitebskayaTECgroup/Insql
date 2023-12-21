{минутные срезы}
/*ReportName=Температура в шкафах (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(S2_STKER_Y999 as decimal(15,1)) as "T в шкафу СТКЭР-ТА2, °С[S2_STKER_Y999][CHECK:45,40,10,0]",
	CAST(S2_PLC1_T as decimal(15,1)) as "T в ШК-ТА2, °С[S2_PLC1_T][CHECK:45,40,10,0]",
	CAST(S3_STKER_Y80 as decimal(15,1)) as "T в шкафу СТКЭР-ТА3, °С [S3_STKER_Y80][CHECK:45,40,10,0]",
	CAST(S3_PLC1_T as decimal(15,1)) as "Т ШК-ТА3, °С[S3_PLC1_T][CHECK:45,40,10,0]",
	CAST(N01_UM10T001 as decimal(15,1)) as "Т в шкафу РЭП СН-4, °С[N01_UM10T001][CHECK:45,40,10,0]",
	CAST(P01_EU00T001 as decimal(15,1)) as "ИБП-1  <br> СБК-Iоч. Центральная <br> серверная[P01_EU00T001][CHECK:45,40,10,5]",
	CAST(P02_EU00T001 as decimal(15,1)) as "ИБП-2  <br> Серверная АСУТП <br> Линия А[P02_EU00T001][CHECK:27,22,10,5]",
	CAST(P03_EU00T001 as decimal(15,1)) as "ИБП-3  <br> Серверная АСУТП <br> Линия Б[P03_EU00T001][CHECK:27,22,10,5]",
	CAST(P04_EU00T001 as decimal(15,1)) as "ИБП-4  <br> ЛМЗ-97 <br> Линия А[P04_EU00T001][CHECK:45,40,10,5]",
	CAST(P05_EU00T001 as decimal(15,1)) as "ИБП-5  <br> ЛМЗ-97 <br> Линия Б[P05_EU00T001][CHECK:45,40,10,5]",
	CAST(P06_EU00T001 as decimal(15,1)) as "ИБП-6  <br> Серверная АСУТП <br> РЭП СН-4[P06_EU00T001][CHECK:32,28,10,5]",
	CAST(P07_EU00T001 as decimal(15,1)) as "ИБП-7  <br> Серверная АСУТП <br> ГМ ПЭН-6[P07_EU00T001][CHECK:37,35,10,5]",
	CAST(P09_EU00T001 as decimal(15,1)) as "ИБП-9  <br> СБК-IIоч. Кабинет <br> ЗНЦТАИ[P09_EU00T001][CHECK:45,40,10,5]",
	CAST(P10_EU00T001 as decimal(15,1)) as "ИБП-10 <br> АБК<br>Кабинет СВТ[P10_EU00T001][CHECK:45,40,10,5]",
	CAST(P11_EU00T001 as decimal(15,1)) as "ИБП-11 <br> ЦТЩУ<br>ШОС[P11_EU00T001][CHECK:45,40,10,5]",
	CAST(P12_EU00T001 as decimal(15,1)) as "ИБП-12 <br> ЦТЩУ<br>ШОС[P12_EU00T001][CHECK:45,40,10,5]",
	CAST(P13_EU00T001 as decimal(15,1)) as "ИБП-13 <br> ЦТЩУ<br>ШОС[P13_EU00T001][CHECK:45,40,10,5]",
	CAST(P14_EU00T001 as decimal(15,1)) as "ИБП-14 <br> ЦТЩУ<br>ШОС[P14_EU00T001][CHECK:45,40,10,5]",
	CAST(P15_EU00T001 as decimal(15,1)) as "ИБП-15 <br> ЭКОМ-3000 Центр.серв. [P15_EU00T001][CHECK:45,40,10,5]",
	CAST(P17_EU00T001 as decimal(15,1)) as "ИБП-17 <br> ШКУ Т/О-IIоч. [P17_EU00T001][CHECK:45,40,10,5]",
	CAST(P18_EU00T001 as decimal(15,1)) as "ИБП-18 <br> ГРП [P18_EU00T001][CHECK:45,40,10,5]",
	CAST(P19_EU00T001 as decimal(15,1)) as "ИБП-19 <br> ТТЦ [P19_EU00T001][CHECK:45,40,10,5]",
	CAST(P20_EU00T001 as decimal(15,1)) as "ИБП-20 <br> РЭП СН-4 [P20_EU00T001][CHECK:45,40,10,5]",
	CAST(P21_EU00T001 as decimal(15,1)) as "ИБП-21 <br> КН3-1 [P21_EU00T001][CHECK:45,40,10,5]",
	CAST(P22_EU00T001 as decimal(15,1)) as "ИБП-22 <br> КА-4 [P22_EU00T001][CHECK:45,40,10,5]",
	CAST(P23_EU00T001 as decimal(15,1)) as "ИБП-23 <br> ШПЗ КА-3,4,5[P23_EU00T001][CHECK:45,40,10,5]",
	CAST(P24_EU00T001 as decimal(15,1)) as "ИБП-24 <br> АСУ [P24_EU00T001][CHECK:45,40,10,5]",
	CAST(U1_Tnv_3_4 as decimal(15,1)) as "Т наружного воздуха, °С [U1_Tnv_3_4][CHECK:35,30,-30,-35]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_STKER_Y80, S2_STKER_Y999, S2_PLC1_T, N01_UM10T001, S3_PLC1_T, U1_Tnv_3_4, P01_EU00T001, P02_EU00T001, P03_EU00T001, P04_EU00T001, P05_EU00T001, P06_EU00T001, P07_EU00T001, P09_EU00T001, P10_EU00T001, P11_EU00T001, P12_EU00T001, P13_EU00T001, P14_EU00T001, P15_EU00T001, P17_EU00T001, P18_EU00T001, P19_EU00T001, P20_EU00T001, P21_EU00T001, P22_EU00T001, P23_EU00T001, P24_EU00T001 
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Температура в шкафах (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(S2_STKER_Y999 as decimal(15,1)) as "T в шкафу СТКЭР-ТА2, °С[S2_STKER_Y999][CHECK:45,40,10,0]",
	CAST(S2_PLC1_T as decimal(15,1)) as "T в ШК-ТА2, °С[S2_PLC1_T][CHECK:45,40,10,0]",
	CAST(S3_STKER_Y80 as decimal(15,1)) as "T в шкафу СТКЭР-ТА3, °С [S3_STKER_Y80][CHECK:45,40,10,0]",
	CAST(S3_PLC1_T as decimal(15,1)) as "Т ШК-ТА3, °С[S3_PLC1_T][CHECK:45,40,10,0]",
	CAST(N01_UM10T001 as decimal(15,1)) as "Т в шкафу РЭП СН-4, °С[N01_UM10T001][CHECK:45,40,10,0]",
	CAST(P01_EU00T001 as decimal(15,1)) as "ИБП-1, °С <br> СБК-Iоч. Центральная <br> серверная[P01_EU00T001][CHECK:45,40,10,5]",
	CAST(P02_EU00T001 as decimal(15,1)) as "ИБП-2, °С <br> Серверная АСУТП <br> Линия А[P02_EU00T001][CHECK:27,22,10,5]",
	CAST(P03_EU00T001 as decimal(15,1)) as "ИБП-3, °С <br> Серверная АСУТП <br> Линия Б[P03_EU00T001][CHECK:27,22,10,5]",
	CAST(P04_EU00T001 as decimal(15,1)) as "ИБП-4, °С <br> ЛМЗ-97 <br> Линия А[P04_EU00T001][CHECK:45,40,10,5]",
	CAST(P05_EU00T001 as decimal(15,1)) as "ИБП-5, °С <br> ЛМЗ-97 <br> Линия Б[P05_EU00T001][CHECK:45,40,10,5]",
	CAST(P06_EU00T001 as decimal(15,1)) as "ИБП-6, °С <br> Серверная АСУТП <br> РЭП СН-4[P06_EU00T001][CHECK:32,28,10,5]",
	CAST(P07_EU00T001 as decimal(15,1)) as "ИБП-7, °С <br> Серверная АСУТП <br> ГМ ПЭН-6[P07_EU00T001][CHECK:37,35,10,5]",
	CAST(P09_EU00T001 as decimal(15,1)) as "ИБП-9, °С <br> СБК-IIоч. Кабинет <br> ЗНЦТАИ[P09_EU00T001][CHECK:45,40,10,5]",
	CAST(P10_EU00T001 as decimal(15,1)) as "ИБП-10,°С<br>АБК<br>Кабинет СВТ[P10_EU00T001][CHECK:45,40,10,5]",
	CAST(P11_EU00T001 as decimal(15,1)) as "ИБП-11,°С<br>ЦТЩУ<br>ШОС[P11_EU00T001][CHECK:45,40,10,5]",
	CAST(P12_EU00T001 as decimal(15,1)) as "ИБП-12,°С<br>ЦТЩУ<br>ШОС[P12_EU00T001][CHECK:45,40,10,5]",
	CAST(P13_EU00T001 as decimal(15,1)) as "ИБП-13,°С<br>ЦТЩУ<br>ШОС[P13_EU00T001][CHECK:45,40,10,5]",
	CAST(P14_EU00T001 as decimal(15,1)) as "ИБП-14,°С<br>ЦТЩУ<br>ШОС[P14_EU00T001][CHECK:45,40,10,5]",
	CAST(P15_EU00T001 as decimal(15,1)) as "ИБП-15,°С<br>ЭКОМ-3000<br>Центральная серверная[P15_EU00T001][CHECK:45,40,10,5]",
	CAST(P17_EU00T001 as decimal(15,1)) as "ИБП-17,°С<br>ШКУ<br>Т/О-IIоч.[P17_EU00T001][CHECK:45,40,10,5]",
	CAST(P18_EU00T001 as decimal(15,1)) as "ИБП-18,°С<br><br>ГРП[P18_EU00T001][CHECK:45,40,10,5]",
	CAST(P19_EU00T001 as decimal(15,1)) as "ИБП-19,°С<br><br>ТТЦ[P19_EU00T001][CHECK:45,40,10,5]",
	CAST(P20_EU00T001 as decimal(15,1)) as "ИБП-20 <br> РЭП СН-4 [P20_EU00T001][CHECK:45,40,10,5]",
	CAST(P21_EU00T001 as decimal(15,1)) as "ИБП-21 <br> КН3-1 [P21_EU00T001][CHECK:45,40,10,5]",
	CAST(P22_EU00T001 as decimal(15,1)) as "ИБП-22 <br> КА-4 [P22_EU00T001][CHECK:45,40,10,5]",
	CAST(P23_EU00T001 as decimal(15,1)) as "ИБП-23 <br> ШПЗ КА-3,4,5[P23_EU00T001][CHECK:45,40,10,5]",
	CAST(P24_EU00T001 as decimal(15,1)) as "ИБП-24 <br> АСУ [P24_EU00T001][CHECK:45,40,10,5]",
	CAST(U1_Tnv_3_4 as decimal(15,1)) as "Т наружного воздуха, °С[U1_Tnv_3_4][CHECK:35,30,-30,-35]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_STKER_Y80, S2_STKER_Y999, S2_PLC1_T, N01_UM10T001, S3_PLC1_T, U1_Tnv_3_4, P01_EU00T001, P02_EU00T001, P03_EU00T001, P04_EU00T001, P05_EU00T001, P06_EU00T001, P07_EU00T001, P09_EU00T001, P10_EU00T001, P11_EU00T001, P12_EU00T001, P13_EU00T001, P14_EU00T001, P15_EU00T001, P17_EU00T001, P18_EU00T001, P19_EU00T001, P20_EU00T001, P21_EU00T001, P22_EU00T001, P23_EU00T001, P24_EU00T001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Температура в шкафах (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(S2_STKER_Y999 as decimal(15,1)) as "T в шкафу СТКЭР-ТА2, °С[S2_STKER_Y999][CHECK:45,40,10,0]",
	CAST(S2_PLC1_T as decimal(15,1)) as "T в ШК-ТА2, °С[S2_PLC1_T][CHECK:45,40,10,0]",
	CAST(S3_STKER_Y80 as decimal(15,1)) as "T в шкафу СТКЭР-ТА3, °С [S3_STKER_Y80][CHECK:45,40,10,0]",
	CAST(S3_PLC1_T as decimal(15,1)) as "Т ШК-ТА3, °С[S3_PLC1_T][CHECK:45,40,10,0]",
	CAST(N01_UM10T001 as decimal(15,1)) as "Т в шкафу РЭП СН-4, °С[N01_UM10T001][CHECK:45,40,10,0]",
	CAST(P01_EU00T001 as decimal(15,1)) as "ИБП-1, °С <br> СБК-Iоч. Центральная <br> серверная[P01_EU00T001][CHECK:45,40,10,5]",
	CAST(P02_EU00T001 as decimal(15,1)) as "ИБП-2, °С <br> Серверная АСУТП <br> Линия А[P02_EU00T001][CHECK:27,22,10,5]",
	CAST(P03_EU00T001 as decimal(15,1)) as "ИБП-3, °С <br> Серверная АСУТП <br> Линия Б[P03_EU00T001][CHECK:27,22,10,5]",
	CAST(P04_EU00T001 as decimal(15,1)) as "ИБП-4, °С <br> ЛМЗ-97 <br> Линия А[P04_EU00T001][CHECK:45,40,10,5]",
	CAST(P05_EU00T001 as decimal(15,1)) as "ИБП-5, °С <br> ЛМЗ-97 <br> Линия Б[P05_EU00T001][CHECK:45,40,10,5]",
	CAST(P06_EU00T001 as decimal(15,1)) as "ИБП-6, °С <br> Серверная АСУТП <br> РЭП СН-4[P06_EU00T001][CHECK:32,28,10,5]",
	CAST(P07_EU00T001 as decimal(15,1)) as "ИБП-7, °С <br> Серверная АСУТП <br> ГМ ПЭН-6[P07_EU00T001][CHECK:37,35,10,5]",
	CAST(P09_EU00T001 as decimal(15,1)) as "ИБП-9, °С <br> СБК-IIоч. Кабинет <br> ЗНЦТАИ[P09_EU00T001][CHECK:45,40,10,5]",
	CAST(P10_EU00T001 as decimal(15,1)) as "ИБП-10,°С<br>АБК<br>Кабинет СВТ[P10_EU00T001][CHECK:45,40,10,5]",
	CAST(P11_EU00T001 as decimal(15,1)) as "ИБП-11,°С<br>ЦТЩУ<br>ШОС[P11_EU00T001][CHECK:45,40,10,5]",
	CAST(P12_EU00T001 as decimal(15,1)) as "ИБП-12,°С<br>ЦТЩУ<br>ШОС[P12_EU00T001][CHECK:45,40,10,5]",
	CAST(P13_EU00T001 as decimal(15,1)) as "ИБП-13,°С<br>ЦТЩУ<br>ШОС[P13_EU00T001][CHECK:45,40,10,5]",
	CAST(P14_EU00T001 as decimal(15,1)) as "ИБП-14,°С<br>ЦТЩУ<br>ШОС[P14_EU00T001][CHECK:45,40,10,5]",
	CAST(P15_EU00T001 as decimal(15,1)) as "ИБП-15,°С<br>ЭКОМ-3000<br>Центральная серверная[P15_EU00T001][CHECK:45,40,10,5]",
	CAST(P17_EU00T001 as decimal(15,1)) as "ИБП-17,°С<br>ШКУ<br>Т/О-IIоч.[P17_EU00T001][CHECK:45,40,10,5]",
	CAST(P18_EU00T001 as decimal(15,1)) as "ИБП-18,°С<br><br>ГРП[P18_EU00T001][CHECK:45,40,10,5]",
	CAST(P19_EU00T001 as decimal(15,1)) as "ИБП-19,°С<br><br>ТТЦ[P19_EU00T001][CHECK:45,40,10,5]",
	CAST(P20_EU00T001 as decimal(15,1)) as "ИБП-20 <br> РЭП СН-4 [P20_EU00T001][CHECK:45,40,10,5]",
	CAST(P21_EU00T001 as decimal(15,1)) as "ИБП-21 <br> КН3-1 [P21_EU00T001][CHECK:45,40,10,5]",
	CAST(P22_EU00T001 as decimal(15,1)) as "ИБП-22 <br> КА-4 [P22_EU00T001][CHECK:45,40,10,5]",
	CAST(P23_EU00T001 as decimal(15,1)) as "ИБП-23 <br> ШПЗ КА-3,4,5[P23_EU00T001][CHECK:45,40,10,5]",
	CAST(P24_EU00T001 as decimal(15,1)) as "ИБП-24 <br> АСУ [P24_EU00T001][CHECK:45,40,10,5]",
	CAST(U1_Tnv_3_4 as decimal(15,1)) as "Т наружного воздуха, °С[U1_Tnv_3_4][CHECK:35,30,-30,-35]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_STKER_Y80, S2_STKER_Y999, S2_PLC1_T, N01_UM10T001, S3_PLC1_T, U1_Tnv_3_4, P01_EU00T001, P02_EU00T001, P03_EU00T001, P04_EU00T001, P05_EU00T001, P06_EU00T001, P07_EU00T001, P09_EU00T001, P10_EU00T001, P11_EU00T001, P12_EU00T001, P13_EU00T001, P14_EU00T001, P15_EU00T001, P17_EU00T001, P18_EU00T001, P19_EU00T001, P20_EU00T001, P21_EU00T001, P22_EU00T001, P23_EU00T001, P24_EU00T001
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")