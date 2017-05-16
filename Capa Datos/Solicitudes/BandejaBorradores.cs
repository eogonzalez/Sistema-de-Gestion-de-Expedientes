using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace Capa_Datos.Solicitudes
{
    public class BandejaBorradores
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectBorradorSolicitudes(int idUsuario)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT bse.id_Solicitud "+
                " ,bse.tipoSolicitud as cmd      "+
                " ,CASE BSE.tipoSolicitud when 'VO' then 'Verificacion de Origen' ELSE 'Opinion Tecnica' END	 as tipoSolicitud "+
                " ,BSE.[razonSocialImportador] ,BSE.[correoImportador] "+
                " ,BSE.[razonSocialExportador] ,gp.Nombre as pais "+
                " ,bse.correoExportador "+
                " ,bse.fecha_creacion "+
                " ,bse.fecha_modificacion "+
                " ,CASE bse.estado WHEN 'T' THEN 'Borrador' ELSE 'Aclaracion' END as descripcion_estado "+
                " ,bse.estado as estado "+
                " FROM BorradorSolicitud_Enc BSE, G_Paises GP "+
                " where  "+
                " gp.IdPais = BSE.idPaisExportador and "+
                " BSE.id_usuarioSolicita = @idUsuario and (BSE.estado = 'T' or BSE.estado = 'AC') ";

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

        public int SelectCantidadBorradores(int id_usuario)
        {
            var respuesta = 0;
            var sql_query = string.Empty;

            sql_query = " select count(1) as borradores "+
                " from BorradorSolicitud_Enc "+
                " where "+
                " id_usuarioSolicita = @id_usuario and estado = 'T' ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("id_usuario", id_usuario);
                    cn.Open();
                    respuesta = Convert.ToInt32(command.ExecuteScalar());
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }


            return respuesta;
        }

        public Boolean DeleteBorrador(int id_solicitud)
        {
            var respuesta = false;
            string sql_query = string.Empty;

            sql_query = " update BorradorSolicitud_Enc "+
                " SET "+
	            " estado = @estado "+
                " where id_Solicitud = @id_solicitud; "+ 
                " update BorradorMotivos "+
                " set "+
	            " estado = @estado "+
                " where id_Solicitud = @id_solicitud; "+
                " update BorradorAdjunto "+
                " set "+
	            " estado = @estado "+
                " where id_solicitud = @id_solicitud; ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("estado", "B");
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }


            return respuesta;
        }

    }
}
