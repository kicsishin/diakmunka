using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace diakmunkaProjekt
{
    internal class SqlImport
    {
        private string fajlDiak;
        private string fajlMunka;
        private string fajlMunkaado;
        private string fajlDiakmunkaImport;
        List<Diak> diakok = new List<Diak>();
        List<Munka> munkak = new List<Munka>();
        List<Munkaado> munkaadok = new List<Munkaado>();

        public SqlImport(string fajlDiak, string fajlMunka, string fajlMunkaado, string fajlDiakmunkaImport)
        {
            this.fajlDiak = fajlDiak;
            this.fajlMunka = fajlMunka;
            this.fajlMunkaado = fajlMunkaado;
            this.fajlDiakmunkaImport = fajlDiakmunkaImport;
            BeolvasDiak();
            BeolvasMunka();
            BeolvasMunkaado();
            ImportGenerator();
        }

        private void ImportGenerator()
        {
            deleteGenerator();
            MunkaadoGenerator();
            DiakGenerator();
            MunkaGenerator();
            selectGenerator();
        }

        private void selectGenerator()
        {
            List<string> fsorok = new List<string>();
            fsorok.Add("SELECT * FROM employers;");
            fsorok.Add("SELECT * FROM students;");
            fsorok.Add("SELECT * FROM projects;");
            File.AppendAllLines(fajlDiakmunkaImport, fsorok);
        }

        private void MunkaGenerator()
        {
            List<string> fsorok = new List<string>();
            string szoveg = Environment.NewLine + "# projects" + Environment.NewLine;
            szoveg = "INSERT INTO projects (employerid, studentid, job, date, hourlyrate, numberofhours, highschoolstudent) VALUES" + Environment.NewLine;
            foreach (var munka in munkak)
            {
                string sor = $"({munka.munkaadoid}, {munka.diakid}, {munka.allas}, {munka.datum}, {munka.oradij}, {munka.oraszam}, {munka.kozepiskolas})";
                fsorok.Add(sor);
            }
            szoveg += String.Join("," + Environment.NewLine, fsorok);
            szoveg += ";\n\n";
            File.AppendAllText(fajlDiakmunkaImport, szoveg);
        }

        private void DiakGenerator()
        {
            List<string> fsorok = new List<string>();
            string szoveg = Environment.NewLine + "# students" + Environment.NewLine;
            szoveg = "INSERT INTO students (id, name, datetime) VALUES" + Environment.NewLine;
            foreach (var diak in diakok)
            {
                string sor = $"({diak.diakaz}, {diak.nev}, {diak.szulido})";
                fsorok.Add(sor);
            }
            szoveg += String.Join("," + Environment.NewLine, fsorok);
            szoveg += ";\n\n";
            File.AppendAllText(fajlDiakmunkaImport, szoveg);
        }

        private void MunkaadoGenerator()
        {
            List<string> fsorok = new List<string>();
            string szoveg = Environment.NewLine + "# employers" + Environment.NewLine;
            szoveg = "INSERT INTO employers (id, name, settlement) VALUES" + Environment.NewLine;
            foreach (var munkaado in munkaadok)
            {
                string sor = $"({munkaado.id}, {munkaado.nev}, {munkaado.telepules})";
                fsorok.Add(sor);
            }
            szoveg += String.Join("," + Environment.NewLine, fsorok);
            szoveg += ";\n\n";
            File.AppendAllText(fajlDiakmunkaImport, szoveg);
        }

        private void deleteGenerator()
        {
            List<string> fsorok = new List<string>();
            fsorok.Add("DELETE FROM employers;");
            fsorok.Add("DELETE FROM projects;");
            fsorok.Add("DELETE FROM students;\n");
            File.WriteAllLines(fajlDiakmunkaImport, fsorok);

        }

        private void BeolvasMunka()
        {
            string[] sorok = File.ReadAllLines(fajlMunka);
            foreach (var sor in sorok.Skip(1))
            {
                string[] oszlopok = sor.Split('\t');
                int munkaadoid = int.Parse(oszlopok[0]);
                string diakid = oszlopok[1] == "" ? "Null" : oszlopok[1];
                string allas = $"'{oszlopok[2]}'";
                string datum = $"'{oszlopok[3]}'";
                int oradij = int.Parse(oszlopok[4]);
                int oraszam = int.Parse(oszlopok[5]);
                int kozepiskolas = int.Parse(oszlopok[6]);
                munkak.Add(new Munka(munkaadoid, diakid, allas, datum, oradij, oraszam, kozepiskolas));
            }
        }

        private void BeolvasMunkaado()
        {
            string[] sorok = File.ReadAllLines(fajlMunkaado);
            foreach (var sor in sorok.Skip(1))
            {
                string[] oszlopok = sor.Split('\t');
                int id = int.Parse(oszlopok[0]);
                string nev = $"'{oszlopok[1]}'"; 
                string telepules = $"'{oszlopok[2]}'";
                munkaadok.Add(new Munkaado(id, nev, telepules));
            }
        }

        private void BeolvasDiak()
        {
            string[] sorok = File.ReadAllLines(fajlDiak);
            foreach (var sor in sorok.Skip(1))
            {
                string[] oszlopok = sor.Split('\t');
                int diakaz = int.Parse(oszlopok[0]);
                string nev = $"'{oszlopok[1]}'";
                string szulido = $"'{oszlopok[2]}'";
                diakok.Add(new Diak(diakaz, nev, szulido));
            }
        }
    }
}