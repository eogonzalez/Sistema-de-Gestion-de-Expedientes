using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Entidad.Solicitudes;

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
                    " ,CASE WHEN obligatorio = 1 THEN nombre+' (Obligatorio) ' ELSE nombre END as nombre, obligatorio " +
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
                    " ,CASE WHEN obligatorio = 1 THEN nombre+' (Obligatorio) ' ELSE nombre END as nombre, obligatorio " +
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

        public int InsertBorradorSolicitud(CEVerificacionOrigen objCEVerificacion)
        {
            int respuesta = 0;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO [SGEODB].[dbo].[BorradorSolicitud_Enc] "+
                " ([id_usuarioSolicita],[tipoSolicitud],[id_instrumento], [fecha_inicio_periodo],[fecha_fin_periodo] "+
                " ,[nombres],[apellidos],[direccion] " +
                " ,[idDepartamentoSolicita],[correo],[telefono] "+
                " ,[razonSocialImportador],[direccionImportador],[correoImportador]"+
                " ,[idDepartamentoImportador],[nitImportador],[telefonoImportador] "+
                " ,[razonSocialExportador],[direccionExportador],[correoExportador]"+
                " ,[idPaisExportador],[nitExportador],[telefonoExportador] "+
                " ,[fecha_creacion],[fecha_modificacion],[estado]) "+
                " VALUES "+
                " (@id_usuarioSolicita,@tipoSolicitud,@id_instrumento, @fecha_inicio_periodo, @fecha_fin_periodo "+
                " ,@nombres,@apellidos,@direccion "+
                " ,@idDepartamentoSolicita,@correo,@telefono "+
                " ,@razonSocialImportador,@direccionImportador,@correoImportador"+
                " ,@idDepartamentoImportador,@nitImportador,@telefonoImportador "+
                " ,@razonSocialExportador,@direccionExportador,@correoExportador "+
                " ,@idPaisExportador,@nitExportador,@telefonoExportador "+
                " ,@fecha_creacion,@fecha_modificacion,@estado);  "+
                " SELECT SCOPE_IDENTITY() ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_usuarioSolicita", objCEVerificacion.ID_UsuarioSolicita);
                command.Parameters.AddWithValue("tipoSolicitud", objCEVerificacion.TipoSolicitud);
                command.Parameters.AddWithValue("id_instrumento", objCEVerificacion.ID_Tratado);
                command.Parameters.AddWithValue("fecha_inicio_periodo", objCEVerificacion.fecha_periodo_inicial);
                command.Parameters.AddWithValue("fecha_fin_periodo", objCEVerificacion.fecha_periodo_final);
                command.Parameters.AddWithValue("nombres", objCEVerificacion.NombresSolicitante);
                command.Parameters.AddWithValue("apellidos", objCEVerificacion.ApellidosSolicitante);
                command.Parameters.AddWithValue("direccion", objCEVerificacion.DireccionSolicitante);
                command.Parameters.AddWithValue("idDepartamentoSolicita", objCEVerificacion.ID_DepartamentoSolicitante);
                command.Parameters.AddWithValue("correo", objCEVerificacion.CorreoSolicitante);
                command.Parameters.AddWithValue("telefono", objCEVerificacion.TelefonoSolicitante);

                command.Parameters.AddWithValue("razonSocialImportador", objCEVerificacion.NombreRazonSocialImportador);
                command.Parameters.AddWithValue("direccionImportador", objCEVerificacion.DireccionImportador);
                command.Parameters.AddWithValue("correoImportador", objCEVerificacion.CorreoImportador);
                command.Parameters.AddWithValue("idDepartamentoImportador", objCEVerificacion.ID_DepartamentoImportador);
                command.Parameters.AddWithValue("nitImportador", objCEVerificacion.NITImportador);
                command.Parameters.AddWithValue("telefonoImportador", objCEVerificacion.TelefonoImportador);

                command.Parameters.AddWithValue("razonSocialExportador", objCEVerificacion.NombreRazonSocialExportador);
                command.Parameters.AddWithValue("direccionExportador", objCEVerificacion.DireccionExportador);
                command.Parameters.AddWithValue("correoExportador", objCEVerificacion.CorreoExportador);
                command.Parameters.AddWithValue("idPaisExportador", objCEVerificacion.ID_PaisExportador);
                command.Parameters.AddWithValue("nitExportador", objCEVerificacion.NITExportador);
                command.Parameters.AddWithValue("telefonoExportador", objCEVerificacion.TelefonoExportador);

                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "T");

                try
                {
                    cn.Open();
                    int id_Solicitud = 0;
                    id_Solicitud = Convert.ToInt32(command.ExecuteScalar());
                    respuesta = id_Solicitud;
                }
                catch   (SqlException){
                    throw;
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }

                        
            return respuesta;
        }

        public Boolean UpdateBorradorSolicitud(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE BorradorSolicitud_Enc " +
                " SET "+
                " id_usuarioSolicita = @id_usuarioSolicita, tipoSolicitud = @tipoSolicitud"+
                " ,id_instrumento = @id_instrumento, fecha_inicio_periodo = @fecha_inicio_periodo, fecha_fin_periodo = @fecha_fin_periodo "+
                " ,nombres = @nombres,apellidos = @apellidos, direccion = @direccion " +
                " ,idDepartamentoSolicita = @idDepartamentoSolicita,correo = @correo,telefono = @telefono " +
                " ,razonSocialImportador = @razonSocialImportador,direccionImportador = @direccionImportador "+
                " ,correoImportador = @correoImportador,idDepartamentoImportador = @idDepartamentoImportador "+
                " ,nitImportador = @nitImportador,telefonoImportador = @telefonoImportador " +
                " ,razonSocialExportador = @razonSocialExportador,direccionExportador = @direccionExportador"+
                " ,correoExportador = @correoExportador, idPaisExportador = @idPaisExportador"+
                " ,nitExportador = @nitExportador, telefonoExportador = @telefonoExportador " +
                " ,fecha_modificacion = @fecha_modificacion " +                
                " WHERE id_solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_usuarioSolicita", objCEVerificacion.ID_UsuarioSolicita);
                command.Parameters.AddWithValue("tipoSolicitud", objCEVerificacion.TipoSolicitud);

                command.Parameters.AddWithValue("id_instrumento", objCEVerificacion.ID_Tratado);
                command.Parameters.AddWithValue("fecha_inicio_periodo", objCEVerificacion.fecha_periodo_inicial);
                command.Parameters.AddWithValue("fecha_fin_periodo", objCEVerificacion.fecha_periodo_final);

                command.Parameters.AddWithValue("nombres", objCEVerificacion.NombresSolicitante);
                command.Parameters.AddWithValue("apellidos", objCEVerificacion.ApellidosSolicitante);
                command.Parameters.AddWithValue("direccion", objCEVerificacion.DireccionSolicitante);
                command.Parameters.AddWithValue("idDepartamentoSolicita", objCEVerificacion.ID_DepartamentoSolicitante);
                command.Parameters.AddWithValue("correo", objCEVerificacion.CorreoSolicitante);
                command.Parameters.AddWithValue("telefono", objCEVerificacion.TelefonoSolicitante);

                command.Parameters.AddWithValue("razonSocialImportador", objCEVerificacion.NombreRazonSocialImportador);
                command.Parameters.AddWithValue("direccionImportador", objCEVerificacion.DireccionImportador);
                command.Parameters.AddWithValue("correoImportador", objCEVerificacion.CorreoImportador);
                command.Parameters.AddWithValue("idDepartamentoImportador", objCEVerificacion.ID_DepartamentoImportador);
                command.Parameters.AddWithValue("nitImportador", objCEVerificacion.NITImportador);
                command.Parameters.AddWithValue("telefonoImportador", objCEVerificacion.TelefonoImportador);

                command.Parameters.AddWithValue("razonSocialExportador", objCEVerificacion.NombreRazonSocialExportador);
                command.Parameters.AddWithValue("direccionExportador", objCEVerificacion.DireccionExportador);
                command.Parameters.AddWithValue("correoExportador", objCEVerificacion.CorreoExportador);
                command.Parameters.AddWithValue("idPaisExportador", objCEVerificacion.ID_PaisExportador);
                command.Parameters.AddWithValue("nitExportador", objCEVerificacion.NITExportador);
                command.Parameters.AddWithValue("telefonoExportador", objCEVerificacion.TelefonoExportador);

                
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("id_solicitud", objCEVerificacion.ID_Solicitud);

                try
                {
                    cn.Open();                    
                    command.ExecuteScalar();
                    respuesta = true;
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


            return respuesta;
        }

        public Boolean InsertBorradorMotivos(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO BorradorMotivos "+
                " ([id_Solicitud],[motivo_1],[motivo_2] "+
                " ,[motivo_3],[motivo_4],[motivo_5] "+
                " ,[motivo_6],[motivo_7],[motivo_8] "+
                " ,[observacion_si_no],[observaciones],[otros_motivos] "+
                " ,[fecha_creacion],[estado],[fecha_modificacion]) "+
                " VALUES "+
                " (@id_Solicitud, @motivo_1,@motivo_2 "+
                " ,@motivo_3,@motivo_4,@motivo_5 "+
                " ,@motivo_6,@motivo_7,@motivo_8 "+
                " ,@observacion_si_no,@observaciones,@otros_motivos " +
                " ,@fecha_creacion,@estado,@fecha_modificacion)";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_Solicitud", objCEVerificacion.ID_Solicitud);                
                command.Parameters.AddWithValue("motivo_1", objCEVerificacion.Motivo_1);
                command.Parameters.AddWithValue("motivo_2", objCEVerificacion.Motivo_2);
                command.Parameters.AddWithValue("motivo_3", objCEVerificacion.Motivo_3);
                command.Parameters.AddWithValue("motivo_4", objCEVerificacion.Motivo_4);
                command.Parameters.AddWithValue("motivo_5", objCEVerificacion.Motivo_5);
                command.Parameters.AddWithValue("motivo_6", objCEVerificacion.Motivo_6);
                command.Parameters.AddWithValue("motivo_7", objCEVerificacion.Motivo_7);
                command.Parameters.AddWithValue("motivo_8", objCEVerificacion.Motivo_8);
                command.Parameters.AddWithValue("observacion_si_no", objCEVerificacion.Observacion_Check);
                command.Parameters.AddWithValue("observaciones", objCEVerificacion.Observaciones);
                command.Parameters.AddWithValue("otros_motivos", objCEVerificacion.OtrosMotivos);

                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "T");

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
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

            return respuesta;
        }

        public Boolean ExisteMotivo(int id_solicitud)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " SELECT COALESCE(count(1), 0)  as existe    "+
                " FROM BorradorMotivos "+
                " where id_Solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                {
                    respuesta = true;
                }
                
            }


            return respuesta;
        }

        public Boolean UpdateBorradorMotivos(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE BorradorMotivos " +
                " SET [motivo_1] = @motivo_1 ,[motivo_2] = @motivo_2 " +
                " ,[motivo_3] = @motivo_3,[motivo_4] = @motivo_4,[motivo_5] = @motivo_5 " +
                " ,[motivo_6] = @motivo_6,[motivo_7] = @motivo_7,[motivo_8] = @motivo_8 " +
                " ,[observacion_si_no] = @observacion_si_no,[observaciones] = @observaciones "+
                " ,[otros_motivos] = @otros_motivos " +
                " ,[fecha_modificacion] = @fecha_modificacion " +
                " WHERE id_solicitud = @id_solicitud";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                
                command.Parameters.AddWithValue("motivo_1", objCEVerificacion.Motivo_1);
                command.Parameters.AddWithValue("motivo_2", objCEVerificacion.Motivo_2);
                command.Parameters.AddWithValue("motivo_3", objCEVerificacion.Motivo_3);
                command.Parameters.AddWithValue("motivo_4", objCEVerificacion.Motivo_4);
                command.Parameters.AddWithValue("motivo_5", objCEVerificacion.Motivo_5);
                command.Parameters.AddWithValue("motivo_6", objCEVerificacion.Motivo_6);
                command.Parameters.AddWithValue("motivo_7", objCEVerificacion.Motivo_7);
                command.Parameters.AddWithValue("motivo_8", objCEVerificacion.Motivo_8);
                command.Parameters.AddWithValue("observacion_si_no", objCEVerificacion.Observacion_Check);
                command.Parameters.AddWithValue("observaciones", objCEVerificacion.Observaciones);
                command.Parameters.AddWithValue("otros_motivos", objCEVerificacion.OtrosMotivos);
                
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);              
                command.Parameters.AddWithValue("id_Solicitud", objCEVerificacion.ID_Solicitud);

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
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

            return respuesta;
        }

        public Boolean InsertDocumentoAnexo(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO BorradorAdjunto "+
                " ([id_Solicitud],[tipoSolicitud],[oficioSAT],[idPrefijoSAT] "+
                " ,[PrefijoSAT],[numeroOficioSAT],[anioOficioSAT],[idRequisito] "+
                " ,[numeroReferencia],[nombreDocumentoOriginal] "+
                " ,[nombreDocumentoSistema],[path],[observaciones] "+
                " ,[fecha_creacion],[estado],[fecha_modificacion]) "+
                " VALUES "+
                " (@id_Solicitud,@tipoSolicitud,@oficioSAT ,@idPrefijoSAT "+
                " ,@PrefijoSAT,@numeroOficioSAT,@anioOficioSAT,@idRequisito "+
                " ,@numeroReferencia ,@nombreDocumentoOriginal "+
                " ,@nombreDocumentoSistema,@path,@observaciones "+
                " ,@fecha_creacion,@estado,@fecha_modificacion) ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_Solicitud", objCEVerificacion.ID_Solicitud);
                command.Parameters.AddWithValue("tipoSolicitud", objCEVerificacion.TipoSolicitud);
                command.Parameters.AddWithValue("oficioSAT", objCEVerificacion.OficioSAT_Check);
                command.Parameters.AddWithValue("idPrefijoSAT", objCEVerificacion.IDPrefijoSAT);
                command.Parameters.AddWithValue("PrefijoSAT", objCEVerificacion.PrefijoSAT);
                command.Parameters.AddWithValue("numeroOficioSAT", objCEVerificacion.numeroOficioSAT);
                command.Parameters.AddWithValue("anioOficioSAT", objCEVerificacion.anioOficioSAT);
                command.Parameters.AddWithValue("idRequisito", objCEVerificacion.IdRequisito);
                command.Parameters.AddWithValue("numeroReferencia", objCEVerificacion.numeroReferencia);
                command.Parameters.AddWithValue("nombreDocumentoOriginal", objCEVerificacion.NombreDocumentoOriginal);
                command.Parameters.AddWithValue("nombreDocumentoSistema", objCEVerificacion.NombreDocumentoSistema);
                command.Parameters.AddWithValue("path", objCEVerificacion.Path);
                command.Parameters.AddWithValue("observaciones", objCEVerificacion.ObservacionesAnexo);                
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "T");
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
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

            return respuesta;
        }

        public DataTable SelectDocumentosAnexos(int id_solicitud, string cmd)
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                if (cmd == "VO")
                {
                    sql_query = " SELECT BA.[corr_BorradorAnexo] " +
                        " ,BA.[oficioSAT] ,BA.[idPrefijoSAT] ,BA.[PrefijoSAT] , BA.[tipoSolicitud] " +
                        " ,BA.[numeroOficioSAT] ,BA.[anioOficioSAT] ,BA.[numeroReferencia] " +
                        " ,BA.[idRequisito],VORV.nombre, BA.[nombreDocumentoOriginal],BA.[nombreDocumentoSistema] " +
                        " ,BA.[path],BA.[observaciones],BA.[fecha_creacion] " +
                        " ,BA.[estado],BA.[fecha_modificacion]  " +
                        " FROM BorradorAdjunto BA, VO_RequisitosVerificacion VORV " +
                        " where ba.idRequisito = VORV.idRequisito  " +
                        " and BA.id_solicitud = @id_solicitud ";
                }
                else
                {
                    sql_query = " SELECT BA.[corr_BorradorAnexo] " +
                        " ,BA.[oficioSAT] ,BA.[idPrefijoSAT] ,BA.[PrefijoSAT] , BA.[tipoSolicitud] " +
                        " ,BA.[numeroOficioSAT] ,BA.[anioOficioSAT] ,BA.[numeroReferencia]  " +
                        " ,BA.[idRequisito],OPROT.nombre, BA.[nombreDocumentoOriginal],BA.[nombreDocumentoSistema] " +
                        " ,BA.[path],BA.[observaciones],BA.[fecha_creacion] " +
                        " ,BA.[estado],BA.[fecha_modificacion] " +
                        " FROM BorradorAdjunto BA, OP_RequisitosOpinionTecnica OPROT " +
                        " where ba.idRequisito = OPROT.idRequisito " +
                        " and BA.id_solicitud = @id_solicitud ";
                }

                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("id_solicitud", id_solicitud);
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

        public DataTable SelectDatosSolicitudEnc(int id_solicitud)
        {
            var dt_respuesta = new DataTable();
            string sql_query = string.Empty;

            sql_query = " SELECT      "+ 
                " [tipoSolicitud],[id_solicitud],[id_instrumento],[fecha_inicio_periodo],[fecha_fin_periodo]"+
                " ,[nombres],[apellidos] "+
                " ,[direccion],[idDepartamentoSolicita],[correo] "+
                " ,[telefono],[razonSocialImportador],[direccionImportador] "+
                " ,[correoImportador],[idDepartamentoImportador],[nitImportador] "+
                " ,[telefonoImportador],[razonSocialExportador],[direccionExportador] "+
                " ,[correoExportador],[idPaisExportador],[nitExportador],[telefonoExportador]"+
                " FROM BorradorSolicitud_Enc "+
                " where id_Solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("id_solicitud", id_solicitud);
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

        public DataTable SelectMotivos(int id_solicitud)
        {
            var dt_respuesta = new DataTable();
            string sql_query = string.Empty;

            sql_query = " SELECT [motivo_1] "+
                " ,[motivo_2],[motivo_3],[motivo_4] "+
                " ,[motivo_5],[motivo_6],[motivo_7] "+
                " ,[motivo_8],[observacion_si_no] "+
                " ,[observaciones],[otros_motivos] "+
                " FROM BorradorMotivos "+
                " where id_Solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("id_solicitud", id_solicitud);
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

        public Boolean VerificaMotivo(int id_solicitud)
        {
            var respuesta = false;

            var sql_query = string.Empty;

            sql_query = " SELECT COALESCE(count(1),0) as verifica "+      
                " FROM BorradorMotivos "+
                " where id_Solicitud = @id_solicitud "+
	            " and (motivo_1 = 1 "+
	            " or motivo_2 = 1 "+
	            " or motivo_3 = 1 "+
	            " or motivo_4 = 1 "+
	            " or motivo_5 = 1 "+
	            " or motivo_6 = 1 "+
	            " or motivo_7 = 1 "+
	            " or motivo_8 = 1 "+
	            " or observacion_si_no = 1) ;";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                {
                    respuesta = true;
                }

            }

            return respuesta;
        }

        public Boolean ExisteAnexo(int id_solicitud)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " SELECT COALESCE(count(1), 0)  as existe    " +
                " FROM BorradorAdjunto " +
                " where id_Solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                {
                    respuesta = true;
                }

            }


            return respuesta;
        }

        public Boolean CumpleAnexoObligatorio(int id_solicitud, string cmd)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            if (cmd == "VO")
            {
                sql_query = " select COALESCE(count(*), 0) as valido "+
                    " from  "+
                    " (select COALESCE(COUNT(1),0) as cantidad "+
                    " from VO_RequisitosVerificacion "+
                    " where obligatorio = 1) as requisito, "+
                    " (select COALESCE(COUNT(1),0) as cumple "+
                    " from BorradorAdjunto BA, VO_RequisitosVerificacion VRV "+
                    " where BA.id_solicitud = @id_solicitud "+
                    " and BA.idRequisito = VRV.idRequisito "+
                    " and VRV.obligatorio = 1) as adjunto "+
                    " where adjunto.cumple >= requisito.cantidad;";
            }
            else
            {
                sql_query = " select COALESCE(count(*), 0) as valido "+
                    " from  "+
                    " (SELECT COALESCE(COUNT(1),0) as cantidad "+
                    " from OP_RequisitosOpinionTecnica "+
                    " where obligatorio = 1) as requisito, "+
                    " (select COALESCE(COUNT(1),0) as cumple "+
                    " from BorradorAdjunto BA, OP_RequisitosOpinionTecnica OROT "+
                    " where BA.id_solicitud = @id_solicitud "+
                    " and BA.idRequisito = OROT.idRequisito "+
                    " and OROT.obligatorio = 1) as adjunto "+
                    " WHERE adjunto.cumple >= requisito.cantidad; ";
            }


            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                {
                    respuesta = true;
                }

            }


            return respuesta;
        }

        public int GeneroExpediente(int id_solicitud)
        {
            var respuesta = 0;

            using (var cn = objConexion.Conectar())
            {
                cn.Open();
                var command = cn.CreateCommand();
                SqlTransaction transaccion;

                //Inicia transaccion
                transaccion = cn.BeginTransaction("GenerarExpediente");

                command.Connection = cn;
                command.Transaction = transaccion;

                try
                {
                    /*Query para insertar el encabezado del expediente*/
                    command.CommandText = " INSERT INTO  "+
	                    " ExpedienteSolicitud_Enc "+
	                    " ([id_Solicitud],[id_usuarioSolicita],[tipoSolicitud] "+
                        " ,[id_instrumento],[fecha_inicio_periodo],[fecha_fin_periodo] "+
	                    " ,[nombres],[apellidos],[direccion],[idDepartamentoSolicita] "+
	                    " ,[correo],[telefono],[razonSocialImportador],[direccionImportador] "+
	                    " ,[correoImportador],[idDepartamentoImportador],[nitImportador] "+
	                    " ,[telefonoImportador],[razonSocialExportador] "+
	                    " ,[direccionExportador],[correoExportador] "+
	                    " ,[idPaisExportador],[nitExportador],[telefonoExportador] "+
	                    " ,[fecha_creacion],[fecha_modificacion],[estado]) "+
                        " select "+
	                    " id_Solicitud, id_usuarioSolicita, tipoSolicitud, "+
                        " id_instrumento, fecha_inicio_periodo, fecha_fin_periodo, "+
	                    " nombres, apellidos, direccion, idDepartamentoSolicita,  "+
	                    " correo, telefono, razonSocialImportador, "+
	                    " direccionImportador, correoImportador, idDepartamentoImportador, "+
	                    " nitImportador, telefonoImportador, razonSocialExportador, "+
	                    " direccionExportador, correoExportador, idPaisExportador, nitExportador, "+
	                    " telefonoExportador, @fecha_creacion as fecha_creacion, @fecha_modificacion as fecha_modificacion, @estado as estado "+
                        " from BorradorSolicitud_Enc "+
                        " where id_Solicitud = @id_solicitud; "+
                        " SELECT SCOPE_IDENTITY(); ";

                    command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                    command.Parameters.AddWithValue("estado", "E");
                    command.Parameters.AddWithValue("id_solicitud", id_solicitud);
                    int id_expediente = 0;
                    id_expediente = Convert.ToInt32(command.ExecuteScalar());

                    /*Query para insertar los motivos del expediente*/
                    command.CommandText = " INSERT INTO ExpedienteMotivos "+
                        " ([id_expediente],[id_Solicitud],[motivo_1] "+
                        " ,[motivo_2],[motivo_3],[motivo_4],[motivo_5] "+
                        " ,[motivo_6],[motivo_7],[motivo_8],[observacion_si_no] "+
                        " ,[observaciones],[otros_motivos],[fecha_creacion] "+
                        " ,[estado],[fecha_modificacion]) "+
                        " SELECT "+
	                    " @id_expediente_motivo as id_expediente, id_Solicitud, motivo_1, "+
	                    " motivo_2, motivo_3,motivo_4, motivo_5, "+
	                    " motivo_6, motivo_7, motivo_8, observacion_si_no, "+
	                    " observaciones, otros_motivos, @fecha_creacion_motivo as fecha_creacion, "+
	                    " @estado_motivo as estado, @fecha_modificacion_motivo as fecha_modificacion"+
                        " from BorradorMotivos "+
                        " where id_Solicitud = @id_solicitud_motivo ";

                    command.Parameters.AddWithValue("id_expediente_motivo", id_expediente);
                    command.Parameters.AddWithValue("fecha_creacion_motivo", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion_motivo", DateTime.Now);
                    command.Parameters.AddWithValue("estado_motivo", "E");
                    command.Parameters.AddWithValue("id_solicitud_motivo", id_solicitud);
                    command.ExecuteNonQuery();

                    /*Query para insertar los documentos anexos*/
                    command.CommandText = " INSERT INTO ExpedienteAdjunto "+
                        " ([id_expediente],[corr_BorradorAnexo],[id_Solicitud] "+
                        " ,[tipoSolicitud],[oficioSAT],[idPrefijoSAT] "+
                        " ,[PrefijoSAT],[numeroOficioSAT],[anioOficioSAT] "+
                        " ,[numeroReferencia],[idRequisito],[nombreDocumentoOriginal] "+
                        " ,[nombreDocumentoSistema],[path],[observaciones] "+
                        " ,[fecha_creacion],[estado],[fecha_modificacion]) "+
                        " select "+
                        " @id_expediente_anexo as id_expediente, corr_BorradorAnexo, id_Solicitud"+
                        " ,tipoSolicitud, oficioSAT, idPrefijoSAT "+
                        " ,PrefijoSAT, numeroOficioSAT, anioOficioSAT"+
                        " ,numeroReferencia, idRequisito, nombreDocumentoOriginal"+
                        " ,nombreDocumentoSistema, path, observaciones"+
                        " , @fecha_creacion_anexo as fecha_creacion, @estado_anexo as estado"+
                        " , @fecha_modificacion_anexo as fecha_modificacion "+
                        " from BorradorAdjunto "+
                        " where id_Solicitud = @id_solicitud_anexo ";

                    command.Parameters.AddWithValue("id_expediente_anexo", id_expediente);
                    command.Parameters.AddWithValue("fecha_creacion_anexo", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion_anexo", DateTime.Now);
                    command.Parameters.AddWithValue("estado_anexo", "E");
                    command.Parameters.AddWithValue("id_solicitud_anexo", id_solicitud);
                    command.ExecuteNonQuery();

                    /*Query para insertar datos del producto */
                    command.CommandText = " INSERT INTO ExpedienteProductoImportacion "+
                        " ([id_expediente],[id_Solicitud],[id_regimen_importacion] "+
                        " ,[nombre_regimen_importacion],[idAduana],[clasificacion_arancelaria]"+
                        " ,[descripcion_comercial],[descripcion_factura],[observaciones] "+
                        " ,[fecha_creacion],[fecha_modificacion],[estado]) "+
                        " SELECT "+
	                    " @id_expediente_producto as id_expediente, id_Solicitud "+
	                    " ,id_regimen_importacion,nombre_regimen_importacion "+
	                    " ,idAduana,clasificacion_arancelaria,descripcion_comercial"+
                        " ,descripcion_factura,observaciones "+
	                    " ,@fecha_creacion_producto as fecha_creacion "+
	                    " ,@fecha_modificacion_producto as fecha_modificacion "+
	                    " ,@estado_producto as estado "+
                        " from BorradorProductoImportacion "+
                        " where id_Solicitud = @id_solicitud_producto ";

                    command.Parameters.AddWithValue("id_expediente_producto", id_expediente);
                    command.Parameters.AddWithValue("fecha_creacion_producto", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion_producto", DateTime.Now);
                    command.Parameters.AddWithValue("estado_producto", "E");
                    command.Parameters.AddWithValue("id_solicitud_producto", id_solicitud);
                    command.ExecuteNonQuery();
                    

                    /*Query para insertar datos del importador*/
                    command.CommandText = " INSERT INTO ExpedienteImportador "+
                        " ([corr_BorradorImportador],[id_expediente],[id_solicitud] "+
                        " ,[tipoSolicitud],[razon_social],[correo],[nit] "+
                        " ,[telefono],[fecha_creacion],[estado],[fecha_modificacion]) "+
                        " select "+
                        " corr_BorradorImportador, @id_expediente_importador as id_expediente, id_Solicitud, "+
                        " tipoSolicitud, razon_social, correo, nit, telefono, @fecha_creacion_importador as fecha_creacion, "+
                        " @estado_importador as estado, @fecha_modificacion_importador as fecha_modificacion "+
                        " from BorradorImportador "+
                        " where id_solicitud = @id_solicitud_importador ";

                    command.Parameters.AddWithValue("id_expediente_importador", id_expediente);
                    command.Parameters.AddWithValue("fecha_creacion_importador", DateTime.Now);
                    command.Parameters.AddWithValue("estado_importador", "E");
                    command.Parameters.AddWithValue("fecha_modificacion_importador", DateTime.Now);
                    command.Parameters.AddWithValue("id_solicitud_importador", id_solicitud);
                    command.ExecuteNonQuery();

                    transaccion.Commit();

                    /*Cambio estatus en borrador*/                    
                    var sql_query = string.Empty;
                    sql_query = " UPDATE BorradorSolicitud_Enc " +
                        " SET " +
                        " [estado] = @estado_BS " +
                        " WHERE id_Solicitud = @id_solicitud_BS; " +
                        " UPDATE BorradorMotivos " +
                        " SET " +
                        " [estado] = @estado_BS " +
                        " WHERE id_Solicitud = @id_solicitud_BS; " +
                        " UPDATE BorradorAdjunto " +
                        " SET " +
                        " [estado] = @estado_BS " +
                        " WHERE id_solicitud = @id_solicitud_BS; "+
                        " UPDATE BorradorProductoImportacion "+
                        " SET "+
                        " [estado] = @estado_BS "+
                        " WHERE id_solicitud = @id_solicitud_BS; "+
                        " UPDATE BorradorImportador "+
                        " SET "+
                        " [estado] = @estado_BS "+
                        " WHERE id_solicitud = @id_solicitud_BS; " ;

                    command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("estado_BS", "E");
                    command.Parameters.AddWithValue("id_solicitud_BS", id_solicitud);
                    command.ExecuteScalar();
                    respuesta = id_expediente;
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

        public DataTable SelectFuncionariosDACE()
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " select gu.nombres, gu.apellidos, gu.correo "+
                " from g_usuarios gu,G_TipoUsuario gtu,G_UsuarioPermiso gup "+
                " WHERE "+
                " gup.id_tipousuario = gtu.id_tipousuario "+
                " and gup.id_usuario = gu.id_usuario "+
                " and gtu.tipo_permiso = 'F'; ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }

            return dt_respuesta;
        }

        public DataTable SelectDatosAnexo(int id_anexo)
        {
            var dt_respuesta = new DataTable();
            var sql_query = string.Empty;

            sql_query = " select oficioSAT, idPrefijoSAT, PrefijoSAT, "+
                " numeroOficioSAT, anioOficioSAT, numeroReferencia, "+
                " idRequisito, observaciones "+
                " from BorradorAdjunto "+
                " where corr_BorradorAnexo = @id_anexo ";
            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_anexo", id_anexo);
                var da = new SqlDataAdapter(command);
                da.Fill(dt_respuesta);
            }


            return dt_respuesta;
        }

        public Boolean UpdateDatosAnexo(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE BorradorAdjunto "+
                " SET "+
                " [oficioSAT] = @oficioSAT ,[idPrefijoSAT] = @idPrefijoSAT "+
                " ,[PrefijoSAT] = @PrefijoSAT,[numeroOficioSAT] = @numeroOficioSAT "+
                " ,[anioOficioSAT] = @anioOficioSAT,[numeroReferencia] = @numeroReferencia "+
                " ,[idRequisito] = @idRequisito ";

            if (objCEVerificacion.NombreDocumentoOriginal != null)
            {
                sql_query += " ,[nombreDocumentoOriginal] = @nombreDocumentoOriginal " +
                " ,[nombreDocumentoSistema] = @nombreDocumentoSistema,[path] = @path ";
            }

            sql_query+= " ,[observaciones] = @observaciones ,[fecha_modificacion] = @fecha_modificacion "+
                " WHERE corr_BorradorAnexo = @id_anexo ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("oficioSAT", objCEVerificacion.OficioSAT_Check);
                command.Parameters.AddWithValue("idPrefijoSAT", objCEVerificacion.IDPrefijoSAT);
                command.Parameters.AddWithValue("PrefijoSAT", objCEVerificacion.PrefijoSAT);
                command.Parameters.AddWithValue("numeroOficioSAT", objCEVerificacion.numeroOficioSAT);
                command.Parameters.AddWithValue("anioOficioSAT", objCEVerificacion.anioOficioSAT);
                command.Parameters.AddWithValue("numeroReferencia", objCEVerificacion.numeroReferencia);
                command.Parameters.AddWithValue("idRequisito", objCEVerificacion.IdRequisito);

                if (objCEVerificacion.NombreDocumentoOriginal != null)
                {
                    command.Parameters.AddWithValue("nombreDocumentoOriginal", objCEVerificacion.NombreDocumentoOriginal);
                    command.Parameters.AddWithValue("nombreDocumentoSistema", objCEVerificacion.NombreDocumentoSistema);
                    command.Parameters.AddWithValue("path", objCEVerificacion.Path);    
                }
                                              
                command.Parameters.AddWithValue("observaciones", objCEVerificacion.ObservacionesAnexo);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("id_anexo", objCEVerificacion.ID_Anexo);

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
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


            return respuesta;
        }

        public DataTable SelectComboInstrumentos()
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                sql_query = " SELECT [id_instrumento],[sigla]+' - '+[nombre_instrumento] as nombre_instrumento "+
                    " FROM G_Instrumentos "+
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

        public DataTable SelectComboAduanas()
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                sql_query = " SELECT [idAduana],[codigo]+' - '+[nombre] as nombre " +
                    " FROM G_Aduanas " +
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

        public Boolean ExistenProductos(int id_solicitud)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " SELECT COALESCE(count(1), 0)  as existe    " +
                " FROM BorradorProductoImportacion " +
                " where id_Solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                {
                    respuesta = true;
                }

            }

            return respuesta;
        }

        public Boolean InsertBorradorProducto(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO BorradorProductoImportacion "+
            " ([id_Solicitud],[id_regimen_importacion],[nombre_regimen_importacion] "+
            " ,[idAduana],[clasificacion_arancelaria],[descripcion_comercial] "+
            " ,[descripcion_factura],[observaciones],[fecha_creacion] "+
            " ,[fecha_modificacion],[estado]) "+
            " VALUES "+
            " (@id_Solicitud,@id_regimen_importacion,@nombre_regimen_importacion "+
            " ,@idAduana,@clasificacion_arancelaria,@descripcion_comercial "+
            " ,@descripcion_factura,@observaciones,@fecha_creacion "+
            " ,@fecha_modificacion,@estado)" ;

            using (var con = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, con);
                command.Parameters.AddWithValue("id_solicitud", objCEVerificacion.ID_Solicitud);
                command.Parameters.AddWithValue("id_regimen_importacion", objCEVerificacion.ID_Regimem_Importacion);
                command.Parameters.AddWithValue("nombre_regimen_importacion", objCEVerificacion.Nombre_Regimen_Importacion);
                command.Parameters.AddWithValue("idAduana", objCEVerificacion.IDAduana);
                command.Parameters.AddWithValue("clasificacion_arancelaria", objCEVerificacion.Clasificacion_Arancelaria);
                command.Parameters.AddWithValue("descripcion_comercial", objCEVerificacion.Descripcion_Comercial);
                command.Parameters.AddWithValue("descripcion_factura", objCEVerificacion.Descripcion_Factura);
                command.Parameters.AddWithValue("observaciones", objCEVerificacion.ObservacionesProducto);
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "A");

                try
                {
                    con.Open();
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

        public Boolean UpdateBorradorProducto(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE BorradorProductoImportacion "+
                " SET [id_regimen_importacion] = @id_regimen_importacion "+
                " ,[nombre_regimen_importacion] = @nombre_regimen_importacion "+
                " ,[idAduana] = @idAduana,[clasificacion_arancelaria] = @clasificacion_arancelaria "+
                " ,[descripcion_comercial] = @descripcion_comercial,[descripcion_factura] = @descripcion_factura "+
                " ,[observaciones] = @observaciones, [fecha_modificacion] = @fecha_modificacion "+
                " WHERE id_Solicitud = @id_solicitud ";

            using (var conn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, conn);
                command.Parameters.AddWithValue("id_regimen_importacion", objCEVerificacion.ID_Regimem_Importacion);
                command.Parameters.AddWithValue("nombre_regimen_importacion", objCEVerificacion.Nombre_Regimen_Importacion);
                command.Parameters.AddWithValue("idAduana", objCEVerificacion.IDAduana);
                command.Parameters.AddWithValue("clasificacion_arancelaria", objCEVerificacion.Clasificacion_Arancelaria);
                command.Parameters.AddWithValue("descripcion_comercial", objCEVerificacion.Descripcion_Comercial);
                command.Parameters.AddWithValue("descripcion_factura", objCEVerificacion.Descripcion_Factura);
                command.Parameters.AddWithValue("observaciones", objCEVerificacion.ObservacionesProducto);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("id_solicitud", objCEVerificacion.ID_Solicitud);

                try
                {
                    conn.Open();
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

        public DataTable SelectProductos(int id_solicitud)
        {
            DataTable dt_respuesta = new DataTable();

            var sql_query = string.Empty;
            
            sql_query = " SELECT [id_regimen_importacion],[nombre_regimen_importacion],[idAduana] "+
                " ,[clasificacion_arancelaria],[descripcion_comercial] "+
                " ,[descripcion_factura],[observaciones] "+
                " FROM BorradorProductoImportacion "+
                " WHERE id_Solicitud = @id_solicitud ";

            using (var conn = objConexion.Conectar())
            {                                
                try
                {
                    var command = new SqlCommand(sql_query, conn);
                    command.Parameters.AddWithValue("id_solicitud", id_solicitud);
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

        public DataTable SelectImportadores(int id_solicitud)
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {

                sql_query = " SELECT [corr_BorradorImportador],[razon_social],[correo],[telefono] "+
                    " FROM BorradorImportador "+
                    " where estado != 'B'  and id_Solicitud = @id_Solicitud ";                

                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("id_solicitud", id_solicitud);
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

        public Boolean InsertImportador(CEVerificacionOrigen objCEVerificacion)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO BorradorImportador "+
                " ([id_Solicitud],[tipoSolicitud],[razon_social] "+
                " ,[correo],[direccion],[nit],[telefono] "+
                " ,[fecha_creacion],[fecha_modificacion],[estado]) "+
                " VALUES "+
                " (@id_Solicitud,@tipoSolicitud,@razon_social "+
                " ,@correo,@direccion,@nit,@telefono "+
                " ,@fecha_creacion,@fecha_modificacion,@estado) ";

            using (var conn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, conn);
                command.Parameters.AddWithValue("id_solicitud", objCEVerificacion.ID_Solicitud);
                command.Parameters.AddWithValue("tipoSolicitud", objCEVerificacion.TipoSolicitud);
                command.Parameters.AddWithValue("razon_social", objCEVerificacion.RazonSocial_Ficha_Importador);
                command.Parameters.AddWithValue("correo", objCEVerificacion.Correo_Ficha_Importador);
                command.Parameters.AddWithValue("direccion", objCEVerificacion.Direccion_Ficha_Importador);
                command.Parameters.AddWithValue("nit", objCEVerificacion.Nit_Ficha_Importador);
                command.Parameters.AddWithValue("telefono", objCEVerificacion.Telefono_Ficha_Importador);
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "A");

                try
                {
                    conn.Open();
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

        public DataTable SelectImportador(int id_importador)
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {

                sql_query = " SELECT [razon_social],[correo],[direccion],[nit],[telefono] " +
                    " FROM BorradorImportador " +
                    " where corr_BorradorImportador = @corr_BorradorImportador ";

                try
                {
                    var command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("corr_BorradorImportador", id_importador);
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

        public Boolean DeleteImportador(int id_importador)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE BorradorImportador "+
                " SET [fecha_modificacion] = @fecha_modificacion "+
                " ,[estado] = @estado "+
                " WHERE corr_BorradorImportador = @corr_BorradorImportador ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("estado", "B");                                
                command.Parameters.AddWithValue("corr_BorradorImportador", id_importador);

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
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


            return respuesta;
        }

        public Boolean UpdateImportador(CEVerificacionOrigen objCEImportador)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE BorradorImportador " +
                " SET [razon_social] = @razon_social, "+
                " [correo] = @correo, [direccion] = @direccion, "+
                " [nit] = @nit, [telefono] = @telefono,"+
                "[fecha_modificacion] = @fecha_modificacion " +                
                " WHERE corr_BorradorImportador = @corr_BorradorImportador ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("razon_social", objCEImportador.RazonSocial_Ficha_Importador);
                command.Parameters.AddWithValue("correo", objCEImportador.Correo_Ficha_Importador);
                command.Parameters.AddWithValue("direccion", objCEImportador.Direccion_Ficha_Importador);
                command.Parameters.AddWithValue("nit", objCEImportador.Nit_Ficha_Importador);
                command.Parameters.AddWithValue("telefono", objCEImportador.Telefono_Ficha_Importador);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);                
                command.Parameters.AddWithValue("corr_BorradorImportador", objCEImportador.ID_Importador);

                try
                {
                    cn.Open();
                    command.ExecuteScalar();
                    respuesta = true;
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


            return respuesta;
        }

        public Boolean ExistenImportadores(int id_solicitud)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " SELECT COALESCE(count(1), 0)  as existe    " +
                " FROM BorradorImportador " +
                " where id_Solicitud = @id_solicitud ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("id_solicitud", id_solicitud);

                cn.Open();
                if (Convert.ToInt32(command.ExecuteScalar()) > 0)
                {
                    respuesta = true;
                }

            }

            return respuesta;
        }
    }
}
