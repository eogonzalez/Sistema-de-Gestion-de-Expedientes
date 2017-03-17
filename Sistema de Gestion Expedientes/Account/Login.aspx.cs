using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Sistema_de_Gestion_Expedientes.Models;
using Capa_Negocio.General;
using System.Web.Security;
using System.Data;

namespace Sistema_de_Gestion_Expedientes.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register";
            //OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
            //var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //if (!String.IsNullOrEmpty(returnUrl))
            //{
            //    RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            //}
        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (IsValid)
            {                
                //// Validar la contraseña del usuario
                //var manager = new UserManager();
                //ApplicationUser user = manager.Find(txtCorreo.Text, Password.Text);
                //if (user != null)
                //{
                    //IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                //}
                //else
                //{
                //    FailureText.Text = "Invalid username or password.";
                //    ErrorMessage.Visible = true;
                //}
                string strCorreo = string.Empty;
                string strContraseña = string.Empty;
                CNLogin cnLogin = new CNLogin();

                strCorreo = txtCorreo.Text;
                strContraseña = Password.Text;

                if (cnLogin.AutorizaLogin(strCorreo))
                {//Si el usuario esta autorizado
                    if (cnLogin.AutenticarLogin(strCorreo, strContraseña))
                    {//Si las credenciales son correctas
                        int idUsuario = cnLogin.ConsultaUsuarioId(strCorreo);
                        
                        //Se almacena cuando el usuario ingresa al sistema
                        cnLogin.Seguridad(idUsuario, DateTime.Now, Convert.ToString(Request.ServerVariables["REMOTE_ADDR"]));

                        //Obtengo datos de usuario para variables de session
                        var tbl = new DataTable();
                        tbl = cnLogin.SelectDatosUsuario(idUsuario);
                        DataRow row = tbl.Rows[0];

                        Session["UsuarioID"] = idUsuario;
                        //Session.Add("CorreoUsuarioLogin", txtCorreo.Text);
                        Session.Add("CorreoUsuarioLogin", row["correo"].ToString());
                        Session.Add("NombresUsuarioLogin", row["nombres"].ToString());
                        Session.Add("ApellidosUsuarioLogin", row["apellidos"].ToString());


                        FormsAuthentication.RedirectFromLoginPage(strCorreo, RememberMe.Checked);                        
                    }
                    else
                    {//Si las credenciales son incorrectas
                        FailureText.Text = "Usuario o contraseña incorrecta.";
                        ErrorMessage.Visible = true;
                    }
                }
                else
                {//Si el usuario no esta autorizado o no existe
                    FailureText.Text = "Usuario no existe o aun no esta autorizado para ingresar.";
                    ErrorMessage.Visible = true;
                }


            }
        }
    }
}