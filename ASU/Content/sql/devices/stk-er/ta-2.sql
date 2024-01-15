{минутные срезы}
/*ReportName=Параметры СТК-ЭР (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(S2_STKER_Y0 as decimal(15, 3)) as "S, МВА [S2_STKER_Y0]",
	CAST(S2_STKER_Y1 as decimal(15, 3)) as "P, МВт [S2_STKER_Y1]",
	CAST(S2_STKER_Y2 as decimal(15, 3)) as "Q, МВАр [S2_STKER_Y2]",
	CAST(S2_STKER_Y3 as decimal(15, 3)) as "f, Гц [S2_STKER_Y3]",
	CAST(S2_STKER_Y4 as decimal(15, 3)) as "Uстат., кВ [S2_STKER_Y4]",
	CAST(S2_STKER_Y5 as decimal(15, 3)) as "Ia, кА [S2_STKER_Y5]",
	CAST(S2_STKER_Y6 as decimal(15, 3)) as "Ib, кА [S2_STKER_Y6]",
	CAST(S2_STKER_Y7 as decimal(15, 3)) as "Ic, кА [S2_STKER_Y7]",
	CAST(S2_STKER_Y9 as decimal(15, 3)) as "Uвозб., В [S2_STKER_Y9]",
	CAST(S2_STKER_K0 as decimal(15, 3)) as "cosф [S2_STKER_K0]",
	CAST(S2_STKER_I0 as decimal(15, 3)) as "I о.п. [S2_STKER_I0]",
	CAST(S2_STKER_Y10 as decimal(15, 3)) as "N ротора, об/мин [S2_STKER_Y10]",
	CAST(S2_STKER_Y8 as decimal(15, 3)) as "I возбужд. [S2_STKER_Y8]",
	CAST(S2_STKER_BK1 as decimal(15, 3)) as "Т обм. стат, паз № 02 [S2_STKER_BK1]",
	CAST(S2_STKER_BK7 as decimal(15, 3)) as "Т обм. стат, паз № 2 [S2_STKER_BK7]",
	CAST(S2_STKER_BK2 as decimal(15, 3)) as "Т обм. стат, паз № 03 [S2_STKER_BK2]",
	CAST(S2_STKER_BK8 as decimal(15, 3)) as "Т обм. стат, паз № 3 [S2_STKER_BK8]",
	CAST(S2_STKER_BK3 as decimal(15, 3)) as "Т обм. стат, паз № 018 [S2_STKER_BK3]",
	CAST(S2_STKER_BK9 as decimal(15, 3)) as "Т обм. стат, паз № 18 [S2_STKER_BK9]",
	CAST(S2_STKER_BK10 as decimal(15, 3)) as "Т обм. стат, паз № 019 [S2_STKER_BK10]",
	CAST(S2_STKER_BK4 as decimal(15, 3)) as "Т обм. стат, паз № 19 [S2_STKER_BK4]",
	CAST(S2_STKER_BK11 as decimal(15, 3)) as "Т обм. стат, паз № 034 [S2_STKER_BK11]",
	CAST(S2_STKER_BK5 as decimal(15, 3)) as "Т обм. стат, паз № 34 [S2_STKER_BK5]",
	CAST(S2_STKER_BK12 as decimal(15, 3)) as "Т обм. стат, паз № 035 [S2_STKER_BK12]",
	CAST(S2_STKER_BK6 as decimal(15, 3)) as "Т обм. стат, паз № 35 [S2_STKER_BK6]",
	CAST(S2_STKER_BK13 as decimal(15, 3)) as "Т. стали серд. стат., п № 02 [S2_STKER_BK13]",
	CAST(S2_STKER_BK14 as decimal(15, 3)) as "Т. стали серд. стат., п № 03 [S2_STKER_BK14]",
	CAST(S2_STKER_BK15 as decimal(15, 3)) as "Т. стали серд. стат., п № 018 [S2_STKER_BK15]",
	CAST(S2_STKER_BK16 as decimal(15, 3)) as "Т. стали серд. стат., п № 019 [S2_STKER_BK16]",
	CAST(S2_STKER_BK17 as decimal(15, 3)) as "Т. стали серд. стат., п № 034 [S2_STKER_BK17]",
	CAST(S2_STKER_BK18 as decimal(15, 3)) as "Т. стали серд. стат., п № 035 [S2_STKER_BK18]",
	CAST(S2_STKER_BK19 as decimal(15, 3)) as "Т. стали серд. стат., п № 2 [S2_STKER_BK19]",
	CAST(S2_STKER_BK20 as decimal(15, 3)) as "Т. стали серд. стат., п № 3 [S2_STKER_BK20]",
	CAST(S2_STKER_BK21 as decimal(15, 3)) as "Т. стали серд. стат., п № 18 [S2_STKER_BK21]",
	CAST(S2_STKER_BK22 as decimal(15, 3)) as "Т. стали серд. стат., п № 19 [S2_STKER_BK22]",
	CAST(S2_STKER_BK23 as decimal(15, 3)) as "Т. стали серд. стат., п № 34 [S2_STKER_BK23]",
	CAST(S2_STKER_BK24 as decimal(15, 3)) as "Т. стали серд. стат., п № 35 [S2_STKER_BK24]",
	CAST(S2_STKER_BK25 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., сл.ст.Т [S2_STKER_BK25]",
	CAST(S2_STKER_BK26 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., сп.ст.В [S2_STKER_BK26]",
	CAST(S2_STKER_BK27 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., корп.возб.сп. [S2_STKER_BK27]",
	CAST(S2_STKER_BK28 as decimal(15, 3)) as "Т гор.возд.на вых. ВО генер., сл.ст.Т [S2_STKER_BK28]",
	CAST(S2_STKER_BK29 as decimal(15, 3)) as "Т гор.возд.на вых. ВО генер., сп.ст.В [S2_STKER_BK29]",
	CAST(S2_STKER_BK30 as decimal(15, 3)) as "Т гор.возд.на вых.воздоох-ля г., корп.возб.сп. [S2_STKER_BK30]",
	CAST(S2_STKER_BK31 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.В сп. 1 [S2_STKER_BK31]",
	CAST(S2_STKER_BK32 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.В сп. 2 [S2_STKER_BK32]",
	CAST(S2_STKER_BK33 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.Т сл. 1 [S2_STKER_BK33]",
	CAST(S2_STKER_BK34 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.Т сл. 2 [S2_STKER_BK34]",
	CAST(S2_STKER_BK35 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля в., слив сл. [S2_STKER_BK35]",
	CAST(S2_STKER_BK36 as decimal(15, 3)) as "Т масла на сливе подш. [S2_STKER_BK36]",
	CAST(S2_STKER_BK37 as decimal(15, 3)) as "Т вкладыша подш. [S2_STKER_BK37]",
	CAST(S2_STKER_BK38 as decimal(15, 3)) as "Т масла на входе в подш. [S2_STKER_BK38]",
	CAST(S2_STKER_BK39 as decimal(15, 3)) as "Т хол. воды на входе в ВО [S2_STKER_BK39]",
	CAST(S2_STKER_BK40 as decimal(15, 3)) as "P воды на входе в ВО [S2_STKER_BK40]",
	CAST(S2_STKER_BK41 as decimal(15, 3)) as "F воды на ВО ген. [S2_STKER_BK41]",
	CAST(S2_STKER_BK42 as decimal(15, 3)) as "F воды на ВО возб. [S2_STKER_BK42]",
	CAST(S2_STKER_BK43 as decimal(15, 3)) as "Точка росы в генераторе [S2_STKER_BK43]",
	CAST(S2_STKER_Y999 as decimal(15, 3)) as "Т в шкафу [S2_STKER_Y999]"
FROM
	OpenQuery(INSQL,
	"SELECT
	DateTime,S2_STKER_BK1,S2_STKER_BK10,S2_STKER_BK11,S2_STKER_BK12,S2_STKER_BK13,S2_STKER_BK14,S2_STKER_BK15,S2_STKER_BK16,S2_STKER_BK17,S2_STKER_BK18,S2_STKER_BK19,S2_STKER_BK2,S2_STKER_BK20,S2_STKER_BK21,S2_STKER_BK22,S2_STKER_BK23,S2_STKER_BK24,S2_STKER_BK25,S2_STKER_BK26,S2_STKER_BK27,S2_STKER_BK28,S2_STKER_BK29,S2_STKER_BK3,S2_STKER_BK30,S2_STKER_BK31,S2_STKER_BK32,S2_STKER_BK33,S2_STKER_BK34,S2_STKER_BK35,S2_STKER_BK36,S2_STKER_BK37,S2_STKER_BK38,S2_STKER_BK39,S2_STKER_BK4,S2_STKER_BK40,S2_STKER_BK41,S2_STKER_BK42,S2_STKER_BK43,S2_STKER_BK44,S2_STKER_BK45,S2_STKER_BK46,S2_STKER_BK47,S2_STKER_BK5,S2_STKER_BK6,S2_STKER_BK7,S2_STKER_BK8,S2_STKER_BK9,S2_STKER_I0,S2_STKER_K0,S2_STKER_Y0,S2_STKER_Y1,S2_STKER_Y10,S2_STKER_Y2,S2_STKER_Y3,S2_STKER_Y4,S2_STKER_Y5,S2_STKER_Y6,S2_STKER_Y7,S2_STKER_Y8,S2_STKER_Y9,S2_STKER_Y999
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Параметры СТК-ЭР (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(S2_STKER_Y0 as decimal(15, 3)) as "S, МВА [S2_STKER_Y0]",
	CAST(S2_STKER_Y1 as decimal(15, 3)) as "P, МВт [S2_STKER_Y1]",
	CAST(S2_STKER_Y2 as decimal(15, 3)) as "Q, МВАр [S2_STKER_Y2]",
	CAST(S2_STKER_Y3 as decimal(15, 3)) as "f, Гц [S2_STKER_Y3]",
	CAST(S2_STKER_Y4 as decimal(15, 3)) as "Uстат., кВ [S2_STKER_Y4]",
	CAST(S2_STKER_Y5 as decimal(15, 3)) as "Ia, кА [S2_STKER_Y5]",
	CAST(S2_STKER_Y6 as decimal(15, 3)) as "Ib, кА [S2_STKER_Y6]",
	CAST(S2_STKER_Y7 as decimal(15, 3)) as "Ic, кА [S2_STKER_Y7]",
	CAST(S2_STKER_Y9 as decimal(15, 3)) as "Uвозб., В [S2_STKER_Y9]",
	CAST(S2_STKER_K0 as decimal(15, 3)) as "cosф [S2_STKER_K0]",
	CAST(S2_STKER_I0 as decimal(15, 3)) as "I о.п. [S2_STKER_I0]",
	CAST(S2_STKER_Y10 as decimal(15, 3)) as "N ротора, об/мин [S2_STKER_Y10]",
	CAST(S2_STKER_Y8 as decimal(15, 3)) as "I возбужд. [S2_STKER_Y8]",
	CAST(S2_STKER_BK1 as decimal(15, 3)) as "Т обм. стат, паз № 02 [S2_STKER_BK1]",
	CAST(S2_STKER_BK7 as decimal(15, 3)) as "Т обм. стат, паз № 2 [S2_STKER_BK7]",
	CAST(S2_STKER_BK2 as decimal(15, 3)) as "Т обм. стат, паз № 03 [S2_STKER_BK2]",
	CAST(S2_STKER_BK8 as decimal(15, 3)) as "Т обм. стат, паз № 3 [S2_STKER_BK8]",
	CAST(S2_STKER_BK3 as decimal(15, 3)) as "Т обм. стат, паз № 018 [S2_STKER_BK3]",
	CAST(S2_STKER_BK9 as decimal(15, 3)) as "Т обм. стат, паз № 18 [S2_STKER_BK9]",
	CAST(S2_STKER_BK10 as decimal(15, 3)) as "Т обм. стат, паз № 019 [S2_STKER_BK10]",
	CAST(S2_STKER_BK4 as decimal(15, 3)) as "Т обм. стат, паз № 19 [S2_STKER_BK4]",
	CAST(S2_STKER_BK11 as decimal(15, 3)) as "Т обм. стат, паз № 034 [S2_STKER_BK11]",
	CAST(S2_STKER_BK5 as decimal(15, 3)) as "Т обм. стат, паз № 34 [S2_STKER_BK5]",
	CAST(S2_STKER_BK12 as decimal(15, 3)) as "Т обм. стат, паз № 035 [S2_STKER_BK12]",
	CAST(S2_STKER_BK6 as decimal(15, 3)) as "Т обм. стат, паз № 35 [S2_STKER_BK6]",
	CAST(S2_STKER_BK13 as decimal(15, 3)) as "Т. стали серд. стат., п № 02 [S2_STKER_BK13]",
	CAST(S2_STKER_BK14 as decimal(15, 3)) as "Т. стали серд. стат., п № 03 [S2_STKER_BK14]",
	CAST(S2_STKER_BK15 as decimal(15, 3)) as "Т. стали серд. стат., п № 018 [S2_STKER_BK15]",
	CAST(S2_STKER_BK16 as decimal(15, 3)) as "Т. стали серд. стат., п № 019 [S2_STKER_BK16]",
	CAST(S2_STKER_BK17 as decimal(15, 3)) as "Т. стали серд. стат., п № 034 [S2_STKER_BK17]",
	CAST(S2_STKER_BK18 as decimal(15, 3)) as "Т. стали серд. стат., п № 035 [S2_STKER_BK18]",
	CAST(S2_STKER_BK19 as decimal(15, 3)) as "Т. стали серд. стат., п № 2 [S2_STKER_BK19]",
	CAST(S2_STKER_BK20 as decimal(15, 3)) as "Т. стали серд. стат., п № 3 [S2_STKER_BK20]",
	CAST(S2_STKER_BK21 as decimal(15, 3)) as "Т. стали серд. стат., п № 18 [S2_STKER_BK21]",
	CAST(S2_STKER_BK22 as decimal(15, 3)) as "Т. стали серд. стат., п № 19 [S2_STKER_BK22]",
	CAST(S2_STKER_BK23 as decimal(15, 3)) as "Т. стали серд. стат., п № 34 [S2_STKER_BK23]",
	CAST(S2_STKER_BK24 as decimal(15, 3)) as "Т. стали серд. стат., п № 35 [S2_STKER_BK24]",
	CAST(S2_STKER_BK25 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., сл.ст.Т [S2_STKER_BK25]",
	CAST(S2_STKER_BK26 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., сп.ст.В [S2_STKER_BK26]",
	CAST(S2_STKER_BK27 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., корп.возб.сп. [S2_STKER_BK27]",
	CAST(S2_STKER_BK28 as decimal(15, 3)) as "Т гор.возд.на вых. ВО генер., сл.ст.Т [S2_STKER_BK28]",
	CAST(S2_STKER_BK29 as decimal(15, 3)) as "Т гор.возд.на вых. ВО генер., сп.ст.В [S2_STKER_BK29]",
	CAST(S2_STKER_BK30 as decimal(15, 3)) as "Т гор.возд.на вых.воздоох-ля г., корп.возб.сп. [S2_STKER_BK30]",
	CAST(S2_STKER_BK31 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.В сп. 1 [S2_STKER_BK31]",
	CAST(S2_STKER_BK32 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.В сп. 2 [S2_STKER_BK32]",
	CAST(S2_STKER_BK33 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.Т сл. 1 [S2_STKER_BK33]",
	CAST(S2_STKER_BK34 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.Т сл. 2 [S2_STKER_BK34]",
	CAST(S2_STKER_BK35 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля в., слив сл. [S2_STKER_BK35]",
	CAST(S2_STKER_BK36 as decimal(15, 3)) as "Т масла на сливе подш. [S2_STKER_BK36]",
	CAST(S2_STKER_BK37 as decimal(15, 3)) as "Т вкладыша подш. [S2_STKER_BK37]",
	CAST(S2_STKER_BK38 as decimal(15, 3)) as "Т масла на входе в подш. [S2_STKER_BK38]",
	CAST(S2_STKER_BK39 as decimal(15, 3)) as "Т хол. воды на входе в ВО [S2_STKER_BK39]",
	CAST(S2_STKER_BK40 as decimal(15, 3)) as "P воды на входе в ВО [S2_STKER_BK40]",
	CAST(S2_STKER_BK41 as decimal(15, 3)) as "F воды на ВО ген. [S2_STKER_BK41]",
	CAST(S2_STKER_BK42 as decimal(15, 3)) as "F воды на ВО возб. [S2_STKER_BK42]",
	CAST(S2_STKER_BK43 as decimal(15, 3)) as "Точка росы в генераторе [S2_STKER_BK43]",
	CAST(S2_STKER_Y999 as decimal(15, 3)) as "Т в шкафу [S2_STKER_Y999]"
FROM
	OpenQuery(INSQL,
	"SELECT
	DateTime,S2_STKER_BK1,S2_STKER_BK10,S2_STKER_BK11,S2_STKER_BK12,S2_STKER_BK13,S2_STKER_BK14,S2_STKER_BK15,S2_STKER_BK16,S2_STKER_BK17,S2_STKER_BK18,S2_STKER_BK19,S2_STKER_BK2,S2_STKER_BK20,S2_STKER_BK21,S2_STKER_BK22,S2_STKER_BK23,S2_STKER_BK24,S2_STKER_BK25,S2_STKER_BK26,S2_STKER_BK27,S2_STKER_BK28,S2_STKER_BK29,S2_STKER_BK3,S2_STKER_BK30,S2_STKER_BK31,S2_STKER_BK32,S2_STKER_BK33,S2_STKER_BK34,S2_STKER_BK35,S2_STKER_BK36,S2_STKER_BK37,S2_STKER_BK38,S2_STKER_BK39,S2_STKER_BK4,S2_STKER_BK40,S2_STKER_BK41,S2_STKER_BK42,S2_STKER_BK43,S2_STKER_BK44,S2_STKER_BK45,S2_STKER_BK46,S2_STKER_BK47,S2_STKER_BK5,S2_STKER_BK6,S2_STKER_BK7,S2_STKER_BK8,S2_STKER_BK9,S2_STKER_I0,S2_STKER_K0,S2_STKER_Y0,S2_STKER_Y1,S2_STKER_Y10,S2_STKER_Y2,S2_STKER_Y3,S2_STKER_Y4,S2_STKER_Y5,S2_STKER_Y6,S2_STKER_Y7,S2_STKER_Y8,S2_STKER_Y9,S2_STKER_Y999
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Параметры СТК-ЭР (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	CAST(S2_STKER_Y0 as decimal(15, 3)) as "S, МВА [S2_STKER_Y0]",
	CAST(S2_STKER_Y1 as decimal(15, 3)) as "P, МВт [S2_STKER_Y1]",
	CAST(S2_STKER_Y2 as decimal(15, 3)) as "Q, МВАр [S2_STKER_Y2]",
	CAST(S2_STKER_Y3 as decimal(15, 3)) as "f, Гц [S2_STKER_Y3]",
	CAST(S2_STKER_Y4 as decimal(15, 3)) as "Uстат., кВ [S2_STKER_Y4]",
	CAST(S2_STKER_Y5 as decimal(15, 3)) as "Ia, кА [S2_STKER_Y5]",
	CAST(S2_STKER_Y6 as decimal(15, 3)) as "Ib, кА [S2_STKER_Y6]",
	CAST(S2_STKER_Y7 as decimal(15, 3)) as "Ic, кА [S2_STKER_Y7]",
	CAST(S2_STKER_Y9 as decimal(15, 3)) as "Uвозб., В [S2_STKER_Y9]",
	CAST(S2_STKER_K0 as decimal(15, 3)) as "cosф [S2_STKER_K0]",
	CAST(S2_STKER_I0 as decimal(15, 3)) as "I о.п. [S2_STKER_I0]",
	CAST(S2_STKER_Y10 as decimal(15, 3)) as "N ротора, об/мин [S2_STKER_Y10]",
	CAST(S2_STKER_Y8 as decimal(15, 3)) as "I возбужд. [S2_STKER_Y8]",
	CAST(S2_STKER_BK1 as decimal(15, 3)) as "Т обм. стат, паз № 02 [S2_STKER_BK1]",
	CAST(S2_STKER_BK7 as decimal(15, 3)) as "Т обм. стат, паз № 2 [S2_STKER_BK7]",
	CAST(S2_STKER_BK2 as decimal(15, 3)) as "Т обм. стат, паз № 03 [S2_STKER_BK2]",
	CAST(S2_STKER_BK8 as decimal(15, 3)) as "Т обм. стат, паз № 3 [S2_STKER_BK8]",
	CAST(S2_STKER_BK3 as decimal(15, 3)) as "Т обм. стат, паз № 018 [S2_STKER_BK3]",
	CAST(S2_STKER_BK9 as decimal(15, 3)) as "Т обм. стат, паз № 18 [S2_STKER_BK9]",
	CAST(S2_STKER_BK10 as decimal(15, 3)) as "Т обм. стат, паз № 019 [S2_STKER_BK10]",
	CAST(S2_STKER_BK4 as decimal(15, 3)) as "Т обм. стат, паз № 19 [S2_STKER_BK4]",
	CAST(S2_STKER_BK11 as decimal(15, 3)) as "Т обм. стат, паз № 034 [S2_STKER_BK11]",
	CAST(S2_STKER_BK5 as decimal(15, 3)) as "Т обм. стат, паз № 34 [S2_STKER_BK5]",
	CAST(S2_STKER_BK12 as decimal(15, 3)) as "Т обм. стат, паз № 035 [S2_STKER_BK12]",
	CAST(S2_STKER_BK6 as decimal(15, 3)) as "Т обм. стат, паз № 35 [S2_STKER_BK6]",
	CAST(S2_STKER_BK13 as decimal(15, 3)) as "Т. стали серд. стат., п № 02 [S2_STKER_BK13]",
	CAST(S2_STKER_BK14 as decimal(15, 3)) as "Т. стали серд. стат., п № 03 [S2_STKER_BK14]",
	CAST(S2_STKER_BK15 as decimal(15, 3)) as "Т. стали серд. стат., п № 018 [S2_STKER_BK15]",
	CAST(S2_STKER_BK16 as decimal(15, 3)) as "Т. стали серд. стат., п № 019 [S2_STKER_BK16]",
	CAST(S2_STKER_BK17 as decimal(15, 3)) as "Т. стали серд. стат., п № 034 [S2_STKER_BK17]",
	CAST(S2_STKER_BK18 as decimal(15, 3)) as "Т. стали серд. стат., п № 035 [S2_STKER_BK18]",
	CAST(S2_STKER_BK19 as decimal(15, 3)) as "Т. стали серд. стат., п № 2 [S2_STKER_BK19]",
	CAST(S2_STKER_BK20 as decimal(15, 3)) as "Т. стали серд. стат., п № 3 [S2_STKER_BK20]",
	CAST(S2_STKER_BK21 as decimal(15, 3)) as "Т. стали серд. стат., п № 18 [S2_STKER_BK21]",
	CAST(S2_STKER_BK22 as decimal(15, 3)) as "Т. стали серд. стат., п № 19 [S2_STKER_BK22]",
	CAST(S2_STKER_BK23 as decimal(15, 3)) as "Т. стали серд. стат., п № 34 [S2_STKER_BK23]",
	CAST(S2_STKER_BK24 as decimal(15, 3)) as "Т. стали серд. стат., п № 35 [S2_STKER_BK24]",
	CAST(S2_STKER_BK25 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., сл.ст.Т [S2_STKER_BK25]",
	CAST(S2_STKER_BK26 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., сп.ст.В [S2_STKER_BK26]",
	CAST(S2_STKER_BK27 as decimal(15, 3)) as "Т хол.возд.на вых. ВО генер., корп.возб.сп. [S2_STKER_BK27]",
	CAST(S2_STKER_BK28 as decimal(15, 3)) as "Т гор.возд.на вых. ВО генер., сл.ст.Т [S2_STKER_BK28]",
	CAST(S2_STKER_BK29 as decimal(15, 3)) as "Т гор.возд.на вых. ВО генер., сп.ст.В [S2_STKER_BK29]",
	CAST(S2_STKER_BK30 as decimal(15, 3)) as "Т гор.возд.на вых.воздоох-ля г., корп.возб.сп. [S2_STKER_BK30]",
	CAST(S2_STKER_BK31 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.В сп. 1 [S2_STKER_BK31]",
	CAST(S2_STKER_BK32 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.В сп. 2 [S2_STKER_BK32]",
	CAST(S2_STKER_BK33 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.Т сл. 1 [S2_STKER_BK33]",
	CAST(S2_STKER_BK34 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля г., ст.Т сл. 2 [S2_STKER_BK34]",
	CAST(S2_STKER_BK35 as decimal(15, 3)) as "Т г.в.всл.патр.на вых.из возд-ля в., слив сл. [S2_STKER_BK35]",
	CAST(S2_STKER_BK36 as decimal(15, 3)) as "Т масла на сливе подш. [S2_STKER_BK36]",
	CAST(S2_STKER_BK37 as decimal(15, 3)) as "Т вкладыша подш. [S2_STKER_BK37]",
	CAST(S2_STKER_BK38 as decimal(15, 3)) as "Т масла на входе в подш. [S2_STKER_BK38]",
	CAST(S2_STKER_BK39 as decimal(15, 3)) as "Т хол. воды на входе в ВО [S2_STKER_BK39]",
	CAST(S2_STKER_BK40 as decimal(15, 3)) as "P воды на входе в ВО [S2_STKER_BK40]",
	CAST(S2_STKER_BK41 as decimal(15, 3)) as "F воды на ВО ген. [S2_STKER_BK41]",
	CAST(S2_STKER_BK42 as decimal(15, 3)) as "F воды на ВО возб. [S2_STKER_BK42]",
	CAST(S2_STKER_BK43 as decimal(15, 3)) as "Точка росы в генераторе [S2_STKER_BK43]",
	CAST(S2_STKER_Y999 as decimal(15, 3)) as "Т в шкафу [S2_STKER_Y999]"
FROM
	OpenQuery(INSQL,
	"SELECT
	DateTime,S2_STKER_BK1,S2_STKER_BK10,S2_STKER_BK11,S2_STKER_BK12,S2_STKER_BK13,S2_STKER_BK14,S2_STKER_BK15,S2_STKER_BK16,S2_STKER_BK17,S2_STKER_BK18,S2_STKER_BK19,S2_STKER_BK2,S2_STKER_BK20,S2_STKER_BK21,S2_STKER_BK22,S2_STKER_BK23,S2_STKER_BK24,S2_STKER_BK25,S2_STKER_BK26,S2_STKER_BK27,S2_STKER_BK28,S2_STKER_BK29,S2_STKER_BK3,S2_STKER_BK30,S2_STKER_BK31,S2_STKER_BK32,S2_STKER_BK33,S2_STKER_BK34,S2_STKER_BK35,S2_STKER_BK36,S2_STKER_BK37,S2_STKER_BK38,S2_STKER_BK39,S2_STKER_BK4,S2_STKER_BK40,S2_STKER_BK41,S2_STKER_BK42,S2_STKER_BK43,S2_STKER_BK44,S2_STKER_BK45,S2_STKER_BK46,S2_STKER_BK47,S2_STKER_BK5,S2_STKER_BK6,S2_STKER_BK7,S2_STKER_BK8,S2_STKER_BK9,S2_STKER_I0,S2_STKER_K0,S2_STKER_Y0,S2_STKER_Y1,S2_STKER_Y10,S2_STKER_Y2,S2_STKER_Y3,S2_STKER_Y4,S2_STKER_Y5,S2_STKER_Y6,S2_STKER_Y7,S2_STKER_Y8,S2_STKER_Y9,S2_STKER_Y999
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")