// TABLE_NAME, ORDINAL_POSITION, COLUMN_NAME
using System;

namespace t4my
{
	/// <summary>
	/// 
	/// </summary>
	/// <typeparam name="ColumnEntry"></typeparam>
	internal class ColumnEntry : IComparable<ColumnEntry>
	{
		// private readonly static NLog.ILogger log = NLog.LogManager.GetCurrentClassLogger();

		public int Seq { get; set; }
		public string Table { get; set; }
		public string Column { get; set; }
		public string DataType { get; set; }

		// IComparable.CompareTo
		public int CompareTo(ColumnEntry Other){
			if (Other == null) return 1;
			return Seq.CompareTo(Other.Seq);
		}
	}
}
