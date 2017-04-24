using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace Capa_Datos.Expedientes
{
    public class BandejaPersonal
    {
        General.Conexion objConexion = new General.Conexion();
        public DataTable SelectExpedientes(int id_usuario_dace)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT ESE.id_expediente, ESE.id_Solicitud  " +
                " ,ESE.tipoSolicitud as cmd , ESE.id_usuarioSolicita , gu.nombres " +
                " ,CASE ESE.tipoSolicitud when 'VO' then 'Verificacion de Origen' ELSE 'Opinion Tecnica' END	 as tipoSolicitud  " +
                " ,ESE.[razonSocialImportador] ,ESE.[correoImportador],ESE.[razonSocialExportador] ,gp.Nombre as pais  " +
                " ,ESE.correoExportador, wfe.fecha_inicio,wfe.sigla_estado " +
                " FROM " +
                " ExpedienteSolicitud_Enc ESE, " +
                " G_Paises GP , g_usuarios GU, " +
                " WF_Expediente WFE " +
                " where " +
                " gp.IdPais = ESE.idPaisExportador and gu.id_usuario = ese.id_usuarioSolicita " +
                " and ESE.estado = 'R' " +
                " and WFE.id_expediente = ese.id_expediente " +
                " and WFE.id_usuario_dace = @id_usuario_dace; ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("id_usuario_dace", id_usuario_dace);

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

    }
}
