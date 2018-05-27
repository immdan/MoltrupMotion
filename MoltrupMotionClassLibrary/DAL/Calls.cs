using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoltrupMotionClassLibrary.BO;


namespace MoltrupMotionClassLibrary.DAL
{
    public class Calls
    {
        MedlemDB mmdb = new MedlemDB();

        public MedlemDB MedlemDB
        {
            get => default(MedlemDB);
            set
            {
            }
        }

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

            foreach (MoltrupMedlem item in mmdb.SoegMedlem(soeg))
            {
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

            var sb = new StringBuilder();

            sb.AppendLine("MedlemsID" +"," + "fornavn" + "," + "efternavn" + "," + "adress" + "," + "postnummer" + "," + "telefon" + "," + "foedselsdag" + "," + "mail");
            foreach (MoltrupMedlem mlm in mmdb.ExportMedlemmer())
            {
                string betalt = "Ikke betalt";
                if (mlm.Betalt == true)
                {
                    betalt = "Betalt";
                }

                sb.AppendLine(mlm.Medlems_id + "," + mlm.Medlems_fornavn + "," + mlm.Medlems_efternavn+ "," + mlm.Medlems_adress + "," + mlm.Zipcode_zipcode + "," + mlm.Medlems_telefon + "," + mlm.Medlems_foedselsdag + "," + mlm.Medlems_mail);
            }

            System.IO.File.WriteAllText(filsti, sb.ToString());

        }

        public void ImportBrugere()
        {
            string filsti;

            Console.WriteLine("Angiv sti til .CSV fil:");
            Console.WriteLine("Første linje i .CSV filen skal være formateret således: fornavn,efternavn,adress,postnummer,telefon,foedselsdag,mail");
            filsti = Console.ReadLine();

            CsvImport csvimport = new CsvImport();

            mmdb.ImportMedlemmer(csvimport.GetDataFromFile(filsti));
        }

    }
}
