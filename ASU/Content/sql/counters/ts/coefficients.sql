{суточные срезы}
/*ReportName="ТС - Коэффициенты погрешностей для расчета небаланса (ввод данных)" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
select
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	maxnb as "Max небаланс, [hint: максимально возможный небаланс]",
	isnull(U04_UM11F401,0) as "Погрешность <br>'Центральная'<br>Масса ПСВ<br>за прош.<br>сутки<br>(%) [Edit:m1|U04_UM11F401]",
	isnull(U04_UM21F401,0) as "Погрешность <br>'Центральная'<br>Масса ОСВ<br>за прош.<br>час<br>(%) [Edit:m1|U04_UM21F401]",
	isnull(U04_UM41F401,0) as "Погрешность <br>'Центральная'<br>Масса<br>подпитки за прош.<br>час<br>(%) [Edit:m1|U04_UM41F401]",
	isnull(U05_UM11F401,0) as "Погрешность <br>'Западная'<br>Масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U05_UM11F401]",
	isnull(U05_UM21F401,0) as "Погрешность <br>'Западная'<br>Масса<br>ОСВ за прош.<br>час<br>(%) [Edit:m1|U05_UM21F401]",
	isnull(U07_UM11F401,0) as "Погрешность <br>'Монолит'<br>Масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U07_UM11F401]",
	isnull(U07_UM21F401,0) as "Погрешность <br>'Монолит'<br>Масса<br>ОСВ за прош.<br>час<br>(%) [Edit:m1|U07_UM21F401]",
	isnull(U08_UM11F401,0) as "Погрешность <br>'Лучеса'<br>Масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U08_UM11F401]",
	isnull(U08_UM21F401,0) as "Погрешность <br>'Лучеса'<br>Масса<br>ОСВ за прош.<br>час<br>(%) [Edit:m1|U08_UM21F401]",
	isnull(U06_UM11F401,0) as "Погрешность <br>'ДОК'<br>масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U06_UM11F401]",
	isnull(U06_UM21F401,0) as "Погрешность <br>'ДОК'<br>Масса<br>ОСВ № 1 за прош.<br>час<br>(%) [Edit:m1|U06_UM21F401]",
	isnull(U06_UM22F401,0) as "Погрешность <br>'ДОК'<br>Масса<br>ОСВ № 2 за прош.<br>час<br>(%)  [Edit:m1|U06_UM22F401]"
	from ( select
		/**/t.*,
		cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrPr,
		cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrObr,
		cast(U04_UM41F001_s1-cast(koefNb*U04_UM41F001_S1*U04_UM41F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrPodp,
		cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as ZkorrPr,
		cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) as ZkorrObr,
		cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as MkorrPr,
		cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as MkorrObr,
		cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0)) as LkorrPr,
		cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as LkorrObr,
		cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrPr,
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr1,
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr2,
		/**/
		cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
		cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
		cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
		cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))+
		cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))
		as SummPodd,
		/**/
		cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
		cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
		cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
		cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))
		as SummObr,
		/*подпитки скорректированные*/
		cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)) As CPodpKorr,
		cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) As ZPodpKorr,
		cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) As MPodpKorr,
		cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) As LPodpKorr,
		cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)) As DPodpKorr,
		/*мподп скорректировн, определяем как сумму всех подпиток(тогда все сходится), можно посчитать по формулам (CkorPodp) но тогда надо увеличить точность вычислений */
		cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
		cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) +
		cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) +
		cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) +
		cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))
		as SumPodpKorr,
		/*энтальпии прямой*/
		/*может понадобится заменить U04_UM11T002_S1 на U04_UM11T001_S1 уточнить...*/
		cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)) as CEntPr,
		cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)) as ZEntPr,
		cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)) as MEntPr,
		cast(dbo.vst_SafeDIV(u08_um11w001_s1,u08_um11F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)) as LEntPr,
		cast(dbo.vst_SafeDIV(u06_um11w001_s1,u06_um11F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)) as DEntPr,
		/*энтальпии обратной*/
		cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)) as CEntObr,
		cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)) as ZEntObr,
		cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)) as MEntObr,
		cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)) as LEntObr,
		cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)) as DEntObr1,
		cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)) as DEntObr2,
		/*поправки для энтальпии прямой*/
		(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1)-U04_UM11T002_S1 as CpoprPr,
		(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1)-U05_UM11T002_S1 as ZpoprPr,
		(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1)-U07_UM11T002_S1 as MpoprPr,
		(dbo.vst_SafeDIV(u08_um11w001_s1,u08_um11F001_s1)*1000/1+U08_VB00T001_S1)-U08_UM11T002_S1 as LpoprPr,
		(dbo.vst_SafeDIV(u06_um11w001_s1,u06_um11F001_s1)*1000/1+U06_VB00T001_S1)-U06_UM11T002_S1 as DpoprPr,
		/*поправки для энтальпии обратной*/
		(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1)-U04_UM21T002_S1 as CpoprObr,
		(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1)-U05_UM21T002_S1 as ZpoprObr,
		(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1)-U07_UM21T002_S1 as MpoprObr,
		(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1)-U08_UM21T002_S1 as LpoprObr,
		(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1)-U06_UM21T002_S1 as DpoprObr1,
		(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1)-U06_UM22T002_S1 as DpoprObr2,
		/*скорректированные энтальпии зачем нужны? ведь они все равно равны нескорректированным*/
		/*энергии = скорректированное значение * энтальпию*/
		/*для прямой*/
		isnull(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) as CEnergPr,
		isnull(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) as ZEnergPr,
		isnull(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) as MEnergPr,
		isnull(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) as LEnergPr,
		isnull(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) as DenergPr,
		/*сумма прямых энергий*/
		isnull(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) +
		isnull(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) +
		isnull(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) +
		isnull(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) +
		isnull(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) 
		as SumEnerPr,
		/*для обратной*/
		isnull(cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) as CenergObr,
		isnull(cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) as ZenrgObr,
		isnull(cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) as MenergObr,
		isnull(cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) as LenergObr,
		isnull(cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) as DenergObr1,
		isnull(cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) as Denergobr2,

		/*сумма обратных энергий*/
		isnull(cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) +
		isnull(cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) +
		isnull(cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) +
		isnull(cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) +
		isnull(cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) +
		isnull(cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) 
		as SumObrEnerg,
		/*энергия для подпитки = скорректированное значение * т холодного источника*/
		(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB01T001_S1) as CenergPodp,
		(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB01T001_S1) as ZenergPodp,
		(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB01T001_S1) as MenergPodp,
		(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001_S1) as LenergPodp,
		(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001_S1) as DenergPodp,
		/*сумма для энергий подпиток*/
		(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB01T001_S1) +
		(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB01T001_S1) +
		(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB01T001_S1) +
		(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001_S1) +
		(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001_S1)
		As SumEnergPodp,
		/*скорректированные энергии */
		cast(
		((cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0))-
		(cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0))-
		((cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB01T001_S1)))/1000 as decimal(15,0)) as CenergItog,

		cast((cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0)-
		cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0)-
		(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB01T001_S1))/1000 as decimal(15,0))
		as ZenergItog,

		cast((cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0)-
		cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0)-
		(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB01T001_S1))/1000 as decimal(15,0)) as MenergItog,

		cast((cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u08_um11w001_s1,u08_um11F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0)-
		cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0)-
		(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001_S1))/1000 as decimal(15,0))
		as LenergItog,

		cast((cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um11w001_s1,u06_um11F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0)-
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0)-
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0)-
		(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
		cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001_S1))/1000 as decimal(15,0))
		as DenergItog
 from
(
SELECT DateTime, 
/*общие*/
cast(U04_UM11F001_S1 as decimal(15,0)) as U04_UM11F001_S1,
cast(U04_UM21F001_S1 as decimal(15,0)) as U04_UM21F001_S1,
cast(U04_UM11W001_S1 as decimal(15,2)) as U04_UM11W001_S1,
cast(U04_UM21W001_S1 as decimal(15,2)) as U04_UM21W001_S1,
cast(U04_UM31W001_S1 as decimal(15,2)) as U04_UM31W001_S1,
cast(U06_UM11F001_S1 as decimal(15,0)) as U06_UM11F001_S1,
cast(U06_UM21F001_S1 as decimal(15,0)) as U06_UM21F001_S1,
cast(U06_UM22F001_S1 as decimal(15,0)) as U06_UM22F001_S1,
cast(U08_UM11F001_S1 as decimal(15,0)) as U08_UM11F001_S1,
cast(U08_UM21W002_S1 as decimal(15,2)) as U08_UM21W002_S1,
cast(U08_UM21F001_S1 as decimal(15,0)) as U08_UM21F001_S1,
cast(U08_UM31W001_S1 as decimal(15,2)) as U08_UM31W001_S1,
cast(U08_UM11W001_S1 as decimal(15,2)) as U08_UM11W001_S1,
cast(U08_UM21W001_S1 as decimal(15,2)) as U08_UM21W001_S1,
cast(U08_UM21T001_S1 as decimal(15,2)) as U08_UM21T001_S1,
cast(U08_UM11T001_S1 as decimal(15,2)) as U08_UM11T001_S1,
cast(U04_UM11T002_S1 as decimal(15,2)) as U04_UM11T002_S1,
cast(U06_UM11T002_S1 as decimal(15,2)) as U06_UM11T002_S1,
cast(U07_UM11T002_S1 as decimal(15,2)) as U07_UM11T002_S1,
cast(U05_UM11T002_S1 as decimal(15,2)) as U05_UM11T002_S1,
cast(U08_UM11T002_S1 as decimal(15,2)) as U08_UM11T002_S1,
cast(U04_UM11T001_S1 as decimal(15,2)) as U04_UM11T001_S1,
cast(U06_UM11T001_S1 as decimal(15,2)) as U06_UM11T001_S1,
cast(U07_UM11T001_S1 as decimal(15,2)) as U07_UM11T001_S1,
cast(U05_UM11T001_S1 as decimal(15,2)) as U05_UM11T001_S1,
cast(U04_UM41T001_S1 as decimal(15,2)) as U04_UM41T001_S1,
cast(U04_VB01T001_S1 as decimal(15,2)) as U04_VB01T001_S1,
cast(U05_VB01T001_S1 as decimal(15,2)) as U05_VB01T001_S1,
cast(U07_VB01T001_S1 as decimal(15,2)) as U07_VB01T001_S1,
cast(U08_VB00T001_S1 as decimal(15,2)) as U08_VB00T001_S1,
cast(U06_VB00T001_S1 as decimal(15,2)) as U06_VB00T001_S1,
cast(U04_UM21T001_S1 as decimal(15,2)) as U04_UM21T001_S1,
cast(U06_UM21T001_S1 as decimal(15,2)) as U06_UM21T001_S1,
cast(U06_UM22T001_S1 as decimal(15,2)) as U06_UM22T001_S1,
cast(U07_UM21T001_S1 as decimal(15,2)) as U07_UM21T001_S1,
cast(U05_UM21T001_S1 as decimal(15,2)) as U05_UM21T001_S1,
cast(U06_UM11W001_S1 as decimal(15,2)) as U06_UM11W001_S1,
cast(U06_UM21W001_S1 as decimal(15,2)) as U06_UM21W001_S1,
cast(U06_UM22W001_S1 as decimal(15,2)) as U06_UM22W001_S1,
cast(U06_UM31W001_S1 as decimal(15,2)) as U06_UM31W001_S1,
cast(U07_UM11G001_S1 as decimal(15,0)) as U07_UM11G001_S1,
cast(U07_UM21G001_S1 as decimal(15,0)) as U07_UM21G001_S1,
cast(U07_UM11W001_S1 as decimal(15,2)) as U07_UM11W001_S1,
cast(U07_UM21W001_S1 as decimal(15,2)) as U07_UM21W001_S1,
cast(U07_UM31W001_S1 as decimal(15,2)) as U07_UM31W001_S1,
cast(U05_UM11F001_S1 as decimal(15,2)) as U05_UM11F001_S1,
cast(U05_UM21F001_S1 as decimal(15,2)) as U05_UM21F001_S1,
cast(U05_UM11W001_S1 as decimal(15,2)) as U05_UM11W001_S1,
cast(U05_UM21W001_S1 as decimal(15,2)) as U05_UM21W001_S1,
cast(U05_UM31W001_S1 as decimal(15,2)) as U05_UM31W001_S1,
cast(U04_UM41F001_S1 as decimal(15,0)) as U04_UM41F001_S1,
cast(U04_UM41W001_S1 as decimal(15,2)) as U04_UM41W001_S1,
cast(U04_UM11W002_S1 as decimal(15,2)) as U04_UM11W002_S1,
cast(U05_UM11W002_S1 as decimal(15,2)) as U05_UM11W002_S1,
cast(U06_UM11W002_S1 as decimal(15,2)) as U06_UM11W002_S1,
cast(U07_UM11W002_S1 as decimal(15,2)) as U07_UM11W002_S1,
cast(U04_UM21W002_S1 as decimal(15,2)) as U04_UM21W002_S1,
cast(U05_UM21W002_S1 as decimal(15,2)) as U05_UM21W002_S1,
cast(U06_UM21W002_S1 as decimal(15,2)) as U06_UM21W002_S1,
cast(U06_UM22W002_S1 as decimal(15,2)) as U06_UM22W002_S1,
cast(U07_UM21W002_S1 as decimal(15,2)) as U07_UM21W002_S1,
cast(U05_UM11F401 as decimal(15,2)) as U05_UM11F401,
cast(U05_UM21F401 as decimal(15,2)) as U05_UM21F401,
cast(U04_UM11F401 as decimal(15,2)) as U04_UM11F401,
cast(U04_UM21F401 as decimal(15,2)) as U04_UM21F401,
cast(U04_UM41F401 as decimal(15,2)) as U04_UM41F401,
cast(U07_UM11F401 as decimal(15,2)) as U07_UM11F401,
cast(U07_UM21F401 as decimal(15,2)) as U07_UM21F401,
cast(U08_UM11F401 as decimal(15,2)) as U08_UM11F401,
cast(U08_UM21F401 as decimal(15,2)) as U08_UM21F401,
cast(U06_UM11F401 as decimal(15,2)) as U06_UM11F401,
cast(U06_UM21F401 as decimal(15,2)) as U06_UM21F401,
cast(U06_UM22F401 as decimal(15,2)) as U06_UM22F401,
cast(U04_UM21T002_S1 as decimal(15,2)) as U04_UM21T002_S1,
cast(U05_UM21T002_S1 as decimal(15,2)) as U05_UM21T002_S1,
cast(U07_UM21T002_S1 as decimal(15,2)) as U07_UM21T002_S1,
cast(U08_UM21T002_S1 as decimal(15,2)) as U08_UM21T002_S1,
cast(U06_UM21T002_S1 as decimal(15,2)) as U06_UM21T002_S1,
cast(U06_UM22T002_S1 as decimal(15,2)) as U06_UM22T002_S1,
/**/
/*максимально возможный небаланс*/
/* запад*/cast((isnull(cast(cast(U05_UM11F001_S1 as decimal (15,2))*U05_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U05_UM21F001_S1 as decimal(15,2))*U05_UM21F401 as decimal(15,2)),0)+
/*центр*/isnull(cast(cast(U04_UM11F001_S1 as decimal(15,2))*U04_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM21F001_S1 as decimal (15,2))*U04_UM21F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM41F001_S1 as decimal(15,2))*U04_UM41F401 as decimal(15,2)),0)+
/*лучеса*/isnull(cast(U08_UM11F001_S1*U08_UM11F401 as decimal(15,2)),0)+isnull(cast(U08_UM21F001_S1*U08_UM21F401 as decimal(15,2)),0)+
/*док*/isnull(cast(cast(U06_UM11F001_S1 as decimal (15,2))*U06_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U06_UM21F001_S1 as decimal(15,2))*U06_UM21F401 as decimal(15,2)),0)+ isnull(cast(cast(U06_UM22F001_S1 as decimal (15,2))*U06_UM22F401 as decimal(15,2)),0)+
/*монолит*/isnull(cast(cast(U07_UM11G001_S1 as decimal(15,2))*U07_UM11F401  as decimal(15,2)),0)+isnull(cast(cast(U07_UM21G001_S1 as decimal)*U07_UM21F401  as decimal(15,2)),0)
)/100  as decimal(15,2)) as MaxNb,
/*макс потери факт*/
(cast(cast(isnull(U05_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U05_UM21F001_S1,0) as decimal (15,0)) as decimal(15,2))+
cast(cast(isnull(U04_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U04_UM21F001_S1,0) as decimal(15,0)) as decimal(15,2))+
cast(cast(isnull(U08_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U08_UM21F001_S1,0) as decimal(15,0)) as decimal(15,2))+
cast(cast(isnull(U06_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U06_UM21F001_S1,0) as decimal(15,0))-cast(isnull(U06_UM22F001_S1,0) as decimal(15,0)) as decimal(15,2))+
cast(cast(isnull(U07_UM11G001_S1,0) as decimal(15,0))-cast(isnull(U07_UM21G001_S1,0) as decimal(15,0)) as decimal(15,2))) as FaktNb, 
/*коэф небаланса*/
cast(
dbo.vst_SafeDIV((cast(isnull(U04_UM41F001_S1,0) as decimal(15,0))-
(cast(cast(U05_UM11F001_S1 as decimal(15,0))-cast(U05_UM21F001_S1 as decimal (15,0)) as decimal(15,2))+
cast(cast(U04_UM11F001_S1 as decimal(15,0))-cast(U04_UM21F001_S1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U08_UM11F001_S1 as decimal(15,0))-cast(U08_UM21F001_S1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U06_UM11F001_S1 as decimal(15,0))-cast(U06_UM21F001_S1 as decimal(15,0))-cast(U06_UM22F001_S1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U07_UM11G001_S1 as decimal(15,0))-cast(U07_UM21G001_S1 as decimal(15,0)) as decimal(15,2)))),
/* запад*/cast((isnull(cast(cast(U05_UM11F001_S1 as decimal (15,2))*U05_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U05_UM21F001_S1 as decimal(15,2))*U05_UM21F401 as decimal(15,2)),0)+
/*центр*/isnull(cast(cast(U04_UM11F001_S1 as decimal(15,2))*U04_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM21F001_S1 as decimal (15,2))*U04_UM21F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM41F001_S1 as decimal(15,2))*U04_UM41F401 as decimal(15,2)),0)+
/*лучеса*/isnull(cast(U08_UM11F001_S1*U08_UM11F401 as decimal(15,2)),0)+isnull(cast(U08_UM21F001_S1*U08_UM21F401 as decimal(15,2)),0)+
/*док*/isnull(cast(cast(U06_UM11F001_S1 as decimal (15,2))*U06_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U06_UM21F001_S1 as decimal(15,2))*U06_UM21F401 as decimal(15,2)),0)+ isnull(cast(cast(U06_UM22F001_S1 as decimal (15,2))*U06_UM22F401 as decimal(15,2)),0)+
/*монолит*/isnull(cast(cast(U07_UM11G001_S1 as decimal(15,2))*U07_UM11F401  as decimal(15,2)),0)+isnull(cast(cast(U07_UM21G001_S1 as decimal)*U07_UM21F401  as decimal(15,2)),0)
)/100  as decimal(15,2))) 
as decimal(15,4)) as koefNb
FROM
	OpenQuery(INSQL,
	"SELECT  DateTime , U04_UM11F001_S1, U04_UM21F001_S1, U04_UM11W001_S1, U04_UM21W001_S1, U04_UM31W001_S1, U06_UM11F001_S1, U06_UM21F001_S1,
	U08_UM11F001_S1,U08_UM21W002_S1,U08_UM21F001_S1,U08_UM31W001_S1,U08_UM11W001_S1, U08_UM21W001_S1, U08_UM21T001_S1,U08_UM11T001_S1,
	U04_UM11T002_S1, U06_UM11T002_S1, U07_UM11T002_S1, U05_UM11T002_S1,U08_UM11T002_S1,
	U04_UM11T001_S1, U06_UM11T001_S1, U07_UM11T001_S1, U05_UM11T001_S1, U04_UM41T001_S1, U04_VB01T001_S1,U05_VB01T001_S1,U07_VB01T001_S1,U08_VB00T001_S1,U06_VB00T001_S1,
	U04_UM21T001_S1, U06_UM21T001_S1, U06_UM22T001_S1, U07_UM21T001_S1, U05_UM21T001_S1,
	U06_UM22F001_S1, U06_UM11W001_S1, U06_UM21W001_S1, U06_UM22W001_S1, U06_UM31W001_S1, U07_UM11G001_S1, U07_UM21G001_S1, U07_UM11W001_S1, U07_UM21W001_S1, U07_UM31W001_S1, U05_UM11F001_S1, U05_UM21F001_S1, U05_UM11W001_S1, U05_UM21W001_S1, U05_UM31W001_S1, U04_UM41F001_S1, U04_UM41W001_S1,
	U04_UM11W002_S1, U05_UM11W002_S1, U06_UM11W002_S1, U07_UM11W002_S1,
	U04_UM21W002_S1, U05_UM21W002_S1, U06_UM21W002_S1, U06_UM22W002_S1, U07_UM21W002_S1,
	U05_UM11F401,U05_UM21F401, U04_UM11F401, U04_UM21F401, U04_UM41F401, 
	U07_UM11F401, U07_UM21F401, U08_UM11F401, U08_UM21F401, 
	U06_UM11F401,U06_UM21F401, U06_UM22F401,
	U04_UM21T002_S1,U05_UM21T002_S1,U07_UM21T002_S1,U08_UM21T002_S1,U06_UM21T002_S1,U06_UM22T002_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'LATEST'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish") r
) t
) as N

{часовые срезы}
/*ReportName="ТС - Коэффициенты погрешностей для расчета небаланса (ввод данных)" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
select
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	maxnb as "Max небаланс, [hint: максимально возможный небаланс]",
	isnull(U04_UM11F401,0) as "Погрешность <br>'Центральная'<br>Масса ПСВ<br>за прош.<br>сутки<br>(%) [Edit:m1|U04_UM11F401]",
	isnull(U04_UM21F401,0) as "Погрешность <br>'Центральная'<br>Масса ОСВ<br>за прош.<br>час<br>(%) [Edit:m1|U04_UM21F401]",
	isnull(U04_UM41F401,0) as "Погрешность <br>'Центральная'<br>Масса<br>подпитки за прош.<br>час<br>(%) [Edit:m1|U04_UM41F401]",
	isnull(U05_UM11F401,0) as "Погрешность <br>'Западная'<br>Масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U05_UM11F401]",
	isnull(U05_UM21F401,0) as "Погрешность <br>'Западная'<br>Масса<br>ОСВ за прош.<br>час<br>(%) [Edit:m1|U05_UM21F401]",
	isnull(U07_UM11F401,0) as "Погрешность <br>'Монолит'<br>Масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U07_UM11F401]",
	isnull(U07_UM21F401,0) as "Погрешность <br>'Монолит'<br>Масса<br>ОСВ за прош.<br>час<br>(%) [Edit:m1|U07_UM21F401]",
	isnull(U08_UM11F401,0) as "Погрешность <br>'Лучеса'<br>Масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U08_UM11F401]",
	isnull(U08_UM21F401,0) as "Погрешность <br>'Лучеса'<br>Масса<br>ОСВ за прош.<br>час<br>(%) [Edit:m1|U08_UM21F401]",
	isnull(U06_UM11F401,0) as "Погрешность <br>'ДОК'<br>масса<br>ПСВ за прош.<br>час<br>(%) [Edit:m1|U06_UM11F401]",
	isnull(U06_UM21F401,0) as "Погрешность <br>'ДОК'<br>Масса<br>ОСВ № 1 за прош.<br>час<br>(%) [Edit:m1|U06_UM21F401]",
	isnull(U06_UM22F401,0) as "Погрешность <br>'ДОК'<br>Масса<br>ОСВ № 2 за прош.<br>час<br>(%)  [Edit:m1|U06_UM22F401]"
from
(
select 
/**/t.*,
cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrPr,
cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrObr,
cast(U04_UM41F001_s1-cast(koefNb*U04_UM41F001_S1*U04_UM41F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrPodp,
cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as ZkorrPr,
cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) as ZkorrObr,
cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as MkorrPr,
cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as MkorrObr,
cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0)) as LkorrPr,
cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as LkorrObr,
cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrPr,
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr1,
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr2,
/**/
cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))
as SummPodd,
/**/
cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))
as SummObr,
/*подпитки скорректированные*/
cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)) As CPodpKorr,
cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) As ZPodpKorr,
cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) As MPodpKorr,
cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) As LPodpKorr,
cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)) As DPodpKorr,
/*мподп скорректировн, определяем как сумму всех подпиток(тогда все сходится), можно посчитать по формулам (CkorPodp) но тогда надо увеличить точность вычислений */
cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) +
cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) +
cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) +
cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))
 as SumPodpKorr,
/*энтальпии прямой*/
/*может понадобится заменить U04_UM11T002_S1 на U04_UM11T001_S1 уточнить...*/
cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)) as CEntPr,
cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)) as ZEntPr,
cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)) as MEntPr,
cast(dbo.vst_SafeDIV(u08_um11w001_s1,u08_um11F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)) as LEntPr,
cast(dbo.vst_SafeDIV(u06_um11w001_s1,u06_um11F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)) as DEntPr,
/*энтальпии обратной*/
cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)) as CEntObr,
cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)) as ZEntObr,
cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)) as MEntObr,
cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)) as LEntObr,
cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)) as DEntObr1,
cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)) as DEntObr2,
/*поправки для энтальпии прямой*/
(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1)-U04_UM11T002_S1 as CpoprPr,
(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1)-U05_UM11T002_S1 as ZpoprPr,
(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1)-U07_UM11T002_S1 as MpoprPr,
(dbo.vst_SafeDIV(u08_um11w001_s1,u08_um11F001_s1)*1000/1+U08_VB00T001_S1)-U08_UM11T002_S1 as LpoprPr,
(dbo.vst_SafeDIV(u06_um11w001_s1,u06_um11F001_s1)*1000/1+U06_VB00T001_S1)-U06_UM11T002_S1 as DpoprPr,
/*поправки для энтальпии обратной*/
(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1)-U04_UM21T002_S1 as CpoprObr,
(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1)-U05_UM21T002_S1 as ZpoprObr,
(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1)-U07_UM21T002_S1 as MpoprObr,
(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1)-U08_UM21T002_S1 as LpoprObr,
(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1)-U06_UM21T002_S1 as DpoprObr1,
(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1)-U06_UM22T002_S1 as DpoprObr2,
/*скорректированные энтальпии зачем нужны? ведь они все равно равны нескорректированным*/
/*энергии = скорректированное значение * энтальпию*/
/*для прямой*/
isnull(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) as CEnergPr,
isnull(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) as ZEnergPr,
isnull(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) as MEnergPr,
isnull(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) as LEnergPr,
isnull(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) as DenergPr,
/*сумма прямых энергий*/
isnull(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) +
isnull(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) +
isnull(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) +
isnull(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) +
isnull(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) 
as SumEnerPr,
/*для обратной*/
isnull(cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) as CenergObr,
isnull(cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) as ZenrgObr,
isnull(cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) as MenergObr,
isnull(cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) as LenergObr,
isnull(cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) as DenergObr1,
isnull(cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) as Denergobr2,

/*сумма обратных энергий*/
isnull(cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0) +
isnull(cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0) +
isnull(cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0) +
isnull(cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0) +
isnull(cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) +
isnull(cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0) 
as SumObrEnerg,
/*энергия для подпитки = скорректированное значение * т холодного источника*/
(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB01T001_S1) as CenergPodp,
(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB01T001_S1) as ZenergPodp,
(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB01T001_S1) as MenergPodp,
(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001_S1) as LenergPodp,
(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001_S1) as DenergPodp,
/*сумма для энергий подпиток*/
(cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB01T001_S1) +
(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB01T001_S1) +
(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB01T001_S1) +
(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001_S1) +
(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001_S1)
As SumEnergPodp,
/*скорректированные энергии */
cast(
((cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u04_um11w001_s1,u04_um11F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0))-
(cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u04_um21w001_s1,u04_um21F001_s1)*1000/1+U04_VB01T001_S1 as decimal(15,2)),0))-
((cast(U04_UM11F001_s1+cast(koefNb*U04_UM11F001_S1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_s1-cast(koefNb*U04_UM21F001_S1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB01T001_S1)))/1000 as decimal(15,0)) as CenergItog,

cast((cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u05_um11w001_s1,u05_um11F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0)-
cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u05_um21w001_s1,u05_um21F001_s1)*1000/1+U05_VB01T001_S1 as decimal(15,2)),0)-
(cast(U05_UM11F001_s1+cast(koefNb*U05_UM11F001_S1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_s1-cast(koefNb*U05_UM21F001_S1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB01T001_S1))/1000 as decimal(15,0))
as ZenergItog,

cast((cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u07_um11w001_s1,u07_um11G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0)-
cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u07_um21w001_s1,u07_um21G001_s1)*1000/1+U07_VB01T001_S1 as decimal(15,2)),0)-
(cast(U07_UM11G001_s1+cast(koefNb*U07_UM11G001_S1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_s1-cast(koefNb*U07_UM21G001_S1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB01T001_S1))/1000 as decimal(15,0)) as MenergItog,

cast((cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u08_um11w001_s1,u08_um11F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0)-
cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u08_um21w001_s1,u08_um21F001_s1)*1000/1+U08_VB00T001_S1 as decimal(15,2)),0)-
(cast(U08_UM11F001_s1+cast(koefNb*U08_UM11F001_S1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_s1-cast(koefNb*U08_UM21F001_S1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001_S1))/1000 as decimal(15,0))
as LenergItog,

cast((cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um11w001_s1,u06_um11F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0)-
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um21w001_s1,u06_um21F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0)-
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um22w001_s1,u06_um22F001_s1)*1000/1+U06_VB00T001_S1 as decimal(15,2)),0)-
(cast(U06_UM11F001_s1+cast(koefNb*U06_UM11F001_S1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_s1-cast(koefNb*U06_UM21F001_S1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_s1-cast(koefNb*U06_UM22F001_S1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001_S1))/1000 as decimal(15,0))
as DenergItog
 from
(
SELECT DateTime, 
/*общие*/
cast(U04_UM11F001_S1 as decimal(15,0)) as U04_UM11F001_S1,
cast(U04_UM21F001_S1 as decimal(15,0)) as U04_UM21F001_S1,
cast(U04_UM11W001_S1 as decimal(15,2)) as U04_UM11W001_S1,
cast(U04_UM21W001_S1 as decimal(15,2)) as U04_UM21W001_S1,
cast(U04_UM31W001_S1 as decimal(15,2)) as U04_UM31W001_S1,
cast(U06_UM11F001_S1 as decimal(15,0)) as U06_UM11F001_S1,
cast(U06_UM21F001_S1 as decimal(15,0)) as U06_UM21F001_S1,
cast(U06_UM22F001_S1 as decimal(15,0)) as U06_UM22F001_S1,
cast(U08_UM11F001_S1 as decimal(15,0)) as U08_UM11F001_S1,
cast(U08_UM21W002_S1 as decimal(15,2)) as U08_UM21W002_S1,
cast(U08_UM21F001_S1 as decimal(15,0)) as U08_UM21F001_S1,
cast(U08_UM31W001_S1 as decimal(15,2)) as U08_UM31W001_S1,
cast(U08_UM11W001_S1 as decimal(15,2)) as U08_UM11W001_S1,
cast(U08_UM21W001_S1 as decimal(15,2)) as U08_UM21W001_S1,
cast(U08_UM21T001_S1 as decimal(15,2)) as U08_UM21T001_S1,
cast(U08_UM11T001_S1 as decimal(15,2)) as U08_UM11T001_S1,
cast(U04_UM11T002_S1 as decimal(15,2)) as U04_UM11T002_S1,
cast(U06_UM11T002_S1 as decimal(15,2)) as U06_UM11T002_S1,
cast(U07_UM11T002_S1 as decimal(15,2)) as U07_UM11T002_S1,
cast(U05_UM11T002_S1 as decimal(15,2)) as U05_UM11T002_S1,
cast(U08_UM11T002_S1 as decimal(15,2)) as U08_UM11T002_S1,
cast(U04_UM11T001_S1 as decimal(15,2)) as U04_UM11T001_S1,
cast(U06_UM11T001_S1 as decimal(15,2)) as U06_UM11T001_S1,
cast(U07_UM11T001_S1 as decimal(15,2)) as U07_UM11T001_S1,
cast(U05_UM11T001_S1 as decimal(15,2)) as U05_UM11T001_S1,
cast(U04_UM41T001_S1 as decimal(15,2)) as U04_UM41T001_S1,
cast(U04_VB01T001_S1 as decimal(15,2)) as U04_VB01T001_S1,
cast(U05_VB01T001_S1 as decimal(15,2)) as U05_VB01T001_S1,
cast(U07_VB01T001_S1 as decimal(15,2)) as U07_VB01T001_S1,
cast(U08_VB00T001_S1 as decimal(15,2)) as U08_VB00T001_S1,
cast(U06_VB00T001_S1 as decimal(15,2)) as U06_VB00T001_S1,
cast(U04_UM21T001_S1 as decimal(15,2)) as U04_UM21T001_S1,
cast(U06_UM21T001_S1 as decimal(15,2)) as U06_UM21T001_S1,
cast(U06_UM22T001_S1 as decimal(15,2)) as U06_UM22T001_S1,
cast(U07_UM21T001_S1 as decimal(15,2)) as U07_UM21T001_S1,
cast(U05_UM21T001_S1 as decimal(15,2)) as U05_UM21T001_S1,
cast(U06_UM11W001_S1 as decimal(15,2)) as U06_UM11W001_S1,
cast(U06_UM21W001_S1 as decimal(15,2)) as U06_UM21W001_S1,
cast(U06_UM22W001_S1 as decimal(15,2)) as U06_UM22W001_S1,
cast(U06_UM31W001_S1 as decimal(15,2)) as U06_UM31W001_S1,
cast(U07_UM11G001_S1 as decimal(15,0)) as U07_UM11G001_S1,
cast(U07_UM21G001_S1 as decimal(15,0)) as U07_UM21G001_S1,
cast(U07_UM11W001_S1 as decimal(15,2)) as U07_UM11W001_S1,
cast(U07_UM21W001_S1 as decimal(15,2)) as U07_UM21W001_S1,
cast(U07_UM31W001_S1 as decimal(15,2)) as U07_UM31W001_S1,
cast(U05_UM11F001_S1 as decimal(15,2)) as U05_UM11F001_S1,
cast(U05_UM21F001_S1 as decimal(15,2)) as U05_UM21F001_S1,
cast(U05_UM11W001_S1 as decimal(15,2)) as U05_UM11W001_S1,
cast(U05_UM21W001_S1 as decimal(15,2)) as U05_UM21W001_S1,
cast(U05_UM31W001_S1 as decimal(15,2)) as U05_UM31W001_S1,
cast(U04_UM41F001_S1 as decimal(15,0)) as U04_UM41F001_S1,
cast(U04_UM41W001_S1 as decimal(15,2)) as U04_UM41W001_S1,
cast(U04_UM11W002_S1 as decimal(15,2)) as U04_UM11W002_S1,
cast(U05_UM11W002_S1 as decimal(15,2)) as U05_UM11W002_S1,
cast(U06_UM11W002_S1 as decimal(15,2)) as U06_UM11W002_S1,
cast(U07_UM11W002_S1 as decimal(15,2)) as U07_UM11W002_S1,
cast(U04_UM21W002_S1 as decimal(15,2)) as U04_UM21W002_S1,
cast(U05_UM21W002_S1 as decimal(15,2)) as U05_UM21W002_S1,
cast(U06_UM21W002_S1 as decimal(15,2)) as U06_UM21W002_S1,
cast(U06_UM22W002_S1 as decimal(15,2)) as U06_UM22W002_S1,
cast(U07_UM21W002_S1 as decimal(15,2)) as U07_UM21W002_S1,
cast(U05_UM11F401 as decimal(15,2)) as U05_UM11F401,
cast(U05_UM21F401 as decimal(15,2)) as U05_UM21F401,
cast(U04_UM11F401 as decimal(15,2)) as U04_UM11F401,
cast(U04_UM21F401 as decimal(15,2)) as U04_UM21F401,
cast(U04_UM41F401 as decimal(15,2)) as U04_UM41F401,
cast(U07_UM11F401 as decimal(15,2)) as U07_UM11F401,
cast(U07_UM21F401 as decimal(15,2)) as U07_UM21F401,
cast(U08_UM11F401 as decimal(15,2)) as U08_UM11F401,
cast(U08_UM21F401 as decimal(15,2)) as U08_UM21F401,
cast(U06_UM11F401 as decimal(15,2)) as U06_UM11F401,
cast(U06_UM21F401 as decimal(15,2)) as U06_UM21F401,
cast(U06_UM22F401 as decimal(15,2)) as U06_UM22F401,
cast(U04_UM21T002_S1 as decimal(15,2)) as U04_UM21T002_S1,
cast(U05_UM21T002_S1 as decimal(15,2)) as U05_UM21T002_S1,
cast(U07_UM21T002_S1 as decimal(15,2)) as U07_UM21T002_S1,
cast(U08_UM21T002_S1 as decimal(15,2)) as U08_UM21T002_S1,
cast(U06_UM21T002_S1 as decimal(15,2)) as U06_UM21T002_S1,
cast(U06_UM22T002_S1 as decimal(15,2)) as U06_UM22T002_S1,
/**/
/*максимально возможный небаланс*/
/* запад*/cast((isnull(cast(cast(U05_UM11F001_S1 as decimal (15,2))*U05_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U05_UM21F001_S1 as decimal(15,2))*U05_UM21F401 as decimal(15,2)),0)+
/*центр*/isnull(cast(cast(U04_UM11F001_S1 as decimal(15,2))*U04_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM21F001_S1 as decimal (15,2))*U04_UM21F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM41F001_S1 as decimal(15,2))*U04_UM41F401 as decimal(15,2)),0)+
/*лучеса*/isnull(cast(U08_UM11F001_S1*U08_UM11F401 as decimal(15,2)),0)+isnull(cast(U08_UM21F001_S1*U08_UM21F401 as decimal(15,2)),0)+
/*док*/isnull(cast(cast(U06_UM11F001_S1 as decimal (15,2))*U06_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U06_UM21F001_S1 as decimal(15,2))*U06_UM21F401 as decimal(15,2)),0)+ isnull(cast(cast(U06_UM22F001_S1 as decimal (15,2))*U06_UM22F401 as decimal(15,2)),0)+
/*монолит*/isnull(cast(cast(U07_UM11G001_S1 as decimal(15,2))*U07_UM11F401  as decimal(15,2)),0)+isnull(cast(cast(U07_UM21G001_S1 as decimal)*U07_UM21F401  as decimal(15,2)),0)
)/100  as decimal(15,2)) as MaxNb,
/*макс потери факт*/
(cast(cast(isnull(U05_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U05_UM21F001_S1,0) as decimal (15,0)) as decimal(15,2))+
cast(cast(isnull(U04_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U04_UM21F001_S1,0) as decimal(15,0)) as decimal(15,2))+
cast(cast(isnull(U08_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U08_UM21F001_S1,0) as decimal(15,0)) as decimal(15,2))+
cast(cast(isnull(U06_UM11F001_S1,0) as decimal(15,0))-cast(isnull(U06_UM21F001_S1,0) as decimal(15,0))-cast(isnull(U06_UM22F001_S1,0) as decimal(15,0)) as decimal(15,2))+
cast(cast(isnull(U07_UM11G001_S1,0) as decimal(15,0))-cast(isnull(U07_UM21G001_S1,0) as decimal(15,0)) as decimal(15,2))) as FaktNb, 
/*коэф небаланса*/
cast(
dbo.vst_SafeDIV((cast(isnull(U04_UM41F001_S1,0) as decimal(15,0))-
(cast(cast(U05_UM11F001_S1 as decimal(15,0))-cast(U05_UM21F001_S1 as decimal (15,0)) as decimal(15,2))+
cast(cast(U04_UM11F001_S1 as decimal(15,0))-cast(U04_UM21F001_S1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U08_UM11F001_S1 as decimal(15,0))-cast(U08_UM21F001_S1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U06_UM11F001_S1 as decimal(15,0))-cast(U06_UM21F001_S1 as decimal(15,0))-cast(U06_UM22F001_S1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U07_UM11G001_S1 as decimal(15,0))-cast(U07_UM21G001_S1 as decimal(15,0)) as decimal(15,2)))),
/* запад*/cast((isnull(cast(cast(U05_UM11F001_S1 as decimal (15,2))*U05_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U05_UM21F001_S1 as decimal(15,2))*U05_UM21F401 as decimal(15,2)),0)+
/*центр*/isnull(cast(cast(U04_UM11F001_S1 as decimal(15,2))*U04_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM21F001_S1 as decimal (15,2))*U04_UM21F401 as decimal(15,2)),0)+isnull(cast(cast(U04_UM41F001_S1 as decimal(15,2))*U04_UM41F401 as decimal(15,2)),0)+
/*лучеса*/isnull(cast(U08_UM11F001_S1*U08_UM11F401 as decimal(15,2)),0)+isnull(cast(U08_UM21F001_S1*U08_UM21F401 as decimal(15,2)),0)+
/*док*/isnull(cast(cast(U06_UM11F001_S1 as decimal (15,2))*U06_UM11F401 as decimal(15,2)),0)+isnull(cast(cast(U06_UM21F001_S1 as decimal(15,2))*U06_UM21F401 as decimal(15,2)),0)+ isnull(cast(cast(U06_UM22F001_S1 as decimal (15,2))*U06_UM22F401 as decimal(15,2)),0)+
/*монолит*/isnull(cast(cast(U07_UM11G001_S1 as decimal(15,2))*U07_UM11F401  as decimal(15,2)),0)+isnull(cast(cast(U07_UM21G001_S1 as decimal)*U07_UM21F401  as decimal(15,2)),0)
)/100  as decimal(15,2))) 
as decimal(15,4)) as koefNb
FROM
	OpenQuery(INSQL,
	"SELECT  DateTime , U04_UM11F001_S1, U04_UM21F001_S1, U04_UM11W001_S1, U04_UM21W001_S1, U04_UM31W001_S1, U06_UM11F001_S1, U06_UM21F001_S1,
	U08_UM11F001_S1,U08_UM21W002_S1,U08_UM21F001_S1,U08_UM31W001_S1,U08_UM11W001_S1, U08_UM21W001_S1, U08_UM21T001_S1,U08_UM11T001_S1,
	U04_UM11T002_S1, U06_UM11T002_S1, U07_UM11T002_S1, U05_UM11T002_S1,U08_UM11T002_S1,
	U04_UM11T001_S1, U06_UM11T001_S1, U07_UM11T001_S1, U05_UM11T001_S1, U04_UM41T001_S1, U04_VB01T001_S1,U05_VB01T001_S1,U07_VB01T001_S1,U08_VB00T001_S1,U06_VB00T001_S1,
	U04_UM21T001_S1, U06_UM21T001_S1, U06_UM22T001_S1, U07_UM21T001_S1, U05_UM21T001_S1,
	U06_UM22F001_S1, U06_UM11W001_S1, U06_UM21W001_S1, U06_UM22W001_S1, U06_UM31W001_S1, U07_UM11G001_S1, U07_UM21G001_S1, U07_UM11W001_S1, U07_UM21W001_S1, U07_UM31W001_S1, U05_UM11F001_S1, U05_UM21F001_S1, U05_UM11W001_S1, U05_UM21W001_S1, U05_UM31W001_S1, U04_UM41F001_S1, U04_UM41W001_S1,
	U04_UM11W002_S1, U05_UM11W002_S1, U06_UM11W002_S1, U07_UM11W002_S1,
	U04_UM21W002_S1, U05_UM21W002_S1, U06_UM21W002_S1, U06_UM22W002_S1, U07_UM21W002_S1,
	U05_UM11F401,U05_UM21F401, U04_UM11F401, U04_UM21F401, U04_UM41F401, 
	U07_UM11F401, U07_UM21F401, U08_UM11F401, U08_UM21F401, 
	U06_UM11F401,U06_UM21F401, U06_UM22F401,
	U04_UM21T002_S1,U05_UM21T002_S1,U07_UM21T002_S1,U08_UM21T002_S1,U06_UM21T002_S1,U06_UM22T002_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'LATEST'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish") r
) t
) as N