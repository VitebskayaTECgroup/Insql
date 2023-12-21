{минутные срезы}
/*ReportName="Расходомеры (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	Round(CASE WHEN Elemer_MashZal_Ch1 < 0 THEN 0 ELSE Elemer_MashZal_Ch1 END, 2) as "Линия напорного трубопровода после насосов НОВ №1,2,3 ЗСОМО [Tag:Elemer_MashZal_Ch1]",
	null,
	Round(Elemer_TurbineZero_Ch1, 2) as "Линия подачи воды с установки по очистке замазученных стоков [Tag:Elemer_TurbineZero_Ch1]",
	null,
	Round(EMIS_MashZal_Q, 2) as "Линия заполнения бака ЗСОМО [Tag:EMIS_MashZal_Q]",
	/* Round(EMIS_MashZal_v, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_v_percents, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_koef_R, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_max, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_min, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_ed_rashod, 2) as "Т бойлера КО1(U02-1), °С [V04_VG21T001]", */
	/* Round(EMIS_MashZal_ed_V, 2) as "G ОСВ КО2, т/ч [V02_VK21F001]", */
	/* Round(EMIS_MashZal_V_obr_celoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_obr_drobnoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_pryam_celoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_pryam_drobnoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_signal_empty_pipe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_signal_no_power, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	null
FROM
	OpenQuery(INSQL,
	"SELECT
		Elemer_MashZal_Ch1,
		Elemer_TurbineZero_Ch1,
		EMIS_MashZal_Q,
		EMIS_MashZal_v,
		EMIS_MashZal_v_percents,
		EMIS_MashZal_koef_R,
		EMIS_MashZal_max,
		EMIS_MashZal_min,
		EMIS_MashZal_ed_rashod,
		EMIS_MashZal_ed_V,
		EMIS_MashZal_V_obr_celoe,
		EMIS_MashZal_V_obr_drobnoe,
		EMIS_MashZal_V_pryam_celoe,
		EMIS_MashZal_V_pryam_drobnoe,
		EMIS_MashZal_signal_empty_pipe,
		EMIS_MashZal_signal_no_power,
		DateTime
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Расходомеры (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	Round(CASE WHEN Elemer_MashZal_Ch1 < 0 THEN 0 ELSE Elemer_MashZal_Ch1 END, 2) as "Линия напорного трубопровода после насосов НОВ №1,2,3 ЗСОМО [Tag:Elemer_MashZal_Ch1]",
	null,
	Round(Elemer_TurbineZero_Ch1, 2) as "Линия подачи воды с установки по очистке замазученных стоков [Tag:Elemer_TurbineZero_Ch1]",
	null,
	Round(EMIS_MashZal_Q, 2) as "Линия заполнения бака ЗСОМО [Tag:EMIS_MashZal_Q]",
	/* Round(EMIS_MashZal_v, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_v_percents, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_koef_R, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_max, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_min, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_ed_rashod, 2) as "Т бойлера КО1(U02-1), °С [V04_VG21T001]", */
	/* Round(EMIS_MashZal_ed_V, 2) as "G ОСВ КО2, т/ч [V02_VK21F001]", */
	/* Round(EMIS_MashZal_V_obr_celoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_obr_drobnoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_pryam_celoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_pryam_drobnoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_signal_empty_pipe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_signal_no_power, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	null
FROM
	OpenQuery(INSQL,
	"SELECT
		Elemer_MashZal_Ch1,
		Elemer_TurbineZero_Ch1,
		EMIS_MashZal_Q,
		EMIS_MashZal_v,
		EMIS_MashZal_v_percents,
		EMIS_MashZal_koef_R,
		EMIS_MashZal_max,
		EMIS_MashZal_min,
		EMIS_MashZal_ed_rashod,
		EMIS_MashZal_ed_V,
		EMIS_MashZal_V_obr_celoe,
		EMIS_MashZal_V_obr_drobnoe,
		EMIS_MashZal_V_pryam_celoe,
		EMIS_MashZal_V_pryam_drobnoe,
		EMIS_MashZal_signal_empty_pipe,
		EMIS_MashZal_signal_no_power,
		DateTime
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Расходомеры (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	Round(CASE WHEN Elemer_MashZal_Ch1 < 0 THEN 0 ELSE Elemer_MashZal_Ch1 END, 2) as "Линия напорного трубопровода после насосов НОВ №1,2,3 ЗСОМО [Tag:Elemer_MashZal_Ch1]",
	null,
	Round(Elemer_TurbineZero_Ch1, 2) as "Линия подачи воды с установки по очистке замазученных стоков [Tag:Elemer_TurbineZero_Ch1]",
	null,
	Round(EMIS_MashZal_Q, 2) as "Линия заполнения бака ЗСОМО [Tag:EMIS_MashZal_Q]",
	/* Round(EMIS_MashZal_v, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_v_percents, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_koef_R, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_max, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_min, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_ed_rashod, 2) as "Т бойлера КО1(U02-1), °С [V04_VG21T001]", */
	/* Round(EMIS_MashZal_ed_V, 2) as "G ОСВ КО2, т/ч [V02_VK21F001]", */
	/* Round(EMIS_MashZal_V_obr_celoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_obr_drobnoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_pryam_celoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_V_pryam_drobnoe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_signal_empty_pipe, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	/* Round(EMIS_MashZal_signal_no_power, 2) as "T ОСВ КО2, °С [V02_VK21T001]", */
	null
FROM
	OpenQuery(INSQL,
	"SELECT
		Elemer_MashZal_Ch1,
		Elemer_TurbineZero_Ch1,
		EMIS_MashZal_Q,
		EMIS_MashZal_v,
		EMIS_MashZal_v_percents,
		EMIS_MashZal_koef_R,
		EMIS_MashZal_max,
		EMIS_MashZal_min,
		EMIS_MashZal_ed_rashod,
		EMIS_MashZal_ed_V,
		EMIS_MashZal_V_obr_celoe,
		EMIS_MashZal_V_obr_drobnoe,
		EMIS_MashZal_V_pryam_celoe,
		EMIS_MashZal_V_pryam_drobnoe,
		EMIS_MashZal_signal_empty_pipe,
		EMIS_MashZal_signal_no_power,
		DateTime
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")