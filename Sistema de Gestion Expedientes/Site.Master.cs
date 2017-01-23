﻿using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Capa_Negocio.Administracion;


namespace Sistema_de_Gestion_Expedientes
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // El código siguiente ayuda a proteger frente a ataques XSRF
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Utilizar el token Anti-XSRF de la cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generar un nuevo token Anti-XSRF y guardarlo en la cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Establecer token Anti-XSRF
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validar el token Anti-XSRF
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Error de validación del token Anti-XSRF.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UsuarioID"] == null)
                {//Si  la variable de sesion no esta creada
                    Session.Add("UsuarioID", 0);
                }
              
                int idUsuario = (int)Session["UsuarioID"];

                if (idUsuario >= 1)
                {//Si usuario esta logeado
                    //Genero menu con permisos
                    //menuDinamico.Items.Add(new MenuItem("Inicio", "Inicio", "~/"));
                    LlenarMenu(idUsuario);
                }
                else
                {// Genero Menu sin permisos
                    //menuDinamico.Items.Add(new MenuItem("Inicio", "Inicio", "~/"));

                    //var catalogos = new MenuItem("Catalogos") { Selectable = false };
                    //catalogos.ChildItems.Add(new MenuItem("Catalogouno", "CatalogoUNO", "~/"));

                    //menuDinamico.Items.Add(catalogos);


                    //menuDinamico.Items.Add(new MenuItem("Registrarse", "Registrarse", "~/Account/Register"));
                    LlenarMenu();
                }                
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut();
        }

        protected void LlenarMenu(int idUsuario = 0)
        {
            var tbl = new DataTable();
            var objCNMenu = new CNMenu();
            tbl = objCNMenu.MenuPrincipal(idUsuario).Tables[0];

            foreach (DataRow enc in tbl.Rows)
            {
                var Item = new MenuItem();

                if (Convert.ToString(enc["id_padre"]) == null || Convert.ToString(enc["id_padre"]) == string.Empty)
                {
                    Item.Value = Convert.ToString(enc["id_opcion"]);
                    Item.Text = Convert.ToString(enc["nombre"]);
                    Item.ToolTip = Convert.ToString(enc["descripcion"]);
                    Item.NavigateUrl = Convert.ToString(enc["url"]);

                    menuDinamico.Items.Add(Item);

                    //Funcion para llenar submenu
                    LlenarSubMenu(Item, tbl);
                }
            }
        }

        protected void LlenarSubMenu(MenuItem Menu, DataTable Datos)
        {
            foreach (DataRow enc in Datos.Rows)
            {
                var Item = new MenuItem();
                var idPadre = Convert.ToString(enc["id_padre"]);

                //if (idPadre != null || idPadre != string.Empty || idPadre.Length > 0)
                if (idPadre.Length > 0)
                {
                    int menuValue = Convert.ToInt32(Menu.Value);
                    int idPadreInt = Convert.ToInt32(enc["id_padre"]);

                    if (menuValue == idPadreInt)
                    {
                        Item.Value = Convert.ToString(enc["id_opcion"]);
                        Item.Text = Convert.ToString(enc["nombre"]);
                        Item.ToolTip = Convert.ToString(enc["descripcion"]);
                        Item.NavigateUrl = Convert.ToString(enc["url"]);

                        Menu.ChildItems.Add(Item);

                        LlenarSubMenu(Item, Datos);
                    }
                }
            }
        }
    }

}