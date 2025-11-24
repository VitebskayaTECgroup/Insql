{срезы минутные}
/*ReportName="Отчёт КА-5 VG1. Экран 4" (срезы минутные)*/
/*Mode=минутные*/
/*UpQuery="срезы на конец часа"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(KA5_VG1_K097 as decimal(15, 1)) as "Т49<br>°С [KA5_VG1_K097]",
	CAST(KA5_VG1_K098 as decimal(15, 1)) as "Т50<br>°С [KA5_VG1_K098]",
	CAST(KA5_VG1_K099 as decimal(15, 1)) as "Т51<br>°С [KA5_VG1_K099]",
	null,
	CAST(KA5_VG1_K101 as decimal(15, 1)) as "Т65<br>°С [KA5_VG1_K101]",
	CAST(KA5_VG1_K102 as decimal(15, 1)) as "Т66<br>°С [KA5_VG1_K102]",
	CAST(KA5_VG1_K103 as decimal(15, 1)) as "Т67<br>°С [KA5_VG1_K103]",
	CAST(KA5_VG1_K104 as decimal(15, 1)) as "Т68<br>°С [KA5_VG1_K104]",
	CAST(KA5_VG1_K105 as decimal(15, 1)) as "Т69<br>°С [KA5_VG1_K105]",
	CAST(KA5_VG1_K106 as decimal(15, 1)) as "Т70<br>°С [KA5_VG1_K106]",
	CAST(KA5_VG1_K107 as decimal(15, 1)) as "Т71<br>°С [KA5_VG1_K107]",
	CAST(KA5_VG1_K108 as decimal(15, 1)) as "Т72<br>°С [KA5_VG1_K108]",
	CAST(KA5_VG1_K109 as decimal(15, 1)) as "Т73<br>°С [KA5_VG1_K109]",
	CAST(KA5_VG1_K110 as decimal(15, 1)) as "Т74<br>°С [KA5_VG1_K110]",
	CAST(KA5_VG1_K111 as decimal(15, 1)) as "Т75<br>°С [KA5_VG1_K111]",
	CAST(KA5_VG1_K112 as decimal(15, 1)) as "Т76<br>°С [KA5_VG1_K112]",
	CAST(KA5_VG1_K113 as decimal(15, 1)) as "Т77<br>°С [KA5_VG1_K113]",
	CAST(KA5_VG1_K114 as decimal(15, 1)) as "Т78<br>°С [KA5_VG1_K114]",
	CAST(KA5_VG1_K115 as decimal(15, 1)) as "Т79<br>°С [KA5_VG1_K115]",
	CAST(KA5_VG1_K116 as decimal(15, 1)) as "Т80<br>°С [KA5_VG1_K116]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K097,
	KA5_VG1_K098,
	KA5_VG1_K099,
	KA5_VG1_K101,
	KA5_VG1_K102,
	KA5_VG1_K103,
	KA5_VG1_K104,
	KA5_VG1_K105,
	KA5_VG1_K106,
	KA5_VG1_K107,
	KA5_VG1_K108,
	KA5_VG1_K109,
	KA5_VG1_K110,
	KA5_VG1_K111,
	KA5_VG1_K112,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец часа}
/*ReportName="Отчёт КА-5 VG1. Экран 4" (срезы на конец часа)*/
/*Mode=часовые-1*/
/*DownQuery="срезы минутные"*/
/*UpQuery="срезы на конец суток"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -5, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K097 as decimal(15, 1)) as "Т49<br>°С [KA5_VG1_K097]",
	CAST(KA5_VG1_K098 as decimal(15, 1)) as "Т50<br>°С [KA5_VG1_K098]",
	CAST(KA5_VG1_K099 as decimal(15, 1)) as "Т51<br>°С [KA5_VG1_K099]",
	null,
	CAST(KA5_VG1_K101 as decimal(15, 1)) as "Т65<br>°С [KA5_VG1_K101]",
	CAST(KA5_VG1_K102 as decimal(15, 1)) as "Т66<br>°С [KA5_VG1_K102]",
	CAST(KA5_VG1_K103 as decimal(15, 1)) as "Т67<br>°С [KA5_VG1_K103]",
	CAST(KA5_VG1_K104 as decimal(15, 1)) as "Т68<br>°С [KA5_VG1_K104]",
	CAST(KA5_VG1_K105 as decimal(15, 1)) as "Т69<br>°С [KA5_VG1_K105]",
	CAST(KA5_VG1_K106 as decimal(15, 1)) as "Т70<br>°С [KA5_VG1_K106]",
	CAST(KA5_VG1_K107 as decimal(15, 1)) as "Т71<br>°С [KA5_VG1_K107]",
	CAST(KA5_VG1_K108 as decimal(15, 1)) as "Т72<br>°С [KA5_VG1_K108]",
	CAST(KA5_VG1_K109 as decimal(15, 1)) as "Т73<br>°С [KA5_VG1_K109]",
	CAST(KA5_VG1_K110 as decimal(15, 1)) as "Т74<br>°С [KA5_VG1_K110]",
	CAST(KA5_VG1_K111 as decimal(15, 1)) as "Т75<br>°С [KA5_VG1_K111]",
	CAST(KA5_VG1_K112 as decimal(15, 1)) as "Т76<br>°С [KA5_VG1_K112]",
	CAST(KA5_VG1_K113 as decimal(15, 1)) as "Т77<br>°С [KA5_VG1_K113]",
	CAST(KA5_VG1_K114 as decimal(15, 1)) as "Т78<br>°С [KA5_VG1_K114]",
	CAST(KA5_VG1_K115 as decimal(15, 1)) as "Т79<br>°С [KA5_VG1_K115]",
	CAST(KA5_VG1_K116 as decimal(15, 1)) as "Т80<br>°С [KA5_VG1_K116]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K097,
	KA5_VG1_K098,
	KA5_VG1_K099,
	KA5_VG1_K100,
	KA5_VG1_K101,
	KA5_VG1_K102,
	KA5_VG1_K103,
	KA5_VG1_K104,
	KA5_VG1_K105,
	KA5_VG1_K106,
	KA5_VG1_K107,
	KA5_VG1_K108,
	KA5_VG1_K109,
	KA5_VG1_K110,
	KA5_VG1_K111,
	KA5_VG1_K112,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{срезы на конец суток}
/*ReportName="Отчёт КА-5 VG1. Экран 4" (срезы на конец суток)*/
/*Mode=суточные-1*/
/*DownQuery="срезы на конец часа"*/
/*UpQuery="агрегированные почасовые"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(mi, -1445, DateTime) as "Дата",
	null,
	CAST(KA5_VG1_K097 as decimal(15, 1)) as "Т49<br>°С [KA5_VG1_K097]",
	CAST(KA5_VG1_K098 as decimal(15, 1)) as "Т50<br>°С [KA5_VG1_K098]",
	CAST(KA5_VG1_K099 as decimal(15, 1)) as "Т51<br>°С [KA5_VG1_K099]",
	null,
	CAST(KA5_VG1_K101 as decimal(15, 1)) as "Т65<br>°С [KA5_VG1_K101]",
	CAST(KA5_VG1_K102 as decimal(15, 1)) as "Т66<br>°С [KA5_VG1_K102]",
	CAST(KA5_VG1_K103 as decimal(15, 1)) as "Т67<br>°С [KA5_VG1_K103]",
	CAST(KA5_VG1_K104 as decimal(15, 1)) as "Т68<br>°С [KA5_VG1_K104]",
	CAST(KA5_VG1_K105 as decimal(15, 1)) as "Т69<br>°С [KA5_VG1_K105]",
	CAST(KA5_VG1_K106 as decimal(15, 1)) as "Т70<br>°С [KA5_VG1_K106]",
	CAST(KA5_VG1_K107 as decimal(15, 1)) as "Т71<br>°С [KA5_VG1_K107]",
	CAST(KA5_VG1_K108 as decimal(15, 1)) as "Т72<br>°С [KA5_VG1_K108]",
	CAST(KA5_VG1_K109 as decimal(15, 1)) as "Т73<br>°С [KA5_VG1_K109]",
	CAST(KA5_VG1_K110 as decimal(15, 1)) as "Т74<br>°С [KA5_VG1_K110]",
	CAST(KA5_VG1_K111 as decimal(15, 1)) as "Т75<br>°С [KA5_VG1_K111]",
	CAST(KA5_VG1_K112 as decimal(15, 1)) as "Т76<br>°С [KA5_VG1_K112]",
	CAST(KA5_VG1_K113 as decimal(15, 1)) as "Т77<br>°С [KA5_VG1_K113]",
	CAST(KA5_VG1_K114 as decimal(15, 1)) as "Т78<br>°С [KA5_VG1_K114]",
	CAST(KA5_VG1_K115 as decimal(15, 1)) as "Т79<br>°С [KA5_VG1_K115]",
	CAST(KA5_VG1_K116 as decimal(15, 1)) as "Т80<br>°С [KA5_VG1_K116]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K097,
	KA5_VG1_K098,
	KA5_VG1_K099,
	KA5_VG1_K100,
	KA5_VG1_K101,
	KA5_VG1_K102,
	KA5_VG1_K103,
	KA5_VG1_K104,
	KA5_VG1_K105,
	KA5_VG1_K106,
	KA5_VG1_K107,
	KA5_VG1_K108,
	KA5_VG1_K109,
	KA5_VG1_K110,
	KA5_VG1_K111,
	KA5_VG1_K112,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116
	FROM Runtime.dbo.AnalogWideHistory 
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")


{агрегированные за час}
/*ReportName="Отчёт КА-5 VG1. Экран 4" (агрегированные за час)*/
/*Mode=часовые-2*/
/*DownQuery="срезы на конец суток"*/
/*UpQuery="агрегированные за сутки"*/
SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(AVG(KA5_VG1_K097) as decimal(15, 1)) as "Т49<br>°С [KA5_VG1_K097]",
	CAST(AVG(KA5_VG1_K098) as decimal(15, 1)) as "Т50<br>°С [KA5_VG1_K098]",
	CAST(AVG(KA5_VG1_K099) as decimal(15, 1)) as "Т51<br>°С [KA5_VG1_K099]",
	null,
	CAST(AVG(KA5_VG1_K101) as decimal(15, 1)) as "Т65<br>°С [KA5_VG1_K101]",
	CAST(AVG(KA5_VG1_K102) as decimal(15, 1)) as "Т66<br>°С [KA5_VG1_K102]",
	CAST(AVG(KA5_VG1_K103) as decimal(15, 1)) as "Т67<br>°С [KA5_VG1_K103]",
	CAST(AVG(KA5_VG1_K104) as decimal(15, 1)) as "Т68<br>°С [KA5_VG1_K104]",
	CAST(AVG(KA5_VG1_K105) as decimal(15, 1)) as "Т69<br>°С [KA5_VG1_K105]",
	CAST(AVG(KA5_VG1_K106) as decimal(15, 1)) as "Т70<br>°С [KA5_VG1_K106]",
	CAST(AVG(KA5_VG1_K107) as decimal(15, 1)) as "Т71<br>°С [KA5_VG1_K107]",
	CAST(AVG(KA5_VG1_K108) as decimal(15, 1)) as "Т72<br>°С [KA5_VG1_K108]",
	CAST(AVG(KA5_VG1_K109) as decimal(15, 1)) as "Т73<br>°С [KA5_VG1_K109]",
	CAST(AVG(KA5_VG1_K110) as decimal(15, 1)) as "Т74<br>°С [KA5_VG1_K110]",
	CAST(AVG(KA5_VG1_K111) as decimal(15, 1)) as "Т75<br>°С [KA5_VG1_K111]",
	CAST(AVG(KA5_VG1_K112) as decimal(15, 1)) as "Т76<br>°С [KA5_VG1_K112]",
	CAST(AVG(KA5_VG1_K113) as decimal(15, 1)) as "Т77<br>°С [KA5_VG1_K113]",
	CAST(AVG(KA5_VG1_K114) as decimal(15, 1)) as "Т78<br>°С [KA5_VG1_K114]",
	CAST(AVG(KA5_VG1_K115) as decimal(15, 1)) as "Т79<br>°С [KA5_VG1_K115]",
	CAST(AVG(KA5_VG1_K116) as decimal(15, 1)) as "Т80<br>°С [KA5_VG1_K116]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime, 
	KA5_VG1_K097,
	KA5_VG1_K098,
	KA5_VG1_K099,
	KA5_VG1_K100,
	KA5_VG1_K101,
	KA5_VG1_K102,
	KA5_VG1_K103,
	KA5_VG1_K104,
	KA5_VG1_K105,
	KA5_VG1_K106,
	KA5_VG1_K107,
	KA5_VG1_K108,
	KA5_VG1_K109,
	KA5_VG1_K110,
	KA5_VG1_K111,
	KA5_VG1_K112,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116
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
/*ReportName="Отчёт КА-5 VG1. Экран 4" (агрегированные за сутки)*/
/*Mode=суточные-2*/
/*DownQuery="агрегированные за час"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateAdd(day, -1, DateTime) as "Дата",
	null,
	CAST(AVG(KA5_VG1_K097) as decimal(15, 1)) as "Т49<br>°С [KA5_VG1_K097]",
	CAST(AVG(KA5_VG1_K098) as decimal(15, 1)) as "Т50<br>°С [KA5_VG1_K098]",
	CAST(AVG(KA5_VG1_K099) as decimal(15, 1)) as "Т51<br>°С [KA5_VG1_K099]",
	null,
	CAST(AVG(KA5_VG1_K101) as decimal(15, 1)) as "Т65<br>°С [KA5_VG1_K101]",
	CAST(AVG(KA5_VG1_K102) as decimal(15, 1)) as "Т66<br>°С [KA5_VG1_K102]",
	CAST(AVG(KA5_VG1_K103) as decimal(15, 1)) as "Т67<br>°С [KA5_VG1_K103]",
	CAST(AVG(KA5_VG1_K104) as decimal(15, 1)) as "Т68<br>°С [KA5_VG1_K104]",
	CAST(AVG(KA5_VG1_K105) as decimal(15, 1)) as "Т69<br>°С [KA5_VG1_K105]",
	CAST(AVG(KA5_VG1_K106) as decimal(15, 1)) as "Т70<br>°С [KA5_VG1_K106]",
	CAST(AVG(KA5_VG1_K107) as decimal(15, 1)) as "Т71<br>°С [KA5_VG1_K107]",
	CAST(AVG(KA5_VG1_K108) as decimal(15, 1)) as "Т72<br>°С [KA5_VG1_K108]",
	CAST(AVG(KA5_VG1_K109) as decimal(15, 1)) as "Т73<br>°С [KA5_VG1_K109]",
	CAST(AVG(KA5_VG1_K110) as decimal(15, 1)) as "Т74<br>°С [KA5_VG1_K110]",
	CAST(AVG(KA5_VG1_K111) as decimal(15, 1)) as "Т75<br>°С [KA5_VG1_K111]",
	CAST(AVG(KA5_VG1_K112) as decimal(15, 1)) as "Т76<br>°С [KA5_VG1_K112]",
	CAST(AVG(KA5_VG1_K113) as decimal(15, 1)) as "Т77<br>°С [KA5_VG1_K113]",
	CAST(AVG(KA5_VG1_K114) as decimal(15, 1)) as "Т78<br>°С [KA5_VG1_K114]",
	CAST(AVG(KA5_VG1_K115) as decimal(15, 1)) as "Т79<br>°С [KA5_VG1_K115]",
	CAST(AVG(KA5_VG1_K116) as decimal(15, 1)) as "Т80<br>°С [KA5_VG1_K116]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
	KA5_VG1_K097,
	KA5_VG1_K098,
	KA5_VG1_K099,
	KA5_VG1_K100,
	KA5_VG1_K101,
	KA5_VG1_K102,
	KA5_VG1_K103,
	KA5_VG1_K104,
	KA5_VG1_K105,
	KA5_VG1_K106,
	KA5_VG1_K107,
	KA5_VG1_K108,
	KA5_VG1_K109,
	KA5_VG1_K110,
	KA5_VG1_K111,
	KA5_VG1_K112,
	KA5_VG1_K113,
	KA5_VG1_K114,
	KA5_VG1_K115,
	KA5_VG1_K116
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
