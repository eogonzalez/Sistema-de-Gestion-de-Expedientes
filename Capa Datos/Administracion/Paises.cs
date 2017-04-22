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
    public class Paises
    {
        General.Conexion objConexion = new General.Conexion();

        public DataSet SelectPaises()
        {
            var ds_respuesta = new DataSet();
            var sql_query = string.Empty;

            sql_query = " SELECT [IdPais] "+
                " ,[Nombre] ,[ISO2] "+
                " FROM G_Paises "+
                " where estado = 'A' ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    var da = new SqlDataAdapter(command);
                    da.Fill(ds_respuesta, "SelectPaises");
                }
                catch (Exception)
                {
                    
                    throw;
                }    
            }

            return ds_respuesta;
        }

        public Boolean SavePaises(CEPaises objCEPaises)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO G_Paises "+
                " ([Nombre],[ISO2] "+
                " ,[fecha_creacion],[fecha_modificacion] "+
                " ,[estado]) "+
                " VALUES "+
                " (@Nombre,@ISO2 "+
                " ,@fecha_creacion,@fecha_modificacion "+
                " ,@estado) ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("Nombre", objCEPaises.Nombre);
                command.Parameters.AddWithValue("ISO2", objCEPaises.ISO2);
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "A");

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }

        public DataTable SelectPais(int id_pais)
        {
            var sql_query = string.Empty;
            var dt_respuesta = new DataTable();

            sql_query = " SELECT [ISO2] " +
                " ,[nombre] " +
                " FROM G_Paises " +
                " where estado = @estado and idPais = @idPais ";

            using (SqlConnection cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);

                    command.Parameters.AddWithValue("estado", 'A');
                    command.Parameters.AddWithValue("idPais", id_pais);

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

        public Boolean UpdatePais(CEPaises objCEPaises)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE G_Paises "+
                " SET nombre = @nombre, ISO2 = @iso2 "+
                " ,fecha_modificacion = @fecha_modificacion "+
                " WHERE IdPais = @idPais ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("nombre", objCEPaises.Nombre);
                command.Parameters.AddWithValue("iso2", objCEPaises.ISO2);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("idPais", objCEPaises.ID_Pais);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }

        public Boolean DeletePais(int id_pais)
        {
            var respuesta = false;

            var sql_query = string.Empty;

            sql_query = " UPDATE G_Paises " +
                " SET  [estado] = @estado " +
                " ,[fecha_modificacion] = @fecha_modificacion " +
                " WHERE idPais = @idPais ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("estado", "B");
                command.Parameters.AddWithValue("idPais", id_pais);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }
    }
}
