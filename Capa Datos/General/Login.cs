using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capa_Entidad.General;
using System.Data;

namespace Capa_Datos.General
{
    public class Login
    {

        Conexion objConexion = new Conexion();

        /*Funcion para validar correo y password para ingresar al sistema, para usuarios autorizados*/
        public Boolean AutenticarLogin(string correo, string password)
        {
            //Declaracion de variables
            Boolean estado = false;
            string sql_query = string.Empty;
            int count = 0;
            

            //Iniciamos proceso de conexion con db
            using (SqlConnection cn = objConexion.Conectar())
            {
                //Query de consulta usuario autorizado
                sql_query = " SELECT COUNT(*) " +
                    " FROM g_usuarios "+
                    " WHERE correo = @correo AND password = @password AND estado = 'A' ";
                try
                {
                    
                    SqlCommand command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("@correo", correo);
                    
                    //Encriptamos la contrasenia
                    General encript = new General();
                    string hash = encript.EncodePassword(correo + password);

                    command.Parameters.AddWithValue("@password", hash);

                    cn.Open();
                    count = Convert.ToInt32(command.ExecuteScalar());

                }
                catch (Exception e)
                {
                    
                    Console.WriteLine(e.Message);
                }
            }

            if (count == 0)
            {
                estado = false;
            }
            else
            {
                estado = true;
            }

            return estado;
        }

        //Funcion para validar correo en proceso de registro
        public Boolean AutenticarRegistro(string correo)
        {
            //Declaracion de variables
            Boolean estado = false;
            string sql_query = string.Empty;
            int count = 0;


            //Iniciamos proceso de conexion con db
            using (SqlConnection cn = objConexion.Conectar())
            {
                //Query de consulta usuario autorizado
                sql_query = " SELECT COUNT(*) " +
                    " FROM g_usuarios " +
                    " WHERE correo = @correo ";
                try
                {

                    SqlCommand command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("@correo", correo);
                    
                    cn.Open();
                    count = Convert.ToInt32(command.ExecuteScalar());

                }
                catch (Exception e)
                {

                    Console.WriteLine(e.Message);
                }
            }

            if (count == 0)
            {
                estado = false;
            }
            else
            {
                estado = true;
            }

            return estado;
        }

        public Boolean RegistrarUsuario(CEUsuario objCEUsuario)
        {
            //Declaracion de variables
            Boolean estado = true;
            string sql_query = string.Empty;           

            //Iniciamos proceso de conexion con db
            using (SqlConnection cn = objConexion.Conectar())
            {
                //Query para insertar
                sql_query = "INSERT INTO g_usuarios "+
	                " VALUES "+
	                " (@nombres,@apellidos,@cui "+
                    " ,@correo,@password,@fecha_registro,'R') ";

                try
                {

                    SqlCommand command = new SqlCommand(sql_query, cn);

                    command.Parameters.AddWithValue("@nombres", objCEUsuario.CE_Nombres);
                    command.Parameters.AddWithValue("@apellidos", objCEUsuario.CE_Apellidos);

                    command.Parameters.AddWithValue("@cui", objCEUsuario.CE_CUI);
                    command.Parameters.AddWithValue("@correo", objCEUsuario.CE_Correo);
                    command.Parameters.AddWithValue("@fecha_registro", DateTime.Now);
                    

                    //Encriptamos la contrasenia
                    General encript = new General();
                    string hash = encript.EncodePassword(objCEUsuario.CE_Correo + objCEUsuario.CE_Password);

                    command.Parameters.AddWithValue("@password", hash);

                    cn.Open();
                    command.ExecuteScalar();

                }
                catch (Exception e)
                {

                    estado = false;
                }
            }
                       
            return estado;
        }

        public DataSet SelectSolicitudRegistroUsuarios()
        {
            DataSet ds_usuarios = new DataSet();
            SqlDataAdapter da_usuarios;

            string sql_query = string.Empty;

            using (SqlConnection cn = objConexion.Conectar())
            {
                sql_query = " SELECT id_usuario " +
                    " ,nombres ,apellidos ,cui " +
                    " ,correo,fecha_registro " +
                    " FROM g_usuarios " +
                    " where estado = 'R' ";
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

        //Funcion para verificar si el usuario esta autorizado para login
        public Boolean AutorizaLogin(string correo)
        {
            //Declaracion de variables
            Boolean estado = false;
            string sql_query = string.Empty;
            int count = 0;


            //Iniciamos proceso de conexion con db
            using (SqlConnection cn = objConexion.Conectar())
            {
                //Query de consulta usuario autorizado
                sql_query = " SELECT COUNT(*) " +
                    " FROM g_usuarios " +
                    " WHERE correo = @correo and estado = 'A' ";
                try
                {

                    SqlCommand command = new SqlCommand(sql_query, cn);
                    command.Parameters.AddWithValue("@correo", correo);

                    cn.Open();
                    count = Convert.ToInt32(command.ExecuteScalar());

                }
                catch (Exception e)
                {

                    Console.WriteLine(e.Message);
                }
            }

            if (count == 0)
            {
                estado = false;
            }
            else
            {
                estado = true;
            }

            return estado;
        }

        //La funcion seguridad registra en la tabla g_usuarios_seguridad el ultimo acceso del usuario
        public Boolean Seguridad(int id_usuario , DateTime fecha_acceso, string dir_ip)
        {
            Boolean respuesta = false;
            string sql_query = string.Empty;
            int int_identidad = 0;
            
            sql_query = " INSERT INTO g_usuarios_seguridad(id_usuario, fecha_ultimo_acceso, direccion_ip) "+
                " VALUES(@idUsuario,@fechaAcceso,@dirIP) Select SCOPE_IDENTITY() ";

            using(SqlConnection conexion = objConexion.Conectar())
            {
                try 
                {	        
		            
                    SqlCommand command = new SqlCommand(sql_query, conexion);
                    command.Parameters.AddWithValue("idUsuario", id_usuario);
                    command.Parameters.AddWithValue("fechaAcceso", fecha_acceso);
                    command.Parameters.AddWithValue("dirIP", dir_ip);
                    conexion.Open();
                    int_identidad = Convert.ToInt32(command.ExecuteScalar());

                    if (int_identidad > 0)
	                {
	                    respuesta = true;	 
	                }else
	                {
                        respuesta =  false;
	                }
	            }
	            catch (Exception)
	            {
		
                    respuesta = false;
		            //throw;
	            }
	 
	        }

            return respuesta;
        
        }
        
        //Funcion para obtener el id del usuario que hizo login
        public int ConsultaUsuarioId(string correo)
        {
            int respuesta = 0;
            string sql_query = string.Empty;

            sql_query = "  SELECT id_usuario FROM g_usuarios WHERE correo = @correo ";

            using (SqlConnection conexion = objConexion.Conectar())
            {
                try
                {
                    SqlCommand command = new SqlCommand(sql_query, conexion);
                    command.Parameters.AddWithValue("@correo", correo);
                    conexion.Open();
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
