{часовые срезы}
/*ReportName="Показатели экономичности с мазутом (ЭКОМ)" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST((L01_EB10P000_H1+L02_EB10P000_H1)/1000 as decimal(15,3))
		as "Выра- ботка Эл/эн, тыс.кВт.ч. [(L01_EB10P000_H1+L02_EB10P000_H1)]",
	CAST(((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000 as decimal(15,3))
		as "Отпуск Эл/эн, тыс.кВт.ч. [hint:E01-(E19+E20+E21+E22+E23+E24+E25+E26)]",
	CAST((U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187 as decimal(15,2))
		as "Отпуск т/эн, ГКал [hint:Отпуск теплоэнергии, ГКал]",
	CAST((U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1)/4.187as decimal(15,2))
		as "Отпуск т/эн водой, ГКал [hint:Отпуск теплоэнергии по магистралям Центр+Док+запад+ВЗРД]",
	CAST((U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187 as decimal(15,2))
		as "Отпуск т/эн паром, ГКал [hint:Отпуск теплоэнергии по магистралям Док+КИМ+ВЗРД (пар)]",
	CAST(M00_AF00G102 as decimal(15,3))
		as "Расход мазута, т/ч [hint:Edit:m1|M00_AF00G102] [Edit:m1|M00_AF00G102]",
	CAST(M00_AF00W102 as decimal(15,3))
		as "Кало- рий- ность мазута, ККал/Кг  [hint:Edit:m1|M00_AF00W102][Edit:m1|M00_AF00W102]",
	CAST(M00_AF00W102 * M00_AF00G102 / 7000 as decimal(15,3))
		as "Расход Усл. Топл Мазут,  ТУТ  [hint: M00_AF00W102*M00_AF00G102/7000]",
	CAST(G01_AM31Q701_H1 / 1000 as decimal(15,3))
		as "Расход газа, тыс. м3/ч [G01_AM31Q701_H1]",
	CAST((G01_AM31Q701_H1*8/7/1000)+((M00_AF00W102)*(M00_AF00G102)/7000) as decimal(15,3)) 
		as "Расход Усл. Топл ГАЗ+ Мазут,  ТУТ [hint:G01_AM31Q701_H1/1000*8/7+M00_AF00G101/1000*M00_AF00w101/7]",
	CAST(MI_URT_OE as decimal(15,3))
		as "Уд. расх. топл. [MI_URT_OE]",
	CAST((MI_URT_OE * ((L01_EB10P000_H1+L02_EB10P000_H1) - (L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000)/1000 as decimal(15,2)) 
		as "Расх. топл. на отп. ЭЭ, ТУТ [hint:Расход топлива на отпуск электроэнергии]",
	CAST((G01_AM31Q701_H1*8/7/1000 + M00_AF00W102*M00_AF00G102/7000)-MI_URT_OE*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000*0.001 as decimal(15,2))
		as "Расх. топл. на отп. ТЭ, ТУТ [hint:Расход топлива на отпуск теплоэнергии]",
	CAST(dbo.vst_SafeDIV((G01_AM31Q701_H1*8/7/1000-MI_URT_OE*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000*0.001),((U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1))/4.187)*1000 as decimal(15,3))
		as "Уд. расх. топл. на отп. ТЭ, кг/ГКал [hint:Удельный Расход топлива на отпуск теплоэнергии при заданом Вээ, кг/ГКал]",
	CAST(100*dbo.vst_SafeDIV((0.86*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000+ (U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187),((G01_AM31Q701_H1*8/7/1000+M00_AF00W102*M00_AF00G102/7000)*7)) as decimal(15,2))
		as "КПД топливо- использо- вания, % [hint:КПД топливоиспользования ТЭЦ, %]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty,
	L01_EB10P000_H1, L02_EB10P000_H1, L07_EB10P000_H1, L08_EB10P000_H1, L09_EB10P000_H1, L67_EB10P000_H1, L20_EB10P000_H1, L21_EB10P000_H1,
	L22_EB10P000_H1, L23_EB10P000_H1, MI_URT_OE, M00_AF00G102, M00_AF00W102, U04_UM31W001_H1, U06_UM31W001_H1, U07_UM31W001_H1,
	U05_UM31W001_H1, U01_UN31W001_H1, U02_UN31W001_H1, U03_UN31W001_H1, G01_AM31Q701_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Показатели экономичности с мазутом (ЭКОМ)" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="часовые срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+CLC_ShiftDuty)
		as "Cме- на [CLC_ShiftDuty]",
	CAST((L01_EB10P000_H1+L02_EB10P000_H1)/1000 as decimal(15,3))
		as "Выработка Эл/эн, тыс.кВт.ч. [(L01_EB10P000_H1+L02_EB10P000_H1)]",
	CAST(((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000 as decimal(15,3))
		as "Отпуск Эл/эн, тыс.кВт.ч. [hint:E01-(E19+E20+E21+E22+E23+E24+E25+E26)]",
	CAST((U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187 as decimal(15,2))
		as "Отпуск т/эн, ГКал [hint:Отпуск теплоэнергии, ГКал]",
	CAST((U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1)/4.187as decimal(15,2))
		as "Отпуск т/эн водой, ГКал [hint:Отпуск теплоэнергии по магистралям Центр+Док+запад+ВЗРД]",
	CAST((U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187as decimal(15,2))
		as "Отпуск т/эн паром, ГКал [hint:Отпуск теплоэнергии по магистралям Док+КИМ+ВЗРД (пар)]",
	CAST(M00_AF00G102 as decimal(15,3)) 
		as "Расход мазута, т/ч [hint:Edit:m1|M00_AF00G102] [Edit:m1|M00_AF00G102]",
	CAST(M00_AF00W102 as decimal(15,3))
		as "Кало- рий- ность мазута, ККал/Кг  [hint:Edit:m1|M00_AF00W102][Edit:m1|M00_AF00W102]",
	CAST(M00_AF00W102*M00_AF00G102/7000 as decimal(15,3)) 
		as "Расход Усл. Топл Мазут,  ТУТ  [hint: M00_AF00W102*M00_AF00G102/7000]",
	CAST(G01_AM31Q701_H1/1000 as decimal(15,3)) 
		as "Расход газа, тыс. м3/ч [G01_AM31Q701_H1]",
	CAST(G01_AM31Q701_H1*8/7/1000+M00_AF00W102*M00_AF00G102/7000 as decimal(15,3))
		as "Расход Усл. Топл ГАЗ+ Мазут,  ТУТ [hint:G01_AM31Q701_H1/1000*8/7+M00_AF00G101/1000*M00_AF00w101/7]",
	CAST(MI_URT_OE as decimal(15,3))
		as "Уд. расх. топл. [MI_URT_OE]",
	CAST((MI_URT_OE*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000)/1000 as decimal(15,2))
		as "Расх. топл. на отп. ЭЭ, ТУТ [hint:Расход топлива на отпуск электроэнергии]",
	CAST((G01_AM31Q701_H1*8/7/1000+M00_AF00W102*M00_AF00G102/7000)-MI_URT_OE*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000*0.001
	as decimal(15,2))
		as "Расх. топл. на отп. ТЭ, ТУТ [hint:Расход топлива на отпуск теплоэнергии]",
	CAST(dbo.vst_SafeDIV((G01_AM31Q701_H1*8/7/1000-MI_URT_OE*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000*0.001),((U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1))/4.187)*1000 as decimal(15,3))
		as "Уд. расх. топл. на отп. ТЭ, кг/ГКал [hint:Удельный Расход топлива на отпуск теплоэнергии при заданом Вээ, кг/ГКал]",
	CAST(100*dbo.vst_SafeDIV((0.86*((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000+(U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187),((G01_AM31Q701_H1*8/7/1000+M00_AF00W102*M00_AF00G102/7000)*7)) as decimal(15,2))
		as "КПД топливо- использо- вания, % [hint:КПД топливоиспользования ТЭЦ, %]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty,
	L01_EB10P000_H1, L02_EB10P000_H1, L07_EB10P000_H1, L08_EB10P000_H1, L09_EB10P000_H1, L67_EB10P000_H1, L20_EB10P000_H1, L21_EB10P000_H1, L22_EB10P000_H1, L23_EB10P000_H1, MI_URT_OE,
	M00_AF00G102, M00_AF00W102,
	U04_UM31W001_H1, U06_UM31W001_H1, U07_UM31W001_H1, U05_UM31W001_H1, U01_UN31W001_H1,  U02_UN31W001_H1,  U03_UN31W001_H1,
	G01_AM31Q701_H1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Показатели экономичности с мазутом (ЭКОМ)"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime)))
		as "Cмена [CLC_ShiftDuty]",
	CAST(sum((L01_EB10P000_H1+L02_EB10P000_H1))/1000 as decimal(15,3))
		as "Выработка Эл/эн, тыс.кВт.ч. [(L01_EB10P000_H1+L02_EB10P000_H1)]",
	CAST(sum((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000 as decimal(15,3))
		as "Отпуск Эл/эн, тыс.кВт.ч. [E01-(E19+E20+E21+E22+E23+E24+E25+E26)]",
	CAST(sum(U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187 as decimal(15,3))
		as "Отпуск т/эн, ГКал [Отпуск теплоэнергии, ГКал]",
	CAST(sum(U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1)/4.187 as decimal(15,3))
		as "Отпуск т/эн водой, ГКал [Отпуск теплоэнергии по магистралям Центр+Док+запад+ВЗРД]",
	CAST(sum(U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187 as decimal(15,3))
		as "Отпуск т/эн паром, ГКал [Отпуск теплоэнергии по магистралям Док+КИМ+ВЗРД (пар)]",
	CAST(sum(M00_AF00G102)as decimal(15,3))
		as "Расход мазута, т/ч [hint:M00_AF00G102]",
	CAST(avg(M00_AF00W102)as decimal(15,3))
		as "Кало- рийность мазута, ККал/Кг [hint:M00_AF00W102]",
	CAST(sum((M00_AF00G102*M00_AF00W102))/7000 as decimal(15,3))
		as "Расход Усл. Топл Мазут, ТУТ [hint: M00_AF00W102*M00_AF00G102/7000]",
	CAST(sum(G01_AM31Q701_H1)/1000 as decimal(15,3))
		as "Расход газа, тыс. м3/ч [G01_AM31Q701_H1]",
	CAST(sum((G01_AM31Q701_H1)*8/7/1000+((M00_AF00G102*M00_AF00W102)/7000)) as decimal(15,3))
		as "Расход Усл. Топл, ТУТ [G01_AM31Q701_H1*8/7]",
	CAST(avg(MI_URT_OE) as decimal(15,3))
		as "Уд. расх. топл. [MI_URT_OE]",
	CAST(avg(MI_URT_OE)*(sum((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000)/1000 as decimal(15,3))
		as "Расх. топл. на отп. ЭЭ, ТУТ [Расход топлива на отпуск электроэнергии]",
	CAST(sum((G01_AM31Q701_H1)*8/7/1000+((M00_AF00G102*M00_AF00W102)/7000))-(avg(MI_URT_OE)*(sum((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000)/1000) as decimal(15,3))
		as "Расх. топл. на отп. ТЭ, ТУТ [Расход топлива на отпуск теплоэнергии]",
	CAST(dbo.vst_SafeDIV((sum((G01_AM31Q701_H1)*8/7/1000+((M00_AF00G102*M00_AF00W102)/7000))-(avg(MI_URT_OE)*(sum((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000)/1000)),(sum(U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187))*1000 as decimal(15,3))
		as "Уд. расх. топл. на отп. ТЭ, кг/ГКал [Удельный Расход топлива на отпуск теплоэнергии при заданом Вээ, кг/ГКал]",
	CAST(100*dbo.vst_SafeDIV((0.86*(sum((L01_EB10P000_H1+L02_EB10P000_H1)-(L07_EB10P000_H1+L08_EB10P000_H1+L09_EB10P000_H1+L67_EB10P000_H1+L20_EB10P000_H1+L21_EB10P000_H1+L22_EB10P000_H1+L23_EB10P000_H1))/1000)+(sum(U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U01_UN31W001_H1+U02_UN31W001_H1+U03_UN31W001_H1)/4.187)
	),((sum((G01_AM31Q701_H1)*8/7/1000+((M00_AF00G102*M00_AF00W102)/7000)))*7)) as decimal(15,2))
		as "КПД топливо- использования, % [КПД топливоиспользования ТЭЦ, %]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, CLC_ShiftDuty,
	L01_EB10P000_H1, L02_EB10P000_H1, L07_EB10P000_H1, L08_EB10P000_H1, L09_EB10P000_H1, L67_EB10P000_H1, L20_EB10P000_H1, L21_EB10P000_H1, L22_EB10P000_H1, L23_EB10P000_H1, MI_URT_OE, 
	M00_AF00G102, M00_AF00W102,
	U04_UM31W001_H1, U06_UM31W001_H1, U07_UM31W001_H1, U05_UM31W001_H1, U01_UN31W001_H1, U02_UN31W001_H1, U03_UN31W001_H1,
	G01_AM31Q701_H1
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