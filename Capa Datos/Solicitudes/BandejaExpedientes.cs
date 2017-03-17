using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Capa_Datos.Solicitudes
{
    public class BandejaExpedientes
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectExpedientes()
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT ESE.id_expediente, ESE.id_Solicitud "+
                " ,ESE.tipoSolicitud as cmd "+
                " , ESE.id_usuarioSolicita  "+
                " , gu.nombres "+
                " ,CASE ESE.tipoSolicitud when 'VO' then 'Verificacion de Origen' ELSE 'Opinion Tecnica' END	 as tipoSolicitud  "+
                " ,ESE.[razonSocialImportador] ,ESE.[correoImportador]  "+
                " ,ESE.[razonSocialExportador] ,gp.Nombre as pais  "+
                " ,ESE.correoExportador  "+
                " ,ESE.fecha_creacion  "+
                " ,ESE.fecha_modificacion  "+
                " FROM ExpedienteSolicitud_Enc ESE, G_Paises GP , g_usuarios GU "+
                " where   "+
                " gp.IdPais = ESE.idPaisExportador "+
                " and gu.id_usuario = ese.id_usuarioSolicita "+
                " and ESE.estado = 'E' ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);                    
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

        public int SelectCantidadExpedientes()
        {
            var respuesta = 0;
            var sql_query = string.Empty;

            sql_query = " select count(1) as borradores "+
                " from ExpedienteSolicitud_Enc  "+
                " where  "+
                " estado = 'E' ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);                    
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
    }
}
