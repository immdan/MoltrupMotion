using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoltrupMotionClassLibrary.BO;
using MoltrupMotionClassLibrary.DAL;

namespace MoltrupMotionClassLibrary
{
    class test
    {
        static void Main(string[] args)
        {
            //MedlemDB test = new MedlemDB();

            //Console.WriteLine("Indtast Medlems For eller efter -navn");

            //foreach (MoltrupMedlem cat in test.SoegAlleMedlem())
            //{
            //    Console.WriteLine(Convert.ToString(cat.Medlems_id) +", "+ cat.Medlems_fornavn + ", " + cat.Medlems_efternavn + ", " + cat.Medlems_foedselsdag);
            //}
            //Console.ReadLine();

            Calls calls = new Calls();

            ConsoleKeyInfo keyinfo = new ConsoleKeyInfo();
            Menu.Menuen();

            do
            {
                keyinfo = Console.ReadKey(true);

                switch (keyinfo.KeyChar)
                {
                    case 'o':
                        calls.OpretBruger();
                        Console.ReadLine();
                        break;

                    case 's':
                        calls.SoegBruger();
                        Console.ReadLine();
                        break;

                    case 'a':
                        calls.SoegAlleBrugere();
                        Console.ReadLine();
                        break;

                    case 'r':
                        calls.AendreBruger();
                        Console.ReadLine();
                        break;

                    case 'b':
                        calls.SaetBetaling();
                        Console.ReadLine();
                        break;

                    case 'd':
                        calls.SletMedlem();
                        Console.ReadLine();
                        break;

                    case 'e':
                        calls.ExportAlleBrugere();
                        Console.ReadLine();
                        break;

                }
                
                Menu.Menuen();
            } while (keyinfo.KeyChar != 'x');

            


            Console.WriteLine("Programmet er afsluttet!");
            Console.ReadLine();
        }
    }
}
