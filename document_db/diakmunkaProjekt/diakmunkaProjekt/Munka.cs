namespace diakmunkaProjekt
{
    internal class Munka
    {
        public int munkaadoid;
        public string diakid;
        public string allas;
        public string datum;
        public int oradij;
        public int oraszam;
        public int kozepiskolas;

        public Munka(int munkaadoid, string diakid, string allas, string datum, int oradij, int oraszam, int kozepiskolas)
        {
            this.munkaadoid = munkaadoid;
            this.diakid = diakid;
            this.allas = allas;
            this.datum = datum;
            this.oradij = oradij;
            this.oraszam = oraszam;
            this.kozepiskolas = kozepiskolas;
        }
    }
}