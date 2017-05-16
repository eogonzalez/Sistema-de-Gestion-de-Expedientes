using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Entidad.Expedientes;

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

        public bool AutoAsignarExpediente(CEExpedientes objCEExpedientes)
        {
            var respuesta = false;
            using (var cn = objConexion.Conectar())
            {
                cn.Open();
                var command = cn.CreateCommand();
                SqlTransaction transaccion;

                //Inicia transaccion
                transaccion = cn.BeginTransaction("AutoAsignoExpediente");

                command.Connection = cn;
                command.Transaction = transaccion;

                try
                {
                    /*Query para crear asignacion de expediente*/
                    command.CommandText = " INSERT INTO " +
                        " WF_Expediente " +
                        " ([id_expediente],[id_usuario_dace],[fecha_inicio] " +
                        " ,[sigla_estado],[estado_principal],[estado_alterno] " +
                        " ,[dia_max],[dia_min],[observaciones] " +
                        " ,[fecha_creacion] " +
                        " ,[fecha_modificacion],[estado]) " +
                        " VALUES " +
                        " (@id_expediente,@id_usuario_dace,@fecha_inicio " +
                        " ,@sigla_estado,@estado_principal,@estado_alterno " +
                        " ,@dia_max,@dia_min,@observaciones " +
                        " ,@fecha_creacion,@fecha_modificacion,@estado); ";

                    command.Parameters.AddWithValue("id_expediente", objCEExpedientes.ID_Expediente);
                    command.Parameters.AddWithValue("id_usuario_dace", objCEExpedientes.ID_Usuario_DACE);
                    command.Parameters.AddWithValue("fecha_inicio", DateTime.Now);
                    command.Parameters.AddWithValue("sigla_estado", objCEExpedientes.Sigla_Estado);
                    command.Parameters.AddWithValue("estado_principal", objCEExpedientes.Estado_Principal);
                    command.Parameters.AddWithValue("estado_alterno", objCEExpedientes.Estado_Alterno);
                    command.Parameters.AddWithValue("dia_max", objCEExpedientes.Dias_Maximos);
                    command.Parameters.AddWithValue("dia_min", objCEExpedientes.Dias_Minimos);
                    
                    if (string.IsNullOrEmpty(objCEExpedientes.Observaciones))
                    {
                        command.Parameters.AddWithValue("observaciones", DBNull.Value);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("observaciones", objCEExpedientes.Observaciones);        
                    }

                    
                    command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                    command.Parameters.AddWithValue("estado", "A");
                    command.ExecuteNonQuery();



                    /*Actualizo estado de bandeja de expediente general*/

                    command.CommandText = " UPDATE ExpedienteSolicitud_Enc " +
                    " SET [estado] = @estado_ex " +
                    " WHERE id_expediente = @id_expediente_ex;";
                    command.Parameters.AddWithValue("estado_ex", "R");
                    command.Parameters.AddWithValue("id_expediente_ex", objCEExpedientes.ID_Expediente);
                    command.ExecuteNonQuery();

                    transaccion.Commit();
                    respuesta = true;
                }
                catch (Exception)
                {
                    //Manejo de primera excepcion

                    try
                    {
                        transaccion.Rollback();
                    }
                    catch (Exception)
                    {
                        //Manejo de segunda excepcion
                        throw;
                    }
                }

            }

            return respuesta;
        }

        public DataTable SelectEstadoMinimo(string tipo_solicitud)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " select WFT.codigo_estado, WFT.descripcion, WFT.dias_max, WFT.dias_min "+
                " from WF_Tiempos WFT "+
                " Inner join( "+
                " select min(codigo_estado) as min_periodo "+
                " from WF_Tiempos "+
                " where estado = 'A' "+
                " and tipoSolicitud = @tipoSolicitud "+
                " ) as minPer "+
                " on minPer.min_periodo = WFT.codigo_estado ";

            using (var conn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, conn);
                command.Parameters.AddWithValue("@tipoSolicitud", tipo_solicitud);
                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }

            return dt_respuesta;
        }

        public DataTable SelectUsuariosDACE()
        {            
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " select gu.id_usuario, gu.nombres+' '+gu.apellidos as nombres " +
            " from g_usuarios gu, G_UsuarioPermiso gup " +
            " where gu.estado = 'A' " +
            " and gu.id_usuario = gup.id_usuario " +
            " and gup.id_tipousuario = 2;";

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

    }
}
