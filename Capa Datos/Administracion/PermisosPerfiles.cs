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
    public class PermisosPerfiles
    {
        General.Conexion objConexion = new General.Conexion();
        

        public DataSet SelectPermisosPerfiles(int id_usuarioPermiso = 0)
        {
            var respuesta = new DataSet();
            string sql_query = string.Empty;
            var dt = new DataTable();
            var ds = new DataSet();

            if (id_usuarioPermiso > 0)
            {
                sql_query = "  SELECT " +
                    " gptu.corrPermisoTipoUsuario, gtu.nombre as nombrePerfil,gmo.nombre as nombreMenu " +
                    " ,gptu.insertar,gptu.acceder,gptu.editar " +
                    " ,gptu.borrar,gptu.aprobar,gptu.rechazar  " +
                    " FROM G_PermisoTipoUsuario gptu " +
                    " join g_tipousuario gtu " +
                    " on gtu.id_tipousuario = gptu.id_tipousuario " +
                    " join g_menu_opcion gmo " +
                    " on gmo.id_opcion = gptu.id_opcion " +
                    " where	gptu.estado = 'A'  "+
                    " AND gptu.id_tipousuario = @id_usuarioPermiso ";
            }
            else
            {
                sql_query = "  SELECT " +
                    " gptu.corrPermisoTipoUsuario, gtu.nombre as nombrePerfil,gmo.nombre as nombreMenu " +
                    " ,gptu.insertar,gptu.acceder,gptu.editar " +
                    " ,gptu.borrar,gptu.aprobar,gptu.rechazar  " +
                    " FROM G_PermisoTipoUsuario gptu " +
                    " join g_tipousuario gtu " +
                    " on gtu.id_tipousuario = gptu.id_tipousuario " +
                    " join g_menu_opcion gmo " +
                    " on gmo.id_opcion = gptu.id_opcion " +
                    " where	gptu.estado = 'A'  ";
            }



            using (SqlConnection cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                try
                {
                    if (id_usuarioPermiso > 0)
                    {
                        command.Parameters.AddWithValue("id_usuarioPermiso", id_usuarioPermiso);
                    }

                    var da = new SqlDataAdapter(command);
                    da.Fill(ds);
                    respuesta = ds;
                }
                catch (Exception)
                {
                    
                    throw;
                }                
            }

            return respuesta;
        }

        public DataSet SelectCombosPermisosPerfiles()
        {
            var respuesta = new DataSet();

            string sql_query = string.Empty;


            using (SqlConnection cn = objConexion.Conectar())
            {
                try
                {
                    
                    sql_query = " SELECT [id_tipousuario] " +
                        " ,[nombre] " +
                        " FROM [SGEODB].[dbo].[G_TipoUsuario] " +
                        " where estado = 'A'; "+
                        " SELECT id_opcion " +
                        " ,nombre " +
                        " FROM G_Menu_Opcion " +
                        " where estado = 'A' " ;

                    var command = new SqlCommand(sql_query, cn);
                    SqlDataAdapter da = new SqlDataAdapter(command);

                    da.Fill(respuesta);

                }
                catch (Exception)
                {
                    
                    throw;
                }
                
            }

            return respuesta;
        }

        public Boolean InsertPermisosPerfiles(CEPermisosPerfiles objCEPermisosPerfiles)
        {
            Boolean respuesta = false;

            string sql_query = string.Empty;

            sql_query = " INSERT INTO G_PermisoTipoUsuario "+
                " ([id_tipousuario],[id_opcion],[insertar] "+
                " ,[acceder],[editar],[borrar],[aprobar] "+
                " ,[rechazar],[fecha_creacion],[fecha_modificacion] "+
                " ,[estado],[id_usuarioAutoriza]) "+
                " VALUES "+
                " (@id_tipousuario,@id_opcion,@insertar "+
                " ,@acceder,@editar,@borrar,@aprobar "+
                " ,@rechazar ,@fecha_creacion "+
                " ,@fecha_modificacion ,@estado "+
                " ,@id_usuarioAutoriza) ";

            using (SqlConnection cn = objConexion.Conectar())
            {
                SqlCommand command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("@id_tipousuario", objCEPermisosPerfiles.ID_TipoUsuario);

                command.Parameters.AddWithValue("@id_opcion", objCEPermisosPerfiles.ID_Opcion);
                command.Parameters.AddWithValue("@insertar", objCEPermisosPerfiles.Insertar);

                command.Parameters.AddWithValue("@acceder", objCEPermisosPerfiles.Acceder);
                command.Parameters.AddWithValue("@editar", objCEPermisosPerfiles.Editar);

                command.Parameters.AddWithValue("@borrar", objCEPermisosPerfiles.Borrar);
                command.Parameters.AddWithValue("@aprobar", objCEPermisosPerfiles.Aprobar);

                command.Parameters.AddWithValue("@rechazar", objCEPermisosPerfiles.Rechazar);
                command.Parameters.AddWithValue("@fecha_creacion", DateTime.Now);

                command.Parameters.AddWithValue("@fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("@estado", 'A');
                command.Parameters.AddWithValue("@id_usuarioAutoriza", objCEPermisosPerfiles.ID_UsuarioAutoriza);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }
    }
}
