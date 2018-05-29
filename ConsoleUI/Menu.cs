using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoltrupMotionClassLibrary.DAL
{
    public class Menu
    {
        public static void Menuen()
        {
            //En tekst fremstilling til en menu, som til at starte med "renser" skærmoutputtet.
            Console.Clear();
            Console.WriteLine("A = Vis alle");
            Console.WriteLine("S = Søg medlem");
            Console.WriteLine("O = Opret medlem");
            Console.WriteLine("R = Ret medlem");
            Console.WriteLine("B = Betalt kontingent");
            Console.WriteLine("D = Slet medlem");
            Console.WriteLine("E = Exporter medlemmer til fil");
            Console.WriteLine("I = Import medlemmer fra fil");
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("X = Afslut programmet");

        }
    }
}
