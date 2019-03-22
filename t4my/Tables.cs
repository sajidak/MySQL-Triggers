using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using NLog;

/*
Requies Connection string
*/

namespace t4my
{
	public static class Tables
	{
		private readonly static NLog.ILogger log = NLog.LogManager.GetCurrentClassLogger();

		/// <summary>
		/// 
		/// </summary>
		/// <param name="t4MyConfiguration"></param>
		/// <returns></returns>
		public static string List(Config t4MyConfiguration)
		{
			log.Info("Preparing to Fetch table list of schema.");
			System.Text.StringBuilder lsbList = new System.Text.StringBuilder();

			List<string> loList = TableList(t4MyConfiguration);
			log.Trace($"Formatting entries for {loList.Count} tables");
			string lsEntry = consts.TABLE_ENTRY_FIRST;
			foreach (string vTbl in loList)
			{
				log.Trace($"Formatting table {vTbl}");
				lsbList.AppendLine(string.Format(lsEntry, vTbl));
				lsEntry = consts.TABLE_ENTRY_OTHER;
			}
			log.Debug("Formatted Table Entries {0}{1}{0}", Environment.NewLine, lsbList.ToString());
			return lsbList.ToString();
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="t4MyConfiguration"></param>
		/// <returns></returns>
		internal static List<string> TableList(Config t4MyConfiguration){
			log.Info("Preparing to Fetch table list of schema '${0}'", t4MyConfiguration.Schema);
			List<string> loList = new List<string>();
			try
			{
				using (MySqlConnection dbConn = new MySqlConnection(t4MyConfiguration.ConnectionString))
				{
					MySqlDataReader dbRDR;
					MySqlCommand dbCMD;
					string lsCMD;
					string lsEntry;

					dbConn.Open();
					log.Debug("Connection status = {0}", dbConn.State);

					lsCMD = "SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = @SCHEMA and TABLE_TYPE = 'BASE TABLE';";
					dbCMD = new MySqlCommand();
					dbCMD.Connection = dbConn;
					dbCMD.CommandType = System.Data.CommandType.Text;
					dbCMD.CommandText = lsCMD;
					dbCMD.Prepare();

					dbCMD.Parameters.Add(new MySql.Data.MySqlClient.MySqlParameter("@SCHEMA", MySqlDbType.VarChar)
					{
						Value = t4MyConfiguration.Schema.Trim()
					});

					dbRDR = dbCMD.ExecuteReader();
					lsEntry = consts.TABLE_ENTRY_FIRST;
					while (dbRDR.Read())
					{
						lsEntry = dbRDR["TABLE_NAME"].ToString();
						loList.Add(lsEntry);
						log.Trace($"Got table {lsEntry}");
					}
					log.Info("Got {0} tables for schema {1}", loList.Count, t4MyConfiguration.Schema.Trim());
					dbRDR.Close();
					dbConn.Close();
				}

			}
			catch (System.Exception eX)
			{
				log.Error(eX, "Error fetching table list for schema");
			}

			return loList;
		}

	}
}
