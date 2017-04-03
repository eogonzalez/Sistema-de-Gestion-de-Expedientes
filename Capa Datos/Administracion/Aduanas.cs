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
    public class Aduanas
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectAduanas()
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT [IdAduana] " +
                " ,[Nombre] ,[Codigo] " +
                " FROM G_Aduanas " +
                " where estado = 'A' ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    var da = new SqlDataAdapter(command);
                    da.Fill(dt_respuesta);
                }
                catch (Exception)
                {

                    throw;
                }
            }

            return dt_respuesta;
        }

        public Boolean SaveAduanas(CEAduanas objCEAduanas)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO G_Aduanas " +
                " ([Nombre],[Codigo] " +
                " ,[fecha_creacion],[fecha_modificacion] " +
                " ,[estado]) " +
                " VALUES " +
                " (@Nombre,@Codigo " +
                " ,@fecha_creacion,@fecha_modificacion " +
                " ,@estado) ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("Nombre", objCEAduanas.Nombre);
                command.Parameters.AddWithValue("Codigo", objCEAduanas.Codigo);
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "A");

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }

        public DataTable SelectAduana(int id_aduana)
        {
            var sql_query = string.Empty;
            var dt_respuesta = new DataTable();

            sql_query = " SELECT [Codigo] " +
                " ,[nombre] " +
                " FROM G_Aduanas " +
                " where estado = @estado and idAduana = @idAduana ";

            using (SqlConnection cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);

                    command.Parameters.AddWithValue("estado", 'A');
                    command.Parameters.AddWithValue("idAduana", id_aduana);

                    var da = new SqlDataAdapter(command);
                    da.Fill(dt_respuesta);
                }
                catch (Exception)
                {

                    throw;
                }
            }
            return dt_respuesta;
        }

        public Boolean UpdateAduana(CEAduanas objCEAduanas)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE G_Aduana " +
                " SET nombre = @nombre, Codigo = @codigo " +
                " ,fecha_modificacion = @fecha_modificacion " +
                " WHERE IdCodigo = @idCodigo ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("nombre", objCEAduanas.Nombre);
                command.Parameters.AddWithValue("codigo", objCEAduanas.Codigo);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("idCodigo", objCEAduanas.ID_Aduana);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }

        public Boolean DeleteAduana(int id_aduana)
        {
            var respuesta = false;

            var sql_query = string.Empty;

            sql_query = " UPDATE G_Aduanas " +
                " SET  [estado] = @estado " +
                " ,[fecha_modificacion] = @fecha_modificacion " +
                " WHERE idAduana = @idAduana ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("estado", "B");
                command.Parameters.AddWithValue("idAduana", id_aduana);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }
    }
}
