{срезы по 4 часа}
/*ReportName=Суточная ведомость котлоагрегата БКЗ №5 (2 часть)*/
/*StartDate=dd.MM.yyyy 00:00:00.000*/
/*DeltaDate=00.00.0000 24:00:00.000*/
/*Step=01.00.0000 00:00:00.000*/
/*Resolution=14400000*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	ROUND(KA5_VG1_K065, 2) as "Температура<br/>металла<br/>змеевика<br/>№3, °С[KA5_VG1_K065]",
	ROUND(KA5_VG1_K066, 2) as "Температура<br/>металла<br/>змеевика<br/>№10, °С[KA5_VG1_K066]",
	ROUND(KA5_VG1_K067, 2) as "Температура<br/>металла<br/>змеевика<br/>№17, °С[KA5_VG1_K067]",
	ROUND(KA5_VG1_K068, 2) as "Температура<br/>металла<br/>змеевика<br/>№24, °С[KA5_VG1_K068]",
	ROUND(KA5_VG1_K069, 2) as "Температура<br/>металла<br/>змеевика<br/>№31, °С[KA5_VG1_K069]",
	ROUND(KA5_VG1_K070, 2) as "Температура<br/>металла<br/>змеевика<br/>№38, °С[KA5_VG1_K070]",
	null,
	ROUND(KA5_VG1_K037, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 1-я ст.<br/>слева низ, °С[KA5_VG1_K037]",
	ROUND(KA5_VG1_K038, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 1-я ст.<br/>слева верх, °С[KA5_VG1_K038]",
	ROUND(KA5_VG1_K039, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 1-я ст.<br/>справа низ, °С[KA5_VG1_K039]",
	ROUND(KA5_VG1_K040, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 1-я ст.<br/>справа верх, °С[KA5_VG1_K040]",
	ROUND(KA5_VG1_K041, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 2-я ст.<br/>слева низ, °С[KA5_VG1_K041]",
	ROUND(KA5_VG1_K042, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 2-я ст.<br/>слева верх, °С[KA5_VG1_K042]",
	ROUND(KA5_VG1_K043, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 2-я ст.<br/>справа низ, °С[KA5_VG1_K043]",
	ROUND(KA5_VG1_K044, 2) as "Темп. металла<br/>коллект. впрыс.<br/>главный и растоп.<br/>п/провод К-5 2-я ст.<br/>справа верх, °С[KA5_VG1_K044]",
	null,
	ROUND(KA5_VG1_K091, 2) as "Температура<br/>воздуха до<br/>калориферов слева, °С[KA5_VG1_K091]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K065,
	KA5_VG1_K066,
	KA5_VG1_K067,
	KA5_VG1_K068,
	KA5_VG1_K069,
	KA5_VG1_K070,
	KA5_VG1_K037,
	KA5_VG1_K038,
	KA5_VG1_K039,
	KA5_VG1_K040,
	KA5_VG1_K041,
	KA5_VG1_K042,
	KA5_VG1_K043,
	KA5_VG1_K044,
	KA5_VG1_K091
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")