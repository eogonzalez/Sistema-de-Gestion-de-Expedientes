using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Capa_Datos.Administracion
{
    public class Instrumentos
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectInstrumentos()
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT [id_instrumento],[nombre_instrumento] "+
                " ,[sigla],[observaciones],[fecha_vigencia] "+
                " FROM G_Instrumentos "+
                " WHERE estado = 'A'; ";

            using (var con = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, con);
                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }

            return dt_respuesta;
        }
    }
}
