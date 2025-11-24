{срезы минутные}
/*ReportName="Отчёт КА-5 VG1. Экран 3" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K065 as decimal(15, 1)) as "Т52<br>°С [KA5_VG1_K065]",
	CAST(KA5_VG1_K066 as decimal(15, 1)) as "Т53<br>°С [KA5_VG1_K066]",
	CAST(KA5_VG1_K067 as decimal(15, 1)) as "Т54<br>°С [KA5_VG1_K067]",
	CAST(KA5_VG1_K068 as decimal(15, 1)) as "Т55<br>°С [KA5_VG1_K068]",
	CAST(KA5_VG1_K069 as decimal(15, 1)) as "Т56<br>°С [KA5_VG1_K069]",
	CAST(KA5_VG1_K070 as decimal(15, 1)) as "Т57<br>°С [KA5_VG1_K070]",
	CAST(KA5_VG1_K071 as decimal(15, 1)) as "Т58<br>°С [KA5_VG1_K071]",
	CAST(KA5_VG1_K072 as decimal(15, 1)) as "Т59<br>°С [KA5_VG1_K072]",
	CAST(KA5_VG1_K073 as decimal(15, 1)) as "Т60<br>°С [KA5_VG1_K073]",
	CAST(KA5_VG1_K074 as decimal(15, 1)) as "Т61<br>°С [KA5_VG1_K074]",
	CAST(KA5_VG1_K075 as decimal(15, 1)) as "Т62<br>°С [KA5_VG1_K075]",
	CAST(KA5_VG1_K076 as decimal(15, 1)) as "Т63<br>°С [KA5_VG1_K076]",
	CAST(KA5_VG1_K077 as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K077]",
	CAST(KA5_VG1_K078 as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K078]",
	CAST(KA5_VG1_K079 as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K079]",
	CAST(KA5_VG1_K080 as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K080]",
	CAST(KA5_VG1_K081 as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K081]",
	CAST(KA5_VG1_K082 as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K082]",
	CAST(KA5_VG1_K083 as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K083]",
	CAST(KA5_VG1_K084 as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K084]",
	CAST(KA5_VG1_K085 as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K085]",
	CAST(KA5_VG1_K086 as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K086]",
	CAST(KA5_VG1_K087 as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K087]",
	CAST(KA5_VG1_K088 as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K088]",
	CAST(KA5_VG1_K089 as decimal(15, 1)) as "Т41<br>°С [KA5_VG1_K089]",
	CAST(KA5_VG1_K090 as decimal(15, 1)) as "Т42<br>°С [KA5_VG1_K090]",
	CAST(KA5_VG1_K091 as decimal(15, 1)) as "Т43<br>°С [KA5_VG1_K091]",
	CAST(KA5_VG1_K092 as decimal(15, 1)) as "Т44<br>°С [KA5_VG1_K092]",
	CAST(KA5_VG1_K093 as decimal(15, 1)) as "Т45<br>°С [KA5_VG1_K093]",
	CAST(KA5_VG1_K094 as decimal(15, 1)) as "Т46<br>°С [KA5_VG1_K094]",
	CAST(KA5_VG1_K095 as decimal(15, 1)) as "Т47<br>°С [KA5_VG1_K095]",
	CAST(KA5_VG1_K096 as decimal(15, 1)) as "Т48<br>°С [KA5_VG1_K096]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070,
	KA5_VG1_K071,
	KA5_VG1_K072,
	KA5_VG1_K073,
	KA5_VG1_K074,
	KA5_VG1_K075,
	KA5_VG1_K076,
	KA5_VG1_K077,
	KA5_VG1_K078,
	KA5_VG1_K079,
	KA5_VG1_K080,
	KA5_VG1_K081,
	KA5_VG1_K082,
	KA5_VG1_K083,
	KA5_VG1_K084,
	KA5_VG1_K085,
	KA5_VG1_K086,
	KA5_VG1_K087,
	KA5_VG1_K088,
	KA5_VG1_K089,
	KA5_VG1_K090,
	KA5_VG1_K091,
	KA5_VG1_K092,
	KA5_VG1_K093,
	KA5_VG1_K094,
	KA5_VG1_K095,
	KA5_VG1_K096
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-5 VG1. Экран 3" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K065 as decimal(15, 1)) as "Т52<br>°С [KA5_VG1_K065]",
	CAST(KA5_VG1_K066 as decimal(15, 1)) as "Т53<br>°С [KA5_VG1_K066]",
	CAST(KA5_VG1_K067 as decimal(15, 1)) as "Т54<br>°С [KA5_VG1_K067]",
	CAST(KA5_VG1_K068 as decimal(15, 1)) as "Т55<br>°С [KA5_VG1_K068]",
	CAST(KA5_VG1_K069 as decimal(15, 1)) as "Т56<br>°С [KA5_VG1_K069]",
	CAST(KA5_VG1_K070 as decimal(15, 1)) as "Т57<br>°С [KA5_VG1_K070]",
	CAST(KA5_VG1_K071 as decimal(15, 1)) as "Т58<br>°С [KA5_VG1_K071]",
	CAST(KA5_VG1_K072 as decimal(15, 1)) as "Т59<br>°С [KA5_VG1_K072]",
	CAST(KA5_VG1_K073 as decimal(15, 1)) as "Т60<br>°С [KA5_VG1_K073]",
	CAST(KA5_VG1_K074 as decimal(15, 1)) as "Т61<br>°С [KA5_VG1_K074]",
	CAST(KA5_VG1_K075 as decimal(15, 1)) as "Т62<br>°С [KA5_VG1_K075]",
	CAST(KA5_VG1_K076 as decimal(15, 1)) as "Т63<br>°С [KA5_VG1_K076]",
	CAST(KA5_VG1_K077 as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K077]",
	CAST(KA5_VG1_K078 as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K078]",
	CAST(KA5_VG1_K079 as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K079]",
	CAST(KA5_VG1_K080 as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K080]",
	CAST(KA5_VG1_K081 as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K081]",
	CAST(KA5_VG1_K082 as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K082]",
	CAST(KA5_VG1_K083 as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K083]",
	CAST(KA5_VG1_K084 as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K084]",
	CAST(KA5_VG1_K085 as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K085]",
	CAST(KA5_VG1_K086 as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K086]",
	CAST(KA5_VG1_K087 as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K087]",
	CAST(KA5_VG1_K088 as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K088]",
	CAST(KA5_VG1_K089 as decimal(15, 1)) as "Т41<br>°С [KA5_VG1_K089]",
	CAST(KA5_VG1_K090 as decimal(15, 1)) as "Т42<br>°С [KA5_VG1_K090]",
	CAST(KA5_VG1_K091 as decimal(15, 1)) as "Т43<br>°С [KA5_VG1_K091]",
	CAST(KA5_VG1_K092 as decimal(15, 1)) as "Т44<br>°С [KA5_VG1_K092]",
	CAST(KA5_VG1_K093 as decimal(15, 1)) as "Т45<br>°С [KA5_VG1_K093]",
	CAST(KA5_VG1_K094 as decimal(15, 1)) as "Т46<br>°С [KA5_VG1_K094]",
	CAST(KA5_VG1_K095 as decimal(15, 1)) as "Т47<br>°С [KA5_VG1_K095]",
	CAST(KA5_VG1_K096 as decimal(15, 1)) as "Т48<br>°С [KA5_VG1_K096]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070,
	KA5_VG1_K071,
	KA5_VG1_K072,
	KA5_VG1_K073,
	KA5_VG1_K074,
	KA5_VG1_K075,
	KA5_VG1_K076,
	KA5_VG1_K077,
	KA5_VG1_K078,
	KA5_VG1_K079,
	KA5_VG1_K080,
	KA5_VG1_K081,
	KA5_VG1_K082,
	KA5_VG1_K083,
	KA5_VG1_K084,
	KA5_VG1_K085,
	KA5_VG1_K086,
	KA5_VG1_K087,
	KA5_VG1_K088,
	KA5_VG1_K089,
	KA5_VG1_K090,
	KA5_VG1_K091,
	KA5_VG1_K092,
	KA5_VG1_K093,
	KA5_VG1_K094,
	KA5_VG1_K095,
	KA5_VG1_K096
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-5 VG1. Экран 3" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K065 as decimal(15, 1)) as "Т52<br>°С [KA5_VG1_K065]",
	CAST(KA5_VG1_K066 as decimal(15, 1)) as "Т53<br>°С [KA5_VG1_K066]",
	CAST(KA5_VG1_K067 as decimal(15, 1)) as "Т54<br>°С [KA5_VG1_K067]",
	CAST(KA5_VG1_K068 as decimal(15, 1)) as "Т55<br>°С [KA5_VG1_K068]",
	CAST(KA5_VG1_K069 as decimal(15, 1)) as "Т56<br>°С [KA5_VG1_K069]",
	CAST(KA5_VG1_K070 as decimal(15, 1)) as "Т57<br>°С [KA5_VG1_K070]",
	CAST(KA5_VG1_K071 as decimal(15, 1)) as "Т58<br>°С [KA5_VG1_K071]",
	CAST(KA5_VG1_K072 as decimal(15, 1)) as "Т59<br>°С [KA5_VG1_K072]",
	CAST(KA5_VG1_K073 as decimal(15, 1)) as "Т60<br>°С [KA5_VG1_K073]",
	CAST(KA5_VG1_K074 as decimal(15, 1)) as "Т61<br>°С [KA5_VG1_K074]",
	CAST(KA5_VG1_K075 as decimal(15, 1)) as "Т62<br>°С [KA5_VG1_K075]",
	CAST(KA5_VG1_K076 as decimal(15, 1)) as "Т63<br>°С [KA5_VG1_K076]",
	CAST(KA5_VG1_K077 as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K077]",
	CAST(KA5_VG1_K078 as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K078]",
	CAST(KA5_VG1_K079 as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K079]",
	CAST(KA5_VG1_K080 as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K080]",
	CAST(KA5_VG1_K081 as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K081]",
	CAST(KA5_VG1_K082 as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K082]",
	CAST(KA5_VG1_K083 as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K083]",
	CAST(KA5_VG1_K084 as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K084]",
	CAST(KA5_VG1_K085 as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K085]",
	CAST(KA5_VG1_K086 as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K086]",
	CAST(KA5_VG1_K087 as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K087]",
	CAST(KA5_VG1_K088 as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K088]",
	CAST(KA5_VG1_K089 as decimal(15, 1)) as "Т41<br>°С [KA5_VG1_K089]",
	CAST(KA5_VG1_K090 as decimal(15, 1)) as "Т42<br>°С [KA5_VG1_K090]",
	CAST(KA5_VG1_K091 as decimal(15, 1)) as "Т43<br>°С [KA5_VG1_K091]",
	CAST(KA5_VG1_K092 as decimal(15, 1)) as "Т44<br>°С [KA5_VG1_K092]",
	CAST(KA5_VG1_K093 as decimal(15, 1)) as "Т45<br>°С [KA5_VG1_K093]",
	CAST(KA5_VG1_K094 as decimal(15, 1)) as "Т46<br>°С [KA5_VG1_K094]",
	CAST(KA5_VG1_K095 as decimal(15, 1)) as "Т47<br>°С [KA5_VG1_K095]",
	CAST(KA5_VG1_K096 as decimal(15, 1)) as "Т48<br>°С [KA5_VG1_K096]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070,
	KA5_VG1_K071,
	KA5_VG1_K072,
	KA5_VG1_K073,
	KA5_VG1_K074,
	KA5_VG1_K075,
	KA5_VG1_K076,
	KA5_VG1_K077,
	KA5_VG1_K078,
	KA5_VG1_K079,
	KA5_VG1_K080,
	KA5_VG1_K081,
	KA5_VG1_K082,
	KA5_VG1_K083,
	KA5_VG1_K084,
	KA5_VG1_K085,
	KA5_VG1_K086,
	KA5_VG1_K087,
	KA5_VG1_K088,
	KA5_VG1_K089,
	KA5_VG1_K090,
	KA5_VG1_K091,
	KA5_VG1_K092,
	KA5_VG1_K093,
	KA5_VG1_K094,
	KA5_VG1_K095,
	KA5_VG1_K096
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-5 VG1. Экран 3" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(KA5_VG1_K065) as decimal(15, 1)) as "Т52<br>°С [KA5_VG1_K065]",
	CAST(AVG(KA5_VG1_K066) as decimal(15, 1)) as "Т53<br>°С [KA5_VG1_K066]",
	CAST(AVG(KA5_VG1_K067) as decimal(15, 1)) as "Т54<br>°С [KA5_VG1_K067]",
	CAST(AVG(KA5_VG1_K068) as decimal(15, 1)) as "Т55<br>°С [KA5_VG1_K068]",
	CAST(AVG(KA5_VG1_K069) as decimal(15, 1)) as "Т56<br>°С [KA5_VG1_K069]",
	CAST(AVG(KA5_VG1_K070) as decimal(15, 1)) as "Т57<br>°С [KA5_VG1_K070]",
	CAST(AVG(KA5_VG1_K071) as decimal(15, 1)) as "Т58<br>°С [KA5_VG1_K071]",
	CAST(AVG(KA5_VG1_K072) as decimal(15, 1)) as "Т59<br>°С [KA5_VG1_K072]",
	CAST(AVG(KA5_VG1_K073) as decimal(15, 1)) as "Т60<br>°С [KA5_VG1_K073]",
	CAST(AVG(KA5_VG1_K074) as decimal(15, 1)) as "Т61<br>°С [KA5_VG1_K074]",
	CAST(AVG(KA5_VG1_K075) as decimal(15, 1)) as "Т62<br>°С [KA5_VG1_K075]",
	CAST(AVG(KA5_VG1_K076) as decimal(15, 1)) as "Т63<br>°С [KA5_VG1_K076]",
	CAST(AVG(KA5_VG1_K077) as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K077]",
	CAST(AVG(KA5_VG1_K078) as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K078]",
	CAST(AVG(KA5_VG1_K079) as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K079]",
	CAST(AVG(KA5_VG1_K080) as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K080]",
	CAST(AVG(KA5_VG1_K081) as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K081]",
	CAST(AVG(KA5_VG1_K082) as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K082]",
	CAST(AVG(KA5_VG1_K083) as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K083]",
	CAST(AVG(KA5_VG1_K084) as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K084]",
	CAST(AVG(KA5_VG1_K085) as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K085]",
	CAST(AVG(KA5_VG1_K086) as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K086]",
	CAST(AVG(KA5_VG1_K087) as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K087]",
	CAST(AVG(KA5_VG1_K088) as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K088]",
	CAST(AVG(KA5_VG1_K089) as decimal(15, 1)) as "Т41<br>°С [KA5_VG1_K089]",
	CAST(AVG(KA5_VG1_K090) as decimal(15, 1)) as "Т42<br>°С [KA5_VG1_K090]",
	CAST(AVG(KA5_VG1_K091) as decimal(15, 1)) as "Т43<br>°С [KA5_VG1_K091]",
	CAST(AVG(KA5_VG1_K092) as decimal(15, 1)) as "Т44<br>°С [KA5_VG1_K092]",
	CAST(AVG(KA5_VG1_K093) as decimal(15, 1)) as "Т45<br>°С [KA5_VG1_K093]",
	CAST(AVG(KA5_VG1_K094) as decimal(15, 1)) as "Т46<br>°С [KA5_VG1_K094]",
	CAST(AVG(KA5_VG1_K095) as decimal(15, 1)) as "Т47<br>°С [KA5_VG1_K095]",
	CAST(AVG(KA5_VG1_K096) as decimal(15, 1)) as "Т48<br>°С [KA5_VG1_K096]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070,
	KA5_VG1_K071,
	KA5_VG1_K072,
	KA5_VG1_K073,
	KA5_VG1_K074,
	KA5_VG1_K075,
	KA5_VG1_K076,
	KA5_VG1_K077,
	KA5_VG1_K078,
	KA5_VG1_K079,
	KA5_VG1_K080,
	KA5_VG1_K081,
	KA5_VG1_K082,
	KA5_VG1_K083,
	KA5_VG1_K084,
	KA5_VG1_K085,
	KA5_VG1_K086,
	KA5_VG1_K087,
	KA5_VG1_K088,
	KA5_VG1_K089,
	KA5_VG1_K090,
	KA5_VG1_K091,
	KA5_VG1_K092,
	KA5_VG1_K093,
	KA5_VG1_K094,
	KA5_VG1_K095,
	KA5_VG1_K096
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime

{агрегированные за сутки}
/*ReportName="Отчёт КА-5 VG1. Экран 3" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K065) as decimal(15, 1)) as "Т52<br>°С [KA5_VG1_K065]",
	CAST(AVG(KA5_VG1_K066) as decimal(15, 1)) as "Т53<br>°С [KA5_VG1_K066]",
	CAST(AVG(KA5_VG1_K067) as decimal(15, 1)) as "Т54<br>°С [KA5_VG1_K067]",
	CAST(AVG(KA5_VG1_K068) as decimal(15, 1)) as "Т55<br>°С [KA5_VG1_K068]",
	CAST(AVG(KA5_VG1_K069) as decimal(15, 1)) as "Т56<br>°С [KA5_VG1_K069]",
	CAST(AVG(KA5_VG1_K070) as decimal(15, 1)) as "Т57<br>°С [KA5_VG1_K070]",
	CAST(AVG(KA5_VG1_K071) as decimal(15, 1)) as "Т58<br>°С [KA5_VG1_K071]",
	CAST(AVG(KA5_VG1_K072) as decimal(15, 1)) as "Т59<br>°С [KA5_VG1_K072]",
	CAST(AVG(KA5_VG1_K073) as decimal(15, 1)) as "Т60<br>°С [KA5_VG1_K073]",
	CAST(AVG(KA5_VG1_K074) as decimal(15, 1)) as "Т61<br>°С [KA5_VG1_K074]",
	CAST(AVG(KA5_VG1_K075) as decimal(15, 1)) as "Т62<br>°С [KA5_VG1_K075]",
	CAST(AVG(KA5_VG1_K076) as decimal(15, 1)) as "Т63<br>°С [KA5_VG1_K076]",
	CAST(AVG(KA5_VG1_K077) as decimal(15, 1)) as "Т16<br>°С [KA5_VG1_K077]",
	CAST(AVG(KA5_VG1_K078) as decimal(15, 1)) as "Т17<br>°С [KA5_VG1_K078]",
	CAST(AVG(KA5_VG1_K079) as decimal(15, 1)) as "Т18<br>°С [KA5_VG1_K079]",
	CAST(AVG(KA5_VG1_K080) as decimal(15, 1)) as "Т19<br>°С [KA5_VG1_K080]",
	CAST(AVG(KA5_VG1_K081) as decimal(15, 1)) as "Т20<br>°С [KA5_VG1_K081]",
	CAST(AVG(KA5_VG1_K082) as decimal(15, 1)) as "Т21<br>°С [KA5_VG1_K082]",
	CAST(AVG(KA5_VG1_K083) as decimal(15, 1)) as "Т22<br>°С [KA5_VG1_K083]",
	CAST(AVG(KA5_VG1_K084) as decimal(15, 1)) as "Т23<br>°С [KA5_VG1_K084]",
	CAST(AVG(KA5_VG1_K085) as decimal(15, 1)) as "Т24<br>°С [KA5_VG1_K085]",
	CAST(AVG(KA5_VG1_K086) as decimal(15, 1)) as "Т25<br>°С [KA5_VG1_K086]",
	CAST(AVG(KA5_VG1_K087) as decimal(15, 1)) as "Т26<br>°С [KA5_VG1_K087]",
	CAST(AVG(KA5_VG1_K088) as decimal(15, 1)) as "Т27<br>°С [KA5_VG1_K088]",
	CAST(AVG(KA5_VG1_K089) as decimal(15, 1)) as "Т41<br>°С [KA5_VG1_K089]",
	CAST(AVG(KA5_VG1_K090) as decimal(15, 1)) as "Т42<br>°С [KA5_VG1_K090]",
	CAST(AVG(KA5_VG1_K091) as decimal(15, 1)) as "Т43<br>°С [KA5_VG1_K091]",
	CAST(AVG(KA5_VG1_K092) as decimal(15, 1)) as "Т44<br>°С [KA5_VG1_K092]",
	CAST(AVG(KA5_VG1_K093) as decimal(15, 1)) as "Т45<br>°С [KA5_VG1_K093]",
	CAST(AVG(KA5_VG1_K094) as decimal(15, 1)) as "Т46<br>°С [KA5_VG1_K094]",
	CAST(AVG(KA5_VG1_K095) as decimal(15, 1)) as "Т47<br>°С [KA5_VG1_K095]",
	CAST(AVG(KA5_VG1_K096) as decimal(15, 1)) as "Т48<br>°С [KA5_VG1_K096]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070,
	KA5_VG1_K071,
	KA5_VG1_K072,
	KA5_VG1_K073,
	KA5_VG1_K074,
	KA5_VG1_K075,
	KA5_VG1_K076,
	KA5_VG1_K077,
	KA5_VG1_K078,
	KA5_VG1_K079,
	KA5_VG1_K080,
	KA5_VG1_K081,
	KA5_VG1_K082,
	KA5_VG1_K083,
	KA5_VG1_K084,
	KA5_VG1_K085,
	KA5_VG1_K086,
	KA5_VG1_K087,
	KA5_VG1_K088,
	KA5_VG1_K089,
	KA5_VG1_K090,
	KA5_VG1_K091,
	KA5_VG1_K092,
	KA5_VG1_K093,
	KA5_VG1_K094,
	KA5_VG1_K095,
	KA5_VG1_K096
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime
