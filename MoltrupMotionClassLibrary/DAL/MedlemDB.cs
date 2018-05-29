using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using MoltrupMotionClassLibrary.BO;
using MoltrupMotionClassLibrary.BO.Collections;
using System.IO;

namespace MoltrupMotionClassLibrary.DAL
{
    public class MedlemDB
    {

        //Søg individuelt medlem
        public List<MoltrupMedlem> SoegMedlem(string Medlems_id)
        {
            //Oprettelse af en liste til at indeholde dataen som bliver trukket ud af databasen.
            List<MoltrupMedlem> myList = null;

            //Oprettelse af forbindelse til databasen, database læser og kald af Stored Procedure i databasen.
            SqlDataReader myReader = null;
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spSoegMedlem", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@soegmedlem", Medlems_id);
            try
            {
                myConnection.Open();
                myReader = myCommand.ExecuteReader();
                {
                    myList = new List<MoltrupMedlem>();
                    while (myReader.Read())
                    {
                        //Læsning af værdier kaldt fra databasen og associeret med variabler i programmet.
                        MoltrupMedlem myMedlem = new MoltrupMedlem();
                        myMedlem.Medlems_id = Convert.ToInt32(myReader["Medlems_id"]);
                        myMedlem.Medlems_fornavn = myReader["Medlems_fornavn"].ToString();
                        myMedlem.Medlems_efternavn = myReader["Medlems_efternavn"].ToString();
                        myMedlem.Medlems_foedselsdag = myReader["Medlems_foedselsdag"].ToString();
                        myMedlem.Medlems_adress = myReader["Medlems_adress"].ToString();
                        myMedlem.Zipcode_zipcode = Convert.ToInt32(myReader["zipcode_zipcode"]);
                        myMedlem.Medlems_telefon = Convert.ToInt32(myReader["Medlems_telefon"]);
                        myMedlem.Medlems_mail = myReader["Medlems_mail"].ToString();                   

                        string telefonnummer;

                        //I tilfælde af at database værdien returnere en DBNull værdi
                        //indsættes et 0(nul) i programmets Medlems_telefon variabel
                        if (myReader["Medlems_telefon"] is DBNull)
                        {
                            telefonnummer = "0";
                            myMedlem.Medlems_telefon = Convert.ToInt32(telefonnummer);
                        }
                        else
                        {
                            myMedlem.Medlems_telefon = Convert.ToInt32(myReader["Medlems_telefon"]);

                        }

                        myMedlem.Medlems_mail = myReader["Medlems_mail"].ToString();
                        myMedlem.Betalt = Convert.ToBoolean(myReader["betalt"]);

                        
                        myList.Add(myMedlem);
                    }
                }
            }
            finally
            {
                myReader.Close();
                myConnection.Close();
            }
            return myList;
        }

        //Søg alle medlemmer
        public List<MoltrupMedlem> SoegAlleMedlem()
        {
            List<MoltrupMedlem> myList = null;
            SqlDataReader myReader = null;
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spSoegMedlem", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@soegmedlem", "%");
            try
            {
                myConnection.Open();
                myReader = myCommand.ExecuteReader();
                {
                    myList = new List<MoltrupMedlem>();
                    while (myReader.Read())
                    {
                        MoltrupMedlem myMedlem = new MoltrupMedlem();

                        myMedlem.Medlems_id = Convert.ToInt32(myReader["Medlems_id"]);
                        myMedlem.Medlems_fornavn = myReader["Medlems_fornavn"].ToString();
                        myMedlem.Medlems_efternavn = myReader["Medlems_efternavn"].ToString();
                        myMedlem.Medlems_foedselsdag = myReader["Medlems_foedselsdag"].ToString();
                        myMedlem.Medlems_adress = myReader["Medlems_adress"].ToString();
                        myMedlem.Zipcode_zipcode = Convert.ToInt32(myReader["zipcode_zipcode"]);

                        string telefonnummer;
                        if (myReader["Medlems_telefon"] is DBNull)
                        {
                            telefonnummer = "0";
                            myMedlem.Medlems_telefon = Convert.ToInt32(telefonnummer);
                        }
                        else
                        {
                            myMedlem.Medlems_telefon = Convert.ToInt32(myReader["Medlems_telefon"]);

                        }

                        myMedlem.Medlems_mail = myReader["Medlems_mail"].ToString();
                        myMedlem.Betalt = Convert.ToBoolean(myReader["betalt"]);

                        myList.Add(myMedlem);
                    }
                }
            }
            finally
            {
                myReader.Close();
                myConnection.Close();
            }
            return myList;
        }

        //Opret Bruger
        public string OpretMedlem(string fornavn, string efternavn, string foedselsdag, string addresse, int postnummer, int telefonnummer, string mail)
        {
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spOpretMedlem", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@fornavn", fornavn);
            myCommand.Parameters.AddWithValue("@efternavn", efternavn);
            myCommand.Parameters.AddWithValue("@foedselsdag", foedselsdag);
            myCommand.Parameters.AddWithValue("@adress", addresse);
            myCommand.Parameters.AddWithValue("@postnummer", postnummer);
            myCommand.Parameters.AddWithValue("@telefon", telefonnummer);
            myCommand.Parameters.AddWithValue("@mail", mail);
            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            finally
            {
                myConnection.Close();
            }
            return "Bruger er oprettet";
        }

        //Ændre bruger
        public string AendreMedlem(int medlemsId, string fornavn, string efternavn, string addresse, int postnummer, int telefonnummer, string mail)
        {
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spRetMedlem", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@medlemID", medlemsId);
            myCommand.Parameters.AddWithValue("@fornavn", fornavn);
            myCommand.Parameters.AddWithValue("@efternavn", efternavn);
            myCommand.Parameters.AddWithValue("@adress", addresse);
            myCommand.Parameters.AddWithValue("@postnummer", postnummer);
            myCommand.Parameters.AddWithValue("@telefon", telefonnummer);
            myCommand.Parameters.AddWithValue("@mail", mail);
            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            finally
            {
                myConnection.Close();
            }
            string finish = "Bruger er ændret";
            return finish;

        }

        //Sætte betalt værdi for medlem
        public void Betalt(int medlemsID, bool betalt)
        {
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spBetalt", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@betaltID", medlemsID);

            if (betalt == true)
            {
                myCommand.Parameters.AddWithValue("@betalt", true);
            }
            else
            {
                myCommand.Parameters.AddWithValue("@betalt", false);
            }

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            finally
            {
                myConnection.Close();
            }
        }

        //Slette medlem baseret på medlemsid
        public void Slet(int medlemsID)
        {
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spSletMedlem", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@medlemID", medlemsID);

            try
            {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
            }
            finally
            {
                myConnection.Close();
            }
        }


        //Export af medlem som komma separeret fil
        public List<MoltrupMedlem> ExportMedlemmer()
        {
            List<MoltrupMedlem> myList = null;
            SqlDataReader myReader = null;
            SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString);
            SqlCommand myCommand = new SqlCommand("spSoegMedlem", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
            myCommand.Parameters.AddWithValue("@soegmedlem", "%");
            try
            {
                myConnection.Open();
                myReader = myCommand.ExecuteReader();
                {
                    myList = new List<MoltrupMedlem>();
                    while (myReader.Read())
                    {
                        MoltrupMedlem myMedlem = new MoltrupMedlem();
                        myMedlem.Medlems_id = Convert.ToInt32(myReader["Medlems_id"]);
                        myMedlem.Medlems_fornavn = myReader["Medlems_fornavn"].ToString();
                        myMedlem.Medlems_efternavn = myReader["Medlems_efternavn"].ToString();
                        myMedlem.Medlems_foedselsdag = myReader["Medlems_foedselsdag"].ToString();
                        myMedlem.Medlems_adress = myReader["Medlems_adress"].ToString();
                        myMedlem.Zipcode_zipcode = Convert.ToInt32(myReader["zipcode_zipcode"]);


                        string telefonnummer;
                        if (myReader["Medlems_telefon"] is DBNull)
                        {
                            telefonnummer = "0";
                            myMedlem.Medlems_telefon = Convert.ToInt32(telefonnummer);
                        }
                        else
                        {
                            myMedlem.Medlems_telefon = Convert.ToInt32(myReader["Medlems_telefon"]);

                        }

                        myMedlem.Medlems_mail = myReader["Medlems_mail"].ToString();
                        myMedlem.Betalt = Convert.ToBoolean(myReader["betalt"]);

                        myList.Add(myMedlem);
                    }
                }
            }
            finally
            {
                myReader.Close();
                myConnection.Close();
            }
            return myList;
        }


        //Bulk import af medlemmer fra komma separeret fil
        public void ImportMedlemmer(DataTable imported_data)
        {


            using (SqlConnection myConnection = new SqlConnection(AppConfiguration.ConnectionString))
            {
                //Forbindelsen til databasen åbnes og for hver linje i datarækken "imported_data",
                //som kommer fra .CSV filen, skrives værdierne i databasen
                myConnection.Open();
                foreach (DataRow importRow in imported_data.Rows)
                {


                    SqlCommand myCommand = new SqlCommand("spOpretMedlem", myConnection);
                    myCommand.CommandType = CommandType.StoredProcedure;

                    myCommand.Parameters.AddWithValue("@fornavn", importRow["fornavn"]);
                    myCommand.Parameters.AddWithValue("@efternavn", importRow["efternavn"]);
                    myCommand.Parameters.AddWithValue("@foedselsdag", importRow["foedselsdag"]);
                    myCommand.Parameters.AddWithValue("@adress", importRow["adress"]);
                    myCommand.Parameters.AddWithValue("@postnummer", importRow["postnummer"]);
                    myCommand.Parameters.AddWithValue("@telefon", importRow["telefon"]);
                    myCommand.Parameters.AddWithValue("@mail", importRow["mail"]);

                    myCommand.ExecuteNonQuery();
                }

            }


        }
    }
}
