using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoltrupMotionClassLibrary.BO;
using MoltrupMotionClassLibrary.DAL;


namespace MoltrupMotionClassLibrary.BLL
{
    public class Calls
    {
        //Instanciering af MedlemDB så det er muligt at foretage kald
        //ned i klassen.
        MedlemDB mmdb = new MedlemDB();


        public void OpretBruger()
        {
            Console.WriteLine("Opret medlem");

            Console.WriteLine("Indtast fornavn");
            string fornavn = Console.ReadLine();
            Console.WriteLine("Indtast efternavn");
            string efternavn = Console.ReadLine();
            Console.WriteLine("Indtast foedselsdato");
            string foedselsdato = Console.ReadLine();
            Console.WriteLine("Indtast adresse");
            string adresse = Console.ReadLine();
            Console.WriteLine("Indtast postnummer");
            string postnummer = Console.ReadLine();
            Console.WriteLine("Indtast telefonnummer");
            string telefonnummer = Console.ReadLine();
            Console.WriteLine("Indtast mail");
            string mail = Console.ReadLine();

            mmdb.OpretMedlem(fornavn, efternavn, foedselsdato, adresse, Convert.ToInt32(postnummer), Convert.ToInt32(telefonnummer), mail);

        }


        
        public void SoegBruger()
        {
            Console.WriteLine("Indtast Medlems For eller efter -navn");
            string soeg;
            soeg = Console.ReadLine();

            //Gennemgang af alle medlemmerne i databasen
            foreach (MoltrupMedlem item in mmdb.SoegMedlem(soeg))
            {
                //Gennemgang af alle betalt værdierne for at ændre output
                //så det ikke bliver en bool værdi som står.
                string betalt = "Ikke betalt";
                if (item.Betalt == true)
                {
                    betalt = "Betalt";
                }
                Console.WriteLine(Convert.ToString(item.Medlems_id) + ", " + item.Medlems_fornavn + ", " + item.Medlems_efternavn + ", " + item.Medlems_foedselsdag + ", " + item.Zipcode_zipcode + ", " + item.Medlems_adress + ", " + item.Medlems_mail + ", " + item.Medlems_telefon + ", " + betalt);
            }
        }

        
        public void SoegAlleBrugere()
        {
            Console.WriteLine("Alle registrerede brugere:");

            foreach (MoltrupMedlem cat in mmdb.SoegAlleMedlem())
            {
                //Gennemgang af alle betalt værdierne for at ændre output
                //så det ikke bliver en bool værdi som står.
                string betalt = "Ikke Betalt";
                if (cat.Betalt == true)
                {
                    betalt = "Betalt";
                }
                Console.WriteLine(Convert.ToString(cat.Medlems_id) + ", " + cat.Medlems_fornavn + ", " + cat.Medlems_efternavn + ", " + cat.Medlems_foedselsdag + ", " + cat.Zipcode_zipcode + ", " + cat.Medlems_telefon + ", " + betalt);
            }
        }

        public void AendreBruger()
        {
            Console.WriteLine("Ændre medlem");

            int medlemsid = 0;

            //Exception handling i forhold til medlemsid således at programmet
            //kan håndtere at man indtaster en bogstavværdi og kan outpute en fejl til brugeren.
            try
            {
                Console.WriteLine("Indtast medlemsid");
                medlemsid = Convert.ToInt32(Console.ReadLine());
            }
            catch (NullReferenceException)
            {
                Console.WriteLine("Angiv en værdi");
            }
            catch (FormatException)
            {
                Console.WriteLine("Brug en talværdi til at angive medlemsID");
                return;
            }
            catch (Exception)
            {
                
            }

            Console.WriteLine("Indtast fornavn");
            string fornavn = Console.ReadLine();
            Console.WriteLine("Indtast efternavn");
            string efternavn = Console.ReadLine();
            Console.WriteLine("Indtast adresse");
            string adresse = Console.ReadLine();
            Console.WriteLine("Indtast postnummer");
            string postnummer = Console.ReadLine();
            Console.WriteLine("Indtast telefonnummer");
            string telefonnummer = Console.ReadLine();
            Console.WriteLine("Indtast mail");
            string mail = Console.ReadLine();

            mmdb.AendreMedlem(medlemsid, fornavn, efternavn, adresse, Convert.ToInt32(postnummer), Convert.ToInt32(telefonnummer), mail);
            
        }


        
        public void SaetBetaling()
        {
            Console.WriteLine("Indtast medlemsID");
            int medlem = Convert.ToInt32( Console.ReadLine() );
            Console.WriteLine("Indtast boolværdi for betalt");
            bool betalt = Convert.ToBoolean ( Console.ReadLine() );

            mmdb.Betalt(medlem, betalt);

        }

        public void SletMedlem()
        {
            Console.WriteLine("Indtast medlemsID");
            int id = Convert.ToInt32(Console.ReadLine());

            mmdb.Slet(id);
        }


        
        public void ExportAlleBrugere()
        {

            Console.WriteLine("Angiv komplette filsti:");
            string filsti = Console.ReadLine();

            //StringBuilder bliver instancieret for at muliggøre opbyggelse af strenge af tekst til CSV filen
            var sb = new StringBuilder();

            //Den øverste linje skrives med emne værdier for hvad der derunder vil stå.
            sb.AppendLine("MedlemsID" +"," + "fornavn" + "," + "efternavn" + "," + "adress" + "," + "postnummer" + "," + "telefon" + "," + "foedselsdag" + "," + "mail");

            //Hvert medlem løbes igennem og skrives på en ny linje i stringbuilderen.
            foreach (MoltrupMedlem mlm in mmdb.ExportMedlemmer())
            {
                string betalt = "Ikke betalt";
                if (mlm.Betalt == true)
                {
                    betalt = "Betalt";
                }

                sb.AppendLine(mlm.Medlems_id + "," + mlm.Medlems_fornavn + "," + mlm.Medlems_efternavn+ "," + mlm.Medlems_adress + "," + mlm.Zipcode_zipcode + "," + mlm.Medlems_telefon + "," + mlm.Medlems_foedselsdag + "," + mlm.Medlems_mail);
            }

            //Filen skrives og placeres på den angivne filsti.
            System.IO.File.WriteAllText(filsti, sb.ToString());
            Console.WriteLine("Medlemmer er eksporteret.");

        }

        public void ImportBrugere()
        {
            string filsti;

            Console.WriteLine("Angiv sti til .CSV fil:");
            Console.WriteLine("Første linje i .CSV filen skal være formateret således: fornavn,efternavn,adress,postnummer,telefon,foedselsdag,mail");
            filsti = Console.ReadLine();

            CsvImport csvimport = new CsvImport();

            mmdb.ImportMedlemmer(csvimport.GetDataFromFile(filsti));

            Console.WriteLine("Medlemmer importeret");
        }

    }
}
