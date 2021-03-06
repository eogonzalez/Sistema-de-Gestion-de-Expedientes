﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Capa_Entidad.Administracion;

namespace Capa_Datos.Administracion
{
    public class Departamentos
    {
        General.Conexion objConexion = new General.Conexion();
        public DataTable SelectDepartamentos()
        {
            var dt_respuesta = new DataTable();
            string sql_query = string.Empty;

            sql_query = " SELECT idDepartamento,codigoDepto "+
                " ,nombre ,descripcion,estado "+
                " FROM G_Departamento "+
                " where estado = 'A' ";

            using (var cn = objConexion.Conectar())
            {
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

        public Boolean SaveDepartamento(CEDepartamentos objCEDeptos)
        {
            var respuesta = false;
            string sql_query = string.Empty;

            sql_query = " INSERT INTO G_Departamento "+
                " (codigoDepto,nombre,descripcion,estado "+
                " ,fecha_creacion,fecha_modificacion) "+
                " VALUES "+
                " (@codigoDepto,@nombre "+
                " ,@descripcion,@estado "+
                " ,@fecha_creacion,@fecha_modificacion) ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("codigoDepto", objCEDeptos.CodigoDepto);
                command.Parameters.AddWithValue("nombre", objCEDeptos.Nombre);
                command.Parameters.AddWithValue("descripcion", objCEDeptos.Descripcion);
                command.Parameters.AddWithValue("estado", 'A');
                command.Parameters.AddWithValue("fecha_creacion", DateTime.Now);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }


            return respuesta;
        }

        public DataTable SelectDepartamento(int idDepartamento)
        {
            var sql_query = string.Empty;
            var dt_respuesta = new DataTable();

            sql_query = " SELECT [codigoDepto] "+
                " ,[nombre],[descripcion] "+
                " FROM [SGEODB].[dbo].[G_Departamento] "+
                " where estado = @estado and idDepartamento = @idDepartamento ";

            using (SqlConnection cn = objConexion.Conectar())
            {
                try
                {
                    var command = new SqlCommand(sql_query, cn);

                    command.Parameters.AddWithValue("estado", 'A');
                    command.Parameters.AddWithValue("idDepartamento", idDepartamento);

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

        public Boolean UpdateDepartamento(CEDepartamentos objCEDepartamento)
        {
            var respuesta = false;
            var sql_query = string.Empty;

            sql_query = " UPDATE G_Departamento "+
                " SET [codigoDepto] = @codigoDepto "+
                " ,[nombre] = @nombre ,[descripcion] = @descripcion "+
                " ,[fecha_modificacion] = @fecha_modificacion "+
                " WHERE idDepartamento = @idDepartamento";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("codigoDepto", objCEDepartamento.CodigoDepto);
                command.Parameters.AddWithValue("nombre", objCEDepartamento.Nombre);
                command.Parameters.AddWithValue("descripcion", objCEDepartamento.Descripcion);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);
                command.Parameters.AddWithValue("idDepartamento", objCEDepartamento.ID_Departamento);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }

        public Boolean DeleteDepartamento(int idDepartamento)
        {
            var respuesta = false;

            var sql_query = string.Empty;

            sql_query = " UPDATE G_Departamento "+
                " SET  [estado] = @estado "+
                " ,[fecha_modificacion] = @fecha_modificacion "+
                " WHERE idDepartamento = @idDepartamento ";

            using (var cn = objConexion.Conectar())
            {
                var command = new SqlCommand(sql_query, cn);
                command.Parameters.AddWithValue("estado", "B");
                command.Parameters.AddWithValue("idDepartamento", idDepartamento);
                command.Parameters.AddWithValue("fecha_modificacion", DateTime.Now);

                cn.Open();
                command.ExecuteScalar();
                respuesta = true;
            }

            return respuesta;
        }
    }
}
