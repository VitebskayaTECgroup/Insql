{минутные срезы}
/*ReportName="Сетевой насос 1-2 (минутные срезы)"*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(CH1_2_TempRoom, 2)		as "Т в помещ. ЧРЭП, °С [CH1_2_TempRoom]",
	Round(CH1_2_SP_F_PIDOff, 2)		as "Уст част., Гц [CH1_2_SP_F_PIDOff]",
	Round(CH1_2_SP_Press_PIDOn, 2)	as "Уст. давл., МПа [CH1_2_SP_Press_PIDOn]",
	Round(CH1_2_Panel_FOut, 2)		as "Fout, Гц [CH1_2_Panel_FOut]",
	Round(CH1_2_Panel_U, 2)			as "Uпч, В [CH1_2_Panel_U]",
	Round(CH1_2_Panel_I, 2)			as "Aпч, мА [CH1_2_Panel_I]",
	Round(CH1_2_Panel_Pw, 2)		as "Рпч, Вт [CH1_2_Panel_Pw]",
	Round(CH1_2_SP_Hi_PIT1, 2)		as "Верх. уст. давл. [CH1_2_SP_Hi_PIT1]",
	Round(CH1_2_SP_Lo_PIT1, 2)		as "Нижн. уст. давл. [CH1_2_SP_Lo_PIT1]",
	Round(CH1_2_Err_SwitchGear, 2)	as "Ошибки [CH1_2_Err_SwitchGear]",
	Round(CH1_2_STW_Q2, 2)			as "CH1, сост. Q2 [CH1_2_STW_Q2]",
	Round(CH1_2_STW_Q3, 2)			as "CH2, сост. Q3 [CH1_2_STW_Q3]",
	Round(CH1_2_STW_QS11, 2)		as "ПЧ, QS1-1 [CH1_2_STW_QS11]",
	Round(CH1_2_STW_QSG11, 2)		as "ПЧ, QSG1-1 [CH1_2_STW_QSG11]",
	Round(CH1_2_STW_QS12, 2)		as "ПЧ, QS1-2 [CH1_2_STW_QS12]",
	Round(CH1_2_STW_QSG12, 2)		as "ПЧ, QSG1-2 [CH1_2_STW_QSG12]",
	Round(CH1_2_STW_QS21, 2)		as "СН1, QS2-1 [CH1_2_STW_QS21]",
	Round(CH1_2_STW_QS22, 2)		as "СН1, QS2-2 [CH1_2_STW_QS22]",
	Round(CH1_2_STW_QSG2, 2)		as "СН1, QSG2 [CH1_2_STW_QSG2]",
	Round(CH1_2_STW_QS31, 2)		as "СН2, QS3-1 [CH1_2_STW_QS31]",
	Round(CH1_2_STW_QS32, 2)		as "СН2, QS3-2 [CH1_2_STW_QS32]",
	Round(CH1_2_STW_QSG3, 2)		as "СН2, QSG3 [CH1_2_STW_QSG3]",
	Round(CH1_2_STW_Cnv, 2)			as "Состояние ПЧ [CH1_2_STW_Cnv]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
		CH1_2_TempRoom,
		CH1_2_SP_F_PIDOff,
		CH1_2_SP_Press_PIDOn,
		CH1_2_Panel_FOut,
		CH1_2_Panel_U,
		CH1_2_Panel_I,
		CH1_2_Panel_Pw,
		CH1_2_SP_Hi_PIT1,
		CH1_2_SP_Lo_PIT1,
		CH1_2_Err_SwitchGear,
		CH1_2_STW_Q2,
		CH1_2_STW_Q3,
		CH1_2_STW_QS11,
		CH1_2_STW_QSG11,
		CH1_2_STW_QS12,
		CH1_2_STW_QSG12,
		CH1_2_STW_QS21,
		CH1_2_STW_QS22,
		CH1_2_STW_QSG2,
		CH1_2_STW_QS31,
		CH1_2_STW_QS32,
		CH1_2_STW_QSG3,
		CH1_2_STW_Cnv
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Сетевой насос 1-2 (часовые срезы)"*/
/*Mode=часовые-2*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(CH1_2_TempRoom, 2)		as "Т в помещ. ЧРЭП, °С [CH1_2_TempRoom]",
	Round(CH1_2_SP_F_PIDOff, 2)		as "Уст част., Гц [CH1_2_SP_F_PIDOff]",
	Round(CH1_2_SP_Press_PIDOn, 2)	as "Уст. давл., МПа [CH1_2_SP_Press_PIDOn]",
	Round(CH1_2_Panel_FOut, 2)		as "Fout, Гц [CH1_2_Panel_FOut]",
	Round(CH1_2_Panel_U, 2)			as "Uпч, В [CH1_2_Panel_U]",
	Round(CH1_2_Panel_I, 2)			as "Aпч, мА [CH1_2_Panel_I]",
	Round(CH1_2_Panel_Pw, 2)		as "Рпч, Вт [CH1_2_Panel_Pw]",
	Round(CH1_2_SP_Hi_PIT1, 2)		as "Верх. уст. давл. [CH1_2_SP_Hi_PIT1]",
	Round(CH1_2_SP_Lo_PIT1, 2)		as "Нижн. уст. давл. [CH1_2_SP_Lo_PIT1]",
	Round(CH1_2_Err_SwitchGear, 2)	as "Ошибки [CH1_2_Err_SwitchGear]",
	Round(CH1_2_STW_Q2, 2)			as "CH1, сост. Q2 [CH1_2_STW_Q2]",
	Round(CH1_2_STW_Q3, 2)			as "CH2, сост. Q3 [CH1_2_STW_Q3]",
	Round(CH1_2_STW_QS11, 2)		as "ПЧ, QS1-1 [CH1_2_STW_QS11]",
	Round(CH1_2_STW_QSG11, 2)		as "ПЧ, QSG1-1 [CH1_2_STW_QSG11]",
	Round(CH1_2_STW_QS12, 2)		as "ПЧ, QS1-2 [CH1_2_STW_QS12]",
	Round(CH1_2_STW_QSG12, 2)		as "ПЧ, QSG1-2 [CH1_2_STW_QSG12]",
	Round(CH1_2_STW_QS21, 2)		as "СН1, QS2-1 [CH1_2_STW_QS21]",
	Round(CH1_2_STW_QS22, 2)		as "СН1, QS2-2 [CH1_2_STW_QS22]",
	Round(CH1_2_STW_QSG2, 2)		as "СН1, QSG2 [CH1_2_STW_QSG2]",
	Round(CH1_2_STW_QS31, 2)		as "СН2, QS3-1 [CH1_2_STW_QS31]",
	Round(CH1_2_STW_QS32, 2)		as "СН2, QS3-2 [CH1_2_STW_QS32]",
	Round(CH1_2_STW_QSG3, 2)		as "СН2, QSG3 [CH1_2_STW_QSG3]",
	Round(CH1_2_STW_Cnv, 2)			as "Состояние ПЧ [CH1_2_STW_Cnv]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
		CH1_2_TempRoom,
		CH1_2_SP_F_PIDOff,
		CH1_2_SP_Press_PIDOn,
		CH1_2_Panel_FOut,
		CH1_2_Panel_U,
		CH1_2_Panel_I,
		CH1_2_Panel_Pw,
		CH1_2_SP_Hi_PIT1,
		CH1_2_SP_Lo_PIT1,
		CH1_2_Err_SwitchGear,
		CH1_2_STW_Q2,
		CH1_2_STW_Q3,
		CH1_2_STW_QS11,
		CH1_2_STW_QSG11,
		CH1_2_STW_QS12,
		CH1_2_STW_QSG12,
		CH1_2_STW_QS21,
		CH1_2_STW_QS22,
		CH1_2_STW_QSG2,
		CH1_2_STW_QS31,
		CH1_2_STW_QS32,
		CH1_2_STW_QSG3,
		CH1_2_STW_Cnv
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Сетевой насос 1-2 (суточные срезы)"*/
/*Mode=суточные-2*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	Round(CH1_2_TempRoom, 2)		as "Т в помещ. ЧРЭП, °С [CH1_2_TempRoom]",
	Round(CH1_2_SP_F_PIDOff, 2)		as "Уст част., Гц [CH1_2_SP_F_PIDOff]",
	Round(CH1_2_SP_Press_PIDOn, 2)	as "Уст. давл., МПа [CH1_2_SP_Press_PIDOn]",
	Round(CH1_2_Panel_FOut, 2)		as "Fout, Гц [CH1_2_Panel_FOut]",
	Round(CH1_2_Panel_U, 2)			as "Uпч, В [CH1_2_Panel_U]",
	Round(CH1_2_Panel_I, 2)			as "Aпч, мА [CH1_2_Panel_I]",
	Round(CH1_2_Panel_Pw, 2)		as "Рпч, Вт [CH1_2_Panel_Pw]",
	Round(CH1_2_SP_Hi_PIT1, 2)		as "Верх. уст. давл. [CH1_2_SP_Hi_PIT1]",
	Round(CH1_2_SP_Lo_PIT1, 2)		as "Нижн. уст. давл. [CH1_2_SP_Lo_PIT1]",
	Round(CH1_2_Err_SwitchGear, 2)	as "Ошибки [CH1_2_Err_SwitchGear]",
	Round(CH1_2_STW_Q2, 2)			as "CH1, сост. Q2 [CH1_2_STW_Q2]",
	Round(CH1_2_STW_Q3, 2)			as "CH2, сост. Q3 [CH1_2_STW_Q3]",
	Round(CH1_2_STW_QS11, 2)		as "ПЧ, QS1-1 [CH1_2_STW_QS11]",
	Round(CH1_2_STW_QSG11, 2)		as "ПЧ, QSG1-1 [CH1_2_STW_QSG11]",
	Round(CH1_2_STW_QS12, 2)		as "ПЧ, QS1-2 [CH1_2_STW_QS12]",
	Round(CH1_2_STW_QSG12, 2)		as "ПЧ, QSG1-2 [CH1_2_STW_QSG12]",
	Round(CH1_2_STW_QS21, 2)		as "СН1, QS2-1 [CH1_2_STW_QS21]",
	Round(CH1_2_STW_QS22, 2)		as "СН1, QS2-2 [CH1_2_STW_QS22]",
	Round(CH1_2_STW_QSG2, 2)		as "СН1, QSG2 [CH1_2_STW_QSG2]",
	Round(CH1_2_STW_QS31, 2)		as "СН2, QS3-1 [CH1_2_STW_QS31]",
	Round(CH1_2_STW_QS32, 2)		as "СН2, QS3-2 [CH1_2_STW_QS32]",
	Round(CH1_2_STW_QSG3, 2)		as "СН2, QSG3 [CH1_2_STW_QSG3]",
	Round(CH1_2_STW_Cnv, 2)			as "Состояние ПЧ [CH1_2_STW_Cnv]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
		CH1_2_TempRoom,
		CH1_2_SP_F_PIDOff,
		CH1_2_SP_Press_PIDOn,
		CH1_2_Panel_FOut,
		CH1_2_Panel_U,
		CH1_2_Panel_I,
		CH1_2_Panel_Pw,
		CH1_2_SP_Hi_PIT1,
		CH1_2_SP_Lo_PIT1,
		CH1_2_Err_SwitchGear,
		CH1_2_STW_Q2,
		CH1_2_STW_Q3,
		CH1_2_STW_QS11,
		CH1_2_STW_QSG11,
		CH1_2_STW_QS12,
		CH1_2_STW_QSG12,
		CH1_2_STW_QS21,
		CH1_2_STW_QS22,
		CH1_2_STW_QSG2,
		CH1_2_STW_QS31,
		CH1_2_STW_QS32,
		CH1_2_STW_QSG3,
		CH1_2_STW_Cnv
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")