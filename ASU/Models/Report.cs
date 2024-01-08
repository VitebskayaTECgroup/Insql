using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace Insql.Models
{
	public class Report
	{
		// настройки

		public DateTime TimeCreated { get; set; }

		public DateTime Start { get; set; }

		public DateTime Finish { get; set; }

		public string ErrorText { get; set; }

		public Exception Error { get; set; }

		public string[] Queries { get; set; }

		public string CurrentQuery { get; set; }

		public string UpQuery { get; set; }

		public string DownQuery { get; set; }

		public string Name { get; set; }

		public string FilePath { get; set; }

		public string UrlPath { get; set; }

		public string Sql { get; set; }

		public string DateFormat { get; set; }

		public int Resolution { get; set; }

		public bool IsLive { get; set; }

		public bool IsEditEnabled { get; set; }

		// данные

		public ReportHeader[] Headers { get; set; }

		public List<ReportRow> Rows { get; set; }

		public ReportSummary[] Summaries { get; set; }

		public Dictionary<string, List<float>> Traces { get; set; }

		public List<string> Coords { get; set; }

		// методы
		public Report ToTable(string path, string query, string server, string date, string step, string down, string live)
		{
			TimeCreated = DateTime.Now;
			string fileRaw = "", mode = null, database = null, maskStart = null, maskDelta = null, maskStep = null,
				serverName = null, text = null, hint = null, field = null, tagName = null, check = "";
			string[] headerParams = null;
			float val = 0;
			bool /*isGrouping = false, */isFloat = false, descToText = false, isCheckPassed = false;
			DateTime _date;

			// Читаем файл и тип запроса
			try
			{
				UrlPath = path;
				FilePath = HttpContext.Current.Server.MapPath("~/content/sql/" + path);
				fileRaw = System.IO.File.ReadAllText(FilePath);
			}
			catch (Exception e)
			{
				Error = e;
				ErrorText = "Ошибка при чтении файла отчёта";
				return this;
			}

			// Строим список отчётов и получаем текст отчета
			try
			{
				var parts = fileRaw.Split('{');
				var queries = new List<string>(); // список отчетов

				for (int i = 1; i < parts.Length; i++)
				{
					var currentSegment = parts[i];
					if (currentSegment.Contains("}"))
					{
						var currentQuery = currentSegment.Substring(0, currentSegment.IndexOf('}'));
						queries.Add(currentQuery);
						if (currentQuery == query || (string.IsNullOrEmpty(query) && i == 1))
						{
							Sql = currentSegment.Substring(currentSegment.IndexOf('}') + 1);
							CurrentQuery = currentQuery;
						}
					}
				}

				Queries = queries.ToArray();
			}
			catch (Exception e)
			{
				Error = e;
				ErrorText = "Ошибка при чтении списка разделов в файле отчёта";
				return this;
			}

			// Получаем список параметров из отчёта
			try
			{
				var parts = Sql.Substring(0, Sql.IndexOf("SELECT")).Split('\n');
				foreach (var part in parts)
				{
					if (!part.Contains("=")) continue;

					string raw = part.Replace("/*", "").Replace("*/", "").Trim();
					string key = raw.Substring(0, raw.IndexOf('='));
					string value = raw.Substring(raw.IndexOf('=') + 1).Replace("\"", "");

					if (key == "ReportName") Name = value;
					else if (key == "StartDate") maskStart = value;
					else if (key == "DeltaDate") maskDelta = value;
					else if (key == "Step") maskStep = value;
					else if (key == "Database") database = value;
					else if (key == "DownQuery") DownQuery = value;
					else if (key == "UpQuery") UpQuery = value;
					else if (key == "Resolution") Resolution = int.Parse(value);
					//else if (key == "Grouping") isGrouping = true;
					else if (key == "Mode") mode = value;
					else if (key == "DateFormat") DateFormat = value;
				}
				if (!string.IsNullOrEmpty(server)) serverName = server;

				// Определение режима работы и установка дефолтных параметров
				if (mode == "минутные" || string.IsNullOrEmpty(mode))
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "dd.MM.yyyy HH:01:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.00.0000 00:59:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "00.00.0000 01:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "dd.MM.yyyy HH:mm:ss";
					if (Resolution == 0) Resolution = 60000;
				}
				else if (mode == "часовые-1")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "dd.MM.yyyy 01:05:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.00.0000 23:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "01.00.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "dd.MM.yyyy HH:mm";
					if (Resolution == 0) Resolution = 3600000;
				}
				else if (mode == "часовые-2")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "dd.MM.yyyy 01:00:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.00.0000 23:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "01.00.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "dd.MM.yyyy HH:mm";
					if (Resolution == 0) Resolution = 3600000;
				}
				else if (mode == "часовые-с-нуля")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "dd.MM.yyyy 00:00:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.00.0000 23:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "01.00.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "dd.MM.yyyy HH:mm";
					if (Resolution == 0) Resolution = 3600000;
				}
				else if (mode == "суточные-1")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "02.MM.yyyy 00:05:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "-01.01.0000 00:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "00.01.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "d MMMM yyyy";
					if (Resolution == 0) Resolution = 86400000;
				}
				else if (mode == "суточные-2")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "02.MM.yyyy 00:00:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "-01.01.0000 00:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "00.01.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "d MMMM yyyy";
					if (Resolution == 0) Resolution = 86400000;
				}
				else if (mode == "8-12")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "dd.MM.yyyy 09:05:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.00.0000 11:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "00.00.0000 12:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "dd.MM.yyyy HH:mm:ss";
					if (Resolution == 0) Resolution = 3600000;
				}
				else if (mode == "посменный")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "01.MM.yyyy 09:05:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.01.0000 11:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "00.01.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "dd.MM.yyyy HH:mm:ss";
					if (Resolution == 0) Resolution = 3600000;
				}
				else if (mode == "смены за месяц")
				{
					if (string.IsNullOrEmpty(maskStart)) maskStart = "01.MM.yyyy 09:05:00.000";
					if (string.IsNullOrEmpty(maskDelta)) maskDelta = "00.01.0000 11:00:00.000";
					if (string.IsNullOrEmpty(maskStep)) maskStep = "00.01.0000 00:00:00.000";
					if (string.IsNullOrEmpty(DateFormat)) DateFormat = "MMMM yyyy";
					if (Resolution == 0) Resolution = 3600000;
				}
				if (string.IsNullOrEmpty(Name)) Name = "наименование не определено";
				if (string.IsNullOrEmpty(database)) database = "runtime";
			}
			catch (Exception e)
			{
				Error = e;
				ErrorText = "Ошибка при получении настроек из отчёта";
				return this;
			}

			// Определяем итоговые параметры отчета
			try
			{
				Start = DateTime.TryParse(date, out DateTime d) ? d : DateTime.Now;
				Start = ParseDateStart(maskStart, Start);

				// Реализация смещения по времени
				if (!string.IsNullOrEmpty(step))
				{
					Start = ParseDateDelta(maskStep, Start, step);
				}

				// Реализация перехода во вложенный отчёт
				var isDownQuery = false;
				if (down == "1") isDownQuery = true;
				if (isDownQuery && mode == "минутные")
				{
					Start = ParseDateDelta(maskStep, Start, "back");
				}

				// Отсечение будущего времени
				if (Start > DateTime.Now)
				{
					Start = ParseDateStart(maskStart, DateTime.Now);
				}

				// Определение конечной даты
				Finish = ParseDateDelta(maskDelta, Start);
				if (Finish > DateTime.Now)
				{
					Finish = DateTime.Now;
					IsLive = true;
				}
				else
				{
					IsLive = live == "1";
				}
			}
			catch (Exception e)
			{
				Error = e;
				ErrorText = "Ошибка при вычислении диапазона времени";
				return this;
			}

			// Замена в SQL запросе дефолтных значений на определенные параметры
			try
			{
				Sql = Sql
					.Replace("@start", "'" + DateToSqlString(Start) + "'")
					.Replace("@finish", "'" + DateToSqlString(Finish) + "'")
					.Replace("@resolution", Resolution.ToString())
					;

				// Запрос и отображение данных
				using (var conn = new OdbcConnection())
				{
					conn.ConnectionString = "Driver={SQL Server}; Server=" + serverName + "; Database=" + database + "; Uid=wwuser; Pwd=wwuser;";
					conn.ConnectionTimeout = 240;
					conn.Open();

					using (var command = new OdbcCommand())
					{
						command.Connection = conn;
						command.CommandText = Sql;
						command.CommandTimeout = 240;

						Debug.WriteLine(Sql);

						using (var reader = command.ExecuteReader())
						{
							// Заголовки столбцов
							int ColumnsCount = reader.FieldCount;

							Headers = new ReportHeader[ColumnsCount];
							Rows = new List<ReportRow>();
							Summaries = new ReportSummary[ColumnsCount];
							Coords = new List<string>();
							Traces = new Dictionary<string, List<float>>();

							for (int i = 0; i < ColumnsCount; i++)
							{
								hint = "";
								field = reader.GetName(i);

								if (string.IsNullOrEmpty(field))
								{
									Headers[i] = null;
									Summaries[i] = null;
								}
								else
								{
									Headers[i] = new ReportHeader
									{
										CheckValues = null,
										Checks = new string[] { "ALARM_TD_HH", "ALARM_TD_H", "ALARM_TD_N", "ALARM_TD_L", "ALARM_TD_LL" },
									};
									Summaries[i] = new ReportSummary
									{
										Sum = 0,
										Max = float.MinValue,
										Min = float.MaxValue,
									};

									if (field.Contains("["))
									{
										tagName = null;
										descToText = false;

										headerParams = field.Replace("]", "").Split('[');
										field = headerParams[0]?.Trim() ?? "";

										for (int k = 1; k < headerParams.Length; k++)
										{
											string key, value;
											if (headerParams[k].Contains(":"))
											{
												key = headerParams[k].Substring(0, headerParams[k].IndexOf(':')).ToUpper().Trim();
												value = headerParams[k].Substring(headerParams[k].IndexOf(':') + 1);
											}
											else
											{
												key = headerParams[k].ToUpper().Trim();
												value = "";
											}

											if (key == "CHECK")
											{
												Headers[i].CheckValues = value
													.Split(',')
													.Select(x => float.TryParse(x, out float f) ? f : 0)
													.ToArray();
											}

											else if (key == "CLASS")
											{
												Headers[i].Checks = value
													.Split(',');
											}

											else if (key == "VERTICAL")
											{
												Headers[i].IsVertical = true;
											}

											else if (key == "EDIT")
											{
												Headers[i].Edit = value.ToUpper().Replace("M1", "").Replace("|", "").Replace(":", "").Trim();
												IsEditEnabled = true;
											}

											else if (key == "HINT")
											{
												hint += value.Trim();
											}

											else if (key == "DESCRIPTION" || key == "DESC")
											{
												descToText = true;
											}

											else
											{
												tagName = key;
											}
										}

										if (!string.IsNullOrEmpty(tagName))
										{
											using (var conn2 = new OdbcConnection())
											{
												conn2.ConnectionString = "Driver={SQL Server}; Server=" + serverName + "; Database=runtime; Uid=wwuser; Pwd=wwuser;";
												conn2.ConnectionTimeout = 240;
												conn2.Open();

												using (var command2 = new OdbcCommand())
												{
													command2.CommandText = "SELECT TOP 1 Description FROM Tag WHERE TagName = '" + tagName + "'";
													command2.Connection = conn2;

													var reader2 = command2.ExecuteReader();

													if (reader.HasRows)
													{
														try
														{
															reader2.Read();
															string desc = reader2[0].ToString();

															if (descToText) field = desc + field;
															hint = tagName + ": " + desc + hint;
														}
														catch
														{
															hint = tagName + hint;
														}
													}
												}
											}
										}
									}

									Headers[i].Name = field;
									Headers[i].Hint = hint;

									Traces.Add(field, new List<float>());
								}
							}

							// Строки данных
							while (reader.Read())
							{
								text = reader[0].ToString();

								var row = new ReportRow
								{
									Cells = new ReportCell[ColumnsCount - 1],
									Date = DateTime.TryParse(text, out _date) ? _date : DateTime.MinValue
								};

								Coords.Add(row.Date.ToString(DateFormat));
								
								Rows.Add(row);

								for (int i = 1; i < ColumnsCount; i++)
								{
									var header = Headers[i];

									if (header != null)
									{
										isFloat = false;
										val = 0;
										check = "";

										if (reader[i] == DBNull.Value)
										{
											text = null;
										}
										else
										{
											text = reader[i].ToString();
											isFloat = float.TryParse(text, out val);
										}

										// Проверка уставок
										if (isFloat && header.CheckValues != null)
										{
											isCheckPassed = false;

											for (int x = 0; x < header.CheckValues.Length; x++)
											{
												if (val <= header.CheckValues[x])
												{
													try
													{
														check = header.Checks[x];
														isCheckPassed = true;
														break;
													}
													catch { }
												}
											}

											if (!isCheckPassed)
											{
												check = header.Checks.Last();
											}
										}

										row.Cells[i - 1] = new ReportCell
										{
											Text = text,
											IsFloat = isFloat,
											Value = isFloat ? val : 0,
											Check = check,
											Edit = header.Edit,
											IsEmpty = header.Name == "DateMarker",
										};

										// Сбор данных для агрегирования
										Summaries[i].Sum += val;
										if (val < Summaries[i].Min) Summaries[i].Min = val;
										if (val > Summaries[i].Max) Summaries[i].Max = val;

										// Запись значения в trace для графиков
										if (Traces.ContainsKey(header.Name))
										{
											Traces[header.Name].Add(isFloat ? val : 0);
										}
									}
								}
							}
						}
					}
				}
			}
			catch (Exception e)
			{
				Error = e;
				ErrorText = "Ошибка при выполнении Sql кода";
				return this;
			}

			return this;
		}

		public Report ToQuery(string server, string tags, string res, string start, string finish)
		{
			Headers = new ReportHeader[0];
			Rows = new List<ReportRow>();

			if (tags == "") return this;

			Start = DateTime.TryParse(start, out DateTime d) ? d : DateTime.Today.AddHours(DateTime.Now.Hour);
			Finish = DateTime.TryParse(finish, out d) ? d : DateTime.Now;
			Resolution = int.TryParse(res, out int r) ? r : 60000;

			Sql = @"SET QUOTED_IDENTIFIER OFF
				SELECT * FROM OpenQuery(INSQL, 
				""SELECT DateTime, @tags
				FROM Runtime.dbo.WideHistory
				WHERE wwVersion = 'Latest'
				AND wwRetrievalMode = 'Cyclic'
				AND wwResolution = @resolution
				AND DateTime >= '@start'
				AND DateTime <= '@end'"")"
				.Replace("@tags", tags)
				.Replace("@start", Start.ToString("yyyyMMdd HH:mm:ss.fff"))
				.Replace("@end", Finish.ToString("yyyyMMdd HH:mm:ss.fff"))
				.Replace("@resolution", Resolution.ToString());

			using (var conn = new OdbcConnection())
			{
				conn.ConnectionString = "Driver={SQL Server}; Server=" + server.ToUpper() + "; Database=Runtime; Uid=wwuser; Pwd=wwuser;";
				conn.ConnectionTimeout = 240;
				conn.Open();

				using (var command = new OdbcCommand())
				{
					command.Connection = conn;
					command.CommandTimeout = 300;
					command.CommandText = Sql;

					using (var reader = command.ExecuteReader())
					{
						int ColumnsCount = reader.FieldCount;

						Headers = new ReportHeader[ColumnsCount];

						for (int i = 0; i < ColumnsCount; i++)
						{
							Headers[i] = new ReportHeader
							{
								Name = reader.GetName(i),
								Hint = "",
							};
						}

						while (reader.Read())
						{
							var text = reader[0].ToString();

							var row = new ReportRow
							{
								Cells = new ReportCell[ColumnsCount - 1],
								Date = DateTime.TryParse(text, out d) ? d : DateTime.MinValue
							};

							Rows.Add(row);

							for (int i = 1; i < ColumnsCount; i++)
							{
								var cell = new ReportCell();

								if (reader[i] == DBNull.Value)
								{
									cell.IsBoolean = false;
									cell.IsFloat = false;
									cell.Text = null;
								}
								else if (reader.GetFieldType(i) == typeof(bool))
								{
									cell.IsBoolean = true;
									cell.IsFloat = false;
									cell.Bool = reader.GetBoolean(i);
								}
								else
								{
									cell.Text = reader[i].ToString();
									cell.IsBoolean = false;
									cell.IsFloat = float.TryParse(cell.Text, out float val);
									cell.Value = val;
								}

								row.Cells[i - 1] = cell;
							}
						}
					}
				}

				using (var command = new OdbcCommand())
				{
					command.Connection = conn;
					command.CommandTimeout = 10;
					command.CommandText = "SELECT TagName, Description FROM Tag WHERE TagName IN ('" + tags.Replace(",", "','") + "')";

					using (var reader = command.ExecuteReader())
					{
						var desc = new Dictionary<string, string>();

						while (reader.Read())
						{
							desc.Add(reader[0].ToString(), reader[1].ToString());
						}

						foreach (var header in Headers)
						{
							if (desc.ContainsKey(header.Name))
							{
								header.Hint = desc[header.Name];
							}
						}
					}
				}
			}

			return this;
		}

		string DateToSqlString(DateTime date)
		{
			return date.ToString("yyyyMMdd HH:mm:ss.000");
		}

		DateTime ParseDateStart(string mask, DateTime start)
		{
			var newMask = mask
				.Replace("yyyy", start.ToString("yyyy"))
				.Replace("dd", start.ToString("dd"))
				.Replace("MM", start.ToString("MM"))
				.Replace("HH", start.ToString("HH"))
				.Replace("mm", start.ToString("mm"))
				.Replace("ss", start.ToString("ss"))
				;

			return DateTime.Parse(newMask);
		}

		DateTime ParseDateDelta(string mask, DateTime delta, string direction = "forward")
		{
			var newDate = delta;
			var dateParts = mask.Split(' ');

			var dateSubParts = dateParts[0].Split('.');
			int years = int.Parse(dateSubParts[2]);
			int months = int.Parse(dateSubParts[1]);
			int days = int.Parse(dateSubParts[0]);

			dateSubParts = dateParts[1].Replace(".000", "").Split(':');
			int hours = int.Parse(dateSubParts[0]);
			int minutes = int.Parse(dateSubParts[1]);
			int seconds = int.Parse(dateSubParts[2]);

			int changer = direction == "forward" ? 1 : -1;

			return newDate
				.AddDays(changer * years)
				.AddMonths(changer * months)
				.AddDays(changer * days)
				.AddHours(changer * hours)
				.AddMinutes(changer * minutes)
				.AddSeconds(changer * seconds)
				;
		}
	}
}