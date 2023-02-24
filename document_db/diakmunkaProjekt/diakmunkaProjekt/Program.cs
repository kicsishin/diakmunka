using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace diakmunkaProjekt
{
    class Program
    {
        static void Main(string[] args)
        {
            string fajlDiak = "diak.txt", fajlMunka = "munka.txt", fajlMunkaado = "munkaado.txt", fajlDiakmunkaImport = "diakmunkaImport.sql";
            SqlImport s = new SqlImport(fajlDiak, fajlMunka, fajlMunkaado, fajlDiakmunkaImport);

            Console.WriteLine("forras -> {0}", fajlDiakmunkaImport);
            Console.ReadLine();
             
        }
    }
}
