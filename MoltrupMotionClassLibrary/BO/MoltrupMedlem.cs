using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoltrupMotionClassLibrary.BO
{
    public class MoltrupMedlem
    {
        public int Medlems_id { get; set; }
        public string Medlems_fornavn { get; set; }
        public string Medlems_efternavn { get; set; }
        public string Medlems_foedselsdag { get; set; }
        public string Medlems_adress { get; set; }
        public int Zipcode_zipcode { get; set; }
        public int Medlems_telefon { get; set; }
        public string Medlems_mail { get; set; }
        public bool Betalt { get; set; }

    }
}
