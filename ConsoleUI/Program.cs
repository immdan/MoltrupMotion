using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoltrupMotionClassLibrary.DAL;

namespace ConsoleUI
{
    class Program
    {
        static void Main(string[] args)
        {
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

                    case 'i':
                        calls.ImportBrugere();
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
