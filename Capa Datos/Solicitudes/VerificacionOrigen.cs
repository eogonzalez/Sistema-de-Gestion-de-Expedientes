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

        public int InsertBorradorSolicitud(CEVerificacionOrigen objCEVerificacion)
        {
            int respuesta = 0;
            var sql_query = string.Empty;

            sql_query = " INSERT INTO [SGEODB].[dbo].[BorradorSolicitud_Enc] "+
                " ([id_usuarioSolicita],[tipoSolicitud],[nombres],[apellidos],[direccion] " +
                " ,[idDepartamentoSolicita],[correo],[telefono] "+
                " ,[razonSocialImportador],[direccionImportador],[correoImportador]"+
                " ,[idDepartamentoImportador],[nitImportador],[telefonoImportador] "+
                " ,[razonSocialExportador],[direccionExportador],[correoExportador]"+
                " ,[idPaisExportador],[nitExportador],[telefonoExportador] "+
                " ,[fecha_creacion],[fecha_modificacion],[estado]) "+
                " VALUES "+
                " (@id_usuarioSolicita,@tipoSolicitud,@nombres,@apellidos,@direccion "+
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

        public DataTable SelectDocumentosAnexos(int id_solicitud)
        {
            var dt_respuesta = new DataTable();

            string sql_query = string.Empty;

            using (var cn = objConexion.Conectar())
            {
                sql_query = " SELECT [corr_BorradorAnexo] "  +
                    " ,[oficioSAT] ,[idPrefijoSAT] ,[PrefijoSAT] "+
                    " ,[numeroOficioSAT] ,[anioOficioSAT] ,[numeroReferencia] "+
                    " ,[idRequisito],[nombreDocumentoOriginal],[nombreDocumentoSistema] "+
                    " ,[path],[observaciones],[fecha_creacion] "+
                    " ,[estado],[fecha_modificacion] "+
                    " FROM BorradorAdjunto "+
                    " where id_solicitud = @id_solicitud ";
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
                " [tipoSolicitud],[nombres],[apellidos] "+
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
    }
}
