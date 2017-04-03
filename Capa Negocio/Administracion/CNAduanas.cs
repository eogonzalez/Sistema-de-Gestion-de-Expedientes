using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Capa_Datos.Administracion;
using Capa_Entidad.Administracion;

namespace Capa_Negocio.Administracion
{
    public class CNAduanas
    {
        Aduanas objCDAduanas = new Aduanas();

        public DataTable SelectAduanas()
        {
            return objCDAduanas.SelectAduanas();
        }

        public Boolean SaveAduanas(CEAduanas objCEAduanas)
        {
            return objCDAduanas.SaveAduanas(objCEAduanas);
        }

        public DataTable SelectAduana(int id_aduana)
        {
            return objCDAduanas.SelectAduana(id_aduana);
        }

        public Boolean UpdateAduana(CEAduanas objCEAduanas)
        {
            return objCDAduanas.UpdateAduana(objCEAduanas);
        }

        public Boolean DeleteAduana(int id_aduana)
        {
            return objCDAduanas.DeleteAduana(id_aduana);
        }
    }
}
