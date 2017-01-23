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
    public class Menu
    {
        General.Conexion objConexion = new General.Conexion();

        public DataTable SelectMenu(int id_padre = 0)
        {
            string sql_query = string.Empty;
            DataTable dt = new DataTable();

            if (id_padre > 0)
            {
                sql_query = " SELECT [id_opcion] " +
                    " ,[nombre] " +
                    " ,[descripcion] " +
                    " ,[url] " +
                    " ,obligatorio " +
                    " ,visible " +
                    " ,login " +
                    " FROM [g_menu_opcion] " +
                    " where id_padre = @id_padre " +
                    " order by orden ";
            }
            else
            {
                sql_query = " SELECT [id_opcion] " +
                    " ,[nombre] " +
                    " ,[descripcion] " +
                    " ,[url] " +
                    " ,obligatorio " +
                    " ,visible " +
                    " ,login " +
                    " FROM [g_menu_opcion] " +
                    " where id_padre is null " +
                    " order by orden ";
            }

            using (SqlConnection cn = objConexion.Conectar())
            {
                try
                {
                    SqlCommand command = new SqlCommand(sql_query, cn);

                    if (id_padre > 0)
                    {
                        command.Parameters.AddWithValue("id_padre", id_padre);
                    }

                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(dt);
                }
                catch (Exception)
                {
                    
                    //throw ex;
                }
            }

            return dt;
        }

        public Boolean SaveMenu(CEMenu objCEMenu)
        {
            Boolean respuesta = false;
            string sql_query = string.Empty;

            sql_query = " INSERT INTO [g_menu_opcion] " +
                " ([nombre], [descripcion] ";

            if (objCEMenu.Id_Padre == 0)
            {
                sql_query += " , [url], [orden] " +
                    " ,[visible],[obligatorio],[login]) " +
                    " VALUES " +
                    " (@nombre, @descripcion " +
                    " ,@url, @orden " +
                    " ,@visible, @obligatorio, @login) ";
            }
            else
            {
                sql_query += " , [url], [id_padre], [orden] " +
                    " ,[visible],[obligatorio],[login]) " +
                    " VALUES " +
                    " (@nombre, @descripcion " +
                    " ,@url, @id_padre, @orden " +
                    " ,@visible, @obligatorio, @login) ";
            }

            using (SqlConnection cn = objConexion.Conectar())
            {
                SqlCommand command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("nombre", objCEMenu.Nombre);
                command.Parameters.AddWithValue("descripcion", objCEMenu.Descripcion);
                command.Parameters.AddWithValue("url", objCEMenu.URL);

                if (objCEMenu.Id_Padre > 0)
                {
                    command.Parameters.AddWithValue("id_padre", objCEMenu.Id_Padre);
                }

                command.Parameters.AddWithValue("orden", objCEMenu.Orden);
                command.Parameters.AddWithValue("visible", objCEMenu.Visible);
                command.Parameters.AddWithValue("obligatorio", objCEMenu.Obligatorio);
                command.Parameters.AddWithValue("login", objCEMenu.Login);
                
                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }
            return respuesta;
        }

        public DataSet MenuPrincipal(int idUsuario = 0)
        {
            string sql_query = string.Empty;
            var ds = new DataSet();

            try
            {

                if (idUsuario == 0)
                {//Si usuario es anonimo
                    sql_query = " SELECT id_opcion " +
                        " ,nombre ,descripcion " +
                        " ,url ,id_padre " +
                        " FROM dbo.g_menu_opcion " +
                        " where obligatorio = 1 Or visible = 1 and login = 0 " +
                        " order by orden ";
                }
                else
                {//Si usuario esta registrado
                    sql_query = " SELECT id_opcion " +
                        " ,nombre ,descripcion " +
                        " ,url ,id_padre " +
                        " FROM dbo.g_menu_opcion " +
                        " where obligatorio = 1 Or visible = 1 and login = 1 " +
                        " order by orden ";
                }



                using (var cn = objConexion.Conectar())
                {
                    var command = new SqlCommand(sql_query, cn);
                    var da = new SqlDataAdapter(command);
                    da.Fill(ds);
                    cn.Close();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            return ds;
        }
    }
}
