{срезы минутные}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K3_VG1_P13b as decimal(15, 1)) as "П13б<br>°С [K3_VG1_P13b]",
	CAST(K3_VG1_P14b as decimal(15, 1)) as "П14б<br>°С [K3_VG1_P14b]",
	CAST(K3_VG1_P15b as decimal(15, 1)) as "П15б<br>°С [K3_VG1_P15b]",
	CAST(K3_VG1_P16b as decimal(15, 1)) as "П16б<br>°С [K3_VG1_P16b]",
	CAST(K3_VG1_P17b as decimal(15, 1)) as "П17б<br>°С [K3_VG1_P17b]",
	CAST(K3_VG1_P18b as decimal(15, 1)) as "П18б<br>°С [K3_VG1_P18b]",
	CAST(K3_VG1_P19b as decimal(15, 1)) as "П19б<br>°С [K3_VG1_P19b]",
	CAST(K3_VG1_P20b as decimal(15, 1)) as "П20б<br>°С [K3_VG1_P20b]",
	CAST(K3_VG1_P21b as decimal(15, 1)) as "П21б<br>°С [K3_VG1_P21b]",
	CAST(K3_VG1_P22b as decimal(15, 1)) as "П22б<br>°С [K3_VG1_P22b]",
	CAST(K3_VG1_P23b as decimal(15, 1)) as "П23б<br>°С [K3_VG1_P23b]",
	CAST(K3_VG1_P24b as decimal(15, 1)) as "П24б<br>°С [K3_VG1_P24b]",
	CAST(K3_VG1_P25b as decimal(15, 1)) as "П25б<br>°С [K3_VG1_P25b]",
	CAST(K3_VG1_P26b as decimal(15, 1)) as "П26б<br>°С [K3_VG1_P26b]",
	CAST(K3_VG1_P27b as decimal(15, 1)) as "П27б<br>°С [K3_VG1_P27b]",
	CAST(K3_VG1_P28b as decimal(15, 1)) as "П28б<br>°С [K3_VG1_P28b]",
	CAST(K3_VG1_P29b as decimal(15, 1)) as "П29б<br>°С [K3_VG1_P29b]",
	CAST(K3_VG1_P30b as decimal(15, 1)) as "П30б<br>°С [K3_VG1_P30b]",
	CAST(K3_VG1_P31b as decimal(15, 1)) as "П31б<br>°С [K3_VG1_P31b]",
	CAST(K3_VG1_P32b as decimal(15, 1)) as "П32б<br>°С [K3_VG1_P32b]",
	CAST(K3_VG1_P33b as decimal(15, 1)) as "П33б<br>°С [K3_VG1_P33b]",
	CAST(K3_VG1_P34b as decimal(15, 1)) as "П34б<br>°С [K3_VG1_P34b]",
	CAST(K3_VG1_P35b as decimal(15, 1)) as "П35б<br>°С [K3_VG1_P35b]",
	CAST(K3_VG1_P36b as decimal(15, 1)) as "П36б<br>°С [K3_VG1_P36b]",
	CAST(K3_VG1_P37b as decimal(15, 1)) as "П37б<br>°С [K3_VG1_P37b]",
	CAST(K3_VG1_P38b as decimal(15, 1)) as "П38б<br>°С [K3_VG1_P38b]",
	CAST(K3_VG1_P39b as decimal(15, 1)) as "П39б<br>°С [K3_VG1_P39b]",
	CAST(K3_VG1_P40b as decimal(15, 1)) as "П40б<br>°С [K3_VG1_P40b]",
	CAST(K3_VG1_P41b as decimal(15, 1)) as "П41б<br>°С [K3_VG1_P41b]",
	CAST(K3_VG1_P42b as decimal(15, 1)) as "П42б<br>°С [K3_VG1_P42b]",
	CAST(K3_VG1_P43b as decimal(15, 1)) as "П43б<br>°С [K3_VG1_P43b]",
	CAST(K3_VG1_P44b as decimal(15, 1)) as "П44б<br>°С [K3_VG1_P44b]",
	CAST(K3_VG1_P45b as decimal(15, 1)) as "П45б<br>°С [K3_VG1_P45b]",
	CAST(K3_VG1_P46b as decimal(15, 1)) as "П46б<br>°С [K3_VG1_P46b]",
	CAST(K3_VG1_P47b as decimal(15, 1)) as "П47б<br>°С [K3_VG1_P47b]",
	CAST(K3_VG1_P48b as decimal(15, 1)) as "П48б<br>°С [K3_VG1_P48b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P13b,
	K3_VG1_P14b,
	K3_VG1_P15b,
	K3_VG1_P16b,
	K3_VG1_P17b,
	K3_VG1_P18b,
	K3_VG1_P19b,
	K3_VG1_P20b,
	K3_VG1_P21b,
	K3_VG1_P22b,
	K3_VG1_P23b,
	K3_VG1_P24b,
	K3_VG1_P25b,
	K3_VG1_P26b,
	K3_VG1_P27b,
	K3_VG1_P28b,
	K3_VG1_P29b,
	K3_VG1_P30b,
	K3_VG1_P31b,
	K3_VG1_P32b,
	K3_VG1_P33b,
	K3_VG1_P34b,
	K3_VG1_P35b,
	K3_VG1_P36b,
	K3_VG1_P37b,
	K3_VG1_P38b,
	K3_VG1_P39b,
	K3_VG1_P40b,
	K3_VG1_P41b,
	K3_VG1_P42b,
	K3_VG1_P43b,
	K3_VG1_P44b,
	K3_VG1_P45b,
	K3_VG1_P46b,
	K3_VG1_P47b,
	K3_VG1_P48b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(K3_VG1_P13b as decimal(15, 1)) as "П13б<br>°С [K3_VG1_P13b]",
	CAST(K3_VG1_P14b as decimal(15, 1)) as "П14б<br>°С [K3_VG1_P14b]",
	CAST(K3_VG1_P15b as decimal(15, 1)) as "П15б<br>°С [K3_VG1_P15b]",
	CAST(K3_VG1_P16b as decimal(15, 1)) as "П16б<br>°С [K3_VG1_P16b]",
	CAST(K3_VG1_P17b as decimal(15, 1)) as "П17б<br>°С [K3_VG1_P17b]",
	CAST(K3_VG1_P18b as decimal(15, 1)) as "П18б<br>°С [K3_VG1_P18b]",
	CAST(K3_VG1_P19b as decimal(15, 1)) as "П19б<br>°С [K3_VG1_P19b]",
	CAST(K3_VG1_P20b as decimal(15, 1)) as "П20б<br>°С [K3_VG1_P20b]",
	CAST(K3_VG1_P21b as decimal(15, 1)) as "П21б<br>°С [K3_VG1_P21b]",
	CAST(K3_VG1_P22b as decimal(15, 1)) as "П22б<br>°С [K3_VG1_P22b]",
	CAST(K3_VG1_P23b as decimal(15, 1)) as "П23б<br>°С [K3_VG1_P23b]",
	CAST(K3_VG1_P24b as decimal(15, 1)) as "П24б<br>°С [K3_VG1_P24b]",
	CAST(K3_VG1_P25b as decimal(15, 1)) as "П25б<br>°С [K3_VG1_P25b]",
	CAST(K3_VG1_P26b as decimal(15, 1)) as "П26б<br>°С [K3_VG1_P26b]",
	CAST(K3_VG1_P27b as decimal(15, 1)) as "П27б<br>°С [K3_VG1_P27b]",
	CAST(K3_VG1_P28b as decimal(15, 1)) as "П28б<br>°С [K3_VG1_P28b]",
	CAST(K3_VG1_P29b as decimal(15, 1)) as "П29б<br>°С [K3_VG1_P29b]",
	CAST(K3_VG1_P30b as decimal(15, 1)) as "П30б<br>°С [K3_VG1_P30b]",
	CAST(K3_VG1_P31b as decimal(15, 1)) as "П31б<br>°С [K3_VG1_P31b]",
	CAST(K3_VG1_P32b as decimal(15, 1)) as "П32б<br>°С [K3_VG1_P32b]",
	CAST(K3_VG1_P33b as decimal(15, 1)) as "П33б<br>°С [K3_VG1_P33b]",
	CAST(K3_VG1_P34b as decimal(15, 1)) as "П34б<br>°С [K3_VG1_P34b]",
	CAST(K3_VG1_P35b as decimal(15, 1)) as "П35б<br>°С [K3_VG1_P35b]",
	CAST(K3_VG1_P36b as decimal(15, 1)) as "П36б<br>°С [K3_VG1_P36b]",
	CAST(K3_VG1_P37b as decimal(15, 1)) as "П37б<br>°С [K3_VG1_P37b]",
	CAST(K3_VG1_P38b as decimal(15, 1)) as "П38б<br>°С [K3_VG1_P38b]",
	CAST(K3_VG1_P39b as decimal(15, 1)) as "П39б<br>°С [K3_VG1_P39b]",
	CAST(K3_VG1_P40b as decimal(15, 1)) as "П40б<br>°С [K3_VG1_P40b]",
	CAST(K3_VG1_P41b as decimal(15, 1)) as "П41б<br>°С [K3_VG1_P41b]",
	CAST(K3_VG1_P42b as decimal(15, 1)) as "П42б<br>°С [K3_VG1_P42b]",
	CAST(K3_VG1_P43b as decimal(15, 1)) as "П43б<br>°С [K3_VG1_P43b]",
	CAST(K3_VG1_P44b as decimal(15, 1)) as "П44б<br>°С [K3_VG1_P44b]",
	CAST(K3_VG1_P45b as decimal(15, 1)) as "П45б<br>°С [K3_VG1_P45b]",
	CAST(K3_VG1_P46b as decimal(15, 1)) as "П46б<br>°С [K3_VG1_P46b]",
	CAST(K3_VG1_P47b as decimal(15, 1)) as "П47б<br>°С [K3_VG1_P47b]",
	CAST(K3_VG1_P48b as decimal(15, 1)) as "П48б<br>°С [K3_VG1_P48b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P13b,
	K3_VG1_P14b,
	K3_VG1_P15b,
	K3_VG1_P16b,
	K3_VG1_P17b,
	K3_VG1_P18b,
	K3_VG1_P19b,
	K3_VG1_P20b,
	K3_VG1_P21b,
	K3_VG1_P22b,
	K3_VG1_P23b,
	K3_VG1_P24b,
	K3_VG1_P25b,
	K3_VG1_P26b,
	K3_VG1_P27b,
	K3_VG1_P28b,
	K3_VG1_P29b,
	K3_VG1_P30b,
	K3_VG1_P31b,
	K3_VG1_P32b,
	K3_VG1_P33b,
	K3_VG1_P34b,
	K3_VG1_P35b,
	K3_VG1_P36b,
	K3_VG1_P37b,
	K3_VG1_P38b,
	K3_VG1_P39b,
	K3_VG1_P40b,
	K3_VG1_P41b,
	K3_VG1_P42b,
	K3_VG1_P43b,
	K3_VG1_P44b,
	K3_VG1_P45b,
	K3_VG1_P46b,
	K3_VG1_P47b,
	K3_VG1_P48b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(K3_VG1_P13b as decimal(15, 1)) as "П13б<br>°С [K3_VG1_P13b]",
	CAST(K3_VG1_P14b as decimal(15, 1)) as "П14б<br>°С [K3_VG1_P14b]",
	CAST(K3_VG1_P15b as decimal(15, 1)) as "П15б<br>°С [K3_VG1_P15b]",
	CAST(K3_VG1_P16b as decimal(15, 1)) as "П16б<br>°С [K3_VG1_P16b]",
	CAST(K3_VG1_P17b as decimal(15, 1)) as "П17б<br>°С [K3_VG1_P17b]",
	CAST(K3_VG1_P18b as decimal(15, 1)) as "П18б<br>°С [K3_VG1_P18b]",
	CAST(K3_VG1_P19b as decimal(15, 1)) as "П19б<br>°С [K3_VG1_P19b]",
	CAST(K3_VG1_P20b as decimal(15, 1)) as "П20б<br>°С [K3_VG1_P20b]",
	CAST(K3_VG1_P21b as decimal(15, 1)) as "П21б<br>°С [K3_VG1_P21b]",
	CAST(K3_VG1_P22b as decimal(15, 1)) as "П22б<br>°С [K3_VG1_P22b]",
	CAST(K3_VG1_P23b as decimal(15, 1)) as "П23б<br>°С [K3_VG1_P23b]",
	CAST(K3_VG1_P24b as decimal(15, 1)) as "П24б<br>°С [K3_VG1_P24b]",
	CAST(K3_VG1_P25b as decimal(15, 1)) as "П25б<br>°С [K3_VG1_P25b]",
	CAST(K3_VG1_P26b as decimal(15, 1)) as "П26б<br>°С [K3_VG1_P26b]",
	CAST(K3_VG1_P27b as decimal(15, 1)) as "П27б<br>°С [K3_VG1_P27b]",
	CAST(K3_VG1_P28b as decimal(15, 1)) as "П28б<br>°С [K3_VG1_P28b]",
	CAST(K3_VG1_P29b as decimal(15, 1)) as "П29б<br>°С [K3_VG1_P29b]",
	CAST(K3_VG1_P30b as decimal(15, 1)) as "П30б<br>°С [K3_VG1_P30b]",
	CAST(K3_VG1_P31b as decimal(15, 1)) as "П31б<br>°С [K3_VG1_P31b]",
	CAST(K3_VG1_P32b as decimal(15, 1)) as "П32б<br>°С [K3_VG1_P32b]",
	CAST(K3_VG1_P33b as decimal(15, 1)) as "П33б<br>°С [K3_VG1_P33b]",
	CAST(K3_VG1_P34b as decimal(15, 1)) as "П34б<br>°С [K3_VG1_P34b]",
	CAST(K3_VG1_P35b as decimal(15, 1)) as "П35б<br>°С [K3_VG1_P35b]",
	CAST(K3_VG1_P36b as decimal(15, 1)) as "П36б<br>°С [K3_VG1_P36b]",
	CAST(K3_VG1_P37b as decimal(15, 1)) as "П37б<br>°С [K3_VG1_P37b]",
	CAST(K3_VG1_P38b as decimal(15, 1)) as "П38б<br>°С [K3_VG1_P38b]",
	CAST(K3_VG1_P39b as decimal(15, 1)) as "П39б<br>°С [K3_VG1_P39b]",
	CAST(K3_VG1_P40b as decimal(15, 1)) as "П40б<br>°С [K3_VG1_P40b]",
	CAST(K3_VG1_P41b as decimal(15, 1)) as "П41б<br>°С [K3_VG1_P41b]",
	CAST(K3_VG1_P42b as decimal(15, 1)) as "П42б<br>°С [K3_VG1_P42b]",
	CAST(K3_VG1_P43b as decimal(15, 1)) as "П43б<br>°С [K3_VG1_P43b]",
	CAST(K3_VG1_P44b as decimal(15, 1)) as "П44б<br>°С [K3_VG1_P44b]",
	CAST(K3_VG1_P45b as decimal(15, 1)) as "П45б<br>°С [K3_VG1_P45b]",
	CAST(K3_VG1_P46b as decimal(15, 1)) as "П46б<br>°С [K3_VG1_P46b]",
	CAST(K3_VG1_P47b as decimal(15, 1)) as "П47б<br>°С [K3_VG1_P47b]",
	CAST(K3_VG1_P48b as decimal(15, 1)) as "П48б<br>°С [K3_VG1_P48b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P13b,
	K3_VG1_P14b,
	K3_VG1_P15b,
	K3_VG1_P16b,
	K3_VG1_P17b,
	K3_VG1_P18b,
	K3_VG1_P19b,
	K3_VG1_P20b,
	K3_VG1_P21b,
	K3_VG1_P22b,
	K3_VG1_P23b,
	K3_VG1_P24b,
	K3_VG1_P25b,
	K3_VG1_P26b,
	K3_VG1_P27b,
	K3_VG1_P28b,
	K3_VG1_P29b,
	K3_VG1_P30b,
	K3_VG1_P31b,
	K3_VG1_P32b,
	K3_VG1_P33b,
	K3_VG1_P34b,
	K3_VG1_P35b,
	K3_VG1_P36b,
	K3_VG1_P37b,
	K3_VG1_P38b,
	K3_VG1_P39b,
	K3_VG1_P40b,
	K3_VG1_P41b,
	K3_VG1_P42b,
	K3_VG1_P43b,
	K3_VG1_P44b,
	K3_VG1_P45b,
	K3_VG1_P46b,
	K3_VG1_P47b,
	K3_VG1_P48b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(K3_VG1_P13b) as decimal(15, 1)) as "П13б<br>°С [K3_VG1_P13b]",
	CAST(AVG(K3_VG1_P14b) as decimal(15, 1)) as "П14б<br>°С [K3_VG1_P14b]",
	CAST(AVG(K3_VG1_P15b) as decimal(15, 1)) as "П15б<br>°С [K3_VG1_P15b]",
	CAST(AVG(K3_VG1_P16b) as decimal(15, 1)) as "П16б<br>°С [K3_VG1_P16b]",
	CAST(AVG(K3_VG1_P17b) as decimal(15, 1)) as "П17б<br>°С [K3_VG1_P17b]",
	CAST(AVG(K3_VG1_P18b) as decimal(15, 1)) as "П18б<br>°С [K3_VG1_P18b]",
	CAST(AVG(K3_VG1_P19b) as decimal(15, 1)) as "П19б<br>°С [K3_VG1_P19b]",
	CAST(AVG(K3_VG1_P20b) as decimal(15, 1)) as "П20б<br>°С [K3_VG1_P20b]",
	CAST(AVG(K3_VG1_P21b) as decimal(15, 1)) as "П21б<br>°С [K3_VG1_P21b]",
	CAST(AVG(K3_VG1_P22b) as decimal(15, 1)) as "П22б<br>°С [K3_VG1_P22b]",
	CAST(AVG(K3_VG1_P23b) as decimal(15, 1)) as "П23б<br>°С [K3_VG1_P23b]",
	CAST(AVG(K3_VG1_P24b) as decimal(15, 1)) as "П24б<br>°С [K3_VG1_P24b]",
	CAST(AVG(K3_VG1_P25b) as decimal(15, 1)) as "П25б<br>°С [K3_VG1_P25b]",
	CAST(AVG(K3_VG1_P26b) as decimal(15, 1)) as "П26б<br>°С [K3_VG1_P26b]",
	CAST(AVG(K3_VG1_P27b) as decimal(15, 1)) as "П27б<br>°С [K3_VG1_P27b]",
	CAST(AVG(K3_VG1_P28b) as decimal(15, 1)) as "П28б<br>°С [K3_VG1_P28b]",
	CAST(AVG(K3_VG1_P29b) as decimal(15, 1)) as "П29б<br>°С [K3_VG1_P29b]",
	CAST(AVG(K3_VG1_P30b) as decimal(15, 1)) as "П30б<br>°С [K3_VG1_P30b]",
	CAST(AVG(K3_VG1_P31b) as decimal(15, 1)) as "П31б<br>°С [K3_VG1_P31b]",
	CAST(AVG(K3_VG1_P32b) as decimal(15, 1)) as "П32б<br>°С [K3_VG1_P32b]",
	CAST(AVG(K3_VG1_P33b) as decimal(15, 1)) as "П33б<br>°С [K3_VG1_P33b]",
	CAST(AVG(K3_VG1_P34b) as decimal(15, 1)) as "П34б<br>°С [K3_VG1_P34b]",
	CAST(AVG(K3_VG1_P35b) as decimal(15, 1)) as "П35б<br>°С [K3_VG1_P35b]",
	CAST(AVG(K3_VG1_P36b) as decimal(15, 1)) as "П36б<br>°С [K3_VG1_P36b]",
	CAST(AVG(K3_VG1_P37b) as decimal(15, 1)) as "П37б<br>°С [K3_VG1_P37b]",
	CAST(AVG(K3_VG1_P38b) as decimal(15, 1)) as "П38б<br>°С [K3_VG1_P38b]",
	CAST(AVG(K3_VG1_P39b) as decimal(15, 1)) as "П39б<br>°С [K3_VG1_P39b]",
	CAST(AVG(K3_VG1_P40b) as decimal(15, 1)) as "П40б<br>°С [K3_VG1_P40b]",
	CAST(AVG(K3_VG1_P41b) as decimal(15, 1)) as "П41б<br>°С [K3_VG1_P41b]",
	CAST(AVG(K3_VG1_P42b) as decimal(15, 1)) as "П42б<br>°С [K3_VG1_P42b]",
	CAST(AVG(K3_VG1_P43b) as decimal(15, 1)) as "П43б<br>°С [K3_VG1_P43b]",
	CAST(AVG(K3_VG1_P44b) as decimal(15, 1)) as "П44б<br>°С [K3_VG1_P44b]",
	CAST(AVG(K3_VG1_P45b) as decimal(15, 1)) as "П45б<br>°С [K3_VG1_P45b]",
	CAST(AVG(K3_VG1_P46b) as decimal(15, 1)) as "П46б<br>°С [K3_VG1_P46b]",
	CAST(AVG(K3_VG1_P47b) as decimal(15, 1)) as "П47б<br>°С [K3_VG1_P47b]",
	CAST(AVG(K3_VG1_P48b) as decimal(15, 1)) as "П48б<br>°С [K3_VG1_P48b]"
FROM
	OpenQuery(INSQL,
		"SELECT DateTime, 
		K3_VG1_P13b,
		K3_VG1_P14b,
		K3_VG1_P15b,
		K3_VG1_P16b,
		K3_VG1_P17b,
		K3_VG1_P18b,
		K3_VG1_P19b,
		K3_VG1_P20b,
		K3_VG1_P21b,
		K3_VG1_P22b,
		K3_VG1_P23b,
		K3_VG1_P24b,
		K3_VG1_P25b,
		K3_VG1_P26b,
		K3_VG1_P27b,
		K3_VG1_P28b,
		K3_VG1_P29b,
		K3_VG1_P30b,
		K3_VG1_P31b,
		K3_VG1_P32b,
		K3_VG1_P33b,
		K3_VG1_P34b,
		K3_VG1_P35b,
		K3_VG1_P36b,
		K3_VG1_P37b,
		K3_VG1_P38b,
		K3_VG1_P39b,
		K3_VG1_P40b,
		K3_VG1_P41b,
		K3_VG1_P42b,
		K3_VG1_P43b,
		K3_VG1_P44b,
		K3_VG1_P45b,
		K3_VG1_P46b,
		K3_VG1_P47b,
		K3_VG1_P48b
		FROM Runtime.dbo.AnalogWideHistory
		WHERE wwVersion = 'Latest'
		AND wwRetrievalMode = 'Cyclic'
		AND wwResolution = @resolution
		AND DateTime >= @start
		AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime

{агрегированные за сутки}
/*ReportName="Отчёт КА-3 VG1. Экран 1" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(K3_VG1_P13b) as decimal(15, 1)) as "П13б<br>°С [K3_VG1_P13b]",
	CAST(AVG(K3_VG1_P14b) as decimal(15, 1)) as "П14б<br>°С [K3_VG1_P14b]",
	CAST(AVG(K3_VG1_P15b) as decimal(15, 1)) as "П15б<br>°С [K3_VG1_P15b]",
	CAST(AVG(K3_VG1_P16b) as decimal(15, 1)) as "П16б<br>°С [K3_VG1_P16b]",
	CAST(AVG(K3_VG1_P17b) as decimal(15, 1)) as "П17б<br>°С [K3_VG1_P17b]",
	CAST(AVG(K3_VG1_P18b) as decimal(15, 1)) as "П18б<br>°С [K3_VG1_P18b]",
	CAST(AVG(K3_VG1_P19b) as decimal(15, 1)) as "П19б<br>°С [K3_VG1_P19b]",
	CAST(AVG(K3_VG1_P20b) as decimal(15, 1)) as "П20б<br>°С [K3_VG1_P20b]",
	CAST(AVG(K3_VG1_P21b) as decimal(15, 1)) as "П21б<br>°С [K3_VG1_P21b]",
	CAST(AVG(K3_VG1_P22b) as decimal(15, 1)) as "П22б<br>°С [K3_VG1_P22b]",
	CAST(AVG(K3_VG1_P23b) as decimal(15, 1)) as "П23б<br>°С [K3_VG1_P23b]",
	CAST(AVG(K3_VG1_P24b) as decimal(15, 1)) as "П24б<br>°С [K3_VG1_P24b]",
	CAST(AVG(K3_VG1_P25b) as decimal(15, 1)) as "П25б<br>°С [K3_VG1_P25b]",
	CAST(AVG(K3_VG1_P26b) as decimal(15, 1)) as "П26б<br>°С [K3_VG1_P26b]",
	CAST(AVG(K3_VG1_P27b) as decimal(15, 1)) as "П27б<br>°С [K3_VG1_P27b]",
	CAST(AVG(K3_VG1_P28b) as decimal(15, 1)) as "П28б<br>°С [K3_VG1_P28b]",
	CAST(AVG(K3_VG1_P29b) as decimal(15, 1)) as "П29б<br>°С [K3_VG1_P29b]",
	CAST(AVG(K3_VG1_P30b) as decimal(15, 1)) as "П30б<br>°С [K3_VG1_P30b]",
	CAST(AVG(K3_VG1_P31b) as decimal(15, 1)) as "П31б<br>°С [K3_VG1_P31b]",
	CAST(AVG(K3_VG1_P32b) as decimal(15, 1)) as "П32б<br>°С [K3_VG1_P32b]",
	CAST(AVG(K3_VG1_P33b) as decimal(15, 1)) as "П33б<br>°С [K3_VG1_P33b]",
	CAST(AVG(K3_VG1_P34b) as decimal(15, 1)) as "П34б<br>°С [K3_VG1_P34b]",
	CAST(AVG(K3_VG1_P35b) as decimal(15, 1)) as "П35б<br>°С [K3_VG1_P35b]",
	CAST(AVG(K3_VG1_P36b) as decimal(15, 1)) as "П36б<br>°С [K3_VG1_P36b]",
	CAST(AVG(K3_VG1_P37b) as decimal(15, 1)) as "П37б<br>°С [K3_VG1_P37b]",
	CAST(AVG(K3_VG1_P38b) as decimal(15, 1)) as "П38б<br>°С [K3_VG1_P38b]",
	CAST(AVG(K3_VG1_P39b) as decimal(15, 1)) as "П39б<br>°С [K3_VG1_P39b]",
	CAST(AVG(K3_VG1_P40b) as decimal(15, 1)) as "П40б<br>°С [K3_VG1_P40b]",
	CAST(AVG(K3_VG1_P41b) as decimal(15, 1)) as "П41б<br>°С [K3_VG1_P41b]",
	CAST(AVG(K3_VG1_P42b) as decimal(15, 1)) as "П42б<br>°С [K3_VG1_P42b]",
	CAST(AVG(K3_VG1_P43b) as decimal(15, 1)) as "П43б<br>°С [K3_VG1_P43b]",
	CAST(AVG(K3_VG1_P44b) as decimal(15, 1)) as "П44б<br>°С [K3_VG1_P44b]",
	CAST(AVG(K3_VG1_P45b) as decimal(15, 1)) as "П45б<br>°С [K3_VG1_P45b]",
	CAST(AVG(K3_VG1_P46b) as decimal(15, 1)) as "П46б<br>°С [K3_VG1_P46b]",
	CAST(AVG(K3_VG1_P47b) as decimal(15, 1)) as "П47б<br>°С [K3_VG1_P47b]",
	CAST(AVG(K3_VG1_P48b) as decimal(15, 1)) as "П48б<br>°С [K3_VG1_P48b]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	K3_VG1_P13b,
	K3_VG1_P14b,
	K3_VG1_P15b,
	K3_VG1_P16b,
	K3_VG1_P17b,
	K3_VG1_P18b,
	K3_VG1_P19b,
	K3_VG1_P20b,
	K3_VG1_P21b,
	K3_VG1_P22b,
	K3_VG1_P23b,
	K3_VG1_P24b,
	K3_VG1_P25b,
	K3_VG1_P26b,
	K3_VG1_P27b,
	K3_VG1_P28b,
	K3_VG1_P29b,
	K3_VG1_P30b,
	K3_VG1_P31b,
	K3_VG1_P32b,
	K3_VG1_P33b,
	K3_VG1_P34b,
	K3_VG1_P35b,
	K3_VG1_P36b,
	K3_VG1_P37b,
	K3_VG1_P38b,
	K3_VG1_P39b,
	K3_VG1_P40b,
	K3_VG1_P41b,
	K3_VG1_P42b,
	K3_VG1_P43b,
	K3_VG1_P44b,
	K3_VG1_P45b,
	K3_VG1_P46b,
	K3_VG1_P47b,
	K3_VG1_P48b
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")
GROUP BY
	DateTime
ORDER BY
	DateTime
