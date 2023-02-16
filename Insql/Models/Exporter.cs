using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.SS.Util;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using BorderStyle = NPOI.SS.UserModel.BorderStyle;

namespace Insql.Models
{
	public static class Exporter
	{
		public static string Export(Report model)
		{
			// получаем модель данных
			var book = new HSSFWorkbook();
			var sheet = book.CreateSheet(model.CurrentQuery ?? "Отчёт");

			// границы печати
			sheet.FitToPage = true;
			sheet.PrintSetup.PaperSize = 9; // именно 9, а не А4, значение взято из записанного в excel макроса
			sheet.PrintSetup.FitHeight = 0;
			sheet.PrintSetup.FitWidth = 0;

			// стили ячеек
			var nameStyle = book.CreateCellStyle();
			var nameFont = book.CreateFont();
			nameFont.IsBold = true;
			nameFont.FontHeightInPoints = 14;
			nameStyle.SetFont(nameFont);
			nameStyle.BorderBottom = BorderStyle.None;
			nameStyle.BorderLeft = BorderStyle.None;
			nameStyle.BorderRight = BorderStyle.None;
			nameStyle.BorderTop = BorderStyle.None;

			var captStyle = book.CreateCellStyle();
			var captFont = book.CreateFont();
			captFont.IsBold = true;
			captStyle.SetFont(captFont);
			captStyle.BorderBottom = BorderStyle.Thin;
			captStyle.BorderLeft = BorderStyle.Thin;
			captStyle.BorderRight = BorderStyle.Thin;
			captStyle.BorderTop = BorderStyle.Thin;
			captStyle.WrapText = true;

			var textStyle = book.CreateCellStyle();
			var textFont = book.CreateFont();
			textFont.IsBold = false;
			textStyle.SetFont(textFont);
			textStyle.BorderBottom = BorderStyle.None;
			textStyle.BorderLeft = BorderStyle.None;
			textStyle.BorderRight = BorderStyle.None;
			textStyle.BorderTop = BorderStyle.None;

			var dataStyle = book.CreateCellStyle();
			var dataFont = book.CreateFont();
			dataFont.IsBold = false;
			dataStyle.SetFont(dataFont);
			dataStyle.BorderBottom = BorderStyle.Thin;
			dataStyle.BorderLeft = BorderStyle.Thin;
			dataStyle.BorderRight = BorderStyle.Thin;
			dataStyle.BorderTop = BorderStyle.Thin;

			// шапка таблицы
			int rowIndex = 2;
			int cellIndex = 0;
			var header = sheet.CreateRow(rowIndex);
			for (int i = 0; i < model.Headers.Length; i++)
			{
				if (model.Headers[i] != null)
				{
					Cell(cellIndex++, model.Headers[i].SeparatedName(" \r\n"), captStyle);
				}
			}

			// строки данных
			rowIndex++;
			foreach (var row in model.Rows)
			{
				cellIndex = 0;
				header = sheet.CreateRow(rowIndex);

				Cell(cellIndex++, row.Date.ToString(model.DateFormat), dataStyle);

				foreach (var cell in row.Cells)
				{
					if (cell != null)
					{
						Cell(cellIndex++, cell.Text, dataStyle);
					}
				}

				rowIndex++;
			}

			// агрегирование
			cellIndex = 0;
			header = sheet.CreateRow(++rowIndex);
			Cell(cellIndex++, "Агрегирование", textStyle);
			for (int i = 1; i < model.Summaries.Length; i++)
			{
				if (model.Summaries[i] != null)
				{
					Cell(cellIndex++, "", textStyle);
				}
			}
			rowIndex++;

			cellIndex = 0;
			header = sheet.CreateRow(rowIndex);
			Cell(cellIndex++, "Сумма", textStyle);
			for (int i = 1; i < model.Summaries.Length; i++)
			{
				if (model.Summaries[i] != null)
				{
					ValueCell(cellIndex++, Math.Round(model.Summaries[i].Sum, 2), dataStyle);
				}
			}
			rowIndex++;

			cellIndex = 0;
			header = sheet.CreateRow(rowIndex);
			Cell(cellIndex++, "Среднее", textStyle);
			for (int i = 1; i < model.Summaries.Length; i++)
			{
				if (model.Summaries[i] != null)
				{
					ValueCell(cellIndex++, Math.Round(model.Summaries[i].Avg(model.Rows.Count), 2), dataStyle);
				}
			}
			rowIndex++;

			cellIndex = 0;
			header = sheet.CreateRow(rowIndex);
			Cell(cellIndex++, "Минимум", textStyle);
			for (int i = 1; i < model.Summaries.Length; i++)
			{
				if (model.Summaries[i] != null)
				{
					ValueCell(cellIndex++, Math.Round(model.Summaries[i].Min, 2), dataStyle);
				}
			}
			rowIndex++;

			cellIndex = 0;
			header = sheet.CreateRow(rowIndex);
			Cell(cellIndex++, "Максимум", textStyle);
			sheet.AutoSizeColumn(0);
			for (int i = 1; i < model.Summaries.Length; i++)
			{
				if (model.Summaries[i] != null)
				{
					ValueCell(cellIndex, Math.Round(model.Summaries[i].Max, 2), dataStyle);
					sheet.AutoSizeColumn(cellIndex);
					if (sheet.GetColumnWidth(cellIndex) > 9 * 256)
					{
						sheet.SetColumnWidth(cellIndex, 9 * 256);
					}
					cellIndex++;
				}
			}

			// название
			rowIndex = 0;
			cellIndex = 0;
			header = sheet.CreateRow(rowIndex);
			for (int i = 0; i < model.Headers.Length; i++)
			{
				if (model.Headers[i] != null)
				{
					if (i == 0)
					{
						Cell(cellIndex++, model.Name, nameStyle);
					}
					else
					{
						Cell(cellIndex++, "", nameStyle);
					}
				}
			}
			sheet.AddMergedRegion(new CellRangeAddress(0, 0, 0, cellIndex - 1));


			// сохранение в файл
			string path = $"Отчёт {model.UrlPath.Replace("/", "_").Replace(".sql", "")} {model.CurrentQuery} {model.Start:dd_MM_yyyy HH_mm_ss}.xls";
			string serverPath = HttpContext.Current.Server.MapPath("~/content/export/" + path);
			using (var xls = new FileStream(serverPath, FileMode.Create))
			{
				book.Write(xls);
				xls.Close();
			}

			return path;

			ICell Cell(int index, string text, ICellStyle style)
			{
				var cell = header.CreateCell(index);
				if (double.TryParse(text, out double value))
				{
					cell.SetCellValue(value);
				}
				else
				{
					cell.SetCellValue(text);
				}
				cell.CellStyle = style;
				cell.CellStyle.VerticalAlignment = VerticalAlignment.Center;
				return cell;
			}

			ICell ValueCell(int index, double value, ICellStyle style)
			{
				var cell = header.CreateCell(index);
				cell.SetCellValue(value);
				cell.CellStyle = style;
				cell.CellStyle.VerticalAlignment = VerticalAlignment.Center;
				return cell;
			}
		}

		public static string ExportQuery(Report report)
		{
			var book = new HSSFWorkbook();
			var sheet = book.CreateSheet();

			var line = sheet.CreateRow(0);
			line.CreateCell(0).SetCellValue("Время");
			for (int i = 0; i < report.Headers.Length; i++)
			{
				line.CreateCell(i + 1).SetCellValue(report.Headers[i].Name);
			}

			line = sheet.CreateRow(1);
			line.CreateCell(0).SetCellValue("");
			for (int i = 0; i < report.Headers.Length; i++)
			{
				line.CreateCell(i + 1).SetCellValue(report.Headers[i].Hint);
			}

			int index = 2;
			foreach (var row in report.Rows)
			{
				line = sheet.CreateRow(index++);
				line.CreateCell(0).SetCellValue(row.Date.ToString("dd.MM.yyyy HH:mm:ss"));
				for (int i = 0; i < row.Cells.Length; i++)
				{
					if (row.Cells[i].IsBoolean)
					{
						line.CreateCell(i + 1).SetCellValue(row.Cells[i].Bool);
					}
					else if (row.Cells[i].IsFloat)
					{
						line.CreateCell(i + 1).SetCellValue(row.Cells[i].Value);
					}
					else
					{
						line.CreateCell(i + 1).SetCellValue(row.Cells[i].Text);
					}
				}
			}

			for (int i = 0; i < index; i++)
			{
				sheet.AutoSizeColumn(i);
			}

			// сохранение в файл
			string path = string.Format("webQuery-{0:d}.xls", DateTime.Now).Replace("/", "-");
			string serverPath = HttpContext.Current.Server.MapPath("~/content/export/" + path);
			using (var xls = new FileStream(serverPath, FileMode.Create))
			{
				book.Write(xls);
				xls.Close();
			}

			return path;
		}

		public static string ExportAlarms(List<Alarm> alarms)
		{
			var book = new HSSFWorkbook();
			var sheet = book.CreateSheet();

			var header = sheet.CreateRow(0);
			header.CreateCell(0).SetCellValue("Дата/время");
			header.CreateCell(1).SetCellValue("Тег");
			header.CreateCell(2).SetCellValue("Описание");
			header.CreateCell(3).SetCellValue("Сервер");
			header.CreateCell(4).SetCellValue("Класс");
			header.CreateCell(5).SetCellValue("Тип");
			header.CreateCell(6).SetCellValue("Значение");
			header.CreateCell(7).SetCellValue("Контрольное значение");

			int index = 1;
			foreach (var alarm in alarms)
			{
				var row = sheet.CreateRow(index++);
				row.CreateCell(0).SetCellValue(alarm.Date.ToString("dd.MM.yyyy HH:mm:ss.fff"));
				row.CreateCell(1).SetCellValue(alarm.TagName);
				row.CreateCell(2).SetCellValue(alarm.Comment);
				row.CreateCell(3).SetCellValue(alarm.Node);
				row.CreateCell(4).SetCellValue(alarm.Class);
				row.CreateCell(5).SetCellValue(alarm.Type);
				row.CreateCell(6).SetCellValue(alarm.Value);
				row.CreateCell(7).SetCellValue(alarm.ControlValue);
			}

			for (int i = 0; i < index; i++)
			{
				sheet.AutoSizeColumn(i);
			}

			// сохранение в файл
			string path = string.Format("Алармы-{0:d}.xls", DateTime.Now).Replace("/", "-");
			string serverPath = HttpContext.Current.Server.MapPath("~/content/export/" + path);
			using (var xls = new FileStream(serverPath, FileMode.Create))
			{
				book.Write(xls);
				xls.Close();
			}

			return path;
		}
	}
}