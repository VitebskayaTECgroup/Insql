{минутные срезы}
/*ReportName="ЭГСАР ЧВД,ЧНД (минутные срезы)"*/
/*Mode=минутные*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	S2_MV010_n1 as "[Description] [S2_MV010_n1]",
	S2_EGOPER_G_SMCVD_FLT_YRST as "[Description] [S2_EGOPER_G_SMCVD_FLT_YRST]",
	S2_EGOPER_VC_SMCVD_SP_APL as "[Description] (OPER) [S2_EGOPER_VC_SMCVD_SP_APL]",
	S2_EGOPER_VC_SMCVD_YAUTO as "[Description] (OPER) [S2_EGOPER_VC_SMCVD_YAUTO]",
	S2_EGOPER_VC_SMCVD_YMAN as "[Description] (OPER) [S2_EGOPER_VC_SMCVD_YMAN]",
	S2_EGOPER_VC_ZOCVD_SP_APL as "[Description] (OPER) [S2_EGOPER_VC_ZOCVD_SP_APL]",
	S2_EGOPER_VC_ZOCVD_YMAN as "[Description] (OPER) [S2_EGOPER_VC_ZOCVD_YMAN]",
	S2_EGOPER_VC_ZOCVD_YOFF as "[Description] (OPER) [S2_EGOPER_VC_ZOCVD_YOFF]",
	S2_EGOPER_VC_ZOCVD_YON as "[Description] (OPER) [S2_EGOPER_VC_ZOCVD_YON]",
	S2_EGOPER_VC_ZOCVD_YRST as "[Description] (OPER) [S2_EGOPER_VC_ZOCVD_YRST]",
	S2_EGR_COND6_ACT as "[Description] [S2_EGR_COND6_ACT]",
	S2_EGR_G_SMCVD as "[Description] [S2_EGR_G_SMCVD]",
	S2_EGR_G_SMCVD_FLT as "[Description] [S2_EGR_G_SMCVD_FLT]",
	S2_EGR_G_ZOCVD as "[Description] [S2_EGR_G_ZOCVD]",
	S2_EGR_I_ZOCVD as "[Description] [S2_EGR_I_ZOCVD]",
	S2_EGR_MSG_C_11 as "[Description] [S2_EGR_MSG_C_11]",
	S2_EGR_MSG_D_9 as "[Description] [S2_EGR_MSG_D_9]",
	S2_EGR_VC_DRCVD_FLT as "[Description] [S2_EGR_VC_DRCVD_FLT]",
	S2_EGR_VC_SMCVD_ST_BL as "[Description] [S2_EGR_VC_SMCVD_ST_BL]",
	S2_EGR_VC_SMCVD_ST_CLS as "[Description] [S2_EGR_VC_SMCVD_ST_CLS]",
	S2_EGR_VC_SMCVD_ST_EN_SM_AUTO as "[Description] [S2_EGR_VC_SMCVD_ST_EN_SM_AUTO]",
	S2_EGR_VC_SMCVD_ST_EN_SM_MAN as "[Description] [S2_EGR_VC_SMCVD_ST_EN_SM_MAN]",
	S2_EGR_VC_SMCVD_ST_EN_ZO_MAN as "[Description] [S2_EGR_VC_SMCVD_ST_EN_ZO_MAN]",
	S2_EGR_VC_SMCVD_ST_OPN as "[Description] [S2_EGR_VC_SMCVD_ST_OPN]",
	S2_EGR_VC_SMCVD_ST_POS_REACH as "[Description] [S2_EGR_VC_SMCVD_ST_POS_REACH]",
	S2_EGR_VC_SMCVD_ST_RDY as "[Description] [S2_EGR_VC_SMCVD_ST_RDY]",
	S2_EGR_VC_SMCVD_ST_SM_AUTO as "[Description] [S2_EGR_VC_SMCVD_ST_SM_AUTO]",
	S2_EGR_VC_SMCVD_ST_SM_MAN as "[Description] [S2_EGR_VC_SMCVD_ST_SM_MAN]",
	S2_EGR_VC_SMCVD_ST_ZO_MAN as "[Description] [S2_EGR_VC_SMCVD_ST_ZO_MAN]",
	S2_EGR_VC_SMCVD_YG as "[Description] [S2_EGR_VC_SMCVD_YG]",
	S2_EGR_VC_ZOCVD_CDF as "[Description] [S2_EGR_VC_ZOCVD_CDF]",
	S2_EGR_VC_ZOCVD_ST1_AI_CH_CTRL as "[Description] [S2_EGR_VC_ZOCVD_ST1_AI_CH_CTRL]",
	S2_EGR_VC_ZOCVD_ST1_BOT_BY_DI as "[Description] [S2_EGR_VC_ZOCVD_ST1_BOT_BY_DI]",
	S2_EGR_VC_ZOCVD_ST1_DR_CF as "[Description] [S2_EGR_VC_ZOCVD_ST1_DR_CF]",
	S2_EGR_VC_ZOCVD_ST1_DR_ENABLED as "[Description] [S2_EGR_VC_ZOCVD_ST1_DR_ENABLED]",
	S2_EGR_VC_ZOCVD_ST1_DR_HEALTH as "[Description] [S2_EGR_VC_ZOCVD_ST1_DR_HEALTH]",
	S2_EGR_VC_ZOCVD_ST1_DR_RUN as "[Description] [S2_EGR_VC_ZOCVD_ST1_DR_RUN]",
	S2_EGR_VC_ZOCVD_ST1_ENC_HEALTH as "[Description] [S2_EGR_VC_ZOCVD_ST1_ENC_HEALTH]",
	S2_EGR_VC_ZOCVD_ST1_HANDLE_MODE as "[Description] [S2_EGR_VC_ZOCVD_ST1_HANDLE_MODE]",
	S2_EGR_VC_ZOCVD_ST1_HW_SQ_BOT as "[Description] [S2_EGR_VC_ZOCVD_ST1_HW_SQ_BOT]",
	S2_EGR_VC_ZOCVD_ST1_HW_SQ_TOP as "[Description] [S2_EGR_VC_ZOCVD_ST1_HW_SQ_TOP]",
	S2_EGR_VC_ZOCVD_ST1_POS_REACH as "[Description] [S2_EGR_VC_ZOCVD_ST1_POS_REACH]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_BOT as "[Description] [S2_EGR_VC_ZOCVD_ST1_SW_SQ_BOT]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_BOT as "[Description] [S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_BOT]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_TOP as "[Description] [S2_EGR_VC_ZOCVD_ST1_SW_SQ_SL_TOP]",
	S2_EGR_VC_ZOCVD_ST1_SW_SQ_TOP as "[Description] [S2_EGR_VC_ZOCVD_ST1_SW_SQ_TOP]",
	S2_EGR_VC_ZOCVD_ST1_TOP_BY_DI as "[Description] [S2_EGR_VC_ZOCVD_ST1_TOP_BY_DI]",
	S2_EGR_VC_ZOCVD_ST2_FLT as "[Description] [S2_EGR_VC_ZOCVD_ST2_FLT]",
	S2_EGR_VC_ZOCVD_ST2_IM_MSR as "[Description] [S2_EGR_VC_ZOCVD_ST2_IM_MSR]",
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_CF as "[Description] [S2_EGR_VC_ZOCVD_ST2_OTHER_IM_CF]",
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_MSR as "[Description] [S2_EGR_VC_ZOCVD_ST2_OTHER_IM_MSR]",
	S2_EGR_VC_ZOCVD_ST2_OTHER_IM_RDY as "[Description] [S2_EGR_VC_ZOCVD_ST2_OTHER_IM_RDY]",
	S2_EGR_VC_ZOCVD_ST2_RDY as "[Description] [S2_EGR_VC_ZOCVD_ST2_RDY]",
	S2_EGR_VC_ZOCVD_YG as "[Description] [S2_EGR_VC_ZOCVD_YG]",
	S2_EGW_G_SMCVD_FLT_YRST as "[Description] [S2_EGW_G_SMCVD_FLT_YRST]",
	S2_EGW_VC_SMCVD_SP as "[Description] [S2_EGW_VC_SMCVD_SP]",
	S2_EGW_VC_SMCVD_SP_APL as "[Description] [S2_EGW_VC_SMCVD_SP_APL]",
	S2_EGW_VC_SMCVD_YAUTO as "[Description] [S2_EGW_VC_SMCVD_YAUTO]",
	S2_EGW_VC_SMCVD_YMAN as "[Description] [S2_EGW_VC_SMCVD_YMAN]",
	S2_EGW_VC_ZOCVD_SP as "[Description] [S2_EGW_VC_ZOCVD_SP]",
	S2_EGW_VC_ZOCVD_SP_APL as "[Description] [S2_EGW_VC_ZOCVD_SP_APL]",
	S2_EGW_VC_ZOCVD_YMAN as "[Description] [S2_EGW_VC_ZOCVD_YMAN]",
	S2_EGW_VC_ZOCVD_YOFF as "[Description] [S2_EGW_VC_ZOCVD_YOFF]",
	S2_EGW_VC_ZOCVD_YON as "[Description] [S2_EGW_VC_ZOCVD_YON]",
	S2_EGW_VC_ZOCVD_YRST as "[Description] [S2_EGW_VC_ZOCVD_YRST]",
	S2_EGOPER_G_SMCND_FLT_YRST as "[Description] [S2_EGOPER_G_SMCND_FLT_YRST]",
	S2_EGOPER_VC_SMCND_SP_APL as "[Description] (OPER) [S2_EGOPER_VC_SMCND_SP_APL]",
	S2_EGOPER_VC_SMCND_YAUTO as "[Description] (OPER) [S2_EGOPER_VC_SMCND_YAUTO]",
	S2_EGOPER_VC_SMCND_YMAN as "[Description] (OPER) [S2_EGOPER_VC_SMCND_YMAN]",
	S2_EGOPER_VC_ZOCND_SP_APL as "[Description] (OPER) [S2_EGOPER_VC_ZOCND_SP_APL]",
	S2_EGOPER_VC_ZOCND_YMAN as "[Description] (OPER) [S2_EGOPER_VC_ZOCND_YMAN]",
	S2_EGOPER_VC_ZOCND_YOFF as "[Description] (OPER) [S2_EGOPER_VC_ZOCND_YOFF]",
	S2_EGOPER_VC_ZOCND_YON as "[Description] (OPER) [S2_EGOPER_VC_ZOCND_YON]",
	S2_EGOPER_VC_ZOCND_YRST as "[Description] (OPER) [S2_EGOPER_VC_ZOCND_YRST]",
	S2_EGR_COND8_ACT as "[Description] [S2_EGR_COND8_ACT]",
	S2_EGR_F_CND_TG as "[Description] [S2_EGR_F_CND_TG]",
	S2_EGR_G_SMCND as "[Description] [S2_EGR_G_SMCND]",
	S2_EGR_G_SMCND_FLT as "[Description] [S2_EGR_G_SMCND_FLT]",
	S2_EGR_G_ZOCND as "[Description] [S2_EGR_G_ZOCND]",
	S2_EGR_I_ZOCND as "[Description] [S2_EGR_I_ZOCND]",
	S2_EGR_MSG_C_13 as "[Description] [S2_EGR_MSG_C_13]",
	S2_EGR_MSG_D_11 as "[Description] [S2_EGR_MSG_D_11]",
	S2_EGR_VC_DRCND_FLT as "[Description] [S2_EGR_VC_DRCND_FLT]",
	S2_EGR_VC_SMCND_ST_BL as "[Description] [S2_EGR_VC_SMCND_ST_BL]",
	S2_EGR_VC_SMCND_ST_CLS as "[Description] [S2_EGR_VC_SMCND_ST_CLS]",
	S2_EGR_VC_SMCND_ST_EN_SM_AUTO as "[Description] [S2_EGR_VC_SMCND_ST_EN_SM_AUTO]",
	S2_EGR_VC_SMCND_ST_EN_SM_MAN as "[Description] [S2_EGR_VC_SMCND_ST_EN_SM_MAN]",
	S2_EGR_VC_SMCND_ST_EN_ZO_MAN as "[Description] [S2_EGR_VC_SMCND_ST_EN_ZO_MAN]",
	S2_EGR_VC_SMCND_ST_OPN as "[Description] [S2_EGR_VC_SMCND_ST_OPN]",
	S2_EGR_VC_SMCND_ST_POS_REACH as "[Description] [S2_EGR_VC_SMCND_ST_POS_REACH]",
	S2_EGR_VC_SMCND_ST_RDY as "[Description] [S2_EGR_VC_SMCND_ST_RDY]",
	S2_EGR_VC_SMCND_ST_SM_AUTO as "[Description] [S2_EGR_VC_SMCND_ST_SM_AUTO]",
	S2_EGR_VC_SMCND_ST_SM_MAN as "[Description] [S2_EGR_VC_SMCND_ST_SM_MAN]",
	S2_EGR_VC_SMCND_ST_ZO_MAN as "[Description] [S2_EGR_VC_SMCND_ST_ZO_MAN]",
	S2_EGR_VC_SMCND_YG as "[Description] [S2_EGR_VC_SMCND_YG]",
	S2_EGR_VC_ZOCND_CDF as "[Description] [S2_EGR_VC_ZOCND_CDF]",
	S2_EGR_VC_ZOCND_ST1_AI_CH_CTRL as "[Description] [S2_EGR_VC_ZOCND_ST1_AI_CH_CTRL]",
	S2_EGR_VC_ZOCND_ST1_BOT_BY_DI as "[Description] [S2_EGR_VC_ZOCND_ST1_BOT_BY_DI]",
	S2_EGR_VC_ZOCND_ST1_DR_CF as "[Description] [S2_EGR_VC_ZOCND_ST1_DR_CF]",
	S2_EGR_VC_ZOCND_ST1_DR_ENABLED as "[Description] [S2_EGR_VC_ZOCND_ST1_DR_ENABLED]",
	S2_EGR_VC_ZOCND_ST1_DR_HEALTH as "[Description] [S2_EGR_VC_ZOCND_ST1_DR_HEALTH]",
	S2_EGR_VC_ZOCND_ST1_DR_RUN as "[Description] [S2_EGR_VC_ZOCND_ST1_DR_RUN]",
	S2_EGR_VC_ZOCND_ST1_ENC_HEALTH as "[Description] [S2_EGR_VC_ZOCND_ST1_ENC_HEALTH]",
	S2_EGR_VC_ZOCND_ST1_HANDLE_MODE as "[Description] [S2_EGR_VC_ZOCND_ST1_HANDLE_MODE]",
	S2_EGR_VC_ZOCND_ST1_HW_SQ_BOT as "[Description] [S2_EGR_VC_ZOCND_ST1_HW_SQ_BOT]",
	S2_EGR_VC_ZOCND_ST1_HW_SQ_TOP as "[Description] [S2_EGR_VC_ZOCND_ST1_HW_SQ_TOP]",
	S2_EGR_VC_ZOCND_ST1_POS_REACH as "[Description] [S2_EGR_VC_ZOCND_ST1_POS_REACH]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_BOT as "[Description] [S2_EGR_VC_ZOCND_ST1_SW_SQ_BOT]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_BOT as "[Description] [S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_BOT]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_TOP as "[Description] [S2_EGR_VC_ZOCND_ST1_SW_SQ_SL_TOP]",
	S2_EGR_VC_ZOCND_ST1_SW_SQ_TOP as "[Description] [S2_EGR_VC_ZOCND_ST1_SW_SQ_TOP]",
	S2_EGR_VC_ZOCND_ST1_TOP_BY_DI as "[Description] [S2_EGR_VC_ZOCND_ST1_TOP_BY_DI]",
	S2_EGR_VC_ZOCND_ST2_FLT as "[Description] [S2_EGR_VC_ZOCND_ST2_FLT]",
	S2_EGR_VC_ZOCND_ST2_IM_MSR as "[Description] [S2_EGR_VC_ZOCND_ST2_IM_MSR]",
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_CF as "[Description] [S2_EGR_VC_ZOCND_ST2_OTHER_IM_CF]",
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_MSR as "[Description] [S2_EGR_VC_ZOCND_ST2_OTHER_IM_MSR]",
	S2_EGR_VC_ZOCND_ST2_OTHER_IM_RDY as "[Description] [S2_EGR_VC_ZOCND_ST2_OTHER_IM_RDY]",
	S2_EGR_VC_ZOCND_ST2_RDY as "[Description] [S2_EGR_VC_ZOCND_ST2_RDY]",
	S2_EGR_VC_ZOCND_YG as "[Description] [S2_EGR_VC_ZOCND_YG]",
	S2_EGW_G_SMCND_FLT_YRST as "[Description] [S2_EGW_G_SMCND_FLT_YRST]",
	S2_EGW_VC_SMCND_SP as "[Description] [S2_EGW_VC_SMCND_SP]",
	S2_EGW_VC_SMCND_SP_APL as "[Description] [S2_EGW_VC_SMCND_SP_APL]",
	S2_EGW_VC_SMCND_YAUTO as "[Description] [S2_EGW_VC_SMCND_YAUTO]",
	S2_EGW_VC_SMCND_YMAN as "[Description] [S2_EGW_VC_SMCND_YMAN]",
	S2_EGW_VC_ZOCND_SP as "[Description] [S2_EGW_VC_ZOCND_SP]",
	S2_EGW_VC_ZOCND_SP_APL as "[Description] [S2_EGW_VC_ZOCND_SP_APL]",
	S2_EGW_VC_ZOCND_YMAN as "[Description] [S2_EGW_VC_ZOCND_YMAN]",
	S2_EGW_VC_ZOCND_YOFF as "[Description] [S2_EGW_VC_ZOCND_YOFF]",
	S2_EGW_VC_ZOCND_YON as "[Description] [S2_EGW_VC_ZOCND_YON]",
	S2_EGW_VC_ZOCND_YRST as "[Description] [S2_EGW_VC_ZOCND_YRST]"
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