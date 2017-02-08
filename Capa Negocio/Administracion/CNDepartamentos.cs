﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Capa_Datos.Administracion;
using Capa_Entidad.Administracion;

namespace Capa_Negocio.Administracion
{
    public class CNDepartamentos
    {
        Departamentos objCDDepartamentos = new Departamentos();
        public DataTable SelectDepartamentos()
        {
            return objCDDepartamentos.SelectDepartamentos();
        }

        public Boolean SaveDepartamento(CEDepartamentos objCEDeptos)
        {
            return objCDDepartamentos.SaveDepartamento(objCEDeptos);
        }
    }
}