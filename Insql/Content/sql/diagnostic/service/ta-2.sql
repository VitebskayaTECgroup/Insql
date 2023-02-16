{минутные срезы}
/*ReportName=Параметры ТА-2 (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST (L01_EG00P000/1000000 as decimal(15,1)) as "Мощность активная, МВт [L01_EG00P000]",
	CAST (S2_STKER_BK1 as decimal(15,0)) as "Температура обмотки статора, паз 2 [S2_STKER_BK1 ]",
	CAST (S2_STKER_BK3 as decimal(15,0)) as "Температура обмотки статора, паз 18 [S2_STKER_BK3 ]",
	CAST (S2_STKER_BK5 as decimal(15,0)) as "Температура обмотки статора, паз 34 [S2_STKER_BK5 ]",
	CAST (S2_STKER_BK13 as decimal(15,0)) as "Температура активной стали сердечника, паз 2 [S2_STKER_BK13]",
	CAST (S2_STKER_BK15 as decimal(15,0)) as "Температура активной стали сердечника, паз 18 [S2_STKER_BK15]",
	CAST (S2_STKER_BK17 as decimal(15,0)) as "Температура активной стали сердечника, паз 34 [S2_STKER_BK17]",
	CAST (S2_VO_IR001 as decimal(15,0)) as "Расход охл. воды за ВО ген. [S2_VO_IR001]",
	CAST (S2_VO_ID008 as decimal(15,0)) as "Давление охл. воды перед. ВО ген. [S2_VO_ID008]",
	CAST (S2_VO_IT007 as decimal(15,0)) as "Т охл. воды перед ВО ген. [S2_VO_IT007]",
	CAST (S2_VO_IT008 as decimal(15,0)) as "Т охл. воды после ВО ген. [S2_VO_IT008]",
	CAST (S2_STKER_BK32 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. ст. В сп. [S2_STKER_BK32]",
	CAST (S2_STKER_BK34 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. ст. Т сл. [S2_STKER_BK34]",
	CAST (S2_STKER_BK35 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. в слив. сл. [S2_STKER_BK35]",
	CAST (S2_MV010_n1 as decimal(15,0)) as "Частота вращения турбины [S2_MV010_n1]",
	CAST (S2_MV001_a1 as decimal(15,3)) as "Осевая вибрация п.п. [S2_MV001_a1]",
	CAST (S2_MV002_a2 as decimal(15,3)) as "Поперечная вибрация п.п. [S2_MV002_a2]",
	CAST (S2_MV003_a3 as decimal(15,3)) as "Осевая вибрация п.п. [S2_MV003_a3]",
	CAST (S2_MV004_S1_1 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV004_S1_1]",
	CAST (S2_MV005_S1_2 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV005_S1_2]",
	CAST (S2_MV006_S1_3 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV006_S1_3]",
	CAST (S2_MV007_a4 as decimal(15,3)) as "Вертикальная вибрация з.п. [S2_MV007_a4]",
	CAST (S2_MV008_a5 as decimal(15,3)) as "Поперечная вибрация з.п. [S2_MV008_a5]",
	CAST (S2_MV009_a6 as decimal(15,3)) as "Осевая вибрация з.п. [S2_MV009_a6]",
	CAST (S2_MV011_a7 as decimal(15,3)) as "Вертикальная вибрация з.п. [S2_MV011_a7]",
	CAST (S2_MV012_a8 as decimal(15,3)) as "Поперечная вибрация з.п. [S2_MV012_a8]",
	CAST (S2_MV014_S2 as decimal(15,3)) as "Относительное тепловое расширение ротора [S2_MV014_S2]",
	CAST (S2_MV015_S2 as decimal(15,3)) as "Относительное тепловое расширение цилиндра [S2_MV015_S2]",
	CAST (S2_MV015_S3 as decimal(15,3)) as "Относительное тепловое расширение цилиндра [S2_MV015_S3]",
	CAST (S2_MS_ID012 as decimal(15,5)) as "Давл. масла на смазку задн. подш. ген.[S2_MS_ID012]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S2_STKER_BK1, S2_STKER_BK7, S3_STKER_Y14_1, S3_STKER_Y17_4, S2_STKER_BK3, S2_STKER_BK9, S3_STKER_Y15_2, S3_STKER_Y18_5, S2_STKER_BK5, S2_STKER_BK11, S3_STKER_Y19_6, S2_STKER_BK13, S2_STKER_BK19, S2_STKER_BK15, S2_STKER_BK21, S2_STKER_BK17, S2_STKER_BK23,S3_STKER_Y16_3, 
	S2_VO_IR001, S2_VO_ID008, S2_VO_IT007, S2_VO_IT008, S2_STKER_BK32, S2_STKER_BK34, S2_STKER_BK35,
	S2_MV010_n1, L01_EG00P000, S2_MV001_a1, S2_MV002_a2, S2_MV003_a3, S2_MV004_S1_1, S2_MV005_S1_2, S2_MV006_S1_3, S2_MV007_a4, S2_MV008_a5, S2_MV009_a6, S2_MV011_a7, S2_MV012_a8, S2_MV014_S2, S2_MV015_S2, S2_MV015_S3,S2_MS_ID012
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=Базисная мазутная емкость №1 (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	CAST (L01_EG00P000/1000000 as decimal(15,1)) as "Мощность активная, МВт [L01_EG00P000]",
	CAST (S2_STKER_BK1 as decimal(15,0)) as "Температура обмотки статора, паз 2 [S2_STKER_BK1 ]",
	CAST (S2_STKER_BK3 as decimal(15,0)) as "Температура обмотки статора, паз 18 [S2_STKER_BK3 ]",
	CAST (S2_STKER_BK5 as decimal(15,0)) as "Температура обмотки статора, паз 34 [S2_STKER_BK5 ]",
	CAST (S2_STKER_BK13 as decimal(15,0)) as "Температура активной стали сердечника, паз 2 [S2_STKER_BK13]",
	CAST (S2_STKER_BK15 as decimal(15,0)) as "Температура активной стали сердечника, паз 18 [S2_STKER_BK15]",
	CAST (S2_STKER_BK17 as decimal(15,0)) as "Температура активной стали сердечника, паз 34 [S2_STKER_BK17]",
	CAST (S2_VO_IR001 as decimal(15,0)) as "Расход охл. воды за ВО ген. [S2_VO_IR001]",
	CAST (S2_VO_ID008 as decimal(15,0)) as "Давление охл. воды перед. ВО ген. [S2_VO_ID008]",
	CAST (S2_VO_IT007 as decimal(15,0)) as "Т охл. воды перед ВО ген. [S2_VO_IT007]",
	CAST (S2_VO_IT008 as decimal(15,0)) as "Т охл. воды после ВО ген. [S2_VO_IT008]",
	CAST (S2_STKER_BK32 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. ст. В сп. [S2_STKER_BK32]",
	CAST (S2_STKER_BK34 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. ст. Т сл. [S2_STKER_BK34]",
	CAST (S2_STKER_BK35 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. в слив. сл. [S2_STKER_BK35]",
	CAST (S2_MV010_n1 as decimal(15,0)) as "Частота вращения турбины [S2_MV010_n1]",
	CAST (S2_MV001_a1 as decimal(15,3)) as "Осевая вибрация п.п. [S2_MV001_a1]",
	CAST (S2_MV002_a2 as decimal(15,3)) as "Поперечная вибрация п.п. [S2_MV002_a2]",
	CAST (S2_MV003_a3 as decimal(15,3)) as "Осевая вибрация п.п. [S2_MV003_a3]",
	CAST (S2_MV004_S1_1 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV004_S1_1]",
	CAST (S2_MV005_S1_2 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV005_S1_2]",
	CAST (S2_MV006_S1_3 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV006_S1_3]",
	CAST (S2_MV007_a4 as decimal(15,3)) as "Вертикальная вибрация з.п. [S2_MV007_a4]",
	CAST (S2_MV008_a5 as decimal(15,3)) as "Поперечная вибрация з.п. [S2_MV008_a5]",
	CAST (S2_MV009_a6 as decimal(15,3)) as "Осевая вибрация з.п. [S2_MV009_a6]",
	CAST (S2_MV011_a7 as decimal(15,3)) as "Вертикальная вибрация з.п. [S2_MV011_a7]",
	CAST (S2_MV012_a8 as decimal(15,3)) as "Поперечная вибрация з.п. [S2_MV012_a8]",
	CAST (S2_MV014_S2 as decimal(15,3)) as "Относительное тепловое расширение ротора [S2_MV014_S2]",
	CAST (S2_MV015_S2 as decimal(15,3)) as "Относительное тепловое расширение цилиндра [S2_MV015_S2]",
	CAST (S2_MV015_S3 as decimal(15,3)) as "Относительное тепловое расширение цилиндра [S2_MV015_S3]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S2_STKER_BK1, S2_STKER_BK7, S3_STKER_Y14_1, S3_STKER_Y17_4, S2_STKER_BK3, S2_STKER_BK9, S3_STKER_Y15_2, S3_STKER_Y18_5, S2_STKER_BK5, S2_STKER_BK11, S3_STKER_Y19_6, S2_STKER_BK13, S2_STKER_BK19, S2_STKER_BK15, S2_STKER_BK21, S2_STKER_BK17, S2_STKER_BK23, S3_STKER_Y16_3,
	S2_VO_IR001, S2_VO_ID008, S2_VO_IT007, S2_VO_IT008, S2_STKER_BK32, S2_STKER_BK34, S2_STKER_BK35,
	S2_MV010_n1, L01_EG00P000, S2_MV001_a1, S2_MV002_a2, S2_MV003_a3, S2_MV004_S1_1, S2_MV005_S1_2, S2_MV006_S1_3, S2_MV007_a4, S2_MV008_a5, S2_MV009_a6, S2_MV011_a7, S2_MV012_a8, S2_MV014_S2, S2_MV015_S2, S2_MV015_S3
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=Базисная мазутная емкость №1 (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	CAST (L01_EG00P000/1000000 as decimal(15,1)) as "Мощность активная, МВт [L01_EG00P000]",
	CAST (S2_STKER_BK1 as decimal(15,0)) as "Температура обмотки статора, паз 2 [S2_STKER_BK1 ]",
	CAST (S2_STKER_BK3 as decimal(15,0)) as "Температура обмотки статора, паз 18 [S2_STKER_BK3 ]",
	CAST (S2_STKER_BK5 as decimal(15,0)) as "Температура обмотки статора, паз 34 [S2_STKER_BK5 ]",
	CAST (S2_STKER_BK13 as decimal(15,0)) as "Температура активной стали сердечника, паз 2 [S2_STKER_BK13]",
	CAST (S2_STKER_BK15 as decimal(15,0)) as "Температура активной стали сердечника, паз 18 [S2_STKER_BK15]",
	CAST (S2_STKER_BK17 as decimal(15,0)) as "Температура активной стали сердечника, паз 34 [S2_STKER_BK17]",
	CAST (S2_VO_IR001 as decimal(15,0)) as "Расход охл. воды за ВО ген. [S2_VO_IR001]",
	CAST (S2_VO_ID008 as decimal(15,0)) as "Давление охл. воды перед. ВО ген. [S2_VO_ID008]",
	CAST (S2_VO_IT007 as decimal(15,0)) as "Т охл. воды перед ВО ген. [S2_VO_IT007]",
	CAST (S2_VO_IT008 as decimal(15,0)) as "Т охл. воды после ВО ген. [S2_VO_IT008]",
	CAST (S2_STKER_BK32 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. ст. В сп. [S2_STKER_BK32]",
	CAST (S2_STKER_BK34 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. ст. Т сл. [S2_STKER_BK34]",
	CAST (S2_STKER_BK35 as decimal(15,0)) as "Т г. в всл. патр. на вых. из ВО г. в слив. сл. [S2_STKER_BK35]",
	CAST (S2_MV010_n1 as decimal(15,0)) as "Частота вращения турбины [S2_MV010_n1]",
	CAST (S2_MV001_a1 as decimal(15,3)) as "Осевая вибрация п.п. [S2_MV001_a1]",
	CAST (S2_MV002_a2 as decimal(15,3)) as "Поперечная вибрация п.п. [S2_MV002_a2]",
	CAST (S2_MV003_a3 as decimal(15,3)) as "Осевая вибрация п.п. [S2_MV003_a3]",
	CAST (S2_MV004_S1_1 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV004_S1_1]",
	CAST (S2_MV005_S1_2 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV005_S1_2]",
	CAST (S2_MV006_S1_3 as decimal(15,3)) as "Осевой сдвиг ротора [S2_MV006_S1_3]",
	CAST (S2_MV007_a4 as decimal(15,3)) as "Вертикальная вибрация з.п. [S2_MV007_a4]",
	CAST (S2_MV008_a5 as decimal(15,3)) as "Поперечная вибрация з.п. [S2_MV008_a5]",
	CAST (S2_MV009_a6 as decimal(15,3)) as "Осевая вибрация з.п. [S2_MV009_a6]",
	CAST (S2_MV011_a7 as decimal(15,3)) as "Вертикальная вибрация з.п. [S2_MV011_a7]",
	CAST (S2_MV012_a8 as decimal(15,3)) as "Поперечная вибрация з.п. [S2_MV012_a8]",
	CAST (S2_MV014_S2 as decimal(15,3)) as "Относительное тепловое расширение ротора [S2_MV014_S2]",
	CAST (S2_MV015_S2 as decimal(15,3)) as "Относительное тепловое расширение цилиндра [S2_MV015_S2]",
	CAST (S2_MV015_S3 as decimal(15,3)) as "Относительное тепловое расширение цилиндра [S2_MV015_S3]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S2_STKER_BK1, S2_STKER_BK7, S3_STKER_Y14_1, S3_STKER_Y17_4, S2_STKER_BK3, S2_STKER_BK9, S3_STKER_Y15_2, S3_STKER_Y18_5, S2_STKER_BK5, S2_STKER_BK11, S3_STKER_Y19_6, S2_STKER_BK13, S2_STKER_BK19, S2_STKER_BK15, S2_STKER_BK21, S2_STKER_BK17, S2_STKER_BK23, S3_STKER_Y16_3,
	S2_VO_IR001, S2_VO_ID008, S2_VO_IT007, S2_VO_IT008, S2_STKER_BK32, S2_STKER_BK34, S2_STKER_BK35,
	S2_MV010_n1, L01_EG00P000, S2_MV001_a1, S2_MV002_a2, S2_MV003_a3, S2_MV004_S1_1, S2_MV005_S1_2, S2_MV006_S1_3, S2_MV007_a4, S2_MV008_a5, S2_MV009_a6, S2_MV011_a7, S2_MV012_a8, S2_MV014_S2, S2_MV015_S2, S2_MV015_S3
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")