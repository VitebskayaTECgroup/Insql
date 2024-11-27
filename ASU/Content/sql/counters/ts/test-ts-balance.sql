{часовые срезы}
/*ReportName=ТС Баланс тест*/
/*Mode=часовые-1*/
/*UpQuery="суточные срезы"*/

SET QUOTED_IDENTIFIER OFF
/*здесь писать что должны получить в отчете*/
select
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
CAST(U04_UM11F001_H1+U06_UM11F001_H1+U07_UM11G001_H1+U05_UM11F001_H1+U08_UM11F001_H1 as decimal(15,2)) as "G сум ПСВ за п/c, т/сут [hint: Масса ПСВ Центр+Док+запад+ВЗРД+Лучеса]",
CAST(dbo.vst_SafeDIV((U04_UM11F001_H1*U04_UM11T001_H1+U06_UM11F001_H1*U06_UM11T001_H1+U07_UM11G001_H1*U07_UM11T001_H1+U05_UM11F001_H1*U05_UM11T001_H1),(U04_UM11F001_H1+U06_UM11F001_H1+U07_UM11G001_H1+U05_UM11F001_H1)) as decimal(15,2)) as "T ср/взв ПСВ за п/c, °С [hint: Температура средневзвешенная ПСВ Центр+Док+запад+ВЗРД+Лучеса]",
CAST(U04_UM21F001_H1+U06_UM21F001_H1+U06_UM22F001_H1+U07_UM21G001_H1+U05_UM21F001_H1+U08_UM21F001_H1 as decimal(15,2)) as "G сум ОСВ за п/с, т/сут [hint: Масса ОСВ Центр+Док+запад+ВЗРД+Лучеса]",
CAST(dbo.vst_SafeDIV((U04_UM21F001_H1*U04_UM21T001_H1+U06_UM21F001_H1*U06_UM21T001_H1+U06_UM22F001_H1*U06_UM22T001_H1+U07_UM21G001_H1*U07_UM21T001_H1+U05_UM21F001_H1*U05_UM21T001_H1),(U04_UM21F001_H1+U06_UM21F001_H1+U06_UM22F001_H1+U07_UM21G001_H1+U05_UM21F001_H1)) as decimal(15,2)) as "T ср/взв ОСВ за п/c, °С [hint: Температура средневзвешенная ОСВ Центр+Док+запад+ВЗРД+Лучеса]",
CAST(U04_UM11W001_H1+U06_UM11W001_H1+U07_UM11W001_H1+U05_UM11W001_H1+U08_UM11W001_H1 as decimal(15,2)) as "W сум ПСВ за п/с, ГДж [hint: Энергия ПСВ Центр+Док+запад+ВЗРД+Лучеса]",
/*10*/CAST(U04_UM21W001_H1+U06_UM21W001_H1+U06_UM22W001_H1+U07_UM21W001_H1+U05_UM21W001_H1+U08_UM21W001_H1 as decimal(15,2)) as "W сум ОСВ за п/с, ГДж [hint: Энергия ОСВ Центр+Док+запад+ВЗРД+Лучеса]",
/*11*/CAST(U04_UM31W001_H1+U06_UM31W001_H1+U07_UM31W001_H1+U05_UM31W001_H1+U08_UM31W001_H1 as decimal(15,2)) as "dW сум по маг. за п/с, ГДж [hint: Энергия по магистралям Центр+Док+запад+ВЗРД+Лучеса]",
/*12*/CAST(U04_UM41W001_H1 as decimal(15,2)) as "W Подп.ТС за п/с, ГДж [U04_UM41W001_H1]",
/*13*/CAST(U04_VB00T001 as decimal(15,2)) as "Tхв за п/с, °С [U04_VB00T001]",
/*7*/CAST(U04_UM41F001_H1 as decimal(15,2)) as "G Подп.ТС за п/с, т/сут [U04_UM41F001_H1]",
/*8*/CAST(U04_UM41T001_H1 as decimal(15,2)) as "T Потп.ТС за п/с, °С [U04_UM41T001_H1]",

isnull(maxnb,0) as "Max нб, [hint: максимально возможный небаланс]",
isnull(faktNb,0) as "М_потерь тонн, [hint: тонн фактические сумарные потери, тонн]",
isnull(koefnb,0) as "Кнеб=(Мпод-Мпотерь)/ Мнб max, %[hint: Коэффициент небаланса]",
isnull(summpodd,0) as "кор Mсум ПСВ, тонн [hint: Сумма ПСВ, корректированная]",
isnull(summobr,0) as "кор Mсум ОСВ, тонн [hint: сумма ОСВ, корректированная]",
isnull(sumpodpkorr,0) as "кор Mподп, тонн [hint: Подпитка, корректированная]",
cast(isnull(SumEnerPr,0)/1000 as decimal(15,2)) as "кор Qсум ПСВ,ГДж[hint: Энергия по подающим трубопроводам]",
cast(isnull(SumObrEnerg,0)/1000 as decimal(15,2)) as "кор Qсум ОСВ,ГДж [hint:[hint: Энергия по обратным трубопроводам]",
cast(isnull(SumEnergPodp,0)/1000 as decimal(15,2)) as "кор Qсум подп,ГДж [hint: Энергия отпущенная с подпиткой]",
cast(isnull(CenergItog,0) as decimal(15,0))+cast(ZenergItog as decimal(15,0))+cast(MenergItog as decimal(15,0))+cast(LenergItog as decimal(15,0))+cast(DenergItog as decimal(15,0)) as "кор dQсум,ГДж [hint:Суммарная потребленная теплоэнергия по магистралям скоррект]",
cast(isnull(CenergItog,0)/4.187 as decimal(15,0)) as "энергия центральная",
cast(isnull(ZenergItog,0)/4.187 as decimal(15,0)) As "энергия западная",
cast(isnull(MenergItog,0)/4.187 as decimal(15,0)) As "энергия монолит",
cast(isnull(LenergItog,0)/4.187 as decimal(15,0)) As "энергия лучеса",
cast(isnull(DenergItog,0)/4.187 as decimal(15,0)) As "энергия ДОК",
cast((cast(isnull(CenergItog,0)/4.187 as decimal(15,0))+cast(isnull(ZenergItog,0)/4.187 as decimal(15,0))+cast(isnull(MenergItog,0)/4.187 as decimal(15,0))+cast(isnull(LenergItog,0)/4.187 as decimal(15,0))+cast(isnull(DenergItog,0)/4.187 as decimal(15,0))) as decimal(15,0)) as "кор dQсум,Гкал[hint:Суммарная потребленная теплоэнергия по магистралям скоррект]"
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
SELECT DateTime, 
/*общие*/
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
cast(U04_UM21T001_H1 as decimal(15,2)) as U04_UM21T001_H1,
cast(U05_UM21T001_H1 as decimal(15,2)) as U05_UM21T001_H1,
cast(U07_UM21T001_H1 as decimal(15,2)) as U07_UM21T001_H1,
cast(U06_UM21T001_H1 as decimal(15,2)) as U06_UM21T001_H1,
cast(U06_UM22T001_H1 as decimal(15,2)) as U06_UM22T001_H1,
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
cast(cast(U07_UM11G001_H1 as decimal(15,0))-cast(U07_UM21G001_H1 as decimal(15,0)) as decimal(15,2))))/
dbo.Zero(/* запад*/cast((cast(cast(U05_UM11F001_H1 as decimal (15,2))*U05_UM11F401 as decimal(15,2))+cast(cast(U05_UM21F001_H1 as decimal(15,2))*U05_UM21F401 as decimal(15,2))+
/*центр*/cast(cast(U04_UM11F001_H1 as decimal(15,2))*U04_UM11F401 as decimal(15,2))+cast(cast(U04_UM21F001_H1 as decimal (15,2))*U04_UM21F401 as decimal(15,2))+cast(cast(U04_UM41F001_H1 as decimal(15,2))*U04_UM41F401 as decimal(15,2))+
/*лучеса*/cast(U08_UM11F001_H1*U08_UM11F401 as decimal(15,2))+cast(U08_UM21F001_H1*U08_UM21F401 as decimal(15,2))+
/*док*/cast(cast(U06_UM11F001_H1 as decimal (15,2))*U06_UM11F401 as decimal(15,2))+cast(cast(U06_UM21F001_H1 as decimal(15,2))*U06_UM21F401 as decimal(15,2))+ cast(cast(U06_UM22F001_H1 as decimal (15,2))*U06_UM22F401 as decimal(15,2))+
/*монолит*/cast(cast(U07_UM11G001_H1 as decimal(15,2))*U07_UM11F401  as decimal(15,2))+cast(cast(U07_UM21G001_H1 as decimal)*U07_UM21F401  as decimal(15,2))
)/100  as decimal(15,2))) as decimal(15,4)) as koefNb
FROM
	OpenQuery(INSQL,
"SELECT  DateTime , U04_UM11F001_H1, U04_UM21F001_H1, U04_UM11W001_H1, U04_UM21W001_H1, U04_UM31W001_H1, U06_UM11F001_H1, U06_UM21F001_H1,
U08_UM11F001_H1,U08_UM21W002_H1,U08_UM21F001_H1,U08_UM31W001_H1,U08_UM11W001_H1, U08_UM21W001_H1, U08_UM21T001_H1,U08_UM11T001_H1,
U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1,U08_UM11T001_H1,
U04_UM11T001_H1, U06_UM11T001_H1, U07_UM11T001_H1, U05_UM11T001_H1, U04_UM41T001_H1, U04_VB00T001,U05_VB00T001,U07_VB00T001,U08_VB00T001,U06_VB00T001,
U04_UM21T001_H1, U06_UM21T001_H1, U06_UM22T001_H1, U07_UM21T001_H1, U05_UM21T001_H1,
U06_UM22F001_H1, U06_UM11W001_H1, U06_UM21W001_H1, U06_UM22W001_H1, U06_UM31W001_H1, U07_UM11G001_H1, U07_UM21G001_H1, U07_UM11W001_H1, U07_UM21W001_H1, U07_UM31W001_H1, U05_UM11F001_H1, U05_UM21F001_H1, U05_UM11W001_H1, U05_UM21W001_H1, U05_UM31W001_H1, U04_UM41F001_H1, U04_UM41W001_H1,
U04_UM11W002_H1, U05_UM11W002_H1, U06_UM11W002_H1, U07_UM11W002_H1,
U04_UM21W002_H1, U05_UM21W002_H1, U06_UM21W002_H1, U06_UM22W002_H1, U07_UM21W002_H1,
U05_UM11F401,U05_UM21F401, U04_UM11F401, U04_UM21F401, U04_UM41F401, 
U07_UM11F401, U07_UM21F401, U08_UM11F401, U08_UM21F401, 
U06_UM11F401,U06_UM21F401, U06_UM22F401,
U04_UM21T001_H1,U05_UM21T001_H1,U07_UM21T001_H1,U08_UM21T001_H1,U06_UM21T001_H1,U06_UM22T001_H1
 FROM Runtime.dbo.AnalogWideHistory 
WHERE wwVersion = 'LATEST'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
AND wwResolution = @resolution ") r 
) t
) as N



{суточные срезы}
/*ReportName="БАЛАНС - ТЕПЛОСЕТЬ" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="часовые срезы"*/

SET QUOTED_IDENTIFIER OFF
/*здесь писать что должны получить в отчете*/
SELECT	
	DateAdd(mi, -1445, DateTime) as "Дата",	
	null, 
	/*2*/
	CAST(U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1+U08_UM11F001_S1 as decimal(15,2)) as "M сум ПСВ за п/c, т/сут [hint: Суммарная масса теплоносителя по подающим  трубопроводам (счетчик)]",
	/*3*/
	CAST(dbo.vst_SafeDIV((U04_UM11F001_S1*U04_UM11T001_S1+U06_UM11F001_S1*U06_UM11T001_S1+U07_UM11G001_S1*U07_UM11T001_S1+U05_UM11F001_S1*U05_UM11T001_S1),(U04_UM11F001_S1+U06_UM11F001_S1+U07_UM11G001_S1+U05_UM11F001_S1)) as decimal(15,2)) as "T ср/взв ПСВ за п/c, °С [hint: Температура средневзвешенная ПСВ ]",
	/*4*/
	CAST(U04_UM21F001_S1+U06_UM21F001_S1+U06_UM22F001_S1+U07_UM21G001_S1+U05_UM21F001_S1+U08_UM21F001_S1  as decimal(15,2)) as "М сум ОСВ за п/с, т/сут [hint: Суммарная масса теплоносителя по обратным трубопроводам (счетчик)]",
	/*5*/
	CAST(dbo.vst_SafeDIV((isnull(U04_UM21F001_S1,0)*isnull(U04_UM21T001_S1,0)+isnull(U06_UM21F001_S1,0)*isnull(U06_UM21T001_S1,0)+isnull(U06_UM22F001_S1,0)*isnull(U06_UM22T001_S1,0)+isnull(U07_UM21G001_S1,0)*isnull(U07_UM21T001_S1,0)+isnull(U05_UM21F001_S1,0)*isnull(U05_UM21T001_S1,0)),(U04_UM21F001_S1+U06_UM21F001_S1+U06_UM22F001_S1+U07_UM21G001_S1+U05_UM21F001_S1)) as decimal(15,2)) as "T ср/взв ОСВ за п/c, °С [hint: Температура средневзвешенная ОСВ ]",

CAST(U04_UM11W001_S1+U06_UM11W001_S1+U07_UM11W001_S1+U05_UM11W001_S1+U08_UM11W001_S1 as decimal(15,2)) as "Q сум ПСВ за п/с, ГДж [hint: Суммарная отпущенная  теплоэнергия по подающим трубопроводам (счетчик)]",

/*10*/CAST(U04_UM21W001_S1+U06_UM21W001_S1+U06_UM22W001_S1+U07_UM21W001_S1+U05_UM21W001_S1+U08_UM21W001_S1 as decimal(15,2)) as "Q сум ОСВ за п/с, ГДж [hint: Суммарная  возвращенная теплоэнергия по обратным трубопроводам (счетчик)]",

/*11*/CAST(U04_UM31W001_S1+U06_UM31W001_S1+U07_UM31W001_S1+U05_UM31W001_S1+U08_UM31W001_S1 as decimal(15,2)) as "dQ сум по маг. за п/с, ГДж [hint: Суммарная  потребленная теплоэнергия по магистралям]",

/*12*/CAST(U04_UM41W001_S1 as decimal(15,2)) as "Q Подп.ТС за п/с, ГДж [U04_UM41W001_S1]",

/*13*/CAST(U04_VB01T001_S1 as decimal(15,2)) as "Tхв за п/с, °С [U04_VB01T001_S1]",

/*7*/CAST(U04_UM41F001_S1 as decimal(15,2)) as "M Подп.ТС за п/с, т/сут [U04_UM41F001_S1] [hint: Масса  израсходованного теплоносителя на подпитку ( счеткик)]",

/*8*/CAST(U04_UM41T001_S1 as decimal(15,2)) as "T Потп.ТС за п/с, °С [U04_UM41T001_S1]",

isnull(maxnb,0) as "Max нб, [hint: максимально возможный небаланс]",

isnull(faktNb,0) as "М_потерь тонн, [hint: тонн фактические сумарные потери, тонн]",

isnull(koefnb,0) as "Кнеб=(Мпод-Мпотерь)/ Мнб max, %[hint: Коэффициент небаланса]",

isnull(summpodd,0) as "кор Mсум ПСВ, тонн [hint: Суммарная масса теплоносителя по подающим трубопроводам скорректир]",

isnull(summobr,0) as "кор Mсум ОСВ, тонн [hint: Суммарная масса теплоносителя по обратным трубопроводам скорректир]",

isnull(sumpodpkorr,0) as "кор Mподп, тонн [hint: Масса израсходованного теплоносителя на подпитку скорректир]",

cast(isnull(SumEnerPr,0)/1000 as decimal(15,2)) as "кор Qсум ПСВ,ГДж[hint: Суммарная отпущенная теплоэнергия по подающим трубопроводам скоррект]",

cast(isnull(SumObrEnerg,0)/1000 as decimal(15,2)) as "кор Qсум ОСВ,ГДж [hint: Суммарная возвращенная теплоэнергия по обратным трубопроводам скоррект]",

cast(isnull(SumEnergPodp,0)/1000 as decimal(15,2)) as "кор Qсум подп,ГДж [hint: Отпущенная теплоэнергия с подпиткой скоррект]",

cast(isnull(CenergItog,0) as decimal(15,0))+cast(ZenergItog as decimal(15,0))+cast(MenergItog as decimal(15,0))+cast(LenergItog as decimal(15,0))+cast(DenergItog as decimal(15,0)) as "кор dQсум,ГДж [hint:Суммарная потребленная теплоэнергия по магистралям скоррект]",

cast(isnull(CenergItog,0)/4.187 as decimal(15,0)) as "энергия центральная [hint:]",

cast(isnull(ZenergItog,0)/4.187 as decimal(15,0)) As "энергия западная [hint:]",

cast(isnull(MenergItog,0)/4.187 as decimal(15,0)) As "энергия монолит [hint:]",

cast(isnull(LenergItog,0)/4.187 as decimal(15,0)) As "энергия лучеса [hint:]",

cast(isnull(DenergItog,0)/4.187 as decimal(15,0)) As "энергия ДОК [hint:]",

cast((cast(isnull(CenergItog,0)/4.187 as decimal(15,0))+cast(isnull(ZenergItog,0)/4.187 as decimal(15,0))+cast(isnull(MenergItog,0)/4.187 as decimal(15,0))+cast(isnull(LenergItog,0)/4.187 as decimal(15,0))+cast(isnull(DenergItog,0)/4.187 as decimal(15,0))) as decimal(15,0)) as "кор dQсум,Гкал[hint:Суммарная потребленная теплоэнергия по магистралям скоррект]"

from
(
select 
/**/t.*,
cast(isnull(U04_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U04_UM11F001_S1,0)*isnull(U04_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0)) as CkorrPr,
cast(isnull(U04_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM21F001_S1,0)*isnull(U04_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)) as CkorrObr,
cast(isnull(U04_UM41F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM41F001_S1,0)*isnull(U04_UM41F401,0)/100 as decimal(15,2)) as decimal (15,0)) as CkorrPodp,
cast(isnull(U05_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U05_UM11F001_S1,0)*isnull(U05_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0)) as ZkorrPr,
cast(isnull(U05_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U05_UM21F001_S1,0)*isnull(U05_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)) as ZkorrObr,
cast(isnull(U07_UM11G001_s1,0)+cast(isnull(koefNb,0)*isnull(U07_UM11G001_S1,0)*isnull(U07_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0)) as MkorrPr,
cast(isnull(U07_UM21G001_s1,0)-cast(isnull(koefNb,0)*isnull(U07_UM21G001_S1,0)*isnull(U07_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) as MkorrObr,
cast(isnull(U08_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U08_UM11F001_S1,0)*isnull(U08_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0)) as LkorrPr,
cast(isnull(U08_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U08_UM21F001_S1,0)*isnull(U08_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) as LkorrObr,
cast(isnull(U06_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U06_UM11F001_S1,0)*isnull(U06_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0)) as DkorrPr,
cast(isnull(U06_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM21F001_S1,0)*isnull(U06_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr1,
cast(isnull(U06_UM22F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM22F001_S1,0)*isnull(U06_UM22F401,0)/100 as decimal (15,2)) as decimal (15,0)) as DkorrObr2,
/**/
cast(isnull(U04_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U04_UM11F001_S1,0)*isnull(U04_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))+
cast(isnull(U05_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U05_UM11F001_S1,0)*isnull(U05_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))+
cast(isnull(U07_UM11G001_s1,0)+cast(isnull(koefNb,0)*isnull(U07_UM11G001_S1,0)*isnull(U07_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))+
cast(isnull(U08_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U08_UM11F001_S1,0)*isnull(U08_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))+
cast(isnull(U06_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U06_UM11F001_S1,0)*isnull(U06_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))
as SummPodd,
/**/
cast(isnull(U04_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM21F001_S1,0)*isnull(U04_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0))+
cast(isnull(U05_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U05_UM21F001_S1,0)*isnull(U05_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0))+
cast(isnull(U07_UM21G001_s1,0)-cast(isnull(koefNb,0)*isnull(U07_UM21G001_S1,0)*isnull(U07_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))+
cast(isnull(U08_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U08_UM21F001_S1,0)*isnull(U08_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))+
cast(isnull(U06_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM21F001_S1,0)*isnull(U06_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))+
cast(isnull(U06_UM22F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM22F001_S1,0)*isnull(U06_UM22F401,0)/100 as decimal (15,2)) as decimal (15,0))
as SummObr,
/*подпитки скорректированные*/
cast(isnull(U04_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U04_UM11F001_S1,0)*isnull(U04_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U04_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM21F001_S1,0)*isnull(U04_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)) As CPodpKorr,
cast(isnull(U05_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U05_UM11F001_S1,0)*isnull(U05_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U05_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U05_UM21F001_S1,0)*isnull(U05_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)) As ZPodpKorr,
cast(isnull(U07_UM11G001_s1,0)+cast(isnull(koefNb,0)*isnull(U07_UM11G001_S1,0)*isnull(U07_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U07_UM21G001_s1,0)-cast(isnull(koefNb,0)*isnull(U07_UM21G001_S1,0)*isnull(U07_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) As MPodpKorr,
cast(isnull(U08_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U08_UM11F001_S1,0)*isnull(U08_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))-cast(isnull(U08_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U08_UM21F001_S1,0)*isnull(U08_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) As LPodpKorr,
cast(isnull(U06_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U06_UM11F001_S1,0)*isnull(U06_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))-
cast(isnull(U06_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM21F001_S1,0)*isnull(U06_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))-
cast(isnull(U06_UM22F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM22F001_S1,0)*isnull(U06_UM22F401,0)/100 as decimal (15,2)) as decimal (15,0)) As DPodpKorr,
/*мподп скорректировн, определяем как сумму всех подпиток(тогда все сходится), можно посчитать по формулам (CkorPodp) но тогда надо увеличить точность вычислений */
cast(isnull(U04_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U04_UM11F001_S1,0)*isnull(U04_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U04_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM21F001_S1,0)*isnull(U04_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0))+
cast(isnull(U05_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U05_UM11F001_S1,0)*isnull(U05_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U05_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U05_UM21F001_S1,0)*isnull(U05_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)) +
cast(isnull(U07_UM11G001_s1,0)+cast(isnull(koefNb,0)*isnull(U07_UM11G001_S1,0)*isnull(U07_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U07_UM21G001_s1,0)-cast(isnull(koefNb,0)*isnull(U07_UM21G001_S1,0)*isnull(U07_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) +
cast(isnull(U08_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U08_UM11F001_S1,0)*isnull(U08_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))-cast(isnull(U08_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U08_UM21F001_S1,0)*isnull(U08_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)) +
cast(isnull(U06_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U06_UM11F001_S1,0)*isnull(U06_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))-
cast(isnull(U06_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM21F001_S1,0)*isnull(U06_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))-
cast(isnull(U06_UM22F001_s1,0)-cast(isnull(koefNb,0)*isnull(U06_UM22F001_S1,0)*isnull(U06_UM22F401,0)/100 as decimal (15,2)) as decimal (15,0))
 as SumPodpKorr,
/*энтальпии прямой*/
/*может понадобится заменить U04_UM11T002_S1 на U04_UM11T001_S1 уточнить...*/
cast(dbo.vst_SafeDIV(isnull(u04_um11w001_s1,0),isnull(u04_um11F001_s1,0))*1000/1+isnull(U04_VB01T001_S1,0) as decimal(15,2)) as CEntPr,
cast(dbo.vst_SafeDIV(isnull(u05_um11w001_s1,0),isnull(u05_um11F001_s1,0))*1000/1+isnull(U05_VB01T001_S1,0) as decimal(15,2)) as ZEntPr,
cast(dbo.vst_SafeDIV(isnull(u07_um11w001_s1,0),isnull(u07_um11G001_s1,0))*1000/1+isnull(U07_VB01T001_S1,0) as decimal(15,2)) as MEntPr,
cast(dbo.vst_SafeDIV(isnull(u08_um11w001_s1,0),isnull(u08_um11F001_s1,0))*1000/1+isnull(U08_VB00T001_S1,0) as decimal(15,2)) as LEntPr,
cast(dbo.vst_SafeDIV(isnull(u06_um11w001_s1,0),isnull(u06_um11F001_s1,0))*1000/1+isnull(U06_VB00T001_S1,0) as decimal(15,2)) as DEntPr,
/*энтальпии обратной*/
cast(dbo.vst_SafeDIV(isnull(u04_um21w001_s1,0),isnull(u04_um21F001_s1,0))*1000/1+isnull(U04_VB01T001_S1,0) as decimal(15,2)) as CEntObr,
cast(dbo.vst_SafeDIV(isnull(u05_um21w001_s1,0),isnull(u05_um21F001_s1,0))*1000/1+isnull(U05_VB01T001_S1,0) as decimal(15,2)) as ZEntObr,
cast(dbo.vst_SafeDIV(isnull(u07_um21w001_s1,0),isnull(u07_um21G001_s1,0))*1000/1+isnull(U07_VB01T001_S1,0) as decimal(15,2)) as MEntObr,
cast(dbo.vst_SafeDIV(isnull(u08_um21w001_s1,0),isnull(u08_um21F001_s1,0))*1000/1+isnull(U08_VB00T001_S1,0) as decimal(15,2)) as LEntObr,
cast(dbo.vst_SafeDIV(isnull(u06_um21w001_s1,0),isnull(u06_um21F001_s1,0))*1000/1+isnull(U06_VB00T001_S1,0) as decimal(15,2)) as DEntObr1,
cast(dbo.vst_SafeDIV(isnull(u06_um22w001_s1,0),isnull(u06_um22F001_s1,0))*1000/1+isnull(U06_VB00T001_S1,0) as decimal(15,2)) as DEntObr2,
/*поправки для энтальпии прямой*/
(dbo.vst_SafeDIV(isnull(u04_um11w001_s1,0),isnull(u04_um11F001_s1,0))*1000/1+isnull(U04_VB01T001_S1,0))-isnull(U04_UM11T002_S1,0) as CpoprPr,
(dbo.vst_SafeDIV(isnull(u05_um11w001_s1,0),isnull(u05_um11F001_s1,0))*1000/1+isnull(U05_VB01T001_S1,0))-isnull(U05_UM11T002_S1,0) as ZpoprPr,
(dbo.vst_SafeDIV(isnull(u07_um11w001_s1,0),isnull(u07_um11G001_s1,0))*1000/1+isnull(U07_VB01T001_S1,0))-isnull(U07_UM11T002_S1,0) as MpoprPr,
(dbo.vst_SafeDIV(isnull(u08_um11w001_s1,0),isnull(u08_um11F001_s1,0))*1000/1+isnull(U08_VB00T001_S1,0))-isnull(U08_UM11T002_S1,0) as LpoprPr,
(dbo.vst_SafeDIV(isnull(u06_um11w001_s1,0),isnull(u06_um11F001_s1,0))*1000/1+isnull(U06_VB00T001_S1,0))-isnull(U06_UM11T002_S1,0) as DpoprPr,
/*поправки для энтальпии обратной*/
(dbo.vst_SafeDIV(isnull(u04_um21w001_s1,0),isnull(u04_um21F001_s1,0))*1000/1+isnull(U04_VB01T001_S1,0))-isnull(U04_UM21T002_S1,0) as CpoprObr,
(dbo.vst_SafeDIV(isnull(u05_um21w001_s1,0),isnull(u05_um21F001_s1,0))*1000/1+isnull(U05_VB01T001_S1,0))-isnull(U05_UM21T002_S1,0) as ZpoprObr,
(dbo.vst_SafeDIV(isnull(u07_um21w001_s1,0),isnull(u07_um21G001_s1,0))*1000/1+isnull(U07_VB01T001_S1,0))-isnull(U07_UM21T002_S1,0) as MpoprObr,
(dbo.vst_SafeDIV(isnull(u08_um21w001_s1,0),isnull(u08_um21F001_s1,0))*1000/1+isnull(U08_VB00T001_S1,0))-isnull(U08_UM21T002_S1,0) as LpoprObr,
(dbo.vst_SafeDIV(isnull(u06_um21w001_s1,0),isnull(u06_um21F001_s1,0))*1000/1+isnull(U06_VB00T001_S1,0))-isnull(U06_UM21T002_S1,0) as DpoprObr1,
(dbo.vst_SafeDIV(isnull(u06_um22w001_s1,0),isnull(u06_um22F001_s1,0))*1000/1+isnull(U06_VB00T001_S1,0))-isnull(U06_UM22T002_S1,0) as DpoprObr2,
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
((cast(isnull(U04_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U04_UM11F001_S1,0)*isnull(U04_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u04_um11w001_s1,0),isnull(u04_um11F001_s1,0))*1000/1+isnull(U04_VB01T001_S1,0) as decimal(15,2)),0))-
(cast(isnull(U04_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM21F001_S1,0)*isnull(U04_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u04_um21w001_s1,0),isnull(u04_um21F001_s1,0))*1000/1+isnull(U04_VB01T001_S1,0) as decimal(15,2)),0))-
((cast(isnull(U04_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U04_UM11F001_S1,0)*isnull(U04_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U04_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U04_UM21F001_S1,0)*isnull(U04_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)))*(isnull(U04_VB01T001_S1,0))))/1000 as decimal(15,0)) as CenergItog,

cast((cast(isnull(U05_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U05_UM11F001_S1,0)*isnull(U05_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u05_um11w001_s1,0),isnull(u05_um11F001_s1,0))*1000/1+isnull(U05_VB01T001_S1,0) as decimal(15,2)),0)-
cast(isnull(U05_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U05_UM21F001_S1,0)*isnull(U05_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u05_um21w001_s1,0),isnull(u05_um21F001_s1,0))*1000/1+isnull(U05_VB01T001_S1,0) as decimal(15,2)),0)-
(cast(isnull(U05_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U05_UM11F001_S1,0)*isnull(U05_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U05_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U05_UM21F001_S1,0)*isnull(U05_UM21F401,0)/100 as decimal(15,2)) as decimal (15,0)))*(isnull(U05_VB01T001_S1,0)))/1000 as decimal(15,0))
as ZenergItog,

cast((cast(isnull(U07_UM11G001_s1,0)+cast(isnull(koefNb,0)*isnull(U07_UM11G001_S1,0)*isnull(U07_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u07_um11w001_s1,0),isnull(u07_um11G001_s1,0))*1000/1+isnull(U07_VB01T001_S1,0) as decimal(15,2)),0)-
cast(isnull(U07_UM21G001_s1,0)-cast(isnull(koefNb,0)*isnull(U07_UM21G001_S1,0)*isnull(U07_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u07_um21w001_s1,0),isnull(u07_um21G001_s1,0))*1000/1+isnull(U07_VB01T001_S1,0) as decimal(15,2)),0)-
(cast(isnull(U07_UM11G001_s1,0)+cast(isnull(koefNb,0)*isnull(U07_UM11G001_S1,0)*isnull(U07_UM11F401,0)/100 as decimal(15,2)) as decimal (15,0))-cast(isnull(U07_UM21G001_s1,0)-cast(isnull(koefNb,0)*isnull(U07_UM21G001_S1,0)*isnull(U07_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)))*(isnull(U07_VB01T001_S1,0)))/1000 as decimal(15,0)) as MenergItog,

cast((cast(isnull(U08_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U08_UM11F001_S1,0)*isnull(U08_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u08_um11w001_s1,0),isnull(u08_um11F001_s1,0))*1000/1+isnull(U08_VB00T001_S1,0) as decimal(15,2)),0)-
cast(isnull(U08_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U08_UM21F001_S1,0)*isnull(U08_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0))*isnull(cast(dbo.vst_SafeDIV(isnull(u08_um21w001_s1,0),isnull(u08_um21F001_s1,0))*1000/1+isnull(U08_VB00T001_S1,0) as decimal(15,2)),0)-
(cast(isnull(U08_UM11F001_s1,0)+cast(isnull(koefNb,0)*isnull(U08_UM11F001_S1,0)*isnull(U08_UM11F401,0)/100 as decimal (15,2)) as decimal (15,0))-cast(isnull(U08_UM21F001_s1,0)-cast(isnull(koefNb,0)*isnull(U08_UM21F001_S1,0)*isnull(U08_UM21F401,0)/100 as decimal (15,2)) as decimal (15,0)))*(isnull(U08_VB00T001_S1,0)))/1000 as decimal(15,0))
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
--cast(U06_UM31W001_S1 as decimal(15,2)) as U06_UM31W001_S1,
cast(ISNULL(CASE WHEN U06_UM31W001_S1 > 1000000 THEN 0 ELSE U06_UM31W001_S1 END, 0) as decimal(15,2)) as U06_UM31W001_S1,
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
U04_UM21T002_S1,U05_UM21T002_S1,U07_UM21T002_S1,U08_UM21T002_S1,U06_UM21T002_S1,U06_UM22T002_S1
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
U04_UM21T002_S1,U05_UM21T002_S1,U07_UM21T002_S1,U08_UM21T002_S1,U06_UM21T002_S1,U06_UM22T002_S1
 FROM Runtime.dbo.AnalogWideHistory 
WHERE wwVersion = 'LATEST'
AND wwRetrievalMode = 'Cyclic'
AND wwResolution = @resolution
AND DateTime >= @start
AND DateTime <= @finish
AND wwResolution = 86400000 ") as raw
) r
) t
) as N

