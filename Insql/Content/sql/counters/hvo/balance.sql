{минутные срезы}
/*ReportName="Баланс Забор-сброс" (минутные срезы)*/
/*Mode=минутные*/
/*UpQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(u03_VR11F001*u03_SY00A700 as decimal(15,2)) as "G реч. воды л. №1 нов, м3/ч [Hint: u03_VR11F001]",
	CAST(H03_VR11F001*H03_SY00A700 as decimal(15,2)) as "G реч. воды л. №2 за п/ч, т/ч [Hint: H03_VR11F001]",
	CAST(H03_VR12F001*H03_SY00A700 as decimal(15,2)) as "G реч. воды л. №3 за п/ч, т/ч [Hint: H03_VR12F001]",

	CAST((isnull(u03_VR11F001*U03_SY00A700,0) + isnull(H03_VR11F001*H03_SY00A700,0) + isnull(H03_VR12F001*H03_SY00A700,0)) as decimal(15,2)) as "Сумма реч.воды за п/ч, т/ч [Hint: Суммарная масса речной воды по линии 1,2,3]",
	
	CAST((isnull(U01_UN11F001,0) + isnull(U02_UN11F001,0) + isnull(U02_UN12F001,0)) - (isnull(U01_UN21F001,0) + isnull(U02_UN21F001,0) + isnull(U03_UN21F001,0)) as decimal(15,2)) as "G не возврат конд, тонн [Hint: Не возврат конденсата от потребителей (3=1-2)]",
	
	CAST(U04_UM41F001*U04_SY00A700 as decimal(15,2)) as "G Подп. ТС за п/ч, т/ч [Hint: U04_UM41F001]",
	
	CAST(H01_VS21F001*H01_SY00A700 as decimal(15,2)) as "Q сброс вод за п/ч, м3/ч [Hint: H01_VS21F001]",

	CAST(isnull(u03_VR11F001*U03_SY00A700,0) + isnull(H03_VR11F001*H03_SY00A700,0) + isnull(H03_VR12F001*H03_SY00A700,0)
		- ((isnull(U01_UN11F001,0) + isnull(U02_UN11F001,0) + isnull(U02_UN12F001,0)) - (isnull(U01_UN21F001,0) + isnull(U02_UN21F001,0) + isnull(U03_UN21F001,0)))
		- (isnull(U04_UM41F001*U04_SY00A700,0)) as decimal(15, 2))
		/*(
			(isnull(u03_VR11F001,0)+isnull(H03_VR11F001,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001,0)*isnull(H03_SY00A700,0))-
			((isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0))-(isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0)))-
			((isnull(U04_UM41F001,0)*isnull(U04_SY00A700,0))*0.928)
		)*/
		/* Расчетный сброс рассчитывается как:
		суммарная масса речной воды (столбец 5) 
		минус не возврат конденсата от потребителей (столбец 6)
		минус объем подпитки ПС (столбец 7) */
		as "Расчетный сброс, т/ч [Hint: Расчетный сброс]",

	CAST(
		(isnull(H01_VS21F001*H01_SY00A700, 0)) - 
		(
			(isnull(u03_VR11F001,0)+isnull(H03_VR11F001,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001,0)*isnull(H03_SY00A700,0))-
			((isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0))-(isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0)))-
			((isnull(U04_UM41F001,0)*isnull(U04_SY00A700,0))*0.928)
		)
		as decimal(15,2)) as "Небаланс, т/ч [Hint: Не баланс по сбросной воде]",
	CAST(
		/* dbo.vst_SafeDIV(
			(
				isnull(H03_VR11F001*H03_SY00A700,0)+
				isnull(H03_VR12F001*H03_SY00A700,0)+
				isnull(u03_VR11F001*u03_SY00A700,0)-
				0.7*isnull(H01_VA21F001*H01_SY00A700,0)-
				isnull(H01_VS21F001*H01_SY00A700,0)-
				isnull(U04_UM41F001*U04_SY00A700,0)
			),(
				isnull(H03_VR11F001*H03_SY00A700,0)+
				isnull(H03_VR12F001*H03_SY00A700,0)+
				isnull(u03_VR11F001*u03_SY00A700,0)-
				0.7*isnull(H01_VA21F001*H01_SY00A700,0)-
				isnull(U04_UM41F001*U04_SY00A700,0)
			) 
		)*100 */
		dbo.vst_SafeDIV(
			(
				(isnull(H01_VS21F001,0) * isnull(H01_SY00A700,0)) - 
				(
					(isnull(u03_VR11F001,0) * isnull(U03_SY00A700,0) + isnull(H03_VR11F001,0) * isnull(H03_SY00A700,0) + isnull(H03_VR12F001,0) * isnull(H03_SY00A700,0)) -
					((isnull(U01_UN11F001,0) + isnull(U02_UN11F001,0) + isnull(U02_UN12F001,0)) - (isnull(U01_UN21F001,0) + isnull(U02_UN21F001,0) + isnull(U03_UN21F001,0))) -
					((isnull(U04_UM41F001,0) * isnull(U04_SY00A700,0)) * 0.928)
				)
			)
			,
			(
				(
					(isnull(u03_VR11F001,0)+isnull(H03_VR11F001,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001,0)*isnull(H03_SY00A700,0))-
					((isnull(U01_UN11F001,0)+isnull(U02_UN11F001,0)+isnull(U02_UN12F001,0))-(isnull(U01_UN21F001,0)+isnull(U02_UN21F001,0)+isnull(U03_UN21F001,0)))-
					((isnull(U04_UM41F001,0)*isnull(U04_SY00A700,0))*0.928)
				)
				/
				100
			)
		)
		/* Небаланс в процентах рассчитывается как:
		отношение небаланса (столбец 9) к фактическому объему сброса воды (столбец 8)
		где фактический объем принимается за 100% */
	as decimal(15,2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, U01_UN11F001, U02_UN11F001, U02_UN12F001, U01_UN21F001, U02_UN21F001, U03_UN21F001,H03_VR11F001, H03_VR12F001, H01_VA21F001, U04_UM41F001, H01_VS21F001, u03_VR11F001, U03_SY00A700, H01_SY00A700, H03_SY00A700, U04_SY00A700
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы}
/*ReportName="Баланс Забор-сброс" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="минутные срезы"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(isnull(u03_VR11F001_H1,0) as decimal(15,2)) as "G реч.воды л.№1нов, м3/ч [u03_VR11F001_H1]",
	CAST(isnull(H03_VR11F001_H1,0) as decimal(15,2)) as "G реч. воды л. №2 за п/ч, т/ч [H03_VR11F001_H1]",
	CAST(isnull(H03_VR12F001_H1,0) as decimal(15,2)) as "G реч. воды л. №3 за п/ч, т/ч [H03_VR12F001_H1]",
	CAST(isnull(H03_VR11F001_H1,0)+isnull(H03_VR12F001_H1,0)+isnull(u03_VR11F001_H1,0) as decimal(15,2)) as "Сумма реч.воды за п/ч, т/ч [Hint: Суммарная масса речной воды по линии 1,2,3]",
	CAST(
	(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- 
	(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)) as decimal(15,2)) as "G не возврат конд, тонн",
	CAST(isnull(U04_UM41F001_H1,0) as decimal(15,2)) as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
	CAST(isnull(H01_VS21F001_H1,0) as decimal(15,2)) as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_H1]",
	CAST(
	(
		(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
		((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
		((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
		)
	as decimal(15,2)) as "Расчетный сброс, т/ч [Hint: Расчетный сброс]",
	CAST ((
		isnull(H01_VS21F001_H1,0) -
		(
			(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
			((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
			((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
		)) 
		as decimal(15, 2)
	) as "Небаланс, т/ч [Hint: Не баланс по сбросной воде]",
	CAST (
	dbo.vst_SafeDIV(
		(
			(isnull(H01_VS21F001_H1,0) -
			(
				(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
				((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
				((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
			))
		)
		,
		(
			(
				(
					(dbo.Zero
					(                                    
						isnull(u03_VR11F001_H1,0)
						+isnull(H03_VR11F001_H1,0)
						+isnull(H03_SY00A700,0)
						+isnull(H03_VR12F001_H1,0)
						+isnull(H03_SY00A700,0)
						-isnull(U01_UN11F001_H1,0)
						+isnull(U02_UN11F001_H1,0)
						+isnull(U02_UN12F001_H1,0)
						-isnull(U01_UN21F001_H1,0)
						+isnull(U02_UN21F001_H1,0)
						+isnull(U03_UN21F001_H1,0)
						-isnull(U04_UM41F001_H1,0)
					)
					*0.928)
				)
			)
			/ 100
		)
	)
	as decimal(15,2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, U01_UN11F001_H1, U02_UN11F001_H1, 
	u03_VR11F001_H1, U03_SY00A700, H03_VR11F001_H1, H03_SY00A700,H03_VR12F001_H1,H03_SY00A700,U01_UN11F001_H1,U02_UN11F001_H1,U02_UN12F001_H1,U01_UN21F001_H1,U02_UN21F001_H1,U03_UN21F001_H1,U04_UM41F001_H1,U04_SY00A700,
	U02_UN12F001_H1,U01_UN21F001_H1,U02_UN21F001_H1,U03_UN21F001_H1,H03_VR11F001_H1, H03_VR12F001_H1, H01_VA21F001_H1, U04_UM41F001_H1, H01_VS21F001_H1, u03_VR11F001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{суточные срезы}
/*ReportName="Баланс Забор-сброс" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(u03_VR11F001_s1 as decimal(15,2)) as "G реч.воды л.№1нов,м3/ч [u03_VR11F001_s1]",
	CAST(H03_VR11F001_S1 as decimal(15,2)) as "G реч. воды л. №2 за п/ч, т/ч [H03_VR11F001_S1]",
	CAST(H03_VR12F001_S1 as decimal(15,2)) as "G реч. воды л. №3 за п/ч, т/ч [H03_VR12F001_S1]",
	CAST(H03_VR11F001_S1+H03_VR12F001_S1+u03_VR11F001_s1 as decimal(15,2)) as "Сумма реч. воды за п/ч, т/ч [Hint: Суммарная масса речной воды по линии 1,2 и 3]",
	CAST(
	(isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0))- 
	(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0))
	as decimal(15,2)) as "G не возврат конд, тонн",
	CAST(U04_UM41F001_S1 as decimal(15,2)) as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_S1]",
	CAST(H01_VS21F001_S1 as decimal(15,2)) as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_S1]",
	CAST(
	(
		(isnull(u03_VR11F001_S1,0)+isnull(H03_VR11F001_S1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_S1,0)*isnull(H03_SY00A700,0))-
		((isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0))-(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0)))-
		((isnull(U04_UM41F001_S1,0)*isnull(U04_SY00A700,0))*0.928)
		)
	as decimal(15,2)) as "Расчетный сброс, т/ч [Hint: Расчетный сброс]",
	CAST(
		(
			H01_VS21F001_S1 -
			(
				(isnull(u03_VR11F001_S1,0)+isnull(H03_VR11F001_S1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_S1,0)*isnull(H03_SY00A700,0))-
				((isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0))-(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0)))-
				((isnull(U04_UM41F001_S1,0)*isnull(U04_SY00A700,0))*0.928)
			)
		) 
		as decimal(15,2)
	)as "Небаланс, т/ч [Hint: Не баланс по сбросной воде]",
	/* 
	По запросу Шуляковской 03.12.2018
	CAST(H03_VR11F001_S1+H03_VR12F001_S1+u03_VR11F001_s1-0.7*H01_VA21F001_S1-H01_VS21F001_S1-U04_UM41F001_S1 as decimal(15,2)) as "Небаланс, т/ч [Hint: Не баланс по сбросной воде]",
	*/
	/* CAST(
	dbo.vst_SafeDIV(  
				(H03_VR11F001_S1+H03_VR12F001_S1+u03_VR11F001_s1-0.7*H01_VA21F001_S1-H01_VS21F001_S1-U04_UM41F001_S1
				),(
				H03_VR11F001_S1+H03_VR12F001_S1+u03_VR11F001_s1-0.7*H01_VA21F001_S1-U04_UM41F001_S1
					)
				)*100 as decimal(15,2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]" */
	CAST (
		dbo.vst_SafeDIV(
			(
				(H01_VS21F001_S1 -
				(
					(isnull(u03_VR11F001_S1,0)+isnull(H03_VR11F001_S1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_S1,0)*isnull(H03_SY00A700,0))-
					((isnull(U01_UN11F001_S1,0)+isnull(U02_UN11F001_S1,0)+isnull(U02_UN12F001_S1,0))-(isnull(U01_UN21F001_S1,0)+isnull(U02_UN21F001_S1,0)+isnull(U03_UN21F001_S1,0)))-
					((isnull(U04_UM41F001_S1,0)*isnull(U04_SY00A700,0))*0.928)
				)) 
			)
			,
			(
				(
					(
						(dbo.Zero
						(
							isnull(u03_VR11F001_S1,0)
							+isnull(H03_VR11F001_S1,0)
							+isnull(H03_VR12F001_S1,0)
							-isnull(U01_UN11F001_S1,0)
							+isnull(U02_UN11F001_S1,0)
							+isnull(U02_UN12F001_S1,0)
							-isnull(U01_UN21F001_S1,0)
							+isnull(U02_UN21F001_S1,0)
							+isnull(U03_UN21F001_S1,0)
							-isnull(U04_UM41F001_S1,0)
						)
						*0.928)
					)
				)
				/100
			)
		) 
	as decimal(15, 2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	U01_UN11F001_S1,U02_UN11F001_S1,U02_UN12F001_S1,U01_UN21F001_S1,U02_UN21F001_S1,U03_UN21F001_S1,
	u03_VR11F001_S1,U03_SY00A700,H03_VR11F001_S1,H03_SY00A700,H03_VR12F001_S1,H03_SY00A700,U01_UN11F001_S1,
	U02_UN11F001_S1,U02_UN12F001_S1,U01_UN21F001_S1,U02_UN21F001_S1,U03_UN21F001_S1,U04_UM41F001_S1,U04_SY00A700,
	H03_VR11F001_S1, H03_VR12F001_S1, H01_VA21F001_S1, U04_UM41F001_S1, H01_VS21F001_S1, u03_VR11F001_s1
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{часовые срезы по сменам 8/12}
/*ReportName="Баланс Забор-сброс" (часовые срезы по сменам 8/12)*/
/*Mode=8-12*/
/*DownQuery="минутные срезы"*/
/*UpQuery="посменный"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CHAR(192+isnull(CLC_ShiftDuty,0)) as "Cме- на [CLC_ShiftDuty]",
	CAST(u03_VR11F001_h1 as decimal(15,2)) as "G реч.воды л.№1нов,м3/ч [u03_VR11F001_sh1]",
	CAST(H03_VR11F001_H1 as decimal(15,2)) as "G реч. воды л. №2 за п/ч, т/ч [H03_VR11F001_H1]",
	CAST(H03_VR12F001_H1 as decimal(15,2)) as "G реч. воды л. №3 за п/ч, т/ч [H03_VR12F001_H1]",
	CAST(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1 as decimal(15,2)) as "Сумма реч.воды за п/ч, т/ч [Hint: Суммарная масса речной воды по линии 1,2,3]",
	CAST(
	(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- 
	(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0))
	as decimal(15,2)) as "G не возврат конд, тонн",
	CAST(U04_UM41F001_H1 as decimal(15,2)) as "G Подп.ТС за п/ч, т/ч [U04_UM41F001_H1]",
	CAST(H01_VS21F001_H1 as decimal(15,2)) as "Q сброс вод за п/ч, м3/ч [H01_VS21F001_H1]",
	CAST(
	(
		(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
		((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
		((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
		)
	as decimal(15,2)) as "Расчетный сброс, т/ч [Hint: Расчетный сброс]",
	CAST (
		(
			H01_VS21F001_H1 - 
			(
				(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
				((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
				((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
			) 
		) 
		as decimal(15,2)
	) as "Небаланс, т/ч [Hint: Не баланс по сбросной воде]",
	/*
	По запросу Шуляковской 03.12.2018
	CAST(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-H01_VS21F001_H1-U04_UM41F001_H1 as decimal(15,2)) as "Небаланс, т/ч [Hint: Не баланс по сбросной воде]",
	*/
	CAST(dbo.vst_SafeDIV((H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-H01_VS21F001_H1-U04_UM41F001_H1),(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-U04_UM41F001_H1))*100 as decimal(15,2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	u03_VR11F001_H1, U03_SY00A700, H03_VR11F001_H1, H03_SY00A700,H03_VR12F001_H1,H03_SY00A700,U01_UN11F001_H1,U02_UN11F001_H1,U02_UN12F001_H1,U01_UN21F001_H1,U02_UN21F001_H1,U03_UN21F001_H1,U04_UM41F001_H1,U04_SY00A700,
	H03_VR11F001_H1, H03_VR12F001_H1, CLC_ShiftDuty, H01_VA21F001_H1, U04_UM41F001_H1, H01_VS21F001_H1, u03_VR11F001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{посменный}
/*ReportName="Баланс Забор-сброс"(агрегированные часовые данные по сменам)*/
/*Mode=посменный*/
/*DownQuery="часовые срезы по сменам 8/12"*/
/*UpQuery="смены за месяц"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(hh, 20, Convert(DateTime, Round(Convert(float, DateAdd(mi, -500, Max(DateTime))) * 2, 0, 1) / 2)) as 'DateMarker',
	DateAdd(mi,480,Convert(DateTime,Round(Convert(float,DateAdd(mi,-500,DateTime))*2,0,1)/2)) as 'Дата',  
	null, 
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(MIN(DateTime))) as "Cмена [CLC_ShiftDuty]", 
	CAST(sum(u03_VR11F001_H1) as decimal(15,2)) as "G реч.воды л.№1нов, м3/см [u03_VR11F001_H1]",
	CAST(sum(H03_VR11F001_H1) as decimal(15,2)) as "G реч. воды л. №2 за смену, т/см [H03_VR11F001_H1]",
	CAST(sum(H03_VR12F001_H1) as decimal(15,2)) as "G реч. воды л. №3 за смену, т/см [H03_VR12F001_H1]",
	CAST(sum(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1) as decimal(15,2)) as "Сумма реч.воды за смену, т/см [Hint: Суммарная масса речной воды по линии 1,2,3]",
	CAST(sum(
	(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- 
	(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0))
	) as decimal(15,2)) as "G не возврат конд, тонн",
	CAST(sum(U04_UM41F001_H1) as decimal(15,2)) as "G Подп.ТС за смену, т/см [U04_UM41F001_H1]",
	CAST(sum(H01_VS21F001_H1) as decimal(15,2)) as "Q сброс вод за смену, м3/см [H01_VS21F001_H1]",
	CAST(
	sum(
	(
		(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
		((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
		((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
		)
	) as decimal(15,2)) as "Расчетный сброс, т/см [Hint: Расчетный сброс]",
	CAST (
		(
			sum(H01_VS21F001_H1) - (
				sum((
					(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
					((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
					((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
				)) 
			)
		)
		as decimal(15, 2)
	) as "Небаланс, т/см [Hint: Не баланс по сбросной воде]",
	/* 
	По запросу Шуляковской 03.12.2018
	CAST(sum(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-H01_VS21F001_H1-U04_UM41F001_H1) as decimal(15,2)) as "Небаланс, т/см [Hint: Не баланс по сбросной воде]",
	*/
	CAST(avg(dbo.vst_SafeDIV((H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-H01_VS21F001_H1-U04_UM41F001_H1),(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-U04_UM41F001_H1)))*100 as decimal(15,2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	u03_VR11F001_H1, U03_SY00A700, H03_VR11F001_H1, H03_SY00A700,H03_VR12F001_H1,H03_SY00A700,U01_UN11F001_H1,U02_UN11F001_H1,U02_UN12F001_H1,U01_UN21F001_H1,U02_UN21F001_H1,U03_UN21F001_H1,U04_UM41F001_H1,U04_SY00A700,
	U01_UN11F001_H1,U02_UN11F001_H1,U02_UN12F001_H1,U01_UN21F001_H1,U02_UN21F001_H1,U03_UN21F001_H1,
	H03_VR11F001_H1, H03_VR12F001_H1, CLC_ShiftDuty, H01_VA21F001_H1, U04_UM41F001_H1, H01_VS21F001_H1, u03_VR11F001_H1
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


{смены за месяц}
/*ReportName="Баланс Забор-сброс" (агрегированные по сменам за месяц)*/
/*Mode=смены за месяц*/
/*DownQuery="посменный"*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
SET LANGUAGE 'Russian'
SELECT
	'02' + Right(Convert(char(10), MIN(DateTime), 104), 8) as 'DateMarker',
	DateName(mm,MIN(DateTime))+' '+DateName(yyyy,MIN(DateTime))  as 'Дата',
	null,
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime)) as "Cмена [CLC_ShiftDuty]", 
	Count(*) as "Час [Время, отработанное сменой за месяц, час]",
	CAST(sum(u03_VR11F001_H1) as decimal(15,2)) as "G реч.воды л.№1нов, м3/ч [u03_VR11F001_H1]",
	CAST(sum(H03_VR11F001_H1) as decimal(15,2)) as "G реч. воды л. №2 сум, т/см [H03_VR11F001_H1]",
	CAST(sum(H03_VR12F001_H1) as decimal(15,2)) as "G реч. воды л. №3 сум, т/см [H03_VR12F001_H1]",
	CAST(sum(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1) as decimal(15,2)) as "Сумма реч.воды сум, т/см [Hint: Суммарная масса речной воды по линии 1,2,3]",
	CAST(sum(
	(isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))- 
	(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0))
	) as decimal(15,2)) as "G не возврат конд, тонн",
	CAST(sum(U04_UM41F001_H1) as decimal(15,2)) as "G Подп.ТС сум, т/см [U04_UM41F001_H1]",
	CAST(sum(H01_VS21F001_H1) as decimal(15,2)) as "Q сброс вод сум, м3/см [H01_VS21F001_H1]",
	CAST(
	sum(
	(
		(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
		((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
		((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
		)
	) 
	as decimal(15,2)) as "Расчетный сброс сум, т/см [Hint: Расчетный сброс]",
	CAST(
		(
			sum(H01_VS21F001_H1) - (
				sum((
					(isnull(u03_VR11F001_H1,0)+isnull(H03_VR11F001_H1,0)*isnull(H03_SY00A700,0)+isnull(H03_VR12F001_H1,0)*isnull(H03_SY00A700,0))-
					((isnull(U01_UN11F001_H1,0)+isnull(U02_UN11F001_H1,0)+isnull(U02_UN12F001_H1,0))-(isnull(U01_UN21F001_H1,0)+isnull(U02_UN21F001_H1,0)+isnull(U03_UN21F001_H1,0)))-
					((isnull(U04_UM41F001_H1,0)*isnull(U04_SY00A700,0))*0.928)
				)) 
			)
		)
		as decimal(15, 2)
	) as "Небаланс сум, т/см [Hint: Не баланс по сбросной воде]",
	/* 
	По запросу Шуляковской 03.12.2018
	CAST(sum(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-H01_VS21F001_H1-U04_UM41F001_H1) as decimal(15,2)) as "Небаланс сум, т/см [Hint: Не баланс по сбросной воде]",
	*/
	CAST(avg(dbo.vst_SafeDIV((H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-H01_VS21F001_H1-U04_UM41F001_H1),(H03_VR11F001_H1+H03_VR12F001_H1+u03_VR11F001_H1-0.7*H01_VA21F001_H1-U04_UM41F001_H1)))*100 as decimal(15,2)) as "Небаланс, % [Hint: Не баланс по сбросной воде в процентах]"
FROM
	OpenQuery(INSQL, 
	"SELECT DateTime, 
	u03_VR11F001_H1, U03_SY00A700, H03_VR11F001_H1, H03_SY00A700,H03_VR12F001_H1,H03_SY00A700,U01_UN11F001_H1,U02_UN11F001_H1,U02_UN12F001_H1,U01_UN21F001_H1,U02_UN21F001_H1,U03_UN21F001_H1,U04_UM41F001_H1,U04_SY00A700,
	H03_VR11F001_H1, H03_VR12F001_H1, CLC_ShiftDuty, H01_VA21F001_H1, U04_UM41F001_H1, H01_VS21F001_H1, u03_VR11F001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
ORDER BY
	CHAR(192+Runtime.dbo.vst_GetShiftNumber(DateTime))
