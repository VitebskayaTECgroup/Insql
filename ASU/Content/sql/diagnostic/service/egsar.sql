{минутные срезы}
/*ReportName="ЭГСАР ЧВД,ЧНД (минутные срезы)"*/
/*Mode=минутные*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	S2_MV010_n1 as "Частота вращения ротора турбины [S2_MV010_n1][Vertical:]",
	S2_EGOPER_G_SMCVD_FLT_YRST as "СМ РК ЧВД: Положение, мм: Квитировать [S2_EGOPER_G_SMCVD_FLT_YRST][Vertical:]",
	S2_EGOPER_VC_SMCVD_SP_APL as "СМ РК ЧВД: Задание положения, мм - ПРИМ. [S2_EGOPER_VC_SMCVD_SP_APL][Vertical:]",
	S2_EGOPER_VC_SMCVD_YAUTO as "Привод РК ЧВД: КМД 'УСТ АУ СМ' [S2_EGOPER_VC_SMCVD_YAUTO][Vertical:]",
	S2_EGOPER_VC_SMCVD_YMAN as "Привод РК ЧВД: КМД 'УСТ РУ СМ' [S2_EGOPER_VC_SMCVD_YMAN][Vertical:]",
	S2_EGOPER_VC_ZOCVD_SP_APL as "ЗО РК ЧВД: Задание положения, мкм - ПРИМ. [S2_EGOPER_VC_ZOCVD_SP_APL][Vertical:]",
	S2_EGOPER_VC_ZOCVD_YMAN as "Привод РК ЧВД: КМД 'УСТ РУ ЗО' [S2_EGOPER_VC_ZOCVD_YMAN][Vertical:]",
	S2_EGOPER_VC_ZOCVD_YOFF as "Привод РК ЧВД: КМД 'ОТКЛ' [S2_EGOPER_VC_ZOCVD_YOFF][Vertical:]",
	S2_EGOPER_VC_ZOCVD_YON as "Привод РК ЧВД: КМД 'ВКЛ' [S2_EGOPER_VC_ZOCVD_YON][Vertical:]",
	S2_EGOPER_VC_ZOCVD_YRST as "Привод РК ЧВД: КМД 'Сбросить ошибку' [S2_EGOPER_VC_ZOCVD_YRST][Vertical:]",

	S2_EGR_COND6_ACT as "Привод регулирующих клапанов РК ЧВД готов [S2_EGR_COND6_ACT][Vertical:]",
	S2_EGR_G_SMCVD as "СМ РК ЧВД: Положение, мм [S2_EGR_G_SMCVD][Vertical:]",
	S2_EGR_G_SMCVD_FLT as "Положение СМа РК ЧВД, мм: Неисправность [S2_EGR_G_SMCVD_FLT][Vertical:]",
	S2_EGR_G_ZOCVD as "ЗО РК ЧВД: Положение, мкм [S2_EGR_G_ZOCVD][Vertical:]",
	S2_EGR_I_ZOCVD as "ЗО РК ЧВД: Ток привода, А [S2_EGR_I_ZOCVD][Vertical:]",
	S2_EGR_MSG_C_11 as "Дистанционное УПР. РК ЧВД [S2_EGR_MSG_C_11][Vertical:]",
	S2_EGR_MSG_D_9 as "Неисправность привода РК ЧВД [S2_EGR_MSG_D_9][Vertical:]",
	S2_EGR_VC_DRCVD_FLT as "Привод РК ЧВД: Неисправность [S2_EGR_VC_DRCVD_FLT][Vertical:]",
	S2_EGR_VC_SMCVD_ST_BL as "СМ РК ЧВД: Сост. (Блок.) [S2_EGR_VC_SMCVD_ST_BL][Vertical:]",
	S2_EGR_VC_SMCVD_ST_CLS as "СМ РК ЧВД: Сост. (Закрыт) [S2_EGR_VC_SMCVD_ST_CLS][Vertical:]",
	S2_EGR_VC_SMCVD_ST_EN_SM_AUTO as "СМ РК ЧВД: Сост. (Разр. выб. авт. упр. СМ) [S2_EGR_VC_SMCVD_ST_EN_SM_AUTO][Vertical:]",
	S2_EGR_VC_SMCVD_ST_EN_SM_MAN as "СМ РК ЧВД: Сост. (Разр. выб. ручн. упр. СМ) [S2_EGR_VC_SMCVD_ST_EN_SM_MAN][Vertical:]",
	S2_EGR_VC_SMCVD_ST_EN_ZO_MAN as "СМ РК ЧВД: Сост. (Разр. выб. ручн. упр. ЗОом) [S2_EGR_VC_SMCVD_ST_EN_ZO_MAN][Vertical:]",
	S2_EGR_VC_SMCVD_ST_OPN as "СМ РК ЧВД: Сост. (Открыт) [S2_EGR_VC_SMCVD_ST_OPN][Vertical:]",
	S2_EGR_VC_SMCVD_ST_POS_REACH as "СМ РК ЧВД: Сост. (Перемещение отработано) [S2_EGR_VC_SMCVD_ST_POS_REACH][Vertical:]",
	S2_EGR_VC_SMCVD_ST_RDY as "СМ РК ЧВД: Сост. (Готовность) [S2_EGR_VC_SMCVD_ST_RDY][Vertical:]",
	S2_EGR_VC_SMCVD_ST_SM_AUTO as "СМ РК ЧВД: Сост. (Автоматическое управление СМ) [S2_EGR_VC_SMCVD_ST_SM_AUTO][Vertical:]",
	S2_EGR_VC_SMCVD_ST_SM_MAN as "СМ РК ЧВД: Сост. (Ручное управление СМ) [S2_EGR_VC_SMCVD_ST_SM_MAN][Vertical:]",
	S2_EGR_VC_SMCVD_ST_ZO_MAN as "СМ РК ЧВД: Сост. (Ручное управление ЗОом) [S2_EGR_VC_SMCVD_ST_ZO_MAN][Vertical:]",
	S2_EGR_VC_SMCVD_YG as "СМ РК ЧВД: Текущее задание положения, мм [S2_EGR_VC_SMCVD_YG][Vertical:]",
	S2_EGR_VC_ZOCVD_CDF as "ЗО РК ЧВД: Код ошибки привода [S2_EGR_VC_ZOCVD_CDF][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_AI_CH_CTRL as "ЗО РК ЧВД: Сост. 1 (Работа от аналогового сигнала) [S2_EGR_VC_ZOCVD_ST1_AI_CH_CTRL][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_BOT_BY_DI as "ЗО РК ЧВД: Сост. 1 (Аварийное перемещение вниз) [S2_EGR_VC_ZOCVD_ST1_BOT_BY_DI][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_DR_CF as "ЗО РК ЧВД: Сост. 1 (Ошибка связи с приводом) [S2_EGR_VC_ZOCVD_ST1_DR_CF][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_DR_ENABLED as "ЗО РК ЧВД: Сост. 1 (Привод разблокирован) [S2_EGR_VC_ZOCVD_ST1_DR_ENABLED][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_DR_HEALTH as "ЗО РК ЧВД: Сост. 1 (Привод исправен) [S2_EGR_VC_ZOCVD_ST1_DR_HEALTH][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_DR_RUN as "ЗО РК ЧВД: Сост. 1 (Привод в работе) [S2_EGR_VC_ZOCVD_ST1_DR_RUN][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_ENC_HEALTH as "ЗО РК ЧВД: Сост. 1 (Энкодер исправен) [S2_EGR_VC_ZOCVD_ST1_ENC_HEALTH][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_HANDLE_MODE as "ЗО РК ЧВД: Сост. 1 (Управление от рукоятки) [S2_EGR_VC_ZOCVD_ST1_HANDLE_MODE][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_HW_SQ_BOT as "ЗО РК ЧВД: Сост. 1 (Нижний аппаратный концевик) [S2_EGR_VC_ZOCVD_ST1_HW_SQ_BOT][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_HW_SQ_TOP as "ЗО РК ЧВД: Сост. 1 (Верхний аппаратный концевик) [S2_EGR_VC_ZOCVD_ST1_HW_SQ_TOP][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_POS_REACH as "ЗО РК ЧВД: Сост. 1 (Перемещение отработано) [S2_EGR_VC_ZOCVD_ST1_POS_REACH][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_BOT as "ЗО РК ЧВД: Сост. 1 (Нижний программный концевик) [S2_EGR_VC_ZOCVD_ST1_SW_SQ_BOT][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_BOT as "ЗО РК ЧВД: Сост. 1 (Нижн.прогр.концевик замедл.) [S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_BOT][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_TOP as "ЗО РК ЧВД: Сост. 1 (Верхн.прогр.концевик замедл.) [S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_TOP][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_TOP as "ЗО РК ЧВД: Сост. 1 (Верхний программный концевик) [S2_EGR_VC_ZOCVD_ST1_SW_SQ_TOP][Vertical:]",
	S2_EGR_VC_ZOCVD_ST1_TOP_BY_DI as "ЗО РК ЧВД: Сост. 1 (Аварийное перемещение вверх) [S2_EGR_VC_ZOCVD_ST1_TOP_BY_DI][Vertical:]",
	S2_EGR_VC_ZOCVD_ST2_FLT as "ЗО РК ЧВД: Сост. 2 (Неисправность) [S2_EGR_VC_ZOCVD_ST2_FLT][Vertical:]",
	S2_EGR_VC_ZOCVD_ST2_IM_MSR as "ЗО РК ЧВД: Сост. 2 (Привод выбрал ИМ ведущ.) [S2_EGR_VC_ZOCVD_ST2_IM_MSR][Vertical:]",
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_CF as "ЗО РК ЧВД: Сост. 2 (Потеря связи с другим ИМ) [S2_EGR_VC_ZOCVD_ST2_OTHER_IM_CF][Vertical:]",
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_MSR as "ЗО РК ЧВД: Сост. 2 (Другой ИМ запр.себя вед.) [S2_EGR_VC_ZOCVD_ST2_OTHER_IM_MSR][Vertical:]",
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_RDY as "ЗО РК ЧВД: Сост. 2 (Другой ИМ готов) [S2_EGR_VC_ZOCVD_ST2_OTHER_IM_RDY][Vertical:]",
	S2_EGR_VC_ZOCVD_ST2_RDY as "ЗО РК ЧВД: Сост. 2 (Готовность) [S2_EGR_VC_ZOCVD_ST2_RDY][Vertical:]",
	S2_EGR_VC_ZOCVD_YG as "ЗО РК ЧВД: Текущее задание положения (мкм) [S2_EGR_VC_ZOCVD_YG][Vertical:]",

	S2_EGW_G_SMCVD_FLT_YRST as "СМ РК ЧВД: Положение, мм: Квит. [S2_EGW_G_SMCVD_FLT_YRST][Vertical:]",
	S2_EGW_VC_SMCVD_SP as "СМ РК ЧВД: Задание положения, мм [S2_EGW_VC_SMCVD_SP][Vertical:]",
	S2_EGW_VC_SMCVD_SP_APL as "СМ РК ЧВД: Задание положения, мм -- ПРИМ. [S2_EGW_VC_SMCVD_SP_APL][Vertical:]",
	S2_EGW_VC_SMCVD_YAUTO as "Привод РК ЧВД: КМД 'УСТ АУ СМ'' [S2_EGW_VC_SMCVD_YAUTO][Vertical:]",
	S2_EGW_VC_SMCVD_YMAN as "Привод РК ЧВД: КМД 'УСТ РУ СМ'' [S2_EGW_VC_SMCVD_YMAN][Vertical:]",
	S2_EGW_VC_ZOCVD_SP as "ЗО РК ЧВД: Задание положения (мкм) [S2_EGW_VC_ZOCVD_SP][Vertical:]",
	S2_EGW_VC_ZOCVD_SP_APL as "ЗО РК ЧВД: Задание положения (мкм) - ПРИМ. [S2_EGW_VC_ZOCVD_SP_APL][Vertical:]",
	S2_EGW_VC_ZOCVD_YMAN as "Привод РК ЧВД: КМД 'УСТ РУ ЗО'' [S2_EGW_VC_ZOCVD_YMAN][Vertical:]",
	S2_EGW_VC_ZOCVD_YOFF as "Привод РК ЧВД: КМД 'ОТКЛ'' [S2_EGW_VC_ZOCVD_YOFF][Vertical:]",
	S2_EGW_VC_ZOCVD_YON as "Привод РК ЧВД: КМД 'ВКЛ'' [S2_EGW_VC_ZOCVD_YON][Vertical:]",
	S2_EGW_VC_ZOCVD_YRST as "Привод РК ЧВД: КМД 'Сбросить ошибку'' [S2_EGW_VC_ZOCVD_YRST][Vertical:]",

	S2_EGOPER_G_SMCND_FLT_YRST as "СМ ПД ЧНД: Положение, мм: Квитировать [S2_EGOPER_G_SMCND_FLT_YRST][Vertical:]",
	S2_EGOPER_VC_SMCND_SP_APL as "СМ ПД ЧНД: Задание положения, мм - ПРИМ. [S2_EGOPER_VC_SMCND_SP_APL][Vertical:]",
	S2_EGOPER_VC_SMCND_YAUTO as "Привод ПД ЧНД: КМД 'УСТ АУ СМ' [S2_EGOPER_VC_SMCND_YAUTO][Vertical:]",
	S2_EGOPER_VC_SMCND_YMAN as "Привод ПД ЧНД: КМД 'УСТ РУ СМ' [S2_EGOPER_VC_SMCND_YMAN][Vertical:]",
	S2_EGOPER_VC_ZOCND_SP_APL as "ЗО ПД ЧНД: Задание положения, мкм - ПРИМ. [S2_EGOPER_VC_ZOCND_SP_APL][Vertical:]",
	S2_EGOPER_VC_ZOCND_YMAN as "Привод ПД ЧНД: КМД 'УСТ РУ ЗО' [S2_EGOPER_VC_ZOCND_YMAN][Vertical:]",
	S2_EGOPER_VC_ZOCND_YOFF as "Привод ПД ЧНД: КМД 'ОТКЛ' [S2_EGOPER_VC_ZOCND_YOFF][Vertical:]",
	S2_EGOPER_VC_ZOCND_YON as "Привод ПД ЧНД: КМД 'ВКЛ' [S2_EGOPER_VC_ZOCND_YON][Vertical:]",
	S2_EGOPER_VC_ZOCND_YRST as "Привод ПД ЧНД: КМД 'Сбросить ошибку' [S2_EGOPER_VC_ZOCND_YRST][Vertical:]",

	S2_EGR_COND8_ACT as "Привод поворотной диафрагмы ПД ЧНД готов [S2_EGR_COND8_ACT][Vertical:]",
	S2_EGR_F_CND_TG as "Расчетный расход пара в ЧНД (т/ч) [S2_EGR_F_CND_TG][Vertical:]",
	S2_EGR_G_SMCND as "СМ ПД ЧНД: Положение, мм [S2_EGR_G_SMCND][Vertical:]",
	S2_EGR_G_SMCND_FLT as "Положение СМа ПД ЧНД (мм): Неисправность [S2_EGR_G_SMCND_FLT][Vertical:]",
	S2_EGR_G_ZOCND as "ЗО ПД ЧНД: Положение (мкм) [S2_EGR_G_ZOCND][Vertical:]",
	S2_EGR_I_ZOCND as "ЗО ПД ЧНД: Ток привода (А) [S2_EGR_I_ZOCND][Vertical:]",
	S2_EGR_MSG_C_13 as "Дистанционное УПР. ПД ЧНД [S2_EGR_MSG_C_13][Vertical:]",
	S2_EGR_MSG_D_11 as "Неисправность привода РК ЧНД [S2_EGR_MSG_D_11][Vertical:]",
	S2_EGR_VC_DRCND_FLT as "Привод ПД ЧНД: Неисправность [S2_EGR_VC_DRCND_FLT][Vertical:]",
	S2_EGR_VC_SMCND_ST_BL as "СМ ПД ЧНД: Сост. (Блок.) [S2_EGR_VC_SMCND_ST_BL][Vertical:]",
	S2_EGR_VC_SMCND_ST_CLS as "СМ ПД ЧНД: Сост. (Закрыт) [S2_EGR_VC_SMCND_ST_CLS][Vertical:]",
	S2_EGR_VC_SMCND_ST_EN_SM_AUTO as "СМ ПД ЧНД: Сост. (Разр. выб. авт. упр. СМ) [S2_EGR_VC_SMCND_ST_EN_SM_AUTO][Vertical:]",
	S2_EGR_VC_SMCND_ST_EN_SM_MAN as "СМ ПД ЧНД: Сост. (Разр. выб. ручн. упр. СМ) [S2_EGR_VC_SMCND_ST_EN_SM_MAN][Vertical:]",
	S2_EGR_VC_SMCND_ST_EN_ZO_MAN as "СМ ПД ЧНД: Сост. (Разр. выб. ручн. упр. ЗО) [S2_EGR_VC_SMCND_ST_EN_ZO_MAN][Vertical:]",
	S2_EGR_VC_SMCND_ST_OPN as "СМ ПД ЧНД: Сост. (Открыт) [S2_EGR_VC_SMCND_ST_OPN][Vertical:]",
	S2_EGR_VC_SMCND_ST_POS_REACH as "СМ ПД ЧНД: Сост. (Перемещение отработано) [S2_EGR_VC_SMCND_ST_POS_REACH][Vertical:]",
	S2_EGR_VC_SMCND_ST_RDY as "СМ ПД ЧНД: Сост. (Готовность) [S2_EGR_VC_SMCND_ST_RDY][Vertical:]",
	S2_EGR_VC_SMCND_ST_SM_AUTO as "СМ ПД ЧНД: Сост. (Автоматическое управление СМ) [S2_EGR_VC_SMCND_ST_SM_AUTO][Vertical:]",
	S2_EGR_VC_SMCND_ST_SM_MAN as "СМ ПД ЧНД: Сост. (Ручное управление СМ) [S2_EGR_VC_SMCND_ST_SM_MAN][Vertical:]",
	S2_EGR_VC_SMCND_ST_ZO_MAN as "СМ ПД ЧНД: Сост. (Ручное управление ЗОом) [S2_EGR_VC_SMCND_ST_ZO_MAN][Vertical:]",
	S2_EGR_VC_SMCND_YG as "СМ ПД ЧНД: Текущее задание положения (мм) [S2_EGR_VC_SMCND_YG][Vertical:]",
	S2_EGR_VC_ZOCND_CDF as "ЗО ПД ЧНД: Код ошибки привода [S2_EGR_VC_ZOCND_CDF][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_AI_CH_CTRL as "ЗО ПД ЧНД: Сост. 1 (Работа от аналогового сигнала) [S2_EGR_VC_ZOCND_ST1_AI_CH_CTRL][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_BOT_BY_DI as "ЗО ПД ЧНД: Сост. 1 (Аварийное перемещение вниз) [S2_EGR_VC_ZOCND_ST1_BOT_BY_DI][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_DR_CF as "ЗО ПД ЧНД: Сост. 1 (Ошибка связи с приводом) [S2_EGR_VC_ZOCND_ST1_DR_CF][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_DR_ENABLED as "ЗО ПД ЧНД: Сост. 1 (Привод разблокирован) [S2_EGR_VC_ZOCND_ST1_DR_ENABLED][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_DR_HEALTH as "ЗО ПД ЧНД: Сост. 1 (Привод исправен) [S2_EGR_VC_ZOCND_ST1_DR_HEALTH][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_DR_RUN as "ЗО ПД ЧНД: Сост. 1 (Привод в работе) [S2_EGR_VC_ZOCND_ST1_DR_RUN][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_ENC_HEALTH as "ЗО ПД ЧНД: Сост. 1 (Энкодер исправен) [S2_EGR_VC_ZOCND_ST1_ENC_HEALTH][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_HANDLE_MODE as "ЗО ПД ЧНД: Сост. 1 (Управление от рукоятки) [S2_EGR_VC_ZOCND_ST1_HANDLE_MODE][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_HW_SQ_BOT as "ЗО ПД ЧНД: Сост. 1 (Нижний аппаратный концевик) [S2_EGR_VC_ZOCND_ST1_HW_SQ_BOT][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_HW_SQ_TOP as "ЗО ПД ЧНД: Сост. 1 (Верхний аппаратный концевик) [S2_EGR_VC_ZOCND_ST1_HW_SQ_TOP][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_POS_REACH as "ЗО ПД ЧНД: Сост. 1 (Перемещение отработано) [S2_EGR_VC_ZOCND_ST1_POS_REACH][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_BOT as "ЗО ПД ЧНД: Сост. 1 (Нижний программный концевик) [S2_EGR_VC_ZOCND_ST1_SW_SQ_BOT][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_BOT as "ЗО ПД ЧНД: Сост. 1 (Нижн.прогр.концевик замедлен.) [S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_BOT][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_TOP as "ЗО ПД ЧНД: Сост. 1 (Верхн.прогр.концевик замедл.) [S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_TOP][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_TOP as "ЗО ПД ЧНД: Сост. 1 (Верхний программный концевик) [S2_EGR_VC_ZOCND_ST1_SW_SQ_TOP][Vertical:]",
	S2_EGR_VC_ZOCND_ST1_TOP_BY_DI as "ЗО ПД ЧНД: Сост. 1 (Аварийное перемещение вверх) [S2_EGR_VC_ZOCND_ST1_TOP_BY_DI][Vertical:]",
	S2_EGR_VC_ZOCND_ST2_FLT as "ЗО ПД ЧНД: Сост. 2 (Неисправность) [S2_EGR_VC_ZOCND_ST2_FLT][Vertical:]",
	S2_EGR_VC_ZOCND_ST2_IM_MSR as "ЗО ПД ЧНД: Сост. 2 (Привод выбрал ИМ ведущ.) [S2_EGR_VC_ZOCND_ST2_IM_MSR][Vertical:]",
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_CF as "ЗО ПД ЧНД: Сост. 2 (Потеря связи с другим ИМ) [S2_EGR_VC_ZOCND_ST2_OTHER_IM_CF][Vertical:]",
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_MSR as "ЗО ПД ЧНД: Сост. 2 (Другой ИМ запр.себя вед.) [S2_EGR_VC_ZOCND_ST2_OTHER_IM_MSR][Vertical:]",
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_RDY as "ЗО ПД ЧНД: Сост. 2 (Другой ИМ готов) [S2_EGR_VC_ZOCND_ST2_OTHER_IM_RDY][Vertical:]",
	S2_EGR_VC_ZOCND_ST2_RDY as "ЗО ПД ЧНД: Сост. 2 (Готовность) [S2_EGR_VC_ZOCND_ST2_RDY][Vertical:]",
	S2_EGR_VC_ZOCND_YG as "ЗО ПД ЧНД: Текущее задание положения (мкм) [S2_EGR_VC_ZOCND_YG][Vertical:]",

	S2_EGW_G_SMCND_FLT_YRST as "СМ ПД ЧНД: Положение (мм): Квит. [S2_EGW_G_SMCND_FLT_YRST][Vertical:]",
	S2_EGW_VC_SMCND_SP as "СМ ПД ЧНД: Задание положения (мм) [S2_EGW_VC_SMCND_SP][Vertical:]",
	S2_EGW_VC_SMCND_SP_APL as "СМ ПД ЧНД: Задание положения (мм) - ПРИМ. [S2_EGW_VC_SMCND_SP_APL][Vertical:]",
	S2_EGW_VC_SMCND_YAUTO as "Привод ПД ЧНД: КМД 'УСТ АУ СМ'' [S2_EGW_VC_SMCND_YAUTO][Vertical:]",
	S2_EGW_VC_SMCND_YMAN as "Привод ПД ЧНД: КМД 'УСТ РУ СМ'' [S2_EGW_VC_SMCND_YMAN][Vertical:]",
	S2_EGW_VC_ZOCND_SP as "ЗО ПД ЧНД: Задание положения (мкм) [S2_EGW_VC_ZOCND_SP][Vertical:]",
	S2_EGW_VC_ZOCND_SP_APL as "ЗО ПД ЧНД: Задание положения (мкм) - ПРИМ. [S2_EGW_VC_ZOCND_SP_APL][Vertical:]",
	S2_EGW_VC_ZOCND_YMAN as "Привод ПД ЧНД: КМД 'УСТ РУ ЗО'' [S2_EGW_VC_ZOCND_YMAN][Vertical:]",
	S2_EGW_VC_ZOCND_YOFF as "Привод ПД ЧНД: КМД 'ОТКЛ'' [S2_EGW_VC_ZOCND_YOFF][Vertical:]",
	S2_EGW_VC_ZOCND_YON as "Привод ПД ЧНД: КМД 'ВКЛ'' [S2_EGW_VC_ZOCND_YON][Vertical:]",
	S2_EGW_VC_ZOCND_YRST as "Привод ПД ЧНД: КМД 'Сбросить ошибку'' [S2_EGW_VC_ZOCND_YRST][Vertical:]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,S2_MV010_n1,S2_EGOPER_G_SMCVD_FLT_YRST,
	S2_EGOPER_VC_SMCVD_SP_APL,
	S2_EGOPER_VC_SMCVD_YAUTO,
	S2_EGOPER_VC_SMCVD_YMAN,
	S2_EGOPER_VC_ZOCVD_SP_APL,
	S2_EGOPER_VC_ZOCVD_YMAN,
	S2_EGOPER_VC_ZOCVD_YOFF,
	S2_EGOPER_VC_ZOCVD_YON,
	S2_EGOPER_VC_ZOCVD_YRST,
	S2_EGR_COND6_ACT,
	S2_EGR_G_SMCVD,
	S2_EGR_G_SMCVD_FLT,
	S2_EGR_G_ZOCVD,
	S2_EGR_I_ZOCVD,
	S2_EGR_MSG_C_11,
	S2_EGR_MSG_D_9,
	S2_EGR_VC_DRCVD_FLT,
	S2_EGR_VC_SMCVD_ST_BL,
	S2_EGR_VC_SMCVD_ST_CLS,
	S2_EGR_VC_SMCVD_ST_EN_SM_AUTO,
	S2_EGR_VC_SMCVD_ST_EN_SM_MAN,
	S2_EGR_VC_SMCVD_ST_EN_ZO_MAN,
	S2_EGR_VC_SMCVD_ST_OPN,
	S2_EGR_VC_SMCVD_ST_POS_REACH,
	S2_EGR_VC_SMCVD_ST_RDY,
	S2_EGR_VC_SMCVD_ST_SM_AUTO,
	S2_EGR_VC_SMCVD_ST_SM_MAN,
	S2_EGR_VC_SMCVD_ST_ZO_MAN,
	S2_EGR_VC_SMCVD_YG,
	S2_EGR_VC_ZOCVD_CDF,
	S2_EGR_VC_ZOCVD_ST1_AI_CH_CTRL,
	S2_EGR_VC_ZOCVD_ST1_BOT_BY_DI,
	S2_EGR_VC_ZOCVD_ST1_DR_CF,
	S2_EGR_VC_ZOCVD_ST1_DR_ENABLED,
	S2_EGR_VC_ZOCVD_ST1_DR_HEALTH,
	S2_EGR_VC_ZOCVD_ST1_DR_RUN,
	S2_EGR_VC_ZOCVD_ST1_ENC_HEALTH,
	S2_EGR_VC_ZOCVD_ST1_HANDLE_MODE,
	S2_EGR_VC_ZOCVD_ST1_HW_SQ_BOT,
	S2_EGR_VC_ZOCVD_ST1_HW_SQ_TOP,
	S2_EGR_VC_ZOCVD_ST1_POS_REACH,
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_BOT,
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_BOT,
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_TOP,
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_TOP,
	S2_EGR_VC_ZOCVD_ST1_TOP_BY_DI,
	S2_EGR_VC_ZOCVD_ST2_FLT,
	S2_EGR_VC_ZOCVD_ST2_IM_MSR,
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_CF,
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_MSR,
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_RDY,
	S2_EGR_VC_ZOCVD_ST2_RDY,
	S2_EGR_VC_ZOCVD_YG,
	S2_EGW_G_SMCVD_FLT_YRST,
	S2_EGW_VC_SMCVD_SP,
	S2_EGW_VC_SMCVD_SP_APL,
	S2_EGW_VC_SMCVD_YAUTO,
	S2_EGW_VC_SMCVD_YMAN,
	S2_EGW_VC_ZOCVD_SP,
	S2_EGW_VC_ZOCVD_SP_APL,
	S2_EGW_VC_ZOCVD_YMAN,
	S2_EGW_VC_ZOCVD_YOFF,
	S2_EGW_VC_ZOCVD_YON,
	S2_EGW_VC_ZOCVD_YRST,
	S2_EGOPER_G_SMCND_FLT_YRST,
	S2_EGOPER_VC_SMCND_SP_APL,
	S2_EGOPER_VC_SMCND_YAUTO,
	S2_EGOPER_VC_SMCND_YMAN,
	S2_EGOPER_VC_ZOCND_SP_APL,
	S2_EGOPER_VC_ZOCND_YMAN,
	S2_EGOPER_VC_ZOCND_YOFF,
	S2_EGOPER_VC_ZOCND_YON,
	S2_EGOPER_VC_ZOCND_YRST,
	S2_EGR_COND8_ACT,
	S2_EGR_F_CND_TG,
	S2_EGR_G_SMCND,
	S2_EGR_G_SMCND_FLT,
	S2_EGR_G_ZOCND,
	S2_EGR_I_ZOCND,
	S2_EGR_MSG_C_13,
	S2_EGR_MSG_D_11,
	S2_EGR_VC_DRCND_FLT,
	S2_EGR_VC_SMCND_ST_BL,
	S2_EGR_VC_SMCND_ST_CLS,
	S2_EGR_VC_SMCND_ST_EN_SM_AUTO,
	S2_EGR_VC_SMCND_ST_EN_SM_MAN,
	S2_EGR_VC_SMCND_ST_EN_ZO_MAN,
	S2_EGR_VC_SMCND_ST_OPN,
	S2_EGR_VC_SMCND_ST_POS_REACH,
	S2_EGR_VC_SMCND_ST_RDY,
	S2_EGR_VC_SMCND_ST_SM_AUTO,
	S2_EGR_VC_SMCND_ST_SM_MAN,
	S2_EGR_VC_SMCND_ST_ZO_MAN,
	S2_EGR_VC_SMCND_YG,
	S2_EGR_VC_ZOCND_CDF,
	S2_EGR_VC_ZOCND_ST1_AI_CH_CTRL,
	S2_EGR_VC_ZOCND_ST1_BOT_BY_DI,
	S2_EGR_VC_ZOCND_ST1_DR_CF,
	S2_EGR_VC_ZOCND_ST1_DR_ENABLED,
	S2_EGR_VC_ZOCND_ST1_DR_HEALTH,
	S2_EGR_VC_ZOCND_ST1_DR_RUN,
	S2_EGR_VC_ZOCND_ST1_ENC_HEALTH,
	S2_EGR_VC_ZOCND_ST1_HANDLE_MODE,
	S2_EGR_VC_ZOCND_ST1_HW_SQ_BOT,
	S2_EGR_VC_ZOCND_ST1_HW_SQ_TOP,
	S2_EGR_VC_ZOCND_ST1_POS_REACH,
	S2_EGR_VC_ZOCND_ST1_SW_SQ_BOT,
	S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_BOT,
	S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_TOP,
	S2_EGR_VC_ZOCND_ST1_SW_SQ_TOP,
	S2_EGR_VC_ZOCND_ST1_TOP_BY_DI,
	S2_EGR_VC_ZOCND_ST2_FLT,
	S2_EGR_VC_ZOCND_ST2_IM_MSR,
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_CF,
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_MSR,
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_RDY,
	S2_EGR_VC_ZOCND_ST2_RDY,
	S2_EGR_VC_ZOCND_YG,
	S2_EGW_G_SMCND_FLT_YRST,
	S2_EGW_VC_SMCND_SP,
	S2_EGW_VC_SMCND_SP_APL,
	S2_EGW_VC_SMCND_YAUTO,
	S2_EGW_VC_SMCND_YMAN,
	S2_EGW_VC_ZOCND_SP,
	S2_EGW_VC_ZOCND_SP_APL,
	S2_EGW_VC_ZOCND_YMAN,
	S2_EGW_VC_ZOCND_YOFF,
	S2_EGW_VC_ZOCND_YON,
	S2_EGW_VC_ZOCND_YRST
	FROM WideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")