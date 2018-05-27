using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace MoltrupMotionClassLibrary.DAL
{
    public static class AppConfiguration
    {
        public static string ConnectionString
        {
            get
            {
              return ConfigurationManager.ConnectionStrings["MoltrupMotionDB"].ConnectionString;
            }
        }

        public static MedlemDB MedlemDB
        {
            get => default(MedlemDB);
            set
            {
            }
        }
    }
}
