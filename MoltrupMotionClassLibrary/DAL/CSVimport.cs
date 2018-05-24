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

       public DataTable GetDataFromFile()
        {
            string filsti;

            Console.WriteLine("Angiv sti til .CSV fil:");
            filsti = Console.ReadLine();

            DataTable importedData = new DataTable();

            try
            {
                using (StreamReader sr = new StreamReader(filsti))
                {


                    string header = sr.ReadLine();

                    string[] headerColumns = header.Split(',');
                    foreach (string headerColumn in headerColumns)
                    {
                        importedData.Columns.Add(headerColumn);
                    }



                    while (!sr.EndOfStream)
                    {

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
                Console.WriteLine("the file could not be read:");
                Console.WriteLine(e.Message);
            }

            return importedData;
        }

    }
}
