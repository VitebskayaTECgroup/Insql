{минутные срезы}
/*ReportName=Положение двери шкафа контроллера (минутные срезы)*/
/*Mode=минутные*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	S2_DP_1002 as "№1[S2_DP_1002][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	S2_BK2_SQ1 as "№2.1[S2_BK2_SQ1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	S2_BK2_SQ2 as "№2.2[S2_BK2_SQ2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	S2_BK3_SQ1 as "№3.1[S2_BK3_SQ1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	S2_BK3_SQ2 as "№3.2[S2_BK3_SQ2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	S2_BK4_SQ1 as "№4.1[S2_BK4_SQ1][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]",
	S2_BK4_SQ2 as "№4.2[S2_BK4_SQ2][CHECK:2,2,0,0][CLASS:,,ALARM_TD_N_CC,,]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	S2_DP_1002, S2_BK2_SQ1, S2_BK2_SQ2, S2_BK3_SQ1, S2_BK3_SQ2, S2_BK4_SQ1, S2_BK4_SQ2 
	FROM Runtime.dbo.DiscreteWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")