{Month total counter}
/*ReportName=Системный лог InSQL (Итоговый за месяц)*/
/*ReportRefresh=dd.MM.yyyy HH:mm:01.000*/
/*StartDate=01.MM.yyyy 00:00:00.010*/
/*DeltaDate=00.01.0000 00:00:00.000*/
/*Step=00.01.0000 00:00:00.000*/
/*DownQuery="Summary log"*/

SET QUOTED_IDENTIFIER OFF
select
	CONVERT(nvarchar(10),DateTime,104) as 'Дата',
	Type,
	SUM(TotalCount) as 'Count'
FROM
	dbo.v_ErrorLog
WHERE
	DateTime >= @start
GROUP BY
	CONVERT(nvarchar(10),DateTime,104),Type
order by
	CONVERT(nvarchar(10),DateTime,104),Type


{Summary log}
/*ReportName=Системный лог InSQL (Суммарный)*/
/*ReportRefresh=dd.MM.yyyy HH:mm:00.000*/
/*StartDate=dd.MM.yyyy 00:00:00.010*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*DownQuery="Detail log"*/
/*UpQuery="Month total counter"*/

SET QUOTED_IDENTIFIER OFF
select
	Min(DateTime) as 'Start Time',
	Max(DateTime) as 'End Time',
	Type,
	LocalizedText,
	Parameter,
	SUM(TotalCount) as 'Count',
	ModuleID,
	FileName,
	Line
FROM
	dbo.v_ErrorLog
WHERE
	DateTime >= @start
GROUP BY
	Type,
	LocalizedText,
	Parameter,
	ModuleID,
	FileName,
	Line
order by
	Max(DateTime)


{Detail log}
/*ReportName=Системный лог InSQL (Детальный)*/
/*ReportRefresh=dd.MM.yyyy HH:mm:00.000*/
/*StartDate=dd.MM.yyyy 00:00:00.010*/
/*DeltaDate=00.00.0000 23:59:59.000*/
/*Step=01.00.0000 00:00:00.000*/
/*UpQuery="Summary log"*/

SET QUOTED_IDENTIFIER OFF
SELECT
	*
FROM
	dbo.v_ErrorLog
WHERE
	DateTime >= @start
Order by
	datetime