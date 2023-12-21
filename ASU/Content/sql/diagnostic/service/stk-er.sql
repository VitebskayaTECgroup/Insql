{минутные срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СТК-ЭР (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	S3_1133 as "Звуковой сигнал СТК-ЭР[Vertical:] [S3_1133][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1135 as "Выход предупредительной уставки[Vertical:] [S3_1135][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1137 as "Выход аварийной уставки[Vertical:] [S3_1137][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1139 as "Неисправность измерительного канала[Vertical:] [S3_1139][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1141 as "Неисправность СТК-ЭР[Vertical:] [S3_1141][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1143 as "Неисправность системы возбуждения[Vertical:] [S3_1143][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1145 as "Отклонение температуры[Vertical:] [S3_1145][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1147 as "Жидкость вкорпусе генератора[Vertical:] [S3_1147][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_A381 as "Есть питание в схеме конторля ЭМВ [Vertical:][S3_A381][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_1113 as "Неисправность стойки ЛМЗ [Vertical:][S3_1113][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1125 as "Неиспр кан-в расш-я, искрив-я, об-тов [Vertical:][S3_1125][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_1037 as "нет питания в панели питания датчиков [Vertical:][S3_1037][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1039 as "Нет питания на местном щите ур-меров [Vertical:][S3_1039][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1041 as "Нет питания 220 цепей МУТ [Vertical:][S3_1041][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1043 as "Нет питания 220 в ИПК [Vertical:][S3_1043][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1054 as "нет питания сервомоторов [Vertical:][S3_1054][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1055 as "Нет питания DC 220 [Vertical:][S3_1055][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1057 as "Неисправность цепей ввода DC220 [Vertical:][S3_1057][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1001 as "Вызов к сборке задвижек 111Н [Vertical:][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1003 as "Вызов к сборке задвижек 112Н [Vertical:][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_A1 as "Питание цепи дискретных сигналов А1 [Vertical:][S3_A1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_1133, S3_1135, S3_1137, S3_1139, S3_1141, S3_1143, S3_1145,  S3_1147,
	S3_A381,S3_1113,S3_1125,
	S3_1037,S3_1039,S3_1041,S3_1043,S3_1054,S3_1055,S3_1057,S3_1001,S3_1003,S3_A1
	FROM Runtime.dbo.DiscreteWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СТК-ЭР (срезы на конец часа)*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	S3_1133 as "Звуковой сигнал СТК-ЭР [Vertical:][S3_1133][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1135 as "Выход предупредительной уставки [Vertical:][S3_1135][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1137 as "Выход аварийной уставки [Vertical:][S3_1137][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1139 as "Неисправность измерительного канала [Vertical:][S3_1139][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1141 as "Неисправность СТК-ЭР [Vertical:][S3_1141][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1143 as "Неисправность системы возбуждения [Vertical:][S3_1143][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1145 as "Отклонение температуры [Vertical:][S3_1145][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1147 as "Жидкость вкорпусе генератора [Vertical:][S3_1147][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_A381 as "Есть питание в схеме конторля ЭМВ [Vertical:][S3_A381][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_1113 as "Неисправность стойки ЛМЗ [Vertical:][S3_1113][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1125 as "Неиспр кан-в расш-я, искрив-я, об-тов [Vertical:][S3_1125][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_1037 as "нет питания в панели питания датчиков [Vertical:][S3_1037][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1039 as "Нет питания на местном щите ур-меров [Vertical:][S3_1039][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1041 as "Нет питания 220 цепей МУТ [Vertical:][S3_1041][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1043 as "Нет питания 220 в ИПК [Vertical:][S3_1043][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1054 as "нет питания сервомоторов [Vertical:][S3_1054][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1055 as "Нет питания DC 220 [Vertical:][S3_1055][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1057 as "Неисправность цепей ввода DC220 [Vertical:][S3_1057][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1001 as "Вызов к сборке задвижек 111Н [Vertical:][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1003 as "Вызов к сборке задвижек 112Н [Vertical:][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_A1 as "Питание цепи дискретных сигналов А1 [Vertical:][S3_A1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_1133, S3_1135, S3_1137, S3_1139, S3_1141, S3_1143, S3_1145,  S3_1147,
	S3_A381,S3_1113,S3_1125,
	S3_1037,S3_1039,S3_1041,S3_1043,S3_1054,S3_1055,S3_1057,S3_1001,S3_1003,S3_A1
	FROM Runtime.dbo.DiscreteWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName=ДИАГНОСТИКА СОСТОЯНИЯ СТК-ЭР (срезы на конец суток)*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime - 1 as "Дата",
	null,
	S3_1133 as "Звуковой сигнал СТК-ЭР[Vertical:] [S3_1133][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1135 as "Выход предупредительной уставки[Vertical:] [S3_1135][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1137 as "Выход аварийной уставки[Vertical:] [S3_1137][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1139 as "Неисправность измерительного канала[Vertical:] [S3_1139][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1141 as "Неисправность СТК-ЭР[Vertical:] [S3_1141][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1143 as "Неисправность системы возбуждения[Vertical:] [S3_1143][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1145 as "Отклонение температуры[Vertical:] [S3_1145][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1147 as "Жидкость вкорпусе генератора[Vertical:] [S3_1147][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_A381 as "Есть питание в схеме конторля ЭМВ [Vertical:][S3_A381][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_1113 as "Неисправность стойки ЛМЗ [Vertical:][S3_1113][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1125 as "Неиспр кан-в расш-я, искрив-я, об-тов [Vertical:][S3_1125][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	null,
	S3_1037 as "нет питания в панели питания датчиков [Vertical:][S3_1037][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1039 as "Нет питания на местном щите ур-меров [Vertical:][S3_1039][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1041 as "Нет питания 220 цепей МУТ [Vertical:][S3_1041][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1043 as "Нет питания 220 в ИПК [Vertical:][S3_1043][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1054 as "нет питания сервомоторов [Vertical:][S3_1054][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1055 as "Нет питания DC 220 [Vertical:][S3_1055][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1057 as "Неисправность цепей ввода DC220 [Vertical:][S3_1057][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1001 as "Вызов к сборке задвижек 111Н [Vertical:][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_1003 as "Вызов к сборке задвижек 112Н [Vertical:][CHECK:1,1,-1,-2][CLASS:,,ALARM_TD_N_CC,,]",
	S3_A1 as "Питание цепи дискретных сигналов А1 [Vertical:][S3_A1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, S3_1133, S3_1135, S3_1137, S3_1139, S3_1141, S3_1143, S3_1145,  S3_1147,
	S3_A381,S3_1113,S3_1125,
	S3_1037,S3_1039,S3_1041,S3_1043,S3_1054,S3_1055,S3_1057,S3_1001,S3_1003,S3_A1
	FROM Runtime.dbo.DiscreteWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")