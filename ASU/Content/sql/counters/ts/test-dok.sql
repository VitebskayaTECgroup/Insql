{часовые срезы}
/*ReportName=ТС "ДОК" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
select
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(U06_UM11F001_H1 as decimal(15,2)) as "M ПСВ за п/с, т/ч [hint:  масса  теплоносителя по подающим  трубопроводам (счетчик)]",
	CAST(U06_UM11P001_H1 as decimal(15,2)) as "P ПСВ за п/с, абс.МПа [U06_UM11P001_H1]",
	CAST(U06_UM11T001_H1 as decimal(15,2)) as "T ПСВ за п/с, °С [U06_UM11T001_H1]",
	CAST(U06_UM11T001_H1 as decimal(15,2)) as "Tср.взв. ПСВ за п/с, °С [hint: Средневзвешенная температура прямой СВ за п/с]",
	CAST(U06_UM21F001_H1 as decimal(15,2)) as "M ОСВ1 за п/с, т/с [hint:  масса теплоносителя по обратным трубопроводам (счетчик)]",
	CAST(U06_UM21P001_H1 as decimal(15,2)) as "P ОСВ1 за п/с, абс.МПа [U06_UM21P001_H1]",
	CAST(U06_UM21T001_H1 as decimal(15,2)) as "T ОСВ1 за п/с, °С [U06_UM21T001_H1]",
	CAST(U06_UM21T001_H1 as decimal(15,2)) as "Tср.взв. ОСВ1 за п/с, °С [hint: Средневзвешенная температура обратной СВ за п/с]",
	CAST(U06_UM22F001_H1 as decimal(15,2)) as "M ОСВ2 за п/с, т/ч [hint:  масса теплоносителя по обратным трубопроводам (счетчик)]",
	/*CAST(U06_UM22P001_H1 as decimal(15,2)) as "P ОСВ2 за п/с, абс.МПа [U06_UM22P001_H1]",*/
	CAST(U06_UM22T001_H1 as decimal(15,2)) as "T ОСВ2 за п/с, °С [U06_UM22T001_H1]",
	CAST(U06_UM22T001_H1 as decimal(15,2)) as "Tср.взв. ОСВ2 за п/с, °С [hint: Средневзвешенная температура обратной СВ за п/с]",
	CAST(U06_UM11W001_H1 as decimal(15,2)) as "Q ПСВ за п/ч, ГДж [hint: Отпущенная  теплоэнергия по подающему трубопроводу (счетчик)]",
	CAST(U06_UM21W001_H1 as decimal(15,2)) as "Q ОСВ1 за п/ч, ГДж [hint: Возвращенная теплоэнергия по обратному трубопроводу (счетчик)]",
	CAST(U06_UM22W001_H1 as decimal(15,2)) as "Q ОСВ2 за п/ч, ГДж [hint: Возвращенная теплоэнергия по обратному трубопроводу (счетчик)]",
	CAST(U06_UM31W001_H1 as decimal(15,2)) as "dQ по МАГ за п/ч, ГДж [hint: Потребленная теплоэнергия  (счетчик)]",
	CAST(U06_VB00T001 as decimal(9,2)) as "Tхв за п/с, °С [U06_VB00T001]",
	DkorrPr as "кор Mсум ПСВ, тонн [hint: Масса теплоносителя по подающему трубопроводу скорректир]",
	DkorrObr1 as "кор Mсум ОСВ1, тонн [hint: Масса теплоносителя по обратному трубопроводу1 скорректир]",
	DkorrObr2 as "кор Mсум ОСВ2, тонн [hint: Масса теплоносителя по обратному трубопроводу2 скорректир]",
	DPodpKorr as "кор Mсум подп, тонн[hint: Масса теплоносителя на подпитку скорректир]",
	cast(DEnergPr/1000 as decimal(15,2)) as "кор Qсум ПСВ, ГДж [hint:Отпущенная  теплоэнергия по подающим трубопроводам скоррект]",
	cast(DEnergObr1/1000 as decimal(15,2)) as "кор Qсум1 ОСВ, ГДж [hint: Отпущенная  теплоэнергия по обратнному трубопроводу1 скоррект]",
	cast(DEnergObr2/1000 as decimal(15,2)) as "кор Qсум2 ОСВ, ГДж[hint: Отпущенная  теплоэнергия по обратнному трубопроводу2 скоррект]",
	cast(DEnergPodp/1000 as decimal(15,2)) as "кор Qсум подп, ГДж[hint: Отпущенная теплоэнергия с подпиткой скоррект]",
	DEnergItog as "кор dQсум,ГДж [hint: Суммарная потребленная теплоэнергия по магистралям скоррект]",
	cast(DEnergItog/4.187 as decimal(15,0)) as "кор dQсум,Гкал[hint: Суммарная потребленная теплоэнергия по магистралям скоррект]"
from
(
select 
/**/t.*,
cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrPr,
cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrObr,
cast(U04_UM41F001_H1-cast(koefNb*U04_UM41F001_H1*U04_UM41F401/100 as decimal(15,2)) as decimal (15,0)) as CkorrPodp,
cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as ZkorrPr,
cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) as ZkorrObr,
cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0)) as MkorrPr,
cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as MkorrObr,
cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0)) as LkorrPr,
cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as LkorrObr,
cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrPr,
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr1,
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr2,
/**/
cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))
as SummPodd,
/**/
cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))+
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))
as SummObr,
/*подпитки скорректированные*/
cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)) As CPodpKorr,
cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) As ZPodpKorr,
cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) As MPodpKorr,
cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) As LPodpKorr,
cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)) As DPodpKorr,
/*мподп скорректировн, определяем как сумму всех подпиток(тогда все сходится), можно посчитать по формулам (CkorPodp) но тогда надо увеличить точность вычислений */
cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))+
cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)) +
cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)) +
cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)) +
cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))
 as SumPodpKorr,
/*энтальпии прямой*/
/*может понадобится заменить U04_UM11T001_H1 на U04_UM11T001_H1 уточнить...*/
cast(dbo.vst_SafeDIV(u04_um11w001_H1,u04_um11F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)) as CEntPr,
cast(dbo.vst_SafeDIV(u05_um11w001_H1,u05_um11F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)) as ZEntPr,
cast(dbo.vst_SafeDIV(u07_um11w001_H1,u07_um11G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)) as MEntPr,
cast(dbo.vst_SafeDIV(u08_um11w001_H1,u08_um11F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)) as LEntPr,
cast(dbo.vst_SafeDIV(u06_um11w001_H1,u06_um11F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)) as DEntPr,
/*энтальпии обратной*/
cast(dbo.vst_SafeDIV(u04_um21w001_H1,u04_um21F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)) as CEntObr,
cast(dbo.vst_SafeDIV(u05_um21w001_H1,u05_um21F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)) as ZEntObr,
cast(dbo.vst_SafeDIV(u07_um21w001_H1,u07_um21G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)) as MEntObr,
cast(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)) as LEntObr,
cast(dbo.vst_SafeDIV(u06_um21w001_H1,u06_um21F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)) as DEntObr1,
cast(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)) as DEntObr2,
/*поправки для энтальпии прямой*/
(dbo.vst_SafeDIV(u04_um11w001_H1,u04_um11F001_H1)*1000/1+U04_VB00T001)-U04_UM11T001_H1 as CpoprPr,
(dbo.vst_SafeDIV(u05_um11w001_H1,u05_um11F001_H1)*1000/1+U05_VB00T001)-U05_UM11T001_H1 as ZpoprPr,
(dbo.vst_SafeDIV(u07_um11w001_H1,u07_um11G001_H1)*1000/1+U07_VB00T001)-U07_UM11T001_H1 as MpoprPr,
(dbo.vst_SafeDIV(u08_um11w001_H1,u08_um11F001_H1)*1000/1+U08_VB00T001)-U08_UM11T001_H1 as LpoprPr,
(dbo.vst_SafeDIV(u06_um11w001_H1,u06_um11F001_H1)*1000/1+U06_VB00T001)-U06_UM11T001_H1 as DpoprPr,
/*поправки для энтальпии обратной*/
(dbo.vst_SafeDIV(u04_um21w001_H1,u04_um21F001_H1)*1000/1+U04_VB00T001)-U04_UM21T001_H1 as CpoprObr,
(dbo.vst_SafeDIV(u05_um21w001_H1,u05_um21F001_H1)*1000/1+U05_VB00T001)-U05_UM21T001_H1 as ZpoprObr,
(dbo.vst_SafeDIV(u07_um21w001_H1,u07_um21G001_H1)*1000/1+U07_VB00T001)-U07_UM21T001_H1 as MpoprObr,
(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001)-U08_UM21T001_H1 as LpoprObr,
(dbo.vst_SafeDIV(u06_um21w001_H1,u06_um21F001_H1)*1000/1+U06_VB00T001)-U06_UM21T001_H1 as DpoprObr1,
(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001)-U06_UM22T001_H1 as DpoprObr2,
/*скорректированные энтальпии зачем нужны? ведь они все равно равны нескорректированным*/
/*энергии = скорректированное значение * энтальпию*/
/*для прямой*/
isnull(cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um11w001_H1,u04_um11F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)),0) as CEnergPr,
isnull(cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um11w001_H1,u05_um11F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)),0) as ZEnergPr,
isnull(cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um11w001_H1,u07_um11G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)),0) as MEnergPr,
isnull(cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)),0) as LEnergPr,
isnull(cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0) as DenergPr,
/*сумма прямых энергий*/
isnull(cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um11w001_H1,u04_um11F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)),0) +
isnull(cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um11w001_H1,u05_um11F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)),0) +
isnull(cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um11w001_H1,u07_um11G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)),0) +
isnull(cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)),0) +
isnull(cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0) 
as SumEnerPr,
/*для обратной*/
isnull(cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um21w001_H1,u04_um21F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)),0) as CenergObr,
isnull(cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um21w001_H1,u05_um21F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)),0) as ZenrgObr,
isnull(cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um21w001_H1,u07_um21G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)),0) as MenergObr,
isnull(cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)),0) as LenergObr,
isnull(cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um21w001_H1,u06_um21F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0) as DenergObr1,
isnull(cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0) as Denergobr2,

/*сумма обратных энергий*/
isnull(cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u04_um21w001_H1,u04_um21F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)),0) +
isnull(cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u05_um21w001_H1,u05_um21F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)),0) +
isnull(cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u07_um21w001_H1,u07_um21G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)),0) +
isnull(cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)),0) +
isnull(cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um21w001_H1,u06_um21F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0) +
isnull(cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*cast(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0) 
as SumObrEnerg,
/*энергия для подпитки = скорректированное значение * т холодного источника*/
(cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB00T001) as CenergPodp,
(cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB00T001) as ZenergPodp,
(cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB00T001) as MenergPodp,
(cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001) as LenergPodp,
(cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001) as DenergPodp,
/*сумма для энергий подпиток*/
(cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB00T001) +
(cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB00T001) +
(cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB00T001) +
(cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001) +
(cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001)
As SumEnergPodp,
/*скорректированные энергии */
cast(
((cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u04_um11w001_H1,u04_um11F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)),0))-
(cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u04_um21w001_H1,u04_um21F001_H1)*1000/1+U04_VB00T001 as decimal(15,2)),0))-
((cast(U04_UM11F001_H1+cast(koefNb*U04_UM11F001_H1*U04_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U04_UM21F001_H1-cast(koefNb*U04_UM21F001_H1*U04_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U04_VB00T001)))/1000 as decimal(15,0)) as CenergItog,

cast((cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u05_um11w001_H1,u05_um11F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)),0)-
cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u05_um21w001_H1,u05_um21F001_H1)*1000/1+U05_VB00T001 as decimal(15,2)),0)-
(cast(U05_UM11F001_H1+cast(koefNb*U05_UM11F001_H1*U05_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U05_UM21F001_H1-cast(koefNb*U05_UM21F001_H1*U05_UM21F401/100 as decimal(15,2)) as decimal (15,0)))*(U05_VB00T001))/1000 as decimal(15,0))
as ZenergItog,

cast((cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u07_um11w001_H1,u07_um11G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)),0)-
cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u07_um21w001_H1,u07_um21G001_H1)*1000/1+U07_VB00T001 as decimal(15,2)),0)-
(cast(U07_UM11G001_H1+cast(koefNb*U07_UM11G001_H1*U07_UM11F401/100 as decimal(15,2)) as decimal (15,0))-cast(U07_UM21G001_H1-cast(koefNb*U07_UM21G001_H1*U07_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U07_VB00T001))/1000 as decimal(15,0)) as MenergItog,

cast((cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u08_um11w001_H1,u08_um11F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)),0)-
cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u08_um21w001_H1,u08_um21F001_H1)*1000/1+U08_VB00T001 as decimal(15,2)),0)-
(cast(U08_UM11F001_H1+cast(koefNb*U08_UM11F001_H1*U08_UM11F401/100 as decimal (15,2)) as decimal (15,0))-cast(U08_UM21F001_H1-cast(koefNb*U08_UM21F001_H1*U08_UM21F401/100 as decimal (15,2)) as decimal (15,0)))*(U08_VB00T001))/1000 as decimal(15,0))
as LenergItog,

cast((cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um11w001_H1,u06_um11F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0)-
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um21w001_H1,u06_um21F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0)-
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(u06_um22w001_H1,u06_um22F001_H1)*1000/1+U06_VB00T001 as decimal(15,2)),0)-
(cast(U06_UM11F001_H1+cast(koefNb*U06_UM11F001_H1*U06_UM11F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM21F001_H1-cast(koefNb*U06_UM21F001_H1*U06_UM21F401/100 as decimal (15,2)) as decimal (15,0))-
cast(U06_UM22F001_H1-cast(koefNb*U06_UM22F001_H1*U06_UM22F401/100 as decimal (15,2)) as decimal (15,0)))*(U06_VB00T001))/1000 as decimal(15,0))
as DenergItog
 from
(
SELECT
/*общие*/
DateTime,
cast(U04_UM11F001_H1 as decimal(15,0)) as U04_UM11F001_H1,
cast(U04_UM21F001_H1 as decimal(15,0)) as U04_UM21F001_H1,
cast(U04_UM11W001_H1 as decimal(15,2)) as U04_UM11W001_H1,
cast(U04_UM21W001_H1 as decimal(15,2)) as U04_UM21W001_H1,
cast(U04_UM31W001_H1 as decimal(15,2)) as U04_UM31W001_H1,
cast(U06_UM11F001_H1 as decimal(15,0)) as U06_UM11F001_H1,
cast(U06_UM21F001_H1 as decimal(15,0)) as U06_UM21F001_H1,
cast(U06_UM22F001_H1 as decimal(15,0)) as U06_UM22F001_H1,
cast(U08_UM11F001_H1 as decimal(15,0)) as U08_UM11F001_H1,
cast(U08_UM21W002_H1 as decimal(15,2)) as U08_UM21W002_H1,
cast(U08_UM21F001_H1 as decimal(15,0)) as U08_UM21F001_H1,
cast(U08_UM31W001_H1 as decimal(15,2)) as U08_UM31W001_H1,
cast(U08_UM11W001_H1 as decimal(15,2)) as U08_UM11W001_H1,
cast(U08_UM21W001_H1 as decimal(15,2)) as U08_UM21W001_H1,
cast(U08_UM21T001_H1 as decimal(15,2)) as U08_UM21T001_H1,
cast(U08_UM11T001_H1 as decimal(15,2)) as U08_UM11T001_H1,
cast(U04_UM11T001_H1 as decimal(15,2)) as U04_UM11T001_H1,
cast(U06_UM11T001_H1 as decimal(15,2)) as U06_UM11T001_H1,
cast(U07_UM11T001_H1 as decimal(15,2)) as U07_UM11T001_H1,
cast(U05_UM11T001_H1 as decimal(15,2)) as U05_UM11T001_H1,
cast(U04_UM41T001_H1 as decimal(15,2)) as U04_UM41T001_H1,
cast(U04_VB00T001 as decimal(15,2)) as U04_VB00T001,
cast(U05_VB00T001 as decimal(15,2)) as U05_VB00T001,
cast(U07_VB00T001 as decimal(15,2)) as U07_VB00T001,
cast(U08_VB00T001 as decimal(15,2)) as U08_VB00T001,
cast(U06_VB00T001 as decimal(15,2)) as U06_VB00T001,
cast(U04_UM21T001_H1 as decimal(15,2)) as U04_UM21T001_H1,
cast(U06_UM21T001_H1 as decimal(15,2)) as U06_UM21T001_H1,
cast(U06_UM22T001_H1 as decimal(15,2)) as U06_UM22T001_H1,
cast(U07_UM21T001_H1 as decimal(15,2)) as U07_UM21T001_H1,
cast(U05_UM21T001_H1 as decimal(15,2)) as U05_UM21T001_H1,
cast(U06_UM11W001_H1 as decimal(15,2)) as U06_UM11W001_H1,
cast(U06_UM21W001_H1 as decimal(15,2)) as U06_UM21W001_H1,
cast(U06_UM22W001_H1 as decimal(15,2)) as U06_UM22W001_H1,
cast(U06_UM31W001_H1 as decimal(15,2)) as U06_UM31W001_H1,
cast(U07_UM11G001_H1 as decimal(15,0)) as U07_UM11G001_H1,
cast(U07_UM21G001_H1 as decimal(15,0)) as U07_UM21G001_H1,
cast(U07_UM11W001_H1 as decimal(15,2)) as U07_UM11W001_H1,
cast(U07_UM21W001_H1 as decimal(15,2)) as U07_UM21W001_H1,
cast(U07_UM31W001_H1 as decimal(15,2)) as U07_UM31W001_H1,
cast(U05_UM11F001_H1 as decimal(15,2)) as U05_UM11F001_H1,
cast(U05_UM21F001_H1 as decimal(15,2)) as U05_UM21F001_H1,
cast(U05_UM11W001_H1 as decimal(15,2)) as U05_UM11W001_H1,
cast(U05_UM21W001_H1 as decimal(15,2)) as U05_UM21W001_H1,
cast(U05_UM31W001_H1 as decimal(15,2)) as U05_UM31W001_H1,
cast(U04_UM41F001_H1 as decimal(15,0)) as U04_UM41F001_H1,
cast(U04_UM41W001_H1 as decimal(15,2)) as U04_UM41W001_H1,
cast(U04_UM11W002_H1 as decimal(15,2)) as U04_UM11W002_H1,
cast(U05_UM11W002_H1 as decimal(15,2)) as U05_UM11W002_H1,
cast(U06_UM11W002_H1 as decimal(15,2)) as U06_UM11W002_H1,
cast(U07_UM11W002_H1 as decimal(15,2)) as U07_UM11W002_H1,
cast(U04_UM21W002_H1 as decimal(15,2)) as U04_UM21W002_H1,
cast(U05_UM21W002_H1 as decimal(15,2)) as U05_UM21W002_H1,
cast(U06_UM21W002_H1 as decimal(15,2)) as U06_UM21W002_H1,
cast(U06_UM22W002_H1 as decimal(15,2)) as U06_UM22W002_H1,
cast(U07_UM21W002_H1 as decimal(15,2)) as U07_UM21W002_H1,
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
cast(U04_UM11P001_H1 as decimal (15,2)) as U04_UM11P001_H1,
cast(U04_UM21P001_H1 as decimal (15,2)) as U04_UM21P001_H1,
cast(U05_UM11P001_H1 as decimal (15,2)) as U05_UM11P001_H1,
cast(U05_UM21P001_H1 as decimal (15,2)) as U05_UM21P001_H1,
cast(U08_UM11P001_H1 as decimal (15,2)) as U08_UM11P001_H1,
cast(U08_UM21P001_H1 as decimal (15,2)) as U08_UM21P001_H1,
cast(U07_UM11P001_H1 as decimal (15,2)) as U07_UM11P001_H1,
cast(U07_UM21P001_H1 as decimal (15,2)) as U07_UM21P001_H1,
cast(U06_UM11P001_H1 as decimal (15,2)) as U06_UM11P001_H1,
cast(U06_UM21P001_H1 as decimal (15,2)) as U06_UM21P001_H1,
/**/
/*максимально возможный небаланс*/
/* запад*/cast((cast(cast(U05_UM11F001_H1 as decimal (15,2))*U05_UM11F401 as decimal(15,2))+cast(cast(U05_UM21F001_H1 as decimal(15,2))*U05_UM21F401 as decimal(15,2))+
/*центр*/cast(cast(U04_UM11F001_H1 as decimal(15,2))*U04_UM11F401 as decimal(15,2))+cast(cast(U04_UM21F001_H1 as decimal (15,2))*U04_UM21F401 as decimal(15,2))+cast(cast(U04_UM41F001_H1 as decimal(15,2))*U04_UM41F401 as decimal(15,2))+
/*лучеса*/cast(U08_UM11F001_H1*U08_UM11F401 as decimal(15,2))+cast(U08_UM21F001_H1*U08_UM21F401 as decimal(15,2))+
/*док*/cast(cast(U06_UM11F001_H1 as decimal (15,2))*U06_UM11F401 as decimal(15,2))+cast(cast(U06_UM21F001_H1 as decimal(15,2))*U06_UM21F401 as decimal(15,2))+ cast(cast(U06_UM22F001_H1 as decimal (15,2))*U06_UM22F401 as decimal(15,2))+
/*монолит*/cast(cast(U07_UM11G001_H1 as decimal(15,2))*U07_UM11F401  as decimal(15,2))+cast(cast(U07_UM21G001_H1 as decimal)*U07_UM21F401  as decimal(15,2))
)/100  as decimal(15,2)) as MaxNb,
/*макс потери факт*/(cast(cast(U05_UM11F001_H1 as decimal(15,0))-cast(U05_UM21F001_H1 as decimal (15,0)) as decimal(15,2))+
cast(cast(U04_UM11F001_H1 as decimal(15,0))-cast(U04_UM21F001_H1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U08_UM11F001_H1 as decimal(15,0))-cast(U08_UM21F001_H1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U06_UM11F001_H1 as decimal(15,0))-cast(U06_UM21F001_H1 as decimal(15,0))-cast(U06_UM22F001_H1 as decimal(15,0))  as decimal(15,2))+
cast(cast(U07_UM11G001_H1 as decimal(15,0))-cast(U07_UM21G001_H1 as decimal(15,0)) as decimal(15,2))) as FaktNb, 
/*коэф небаланса*/
cast((cast(U04_UM41F001_H1 as decimal(15,0))-(cast(cast(U05_UM11F001_H1 as decimal(15,0))-cast(U05_UM21F001_H1 as decimal (15,0)) as decimal(15,2))+
cast(cast(U04_UM11F001_H1 as decimal(15,0))-cast(U04_UM21F001_H1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U08_UM11F001_H1 as decimal(15,0))-cast(U08_UM21F001_H1 as decimal(15,0)) as decimal(15,2))+
cast(cast(U06_UM11F001_H1 as decimal(15,0))-cast(U06_UM21F001_H1 as decimal(15,0))-cast(U06_UM22F001_H1 as decimal(15,0))  as decimal(15,2))+
cast(cast(U07_UM11G001_H1 as decimal(15,0))-cast(U07_UM21G001_H1 as decimal(15,0)) as decimal(15,2))))
/
dbo.Zero(/* запад*/cast((cast(cast(U05_UM11F001_H1 as decimal (15,2))*U05_UM11F401 as decimal(15,2))+cast(cast(U05_UM21F001_H1 as decimal(15,2))*U05_UM21F401 as decimal(15,2))+
/*центр*/cast(cast(U04_UM11F001_H1 as decimal(15,2))*U04_UM11F401 as decimal(15,2))+cast(cast(U04_UM21F001_H1 as decimal (15,2))*U04_UM21F401 as decimal(15,2))+cast(cast(U04_UM41F001_H1 as decimal(15,2))*U04_UM41F401 as decimal(15,2))+
/*лучеса*/cast(U08_UM11F001_H1*U08_UM11F401 as decimal(15,2))+cast(U08_UM21F001_H1*U08_UM21F401 as decimal(15,2))+
/*док*/cast(cast(U06_UM11F001_H1 as decimal (15,2))*U06_UM11F401 as decimal(15,2))+cast(cast(U06_UM21F001_H1 as decimal(15,2))*U06_UM21F401 as decimal(15,2))+ cast(cast(U06_UM22F001_H1 as decimal (15,2))*U06_UM22F401 as decimal(15,2))+
/*монолит*/cast(cast(U07_UM11G001_H1 as decimal(15,2))*U07_UM11F401  as decimal(15,2))+cast(cast(U07_UM21G001_H1 as decimal)*U07_UM21F401  as decimal(15,2))
)/100  as decimal(15,2))) as decimal(15,4)) as koefNb
FROM
	OpenQuery(INSQL,
	"SELECT DateTime , U04_UM11F001_H1, U04_UM21F001_H1, U04_UM11W001_H1, U04_UM21W001_H1, U04_UM31W001_H1, U06_UM11F001_H1, U06_UM21F001_H1,
	U08_UM11F001_H1,U08_UM21W002_H1,U08_UM21F001_H1,U08_UM31W001_H1,U08_UM11W001_H1, U08_UM21W001_H1, U08_UM21T001_H1,U08_UM11T001_H1,
	U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1,U08_UM11T001_H1,
	U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1, U04_UM41T001_H1, U04_VB00T001,U05_VB00T001,U07_VB00T001,U08_VB00T001,U06_VB00T001,
	U04_UM21T001_H1, U06_UM21T001_H1, U06_UM22T001_H1, U07_UM21T001_H1, U05_UM21T001_H1,
	U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1, U07_UM11G001_H1, U07_UM21G001_H1, U07_UM11W001_H1, U07_UM21W001_H1, U07_UM31W001_H1, U05_UM11F001_H1, U05_UM21F001_H1, U05_UM11W001_H1, U05_UM21W001_H1, U05_UM31W001_H1, U04_UM41F001_H1, U04_UM41W001_H1,
	U04_UM11W002_H1, U05_UM11W002_H1, U06_UM11W002_H1, U07_UM11W002_H1,
	U04_UM21W002_H1, U05_UM21W002_H1, U06_UM21W002_H1, U06_UM22W002_H1, U07_UM21W002_H1,U07_UM11P001_H1,U07_UM21P001_H1,
	U05_UM11F401,U05_UM21F401, U04_UM11F401, U04_UM21F401, U04_UM41F401, 
	U07_UM11F401, U07_UM21F401, U08_UM11F401, U08_UM21F401, 
	U06_UM11F401,U06_UM21F401, U06_UM22F401,
	U04_UM21T001_H1,U05_UM21T001_H1,U07_UM21T001_H1,U08_UM21T001_H1,U06_UM21T001_H1,U06_UM22T001_H1,
	U04_UM11P001_H1,U04_UM21P001_H1,
	U05_UM11P001_H1,U05_UM21P001_H1,
	U06_UM11P001_H1,U06_UM21P001_H1,
	U08_UM11P001_H1,U08_UM21P001_H1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'LATEST'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish") r
) t
) as N


{суточные срезы}
/*ReportName=ТС "ДОК" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
select
	DateAdd(mi, -1445, DateTime) as "Дата",
	null, 
	CAST(U06_UM11F001_S1 as decimal(15,2)) as "M ПСВ за п/с, т/ч [hint:  масса  теплоносителя по подающим  трубопроводам (счетчик)]",
	CAST(U06_UM11P001_S1 as decimal(15,2)) as "P ПСВ за п/с, абс.МПа [U06_UM11P001_S1]",
	CAST(U06_UM11T001_S1 as decimal(15,2)) as "T ПСВ за п/с, °С [U06_UM11T001_S1]",
	CAST(U06_UM11T002_S1 as decimal(15,2)) as "Tср.взв. ПСВ за п/с, °С [hint: Средневзвешенная температура прямой СВ за п/с]",
	CAST(U06_UM21F001_S1 as decimal(15,2)) as "M ОСВ1 за п/с, т/с [hint:  масса теплоносителя по обратным трубопроводам (счетчик)]",
	CAST(U06_UM21P001_S1 as decimal(15,2)) as "P ОСВ1 за п/с, абс.МПа [U06_UM21P001_S1]",
	CAST(U06_UM21T001_S1 as decimal(15,2)) as "T ОСВ1 за п/с, °С [U06_UM21T001_S1]",
	CAST(U06_UM21T002_S1 as decimal(15,2)) as "Tср.взв. ОСВ1 за п/с, °С [hint: Средневзвешенная температура обратной СВ за п/с]",
	CAST(U06_UM22F001_S1 as decimal(15,2)) as "M ОСВ2 за п/с, т/ч [hint:  масса теплоносителя по обратным трубопроводам (счетчик)]",
	CAST(U06_UM22T001_S1 as decimal(15,2)) as "T ОСВ2 за п/с, °С [U06_UM22T001_S1]",
	CAST(U06_UM22T002_S1 as decimal(15,2)) as "Tср.взв. ОСВ2 за п/с, °С [hint: Средневзвешенная температура обратной СВ за п/с]",
	CAST(U06_UM11W001_S1 as decimal(15,2)) as "Q ПСВ за п/ч, ГДж [hint: Отпущенная  теплоэнергия по подающему трубопроводу (счетчик)]",
	CAST(U06_UM21W001_S1 as decimal(15,2)) as "Q ОСВ1 за п/ч, ГДж [hint: Возвращенная теплоэнергия по обратному трубопроводу (счетчик)]",
	CAST(U06_UM22W001_S1 as decimal(15,2)) as "Q ОСВ2 за п/ч, ГДж [hint: Возвращенная теплоэнергия по обратному трубопроводу (счетчик)]",
	CAST(U06_UM31W001_S1 as decimal(15,2)) as "dQ по МАГ за п/ч, ГДж [hint: Потребленная теплоэнергия  (счетчик)]",
	CAST(U06_VB00T001_S1 as decimal(9,2)) as "Tхв за п/с, °С [U06_VB00T001_S1]",
	DkorrPr as "кор Mсум ПСВ, тонн [hint: Масса теплоносителя по подающему трубопроводу скорректир]",
	DkorrObr1 as "кор Mсум ОСВ1, тонн [hint: Масса теплоносителя по обратному трубопроводу1 скорректир]",
	DkorrObr2 as "кор Mсум ОСВ2, тонн [hint: Масса теплоносителя по обратному трубопроводу2 скорректир]",
	DPodpKorr as "кор Mсум подп, тонн[hint: Масса теплоносителя на подпитку скорректир]",
	cast(DEnergPr/1000 as decimal(15,2)) as "кор Qсум ПСВ, ГДж [hint:Отпущенная  теплоэнергия по подающим трубопроводам скоррект]",
	cast(DEnergObr1/1000 as decimal(15,2)) as "кор Qсум1 ОСВ, ГДж [hint: Отпущенная  теплоэнергия по обратнному трубопроводу1 скоррект]",
	cast(DEnergObr2/1000 as decimal(15,2)) as "кор Qсум2 ОСВ, ГДж[hint: Отпущенная  теплоэнергия по обратнному трубопроводу2 скоррект]",
	cast(DEnergPodp/1000 as decimal(15,2)) as "кор Qсум подп, ГДж[hint: Отпущенная теплоэнергия с подпиткой скоррект]",
	DEnergItog as "кор dQсум,ГДж [hint: Суммарная потребленная теплоэнергия по магистралям скоррект]",
	cast(DEnergItog/4.187 as decimal(15,0)) as "кор dQсум,Гкал[hint: Суммарная потребленная теплоэнергия по магистралям скоррект]"
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
SELECT  
/*общие*/
DateTime,
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
cast(U04_UM11P001_S1 as decimal (15,2)) as U04_UM11P001_S1,
cast(U04_UM21P001_S1 as decimal (15,2)) as U04_UM21P001_S1,
cast(U05_UM11P001_S1 as decimal (15,2)) as U05_UM11P001_S1,
cast(U05_UM21P001_S1 as decimal (15,2)) as U05_UM21P001_S1,
cast(U08_UM11P001_S1 as decimal (15,2)) as U08_UM11P001_S1,
cast(U08_UM21P001_S1 as decimal (15,2)) as U08_UM21P001_S1,
cast(U06_UM11P001_S1 as decimal (15,2)) as U06_UM11P001_S1,
cast(U06_UM21P001_S1 as decimal (15,2)) as U06_UM21P001_S1,
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
FROM ( SELECT  
		DateTime, 
		ISNULL(CASE WHEN ABS (U04_UM11W001_S1) > 1000000 THEN 0 ELSE U04_UM11W001_S1 END, 0) as U04_UM11W001_S1,
		ISNULL(CASE WHEN ABS (U04_UM21W001_S1) > 1000000 THEN 0 ELSE U04_UM21W001_S1 END, 0) as U04_UM21W001_S1,
		ISNULL(CASE WHEN ABS (U04_UM31W001_S1) > 1000000 THEN 0 ELSE U04_UM31W001_S1 END, 0) as U04_UM31W001_S1,
		ISNULL(CASE WHEN ABS (U04_UM41W001_S1) > 1000000 THEN 0 ELSE U04_UM41W001_S1 END, 0) as U04_UM41W001_S1,
		ISNULL(CASE WHEN ABS (U06_UM31W001_S1) > 1000000 THEN 0 ELSE U06_UM31W001_S1 END, 0) as U06_UM31W001_S1,
		U04_UM11F001_S1, U04_UM21F001_S1, U06_UM11F001_S1, U06_UM21F001_S1,
	U08_UM11F001_S1,U08_UM21W002_S1,U08_UM21F001_S1,U08_UM31W001_S1,U08_UM11W001_S1, U08_UM21W001_S1, U08_UM21T001_S1,U08_UM11T001_S1,
	U04_UM11T002_S1, U06_UM11T002_S1, U07_UM11T002_S1, U05_UM11T002_S1,U08_UM11T002_S1,
	U04_UM11T001_S1, U06_UM11T001_S1, U07_UM11T001_S1, U05_UM11T001_S1, U04_UM41T001_S1, U04_VB01T001_S1,U05_VB01T001_S1,U07_VB01T001_S1,U08_VB00T001_S1,U06_VB00T001_S1,
	U04_UM21T001_S1, U06_UM21T001_S1, U06_UM22T001_S1, U07_UM21T001_S1, U05_UM21T001_S1,
	U06_UM22F001_S1, U06_UM11W001_S1, U06_UM21W001_S1, U06_UM22W001_S1, U07_UM11G001_S1, U07_UM21G001_S1, U07_UM11W001_S1, U07_UM21W001_S1, U07_UM31W001_S1, U05_UM11F001_S1, U05_UM21F001_S1, U05_UM11W001_S1, U05_UM21W001_S1, U05_UM31W001_S1, U04_UM41F001_S1,
	U04_UM11W002_S1, U05_UM11W002_S1, U06_UM11W002_S1, U07_UM11W002_S1,
	U04_UM21W002_S1, U05_UM21W002_S1, U06_UM21W002_S1, U06_UM22W002_S1, U07_UM21W002_S1,
	U05_UM11F401,U05_UM21F401, U04_UM11F401, U04_UM21F401, U04_UM41F401, 
	U07_UM11F401, U07_UM21F401, U08_UM11F401, U08_UM21F401, 
	U06_UM11F401,U06_UM21F401, U06_UM22F401,
	U04_UM21T002_S1,U05_UM21T002_S1,U07_UM21T002_S1,U08_UM21T002_S1,U06_UM21T002_S1,U06_UM22T002_S1,
	U04_UM11P001_S1,U04_UM21P001_S1,
	U05_UM11P001_S1,U05_UM21P001_S1,
	U06_UM11P001_S1,U06_UM21P001_S1,
	U08_UM11P001_S1,U08_UM21P001_S1
FROM OpenQuery(INSQL,
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
	U04_UM21T002_S1,U05_UM21T002_S1,U07_UM21T002_S1,U08_UM21T002_S1,U06_UM21T002_S1,U06_UM22T002_S1,
	U04_UM11P001_S1,U04_UM21P001_S1,
	U05_UM11P001_S1,U05_UM21P001_S1,
	U06_UM11P001_S1,U06_UM21P001_S1,
	U08_UM11P001_S1,U08_UM21P001_S1
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'LATEST'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish") as raw
) r
) t
) as N