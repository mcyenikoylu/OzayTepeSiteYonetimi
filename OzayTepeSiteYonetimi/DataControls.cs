using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace OzayTepeSiteYonetimi
{
    
    class DataControls
    {
        public static DataTable ListToDt<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                string sType = (prop.PropertyType).FullName.ToString();
                Type type = Type.GetType(sType);

                if (prop.PropertyType.FullName.ToString().Contains("System.Int32"))
                {
                    dataTable.Columns.Add(prop.Name, typeof(System.Int32));
                }
                else if (prop.PropertyType.FullName.ToString().Contains("System.Decimal"))
                {
                    dataTable.Columns.Add(prop.Name, typeof(System.Decimal));
                }
                else if (prop.PropertyType.FullName.ToString().Contains("System.Bool"))
                {
                    dataTable.Columns.Add(prop.Name, typeof(System.Boolean));
                }
                else if (type.Name == "Nullable`1")
                {
                    if (prop.Name.Contains("Tarih"))
                        dataTable.Columns.Add(prop.Name, typeof(System.DateTime));
                    else
                        dataTable.Columns.Add(prop.Name, typeof(System.Object));
                }
                else
                    dataTable.Columns.Add(prop.Name, type);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            dataTable.AcceptChanges();
            return dataTable;
        }

    }
    /// <summary>
    /// List değişkeni DataTable olarak dönderir.
    /// </summary>


}
