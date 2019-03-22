using System;
using System.IO;
using NLog;

namespace t4my
{
	class Program
	{
		private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();

		static void Main(string[] args)
		{
			Console.WriteLine("Hello World!");
			Console.WriteLine("CWD = " + Environment.CurrentDirectory);

			// Debug_WriteEnvVare();
			// Debug_WriteConfigSample();

			RunProcess(args);

			log.Debug("Bye World");
			Console.WriteLine("Bye World!");
			NLog.LogManager.Shutdown(); // Flush and close down internal threads and timers
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="args"></param>
		/// <returns></returns>
		private static bool RunProcess(string[] args)
		{
			log.Info("Processing Commandline arguments");
			if (args.Length < 1)
			{
				// Throw Error
				log.Error("Insufficient arguments, cannot proceeed");
				return false;
			}
			string lsAction = args[0].ToLower();
			string lsOutFile;
			t4my.Config loConfig;

			// [Output file]
			lsOutFile = (args.Length > 1) ? args[1] : string.Empty;

			// [Configuration file]
			loConfig = (args.Length > 2 && !string.IsNullOrWhiteSpace(args[2])) 
							? t4my.Config.FromFile (args[2]) 
							: t4my.Config.FromFile()
							;
			if (loConfig == null)
			{
				log.Error("Cannot proceed without a valid configuration.");
				return false;
			}

			// [Trigger template file] 
			if (args.Length > 3)
			{
				loConfig.TriggerTemplateFile = args[3];
			}

			// [Audit template file]
			if (args.Length > 4)
			{
				loConfig.AuditTableTemplateFile = args[4];
			}

			if (!string.IsNullOrEmpty(lsOutFile))
			{
				loConfig.OutputFile = lsOutFile;
			}
			(bool lbIsValid, string lsErrors) = loConfig.Validate();
			if (!lbIsValid)
			{
				log.Error("Cannot proceed, unrecoverable errors. See details below.");
				log.Error(lsErrors);
				return false;
			}

			// Begin processing
			switch (lsAction)
			{
				case "l":
					log.Info("Option selected: L = 'List all Tables'");
					string lsTables = t4my.Tables.List(loConfig);
					Console.WriteLine(lsTables);
					return true;
				case "g":
					log.Info("Option selected: G = 'Generate Script'");
					string lsScript = t4my.Triggers.TriggersScript(loConfig);
					break;
				default:
					// Throw error condition
					log.Error(
						new ArgumentException($"Unknown value '{lsAction}', aborting further processing.", "Action")
						, $"Unknown value '{lsAction}', aborting further processing."
					);
					return false;
			}
			return true;
		}


		#region Debugging functions - Can be safely deleted

		static string NL = Environment.NewLine;
		
		static void Debug_WriteEnvVare()
		{
			System.Collections.Hashtable loEVs = Environment.GetEnvironmentVariables() as System.Collections.Hashtable;
			string lsVar, lsLongOutput = Environment.NewLine;
			int liCount = 0;
			lsLongOutput += "Emitting Environment Variables - BEGIN" + NL;
			// Console.WriteLine("Emitting Environment Variables - BEGIN");
			foreach (string vKey in loEVs.Keys)
			{
				liCount++;
				lsVar = string.Format("{0,2}. {1,-30} = {2}", liCount, vKey, loEVs[vKey].ToString());
				lsLongOutput += lsVar + NL;
				// Console.WriteLine(lsVar);
			}
			lsLongOutput += "Emitting Environment Variables - END" + NL;
			// Console.WriteLine("Emitting Environment Variables - END");
			log.Info(lsLongOutput);
		}

		static void Debug_WriteConfigSample()
		{
			t4my.Config loConfig = Debug_GetConfigSample();
			// Console.WriteLine(loConfig.ToJSON());
			log.Info(NL + loConfig.ToJSON() + NL);
		}

		static t4my.Config Debug_GetConfigSample()
		{
			System.Collections.Generic.List<string> loList = new System.Collections.Generic.List<string>();
			loList.Add("Table_A");
			loList.Add("Table_B");
			loList.Add("Table_C");
			loList.Add("Table_D");
			t4my.Config loConfig = new Config()
			{
				ConnectionString = "server=127.0.0.1;port=3306;user=db_schema_user;password=plain_text_password;database=schema-name",
				Schema = "schema-name",
				TableList = loList,
			};
			return loConfig;
		}

		#endregion Debugging functions
	}

}
