{минутные срезы}
/*ReportName=Параметры подпиточного деаэратора ст. № 2 (т.о. I оч.)<br> (с регистратора VR-18, шкаф МО-1 ЦТЩУ)<br> (минутный срез)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(O02_AO40L701*(1-ROUND(O02_AO40L701/32767,0,1)) as decimal(15,2)) as "Ldpt (sm) [O02_AO40L701][CHECK:200,166,164,0]",
	CAST(O02_AO40P701*(1-ROUND(O02_AO40P701/32767,0,1)) as decimal(15,2)) as "Pdpt (kPa) [O02_AO40P701][CHECK:50,27,25,0]",
	CAST(O02_AO40T701*(1-ROUND(O02_AO40T701/32767,0,1)) as decimal(15,2)) as "Tdv (&deg; С) [O02_AO40T701][CHECK:100,92,90,0]",
	CAST(O02_AO40P702*(1-ROUND(O02_AO40P702/32767,0,1)) as decimal(15,2)) as "Ppdv (kPa) [O02_AO40P702][CHECK:100,22,20,0]",
	CAST(O02_AO40L702*(1-ROUND(O02_AO40L702/32767,0,1)) as decimal(15,2)) as "Lpdv (m) [O02_AO40L702][CHECK:100,1,-1,-100]",
	CAST(O02_AO40X701*(1-ROUND(O02_AO40X701/32767,0,1)) as decimal(15,2)) as "O<sup>2</sup>dp/t (mkg/dm) [O02_AO40X701][CHECK:4000,1,0,-4000]",
	CAST(O02_AO40X702*(1-ROUND(O02_AO40X702/32767,0,1)) as decimal(15,2)) as "O<sup>2</sup>od<br>(mkg/dm) [O02_AO40X702][CHECK:4000,1,0,-4000]",
	CAST(O02_AO40G701*(1-ROUND(O02_AO40G701/32767,0,1)) as decimal(15,2)) as "G pt/s (t/h)[O02_AO40G701]" 
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, O02_AO40L701,O02_AO40P701,O02_AO40T701,O02_AO40P702,O02_AO40L702,O02_AO40X701,O02_AO40X702,O02_AO40G701
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Параметры подпиточного деаэратора ст. № 2 (т.о. I оч.)<br> (с регистратора VR-18, шкаф МО-1 ЦТЩУ)<br>(часовой срез)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST(O02_AO40L701*(1-ROUND(O02_AO40L701/32767,0,1)) as decimal(15,2)) as "Ldpt (sm) [O02_AO40L701][CHECK:200,166,164,0]",
	CAST(O02_AO40P701*(1-ROUND(O02_AO40P701/32767,0,1)) as decimal(15,2)) as "Pdpt (kPa) [O02_AO40P701][CHECK:50,27,25,0]",
	CAST(O02_AO40T701*(1-ROUND(O02_AO40T701/32767,0,1)) as decimal(15,2)) as "Tdv (&deg; С) [O02_AO40T701][CHECK:100,92,90,0]",
	CAST(O02_AO40P702*(1-ROUND(O02_AO40P702/32767,0,1)) as decimal(15,2)) as "Ppdv (kPa) [O02_AO40P702][CHECK:100,22,20,0]",
	CAST(O02_AO40L702*(1-ROUND(O02_AO40L702/32767,0,1)) as decimal(15,2)) as "Lpdv (m) [O02_AO40L702][CHECK:100,1,-1,-100]",
	CAST(O02_AO40X701*(1-ROUND(O02_AO40X701/32767,0,1)) as decimal(15,2)) as "O<sup>2</sup>dp/t (mkg/dm) [O02_AO40X701][CHECK:4000,1,0,-4000]",
	CAST(O02_AO40X702*(1-ROUND(O02_AO40X702/32767,0,1)) as decimal(15,2)) as "O<sup>2</sup>od<br>(mkg/dm) [O02_AO40X702][CHECK:4000,1,0,-4000]",
	CAST(O02_AO40G701*(1-ROUND(O02_AO40G701/32767,0,1)) as decimal(15,2)) as "G pt/s (t/h)[O02_AO40G701]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, O02_AO40L701,O02_AO40P701,O02_AO40T701,O02_AO40P702,O02_AO40L702,O02_AO40X701,O02_AO40X702,O02_AO40G701
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Параметры подпиточного деаэратора ст. № 2 (т.о. I оч.)<br> (с регистратора VR-18, шкаф МО-1 ЦТЩУ)<br>(суточный срез)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT 
	DateTime - 1 as "Дата",
	CAST(O02_AO40L701*(1-ROUND(O02_AO40L701/32767,0,1)) as decimal(15,2)) as "Ldpt (sm) [O02_AO40L701][CHECK:200,166,164,0]",
	CAST(O02_AO40P701*(1-ROUND(O02_AO40P701/32767,0,1)) as decimal(15,2)) as "Pdpt (kPa) [O02_AO40P701][CHECK:50,27,25,0]",
	CAST(O02_AO40T701*(1-ROUND(O02_AO40T701/32767,0,1)) as decimal(15,2)) as "Tdv (&deg; С) [O02_AO40T701][CHECK:100,92,90,0]",
	CAST(O02_AO40P702*(1-ROUND(O02_AO40P702/32767,0,1)) as decimal(15,2)) as "Ppdv (kPa) [O02_AO40P702][CHECK:100,22,20,0]",
	CAST(O02_AO40L702*(1-ROUND(O02_AO40L702/32767,0,1)) as decimal(15,2)) as "Lpdv (m) [O02_AO40L702][CHECK:100,1,-1,-100]",
	CAST(O02_AO40X701*(1-ROUND(O02_AO40X701/32767,0,1)) as decimal(15,2)) as "O<sup>2</sup>dp/t (mkg/dm) [O02_AO40X701][CHECK:4000,1,0,-4000]",
	CAST(O02_AO40X702*(1-ROUND(O02_AO40X702/32767,0,1)) as decimal(15,2)) as "O<sup>2</sup>od<br>(mkg/dm) [O02_AO40X702][CHECK:4000,1,0,-4000]",
	CAST(O02_AO40G701*(1-ROUND(O02_AO40G701/32767,0,1)) as decimal(15,2)) as "G pt/s (t/h)[O02_AO40G701]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, O02_AO40L701,O02_AO40P701,O02_AO40T701,O02_AO40P702,O02_AO40L702,O02_AO40X701,O02_AO40X702,O02_AO40G701
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")