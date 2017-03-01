using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Entidad.Requisitos;

namespace Capa_Datos.Requisitos
{
    public class Verificacion
    {
        CEVerificacion objCEVerificacion = new CEVerificacion();
        General.Conexion objConexion = new General.Conexion();
        public DataTable SelectRequisitos()
        {
            var dt_respuesta = new DataTable();
            string sql_query = string.Empty;

            sql_query = " SELECT " +
                " idRequisito, nombre,descripcion,obligatorio " +
                " FROM VO_RequisitosVerificacion " +
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

        public Boolean SaveRequisito(CEVerificacion objCEVerificacion)
        {
            var respuesta = false;
            string sql_query = string.Empty;

            sql_query = " INSERT INTO VO_RequisitosVerificacion " +
                " (nombre,descripcion,obligatorio " +
                " ,fecha_creacion,fecha_modificacion,estado) " +
                " VALUES " +
                " (@nombre,@descripcion,@obligatorio " +
                " ,@fecha_creacion,@fecha_modificacion,@estado) ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("@nombre", objCEVerificacion.Nombre);
                command.Parameters.AddWithValue("@descripcion", objCEVerificacion.Descripcion);
                command.Parameters.AddWithValue("@obligatorio", objCEVerificacion.Obligatorio);
                command.Parameters.AddWithValue("@fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("@fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("@estado", "A");

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
                }
                catch (Exception)
                {

                    throw;
                }
            }


            return respuesta;
        }

        public DataTable SelectRequisito(int id_requisito)
        {
            var dt_respuesta = new DataTable();
            string sql_query = string.Empty;

            sql_query = " SELECT " +
                " nombre, descripcion, obligatorio " +
                " FROM VO_RequisitosVerificacion " +
                " where estado = 'A' and idRequisito = @idRequisito ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("idRequisito", id_requisito);

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

        public Boolean DeleteRequisito(int id_requisito)
        {
            var respuesta = false;

            var sql_query = string.Empty;

            sql_query = " UPDATE VO_RequisitosVerificacion " +
                " SET " +
                " [fecha_modificacion] = @fecha_modificacion " +
                " ,[estado] = @estado " +
                " WHERE idRequisito = @idRequisito ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "B");
                command.Parameters.AddWithValue("idRequisito", id_requisito);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }
            return respuesta;
        }

        public Boolean UpdateRequisito(CEVerificacion objCEVerificacion)
        {
            var respuesta = false;

            var sql_query = string.Empty;

            sql_query = " UPDATE VO_RequisitosVerificacion " +
                " SET [nombre] = @nombre " +
                " ,[descripcion] = @descripcion " +
                " ,[obligatorio] = @obligatorio " +
                " ,[fecha_modificacion] = @fecha_modificacion " +
                " WHERE idRequisito = @idRequisito ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("nombre", objCEVerificacion.Nombre);
                command.Parameters.AddWithValue("descripcion", objCEVerificacion.Descripcion);
                command.Parameters.AddWithValue("obligatorio", objCEVerificacion.Obligatorio);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("idRequisito", objCEVerificacion.ID_Requisito);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }
            return respuesta;
        }
    }
}
