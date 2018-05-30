using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace MoltrupMotionClassLibrary.DAL
{
    public class CsvImport
    {
        public DataTable GetDataFromFile(string filsti)
        {


            DataTable importedData = new DataTable();

            try
            {
                using (StreamReader sr = new StreamReader(filsti))
                {

                    //Den øverste linje af .CSV filen læses for at definere emnerne.
                    string header = sr.ReadLine();

                    //Der etableres et string array med emnerne
                    string[] headerColumns = header.Split(',');
                    foreach (string headerColumn in headerColumns)
                    {
                        importedData.Columns.Add(headerColumn);
                    }



                    while (!sr.EndOfStream)
                    {
                        
                        //Hver linje læses og trækkes ud af filen og tilføjes til en datarække.
                        string line = sr.ReadLine();
                        if (string.IsNullOrEmpty(line)) continue;
                        string[] fields = line.Split(',');
                        DataRow importedRow = importedData.NewRow();

                        for (int i = 0; i < fields.Count(); i++)
                        {

                            importedRow[i] = fields[i];

                        }
                        
                        importedData.Rows.Add(importedRow);
                    }
                }


            }
            catch (Exception e)
            {
                Console.WriteLine("Filen kunne ikke læses:");
                Console.WriteLine(e.Message);
            }

            return importedData;
        }

    }
}
