using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Entidad.Expedientes;

namespace Capa_Datos.Expedientes
{
    public class BandejaPersonal
    {
        General.Conexion objConexion = new General.Conexion();
        public DataTable SelectExpedientes(int id_usuario_dace)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " SELECT WFE.idWF_Expediente,ESE.id_expediente, ESE.id_Solicitud  " +
                " ,ESE.tipoSolicitud as cmd , ESE.id_usuarioSolicita , gu.nombres " +
                " ,CASE ESE.tipoSolicitud when 'VO' then 'Verificacion de Origen' ELSE 'Opinion Tecnica' END	 as tipoSolicitud  " +
                " ,ESE.[razonSocialImportador] ,ESE.[correoImportador],ESE.[razonSocialExportador] ,gp.Nombre as pais  " +
                " ,ESE.correoExportador, wfe.fecha_inicio,wfe.sigla_estado, wfe.estado_principal " +
                " FROM " +
                " ExpedienteSolicitud_Enc ESE, " +
                " G_Paises GP , g_usuarios GU, " +
                " WF_Expediente WFE " +
                " where " +
                " gp.IdPais = ESE.idPaisExportador and gu.id_usuario = ese.id_usuarioSolicita " +
                " and ESE.estado = 'R' and WFE.estado = 'A'" +
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

        public bool Update_WF_Estado(CEExpedientes objCEExpedientes)
        {
            var respuesta = false;

            using (var con = objConexion.Conectar())
            {
                con.Open();
                var command = con.CreateCommand();
                SqlTransaction transaccion;

                //Inicia Transaccion
                transaccion = con.BeginTransaction("UpdateEstado");

                command.Connection = con;
                command.Transaction = transaccion;

                try
                {
                    /*Query para insertar nuevo estado*/
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

                    /*Actualizo estado anterior*/
                    command.CommandText = " UPDATE WF_Expediente "+
                        " SET      "+
                        " [fecha_final] = @fecha_final_ant "+
                        " ,[fecha_modificacion] = @fecha_modificacion_ant "+
                        " ,[estado] = @estado_ant "+
                        " WHERE idWF_Expediente = @idWF_Expediente; ";

                    command.Parameters.AddWithValue("fecha_final_ant", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion_ant", DateTime.Now);
                    command.Parameters.AddWithValue("estado_ant", "B");
                    command.Parameters.AddWithValue("idWF_Expediente", objCEExpedientes.ID_WF_Expediente);
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

        public DataTable SelectEstado(string tipo_solicitud, int codigo_estado)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " select descripcion, dias_max, dias_min "+
                " from WF_Tiempos "+
                " where tipoSolicitud = @tipoSolicitud "+
                " and codigo_estado = @codigo_estado; ";

            using (var con = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, con);
                command.Parameters.AddWithValue("@tipoSolicitud", tipo_solicitud);
                command.Parameters.AddWithValue("@codigo_estado", codigo_estado);
                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }

            return dt_respuesta;
        }

        public bool RechazoExpediente(CEExpedientes objCEExpedientes)
        {
            var respuesta = false;
           
            using (var conn = objConexion.Conectar())
            {
                conn.Open();
                var command = conn.CreateCommand();
                SqlTransaction transaccion;

                //Inicia Transaccion
                transaccion = conn.BeginTransaction("RechazoExpediente");

                command.Connection = conn;
                command.Transaction = transaccion;


                try
                {
                    
                    /*Query que inserta bitacora rechazo del expediente*/
                    command.CommandText = " INSERT INTO WF_Rechazo_Expediente " +
                        " ([idWF_Expediente],[id_expediente],[motivo_1] " +
                        " ,[motivo_2],[motivo_3],[motivo_4] " +
                        " ,[check_observacion],[observaciones] " +
                        " ,[check_motivos],[otros_motivos],[fecha_creacion] " +
                        " ,[fecha_modificacion],[estado]) " +
                        " VALUES " +
                        " (@idWF_Expediente,@id_expediente " +
                        " ,@motivo_1,@motivo_2,@motivo_3 " +
                        " ,@motivo_4,@check_observacion " +
                        " ,@observaciones,@check_motivos " +
                        " ,@otros_motivos,@fecha_creacion " +
                        " ,@fecha_modificacion,@estado) ";

                    command.Parameters.AddWithValue("idWF_Expediente", objCEExpedientes.ID_WF_Expediente);
                    command.Parameters.AddWithValue("id_expediente", objCEExpedientes.ID_Expediente);
                    command.Parameters.AddWithValue("motivo_1", objCEExpedientes.Motivo_1);
                    command.Parameters.AddWithValue("motivo_2", objCEExpedientes.Motivo_2);
                    command.Parameters.AddWithValue("motivo_3", objCEExpedientes.Motivo_3);
                    command.Parameters.AddWithValue("motivo_4", objCEExpedientes.Motivo_4);
                    command.Parameters.AddWithValue("check_observacion", objCEExpedientes.Check_Observaciones);
                    command.Parameters.AddWithValue("observaciones", objCEExpedientes.Observaciones_Motivo);
                    command.Parameters.AddWithValue("check_motivos", objCEExpedientes.Check_Otros_Motivos);
                    command.Parameters.AddWithValue("otros_motivos", objCEExpedientes.Otros_Motivos);
                    command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                    command.Parameters.AddWithValue("estado", "A");
                    command.ExecuteNonQuery();

                    transaccion.Commit();

                    objCEExpedientes.Observaciones = objCEExpedientes.Observaciones_Motivo;

                    //Funcion de actualizacion de estado
                    Update_WF_Estado(objCEExpedientes);

                    respuesta = true;

                }
                catch (Exception)
                {
                    //Manejor Primera excepcion

                    try
                    {
                        transaccion.Rollback();
                    }
                    catch (Exception)
                    {
                        //Manejo segunda excepcion
                        throw;
                    }
                }

            }
            return respuesta;
        }

        public bool SolicitoAclaracionExpediente(CEExpedientes objCEExpedientes)
        {
            var respuesta = false;

            using (var con = objConexion.Conectar())
            {
                con.Open();
                var command = con.CreateCommand();
                SqlTransaction transaccion;

                //Inicia Transaccion
                transaccion = con.BeginTransaction("SolicitoAclaracion");

                command.Connection = con;
                command.Transaction = transaccion;

                try
                {
                    /*
                     * A. Inserto registro de bitacora de work flow                     
                     */

                    if (Update_WF_Estado(objCEExpedientes))
                    {
                        /*
                         * 1. Actualizo estado de borradorSolicitud_Enc
                         */

                        command.CommandText = " UPDATE BorradorSolicitud_Enc "+
                            " SET  "+
                            " [estado] = @estado "+
                            " WHERE id_Solicitud = @id_solicitud; ";

                        command.Parameters.AddWithValue("estado", "AC");
                        command.Parameters.AddWithValue("id_solicitud", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.1 Actualizo estado en BorradorMotivos
                         */

                        command.CommandText = " UPDATE [BorradorMotivos] "+
                            " SET "+
                            " [estado] = @estado_bm "+
                            " WHERE id_solicitud = @id_solicitud_bm; ";

                        command.Parameters.AddWithValue("estado_bm", "AC");
                        command.Parameters.AddWithValue("id_solicitud_bm", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.2 Actualizo estado en BorradorAdjunto
                         */

                        command.CommandText = " UPDATE [BorradorAdjunto] "+
                            " SET "+
                            " [estado] = @estado_ba "+
                            " WHERE id_solicitud = @id_solicitud_ba; ";

                        command.Parameters.AddWithValue("estado_ba", "AC");
                        command.Parameters.AddWithValue("id_solicitud_ba", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.3 Actualizo estado BorradorProductoImportacion
                         */

                        command.CommandText = "  UPDATE [BorradorProductoImportacion] "+
                            " SET  "+
                            " [estado] = @estado_bpi "+
                            " WHERE id_solicitud = @id_solicitud_bpi; ";

                        command.Parameters.AddWithValue("estado_bpi", "AC");
                        command.Parameters.AddWithValue("id_solicitud_bpi", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.4 Actualizo estado BorradorImportador
                         */

                        command.CommandText = "   UPDATE [BorradorImportador] "+
                            " SET  "+
                            " [estado] = @estado_bi "+
                            " WHERE id_solicitud = @id_solicitud_bi; ";

                        command.Parameters.AddWithValue("estado_bi", "AC");
                        command.Parameters.AddWithValue("id_solicitud_bi", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();


                        /*
                         * 2. Actualizo estado de ExpedienteSolicitud_Enc
                         */
                        command.CommandText = " UPDATE [ExpedienteSolicitud_Enc] "+
                            " SET  "+
                            " [estado] = @estado_ex "+
                            " WHERE id_expediente = @id_expediente;";

                        command.Parameters.AddWithValue("estado_ex", "AC");
                        command.Parameters.AddWithValue("id_expediente", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.1 Actualizo estado expediente ExpedienteMotivo
                         */
                        command.CommandText = " UPDATE [ExpedienteMotivos] "+
                            " SET  "+
                            " [estado] = @estado_em "+
                            " WHERE id_solicitud = @id_expediente_em; ";

                        command.Parameters.AddWithValue("estado_em", "AC");
                        command.Parameters.AddWithValue("id_expediente_em", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.2 Actualizo estado expedinete ExpedienteAdjunto
                         */

                        command.CommandText = " UPDATE [ExpedienteAdjunto] "+
                            " SET "+
                            " [estado] = @estado_ea "+
                            " WHERE id_expediente = @id_expediente_ea; ";

                        command.Parameters.AddWithValue("estado_ea", "AC");
                        command.Parameters.AddWithValue("id_expediente_ea", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.3 Actualizo estado expediente ExpedienteProductoImportacion
                         */

                        command.CommandText = "  UPDATE [ExpedienteProductoImportacion] "+
                            " SET "+
                            " [estado] = @estado_epi "+
                            " WHERE id_expediente = @id_expediente_epi; ";

                        command.Parameters.AddWithValue("estado_epi", "AC");
                        command.Parameters.AddWithValue("id_expediente_epi", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.4 Actualizo estado expediente ExpedienteImportador
                         */

                        command.CommandText = "   UPDATE [ExpedienteImportador] "+
                            " SET  "+
                            " [estado] = @estado_ei "+
                            " WHERE id_expediente = @id_expediente_ei; ";
                        
                        command.Parameters.AddWithValue("estado_ei", "AC");
                        command.Parameters.AddWithValue("id_expediente_ei", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*Confirmamos transaccion*/
                        transaccion.Commit();
                        respuesta = true;

                    }
                    else
                    {
                        respuesta = false;
                    }

                }
                catch (Exception)
                {
                    //Manejo primera exepcion
                    try
                    {
                        transaccion.Rollback();
                    }
                    catch (Exception)
                    {
                        //Manejo segunda exepcion
                        throw;
                    }
                }

            }


            return respuesta;
        }

        public int Ultimo_ID_Estado_WF_Expediente(int id_expediente)
        {
            var respuesta = 0;
            var sql_query = string.Empty;

            sql_query = " select MAX(idWF_Expediente) as ultimo " +
                " from WF_Expediente " +
                " where id_expediente = @id_expediente ";

            using (var con = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, con);
                command.Parameters.AddWithValue("id_expediente", id_expediente);
                con.Open();
                respuesta = (int)command.ExecuteScalar();
            }

            return respuesta;
        }

        public bool RegresoExpediente(CEExpedientes objCEExpedientes)
        {
            var respuesta = false;

            using (var con = objConexion.Conectar())
            {
                con.Open();
                var command = con.CreateCommand();
                SqlTransaction transaccion;

                //Inicia Transaccion
                transaccion = con.BeginTransaction("RegresoExpedienteAclarado");

                command.Connection = con;
                command.Transaction = transaccion;

                try
                {
                    /*
                     * A. Inserto registro de bitacora de work flow                     
                     */

                    if (Update_WF_Estado(objCEExpedientes))
                    {
                        /*
                         * 1. Actualizo estado de borradorSolicitud_Enc
                         */

                        command.CommandText = " UPDATE BorradorSolicitud_Enc " +
                            " SET  " +
                            " [estado] = @estado " +
                            " WHERE id_Solicitud = @id_solicitud; ";

                        command.Parameters.AddWithValue("estado", "E");
                        command.Parameters.AddWithValue("id_solicitud", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.1 Actualizo estado en BorradorMotivos
                         */

                        command.CommandText = " UPDATE [BorradorMotivos] " +
                            " SET " +
                            " [estado] = @estado_bm " +
                            " WHERE id_solicitud = @id_solicitud_bm; ";

                        command.Parameters.AddWithValue("estado_bm", "E");
                        command.Parameters.AddWithValue("id_solicitud_bm", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.2 Actualizo estado en BorradorAdjunto
                         */

                        command.CommandText = " UPDATE [BorradorAdjunto] " +
                            " SET " +
                            " [estado] = @estado_ba " +
                            " WHERE id_solicitud = @id_solicitud_ba; ";

                        command.Parameters.AddWithValue("estado_ba", "E");
                        command.Parameters.AddWithValue("id_solicitud_ba", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.3 Actualizo estado BorradorProductoImportacion
                         */

                        command.CommandText = "  UPDATE [BorradorProductoImportacion] " +
                            " SET  " +
                            " [estado] = @estado_bpi " +
                            " WHERE id_solicitud = @id_solicitud_bpi; ";

                        command.Parameters.AddWithValue("estado_bpi", "E");
                        command.Parameters.AddWithValue("id_solicitud_bpi", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();

                        /*
                         * 1.4 Actualizo estado BorradorImportador
                         */

                        command.CommandText = "   UPDATE [BorradorImportador] " +
                            " SET  " +
                            " [estado] = @estado_bi " +
                            " WHERE id_solicitud = @id_solicitud_bi; ";

                        command.Parameters.AddWithValue("estado_bi", "E ");
                        command.Parameters.AddWithValue("id_solicitud_bi", objCEExpedientes.ID_Solicitud);
                        command.ExecuteNonQuery();


                        /*
                         * 2. Actualizo estado de ExpedienteSolicitud_Enc
                         */
                        command.CommandText = " UPDATE [ExpedienteSolicitud_Enc] " +
                            " SET  " +
                            " [estado] = @estado_ex " +
                            " WHERE id_expediente = @id_expediente;";

                        command.Parameters.AddWithValue("estado_ex", "R");
                        command.Parameters.AddWithValue("id_expediente", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.1 Actualizo estado expediente ExpedienteMotivo
                         */
                        command.CommandText = " UPDATE [ExpedienteMotivos] " +
                            " SET  " +
                            " [estado] = @estado_em " +
                            " WHERE id_solicitud = @id_expediente_em; ";

                        command.Parameters.AddWithValue("estado_em", "R");
                        command.Parameters.AddWithValue("id_expediente_em", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.2 Actualizo estado expedinete ExpedienteAdjunto
                         */

                        command.CommandText = " UPDATE [ExpedienteAdjunto] " +
                            " SET " +
                            " [estado] = @estado_ea " +
                            " WHERE id_expediente = @id_expediente_ea; ";

                        command.Parameters.AddWithValue("estado_ea", "R");
                        command.Parameters.AddWithValue("id_expediente_ea", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.3 Actualizo estado expediente ExpedienteProductoImportacion
                         */

                        command.CommandText = "  UPDATE [ExpedienteProductoImportacion] " +
                            " SET " +
                            " [estado] = @estado_epi " +
                            " WHERE id_expediente = @id_expediente_epi; ";

                        command.Parameters.AddWithValue("estado_epi", "R");
                        command.Parameters.AddWithValue("id_expediente_epi", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*
                         * 2.4 Actualizo estado expediente ExpedienteImportador
                         */

                        command.CommandText = "   UPDATE [ExpedienteImportador] " +
                            " SET  " +
                            " [estado] = @estado_ei " +
                            " WHERE id_expediente = @id_expediente_ei; ";

                        command.Parameters.AddWithValue("estado_ei", "R");
                        command.Parameters.AddWithValue("id_expediente_ei", objCEExpedientes.ID_Expediente);
                        command.ExecuteNonQuery();

                        /*Confirmamos transaccion*/
                        transaccion.Commit();
                        respuesta = true;

                    }
                    else
                    {
                        respuesta = false;
                    }

                }
                catch (Exception)
                {
                    //Manejo primera exepcion
                    try
                    {
                        transaccion.Rollback();
                    }
                    catch (Exception)
                    {
                        //Manejo segunda exepcion
                        throw;
                    }
                }

            }


            return respuesta;
        }
    }
}
