using System;

namespace t4my
{
	public class consts
	{
		public const string COL_ENTRY_PFX_FIRST = "  ";
		public const string COL_ENTRY_PFX_OTHER = "                    , ";

		// {0} will be one of COL_ENTRY_PFX_FIRST | COL_ENTRY_PFX_OTHER
        // {1} will be the columns name
		public const string COLUMN_ENTRY_OLD = "{0}'{1}', old.{1}";
		public const string COLUMN_ENTRY_NEW = "{0}'{1}', new.{1}";

		// Default Values
		public const string DEFAULT_CONFIG_PATH = @"configs/t4my.default-config.json";
		public const string DEFAULT_AUDIT_TEMPLATE = @"templates/t4my.default-audittable-template.txt";
		public const string DEFAULT_TRIGGER_TEMPLATE = @"templates/t4my.default-trigger-template.txt";

		internal const string TABLE_ENTRY_FIRST = "          \"{0}\"";
		internal const string TABLE_ENTRY_OTHER = "        , \"{0}\"";
	}
}
