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
    public class CNPaises
    {
        Paises objCDPaises = new Paises();

        public DataSet SelectPaises()
        {
            return objCDPaises.SelectPaises();
        }

        public Boolean SavePaises(CEPaises objCEPaises)
        {
            return objCDPaises.SavePaises(objCEPaises);
        }

        public DataTable SelectPais(int id_pais)
        {
            return objCDPaises.SelectPais(id_pais);
        }

        public Boolean UpdatePais(CEPaises objCEPaises)
        {
            return objCDPaises.UpdatePais(objCEPaises);
        }

        public Boolean DeletePais(int id_pais)
        {
            return objCDPaises.DeletePais(id_pais);
        }
    }
}
