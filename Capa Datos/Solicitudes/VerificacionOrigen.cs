using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Capa_Datos.Solicitudes
{
    public class VerificacionOrigen
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectDatosSolicitante(int idUsuario)
        {
            var dt_respuesta = new DataTable();
            string sql_query = string.Empty;

            sql_query = " SELECT "+
                " nombres,apellidos "+
                " ,telefono,idDepartamento "+
                " ,direccion,correo  " +
                " FROM g_usuarios "+
                " where id_usuario = @idUsuario and estado = 'A' ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("idUsuario", idUsuario);
                    var da = new SqlDataAdapter(command);

                    da.Fill(dt_respuesta);
                }
                catch (SqlException)
                {
                    throw;
                }
                catch (Exception)
                {
                    
                    throw;
                }

            }

            return dt_respuesta;
        }

        public DataTable SelectComboPaises()
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                sql_query = " SELECT idPais " +
                    " ,nombre " +
                    " FROM G_Paises " +
                    " where estado = 'A' ";
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

        public DataTable SelectRequisitosVerificacion()
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                sql_query = " SELECT idRequisito " +
                    " ,nombre, obligatorio " +
                    " FROM VO_RequisitosVerificacion " +
                    " where estado = 'A' ";
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

        public DataTable SelectRequisitosOpinion()
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                sql_query = " SELECT idRequisito " +
                    " ,nombre, obligatorio " +
                    " FROM OP_RequisitosOpinionTecnica " +
                    " where estado = 'A' ";
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
    }
}
