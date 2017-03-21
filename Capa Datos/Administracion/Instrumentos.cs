using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Entidad.Administracion;

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

        public Boolean InsertInstrumentos(CEInstrumento objCEInstrumento)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO G_Instrumentos "+
                " ([nombre_instrumento],[sigla] "+
                " ,[observaciones],[fecha_vigencia] "+
                " ,[fecha_creacion],[fecha_modificacion] "+
                " ,[estado],[id_usuarioAutoriza]) "+
                " VALUES "+
                " (@nombre_instrumento,@sigla "+
                " ,@observaciones,@fecha_vigencia "+
                " ,@fecha_creacion,@fecha_modificacion "+
                " ,@estado,@id_usuarioAutoriza) ";

            using (var con = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, con);
                command.Parameters.AddWithValue("nombre_instrumento", objCEInstrumento.Nombre_Instrumento);
                command.Parameters.AddWithValue("sigla", objCEInstrumento.Sigla);
                command.Parameters.AddWithValue("observaciones", objCEInstrumento.Observaciones);
                command.Parameters.AddWithValue("fecha_vigencia", objCEInstrumento.Fecha_Vigencia);
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "A");
                command.Parameters.AddWithValue("id_usuarioAutoriza", objCEInstrumento.ID_UsuarioAutoriza);

                con.Open();
                command.ExecuteNonQuery();
                respuesta = true;

            }

            return respuesta;
        }

        public DataTable SelectInstrumento(int id_instrumento)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT  [nombre_instrumento],[sigla] "+
                " ,[observaciones],[fecha_vigencia] "+
                " FROM G_Instrumentos "+
                " where	 id_instrumento = @id_instrumento ";

            using (var con = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, con);
                command.Parameters.AddWithValue("id_instrumento", id_instrumento);
                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }

            return dt_respuesta;
        }

    }
}
