using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.IO;
using System.Text;

namespace t4my
{
	public class Config
	{
		private readonly static NLog.ILogger log = NLog.LogManager.GetCurrentClassLogger();

		#region Public Properties
		public string Schema { get; set; } = string.Empty;
		public string ConnectionString { get; set; } = string.Empty;
		// public string ConfigurationFile { get; set; } = "configs/t4my.default-config.json";	// path to self... makes no sense
		public string AuditTableTemplateFile { get; set; } = "templates/t4my.default-audittable-template.txt";
		public string TriggerTemplateFile { get; set; } = "templates/t4my.default-trigger-template.txt";
		public string OutputFile { get; set; } = "t4MySql-trigger-script.sql";
		public PlaceHolders PlaceHolderValues { get; set; } = new PlaceHolders();
		public List<string> TableList { get; set; } = new List<string>();
		#endregion Public Properties

		#region Internal Properties
		// These should not be visible outside this library

		[JsonIgnore]
		internal string CurrentTable { get; set; } = string.Empty;    
		[JsonIgnore]
		internal string TriggerTemplate { get; set; }
		[JsonIgnore]
		internal List<ColumnEntry> TableColumns { get; set; }

		#endregion Internal Properties


		#region Static Helper Methods

		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public string ToJSON()
		{
			string lsOut;
			lsOut = JsonConvert.SerializeObject(this, new JsonSerializerSettings()
			{
				Formatting = Formatting.Indented,
				MissingMemberHandling = MissingMemberHandling.Ignore,
				NullValueHandling = NullValueHandling.Include
			});
			;
			return lsOut;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="JsonString"></param>
		/// <returns></returns>
		public static Config FromJSON(string JsonString)
		{
			Config loConfig = JsonConvert.DeserializeObject<Config>(JsonString);
			return loConfig;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <param name="FilePath"></param>
		/// <returns></returns>
		public static Config FromFile(string FilePath = "")
		{
			if (string.IsNullOrWhiteSpace(FilePath))
			{
				FilePath = consts.DEFAULT_CONFIG_PATH;	// use default config path
			}
			if (!File.Exists(FilePath))
			{
				throw new FileNotFoundException("The file specified, " + FilePath + ", cannot be found.");
			}
			// Dont catch exception
			return FromJSON(
				File.ReadAllText(FilePath)
				);
		}

		#endregion Static Helper Methods


		#region Instance Methods

		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public (bool, string) Validate()
		{
			StringBuilder lsbErrors = new StringBuilder();
			bool lbNoErrors = true; // Deviation from standard. Default should be false.

			// Check for empty strings
			if (string.IsNullOrWhiteSpace(Schema))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("'Schema' value '" + Schema + "' is not valid");
			}
			if (string.IsNullOrWhiteSpace(ConnectionString))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("'ConnectionString' value '" + ConnectionString + "' is not valid");
			}
			// No sense in keeping reference to self
			// if (string.IsNullOrWhiteSpace(ConfigurationFile))
			// {
			// 	lbNoErrors = false;
			// 	lsbErrors.AppendLine("'ConfigurationFile' value '" + ConfigurationFile + "' is not valid");
			// }
			if (string.IsNullOrWhiteSpace(AuditTableTemplateFile))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("'AuditTableTemplateFile' value '" + AuditTableTemplateFile + "' is not valid");
			}
			if (string.IsNullOrWhiteSpace(TriggerTemplateFile))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("'TriggerTemplateFile' value '" + TriggerTemplateFile + "' is not valid");
			}
			if (string.IsNullOrWhiteSpace(OutputFile))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("'OutputFile' value '" + OutputFile + "' is not valid");
			}
			if (PlaceHolderValues == null)
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("'PlaceHolderValues' is not valid (empty)");
			}

			// Check for file exist
			// No sense in checking if self exists
			// if (!File.Exists(ConfigurationFile))
			// {
			// 	lbNoErrors = false;
			// 	lsbErrors.AppendLine("File '" + ConfigurationFile + "' does not exist");
			// }
			if (!File.Exists(AuditTableTemplateFile))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("File '" + AuditTableTemplateFile + "' does not exist");
			}
			if (!File.Exists(TriggerTemplateFile))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("File '" + TriggerTemplateFile + "' does not exist");
			}
			string lsOutDir = Path.GetDirectoryName(OutputFile);
			if (string.IsNullOrWhiteSpace(lsOutDir))
			{
				lsOutDir = "." + Path.DirectorySeparatorChar;
			}
			if (!Directory.Exists(lsOutDir))
			{
				lbNoErrors = false;
				lsbErrors.AppendLine("File '" + OutputFile + "' does not exist");
			}
			if (File.Exists(OutputFile))
			{
				lsbErrors.AppendLine("File '" + OutputFile + "' exists, and will be overwritten");
				//TODO: Check for write access.
			}

			return (lbNoErrors, lsbErrors.ToString());
		}

		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public string LoadTriggerTemplate()
		{
			//TODO: Use validation
			string lsTemplate;
			lsTemplate = File.ReadAllText(TriggerTemplateFile);
			this.TriggerTemplate = lsTemplate;
			return lsTemplate;
		}

		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public string GetAuditTableTemplate()
		{
			//TODO: Use validation
			string lsTemplate;
			lsTemplate = File.ReadAllText(AuditTableTemplateFile);
			return lsTemplate;
		}

		/// <summary>
		/// 
		/// </summary>
		internal void ClearInternalData(){
			CurrentTable = string.Empty;
			TriggerTemplate = string.Empty;
			TableColumns = null;
		}
		
		#endregion Instance Methods

	}

	/// <summary>
	/// Placeholder tags that will be replaced by the engine with corresponding values.
	/// </summary>
	public class PlaceHolders
	{
		
		/// <summary>
		/// List of all columns in the table, for Old values.
		/// </summary>
		/// <value></value>
		public String OLD_COLUMNS_PLACEHOLDER { get; set; } = @"${COLUMN_LIST_OLD";

		/// <summary>
		/// List of all columns in the table, for New values.
		/// </summary>
		/// <value></value>
		public String NEW_COLUMNS_PLACEHOLDER { get; set; } = @"${COLUMN_LIST_NEW}";

		/// <summary>
		/// Name of the table for which the script is being generated.
		/// </summary>
		/// <value></value>
		public String TABLE_NAME_PLACEHOLDER { get; set; } = @"${TABLE}";

		/// <summary>
		/// Name of the Audit Trail table, to which the audit records will be written to.
		/// </summary>
		/// <value></value>
		public String AUDIT_TABLE_NAME_PLACEHOLDER { get; set; } = @"${AUDIT_TABLE}";

	}
}
