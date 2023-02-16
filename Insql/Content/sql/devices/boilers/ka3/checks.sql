{срезы минутные}
/*ReportName="К/a 4 - уставки" (срезы минутные)*/
/*Mode=минутные*/

SET QUOTED_IDENTIFIER OFF
SELECT
	DateTime as "Дата",
	null,
	CAST(K31_VD3A868 as decimal(15, 2)) as "B3A, Гц [K31_VD3A868]",
	CAST(K31_VD3B870 as decimal(15, 2)) as "В3Б, Гц [K31_VD3B870]",
	CAST(K31_A866f   as decimal(15, 2)) as "В3,  кПа [K31_A866f]",
	CAST(K31_F3A876  as decimal(15, 2)) as "Д3А, Гц [K31_F3A876]",
	CAST(K31_F3B878  as decimal(15, 2)) as "Д3Б, гЦ [K31_F3B878]",
	CAST(K31_FD221   as decimal(15, 2)) as "Д4,  Па [K31_FD221]"
FROM
	OpenQuery(INSQL,
	"SELECT DateTime,
		K31_VD3A868,
		K31_VD3B870,
		K31_A866f,
		K31_F3A876,
		K31_F3B878,
		K31_FD221
	FROM Runtime.dbo.AnalogWideHistory
	WHERE wwVersion = 'Latest'
	AND wwRetrievalMode = 'Cyclic'
	AND wwResolution = @resolution
	AND DateTime >= @start
	AND DateTime <= @finish")