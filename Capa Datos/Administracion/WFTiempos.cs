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
    public class WFTiempos
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectEstadosTiempos()
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT [id_WF_Tiempos] "+
                " ,CASE tipoSolicitud when 'VO' then 'Verificacion de Origen' ELSE 'Opinion Tecnica' END	 as tipoSolicitud "+
                " ,[codigo_estado] " +
                " ,[descripcion],[dias_max] "+
                " ,[dias_min] "+
                " FROM WF_Tiempos "+
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

        public bool InsertEstado(CEWFTiempos objCEEstado)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO WF_Tiempos "+
                " ([tipoSolicitud],[codigo_estado],[descripcion] "+
                " ,[dias_max],[dias_min],[fecha_creacion] "+
                " ,[fecha_modificacion],[estado]) "+
                " VALUES "+
                " (@tipoSolicitud,@codigo_estado,@descripcion "+
                " ,@dias_max,@dias_min,@fecha_creacion "+
                " ,@fecha_modificacion,@estado)";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("tipoSolicitud", objCEEstado.TipoSolicitud);
                command.Parameters.AddWithValue("codigo_estado", objCEEstado.Codigo_Estado);
                command.Parameters.AddWithValue("descripcion", objCEEstado.Descripcion);
                command.Parameters.AddWithValue("dias_max", objCEEstado.Dias_Max);
                command.Parameters.AddWithValue("dias_min", objCEEstado.Dias_Min);
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "A");

                cn.Open();
                command.ExecuteNonQuery();
                respuesta = true;
            }



            return respuesta;
        }

        public DataTable SelectEstado(int id_estado)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT "+
            " [tipoSolicitud],[codigo_estado] "+
            " ,[descripcion],[dias_max],[dias_min] "+
            " FROM WF_Tiempos "+
            " where id_WF_Tiempos = @id_estado ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_estado", id_estado);

                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }

            return dt_respuesta;
        }

        public Boolean UpdateEstado(CEWFTiempos objCEEstado)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE WF_Tiempos "+
            " SET [tipoSolicitud] = @tipoSolicitud "+
            " ,[codigo_estado] = @codigo_estado "+
            " ,[descripcion] = @descripcion "+
            " ,[dias_max] = @dias_max "+
            " ,[dias_min] = @dias_min "+
            " ,[fecha_modificacion] = @fecha_modificacion "+
            " WHERE id_WF_Tiempos = @id_estado ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("tipoSolicitud", objCEEstado.TipoSolicitud);
                command.Parameters.AddWithValue("codigo_estado", objCEEstado.Codigo_Estado);
                command.Parameters.AddWithValue("descripcion", objCEEstado.Descripcion);
                command.Parameters.AddWithValue("dias_max", objCEEstado.Dias_Max);
                command.Parameters.AddWithValue("dias_min", objCEEstado.Dias_Min);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("id_estado", objCEEstado.ID_WF_Tiempos);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;

            }
            

            return respuesta;
        }

        public Boolean DeleleEstado(int id_estado)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE WF_Tiempos " +
            " SET [estado] = @estado " +
            " ,[fecha_modificacion] = @fecha_modificacion " +
            " WHERE id_WF_Tiempos = @id_estado ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                
                command.Parameters.AddWithValue("estado", "A");
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("id_estado", id_estado);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;

            }


            return respuesta;
        }
         
    }
}
