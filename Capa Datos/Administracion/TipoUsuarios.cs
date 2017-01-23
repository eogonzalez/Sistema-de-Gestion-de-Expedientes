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
    public class TipoUsuarios
    {
        General.Conexion objConexion = new General.Conexion();
        

        public DataSet SelectTipoUsuarios()
        {
            DataSet ds_usuarios = new DataSet();
            SqlDataAdapter da_usuarios;

            string sql_query = string.Empty;

            using (SqlConnection cn = objConexion.Conectar())
            {
                sql_query = " SELECT id_tipousuario " +
                    " ,nombre ,descripcion,tipo_permiso " +
                    " ,fecha_creacion " +
                    " FROM G_TipoUsuario " +
                    " where estado = 'A' ";
                try
                {
                    SqlCommand command = new SqlCommand(sql_query, cn);
                    da_usuarios = new SqlDataAdapter(command);

                    da_usuarios.Fill(ds_usuarios);
                }
                catch (Exception)
                {

                    throw;
                }
            }


            return ds_usuarios;
        }

        public Boolean InsertTipoUsuarios(CETipoUsuarios objetoEntidad)
        {
            Boolean respuesta = false;

            string sql_query = string.Empty;

            try
            {
                sql_query = " INSERT INTO [SGEODB].[dbo].[G_TipoUsuario] "+
                    " ([nombre],[descripcion],[tipo_permiso],[fecha_creacion] "+
                    " ,[fecha_modificacion],[estado]) "+
                    " VALUES "+
                    " (@nombre,@descripcion,@tipo_permiso"+
                    " ,@fecha_creacion,@fecha_modificacion"+
                    " ,@estado) ";

                using (SqlConnection cn = objConexion.Conectar())
                {
                    SqlCommand command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("nombre", objetoEntidad.Nombre);
                    command.Parameters.AddWithValue("descripcion", objetoEntidad.Descripcion);
                    command.Parameters.AddWithValue("tipo_permiso", objetoEntidad.TipoPermiso);
                    command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                    command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                    command.Parameters.AddWithValue("estado", "A");

                    cn.Open();
                    if (command.ExecuteNonQuery() > 0)
                    {
                        respuesta = true;
                    }
                    else
                    {
                        respuesta = false;
                    }
                    
                }
            }
            catch (Exception)
            {
                //mensaje("TU001 - Ha ocurrido un error al almacenar tipo de usuario.")

                respuesta = false;
                //                throw;
            }


            return respuesta;
        }
    }
}
