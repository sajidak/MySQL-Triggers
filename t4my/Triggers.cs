using System;
using NLog;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace t4my
{
	public static class Triggers
	{
		private readonly static NLog.ILogger log = NLog.LogManager.GetCurrentClassLogger();

		/// <summary>
		/// 
		/// </summary>
		/// <param name="RunConfig"></param>
		/// <returns></returns>
		public static string TriggersScript(t4my.Config RunConfig){
			log.Info("Preparing to build trigger script.");
			List<ColumnEntry> loColumnList = new List<ColumnEntry>();
			StringBuilder lsbScript = new StringBuilder();
			string lsCurrTable;

			// Validate Input
			log.Debug("Validate input (TBD)");

			// Add timestamp in comment
			log.Info("Write header to script.");
			lsbScript.AppendLine("/* ");
			lsbScript.AppendLine(" Audit Triggers Script");
			lsbScript.AppendLine("     generated on " + DateTime.Now.ToString("yyyy MMM dd @ HH:mm:ss.fff"));
			lsbScript.AppendLine("     for Schema '" + RunConfig.Schema + "'");
			lsbScript.AppendLine("     by Triggers for MySQL v0.1.0");	// TODO: get version number dynamically
			lsbScript.AppendLine("     (t4my.Triggers.TriggersScript)");
			lsbScript.AppendLine("*/ ");

			// Add audit table to script
			log.Info("Add Audit Trail Table to script, from template file {0}", RunConfig.AuditTableTemplateFile);
			lsbScript.AppendLine(RunConfig.GetAuditTableTemplate());

			// If list is empty, process all tables
			if (RunConfig.TableList.Count == 0)
			{
				log.Info("Table list is empty, get all tables.");
				RunConfig.TableList = Tables.TableList(RunConfig);
			} else
			{
				log.Info("Table list has {0} entries.", RunConfig.TableList.Count);
			}

			// Build Column List
			log.Debug("Get all columns of all tables in schema");
			loColumnList = TableColumns(RunConfig);

			// Get trigger template
			log.Info("Get trigger template from file {0}", RunConfig.TriggerTemplateFile);
			RunConfig.LoadTriggerTemplate();

			// Add script for each table
			log.Debug("Begin Processing {0} tables.", RunConfig.TableList.Count);
			for (int vI = 0; vI < RunConfig.TableList.Count; vI++)
			{
				lsCurrTable = RunConfig.TableList[vI];
				log.Debug("Processing table '{0}'", lsCurrTable);
				RunConfig.CurrentTable = lsCurrTable;
				RunConfig.TableColumns = loColumnList.FindAll(t => t.Table == lsCurrTable);
				lsbScript.AppendLine(TableTriggerScript(RunConfig));
			}

			// Write script to file
			log.Info("Write script to file: {0}", RunConfig.OutputFile);
			File.WriteAllText(RunConfig.OutputFile, lsbScript.ToString());

			// Cleanup
			log.Debug("Cleanup working data from config.");
			RunConfig.ClearInternalData();

			return lsbScript.ToString();
		}

		// TODO:
		private static (bool, string) Validate(){
			log.Warn(
				  new System.NotImplementedException()
				, "NOT YET IMPLEMENTED!"
				);
			return (true, string.Empty);
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="RunConfig"></param>
		/// <returns></returns>
		private static List<ColumnEntry> TableColumns(t4my.Config RunConfig){
			log.Info("Fetching all columns of all tables for schema '{0}'", RunConfig.Schema);

			List<ColumnEntry> loColumnList = new List<ColumnEntry>();
			try
			{
				using (MySqlConnection dbConn = new MySqlConnection(RunConfig.ConnectionString))
				{
					MySqlDataReader dbRDR;
					MySqlCommand dbCMD;
					string lsCMD;

					dbConn.Open();
					log.Debug("Connection status = {0}", dbConn.State);

					//// Get list of candidates that have been scored
					lsCMD = @"select TABLE_NAME, ORDINAL_POSITION, COLUMN_NAME, DATA_TYPE
							  from information_schema.COLUMNS
							  where TABLE_SCHEMA = @SCHEMA;"
							  ;
					dbCMD = new MySqlCommand();
					dbCMD.Connection = dbConn;
					dbCMD.CommandType = System.Data.CommandType.Text;
					dbCMD.CommandText = lsCMD;
					dbCMD.Prepare();

					dbCMD.Parameters.Add(new MySql.Data.MySqlClient.MySqlParameter("@SCHEMA", MySqlDbType.VarChar)
					{
						Value = RunConfig.Schema.Trim()
					});

					dbRDR = dbCMD.ExecuteReader();
					while (dbRDR.Read())
					{
						loColumnList.Add(new ColumnEntry()
						{
							Seq = int.Parse(dbRDR["ORDINAL_POSITION"].ToString()),
							Table = dbRDR["TABLE_NAME"].ToString(),
							Column = dbRDR["COLUMN_NAME"].ToString(),
							DataType = dbRDR["DATA_TYPE"].ToString()
						});
					}
					log.Info("Got {0} entries", loColumnList.Count);
					dbRDR.Close();
					dbConn.Close();
				}

			}
			catch (System.Exception eX)
			{
				log.Error(eX, "Error fetching Column list for schema");
				throw eX;
			}

			return loColumnList;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="RunConfig"></param>
		/// <returns></returns>
		private static string TableTriggerScript(t4my.Config RunConfig){
			log.Info(
				  "Building trigger script for table '{0}', with {1} columns"
				, RunConfig.CurrentTable
				, RunConfig.TableColumns.Count
				);

			StringBuilder lsbOldCols = new StringBuilder();
			StringBuilder lsbNewCols = new StringBuilder();

			// Working vars
			string lsPFX = consts.COL_ENTRY_PFX_FIRST;
			string lsEntry = "";
			string lsTrigger = "";

			// build old, new column list
			// RunConfig.TableColumns.Sort(delegate (ColumnEntry X, ColumnEntry Y) {return (X.Seq > Y.Seq) ? 1 : -1;});
			RunConfig.TableColumns.Sort();
			foreach (ColumnEntry vCol in RunConfig.TableColumns)
			{
				lsEntry = string.Format(consts.COLUMN_ENTRY_OLD, lsPFX, vCol.Column);
				lsbOldCols.AppendLine(lsEntry);
				lsEntry = string.Format(consts.COLUMN_ENTRY_NEW, lsPFX, vCol.Column);
				lsbNewCols.AppendLine(lsEntry);
				// Need comma for subsequent entries
				lsPFX = consts.COL_ENTRY_PFX_OTHER;	// TODO: figure out better way
			}
			// generate trigger for table
			lsTrigger = RunConfig.TriggerTemplate
									.Replace(RunConfig.PlaceHolderValues.TABLE_NAME_PLACEHOLDER, RunConfig.CurrentTable)
									.Replace(RunConfig.PlaceHolderValues.OLD_COLUMNS_PLACEHOLDER, lsbOldCols.ToString())
									.Replace(RunConfig.PlaceHolderValues.NEW_COLUMNS_PLACEHOLDER, lsbNewCols.ToString())
									;
			log.Debug("Done building trigger script for table {0}", RunConfig.CurrentTable);
			return lsTrigger;
		}

	}
}
