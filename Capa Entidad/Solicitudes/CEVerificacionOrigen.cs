using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_Entidad.Solicitudes
{
    public class CEVerificacionOrigen
    {
        
        #region Datos Primarios

        public DateTime fecha_periodo_inicial { get; set; }
        public DateTime fecha_periodo_final { get; set; }
        public int ID_Tratado { get; set; }

        public int ID_Solicitud { get; set; }
        public int ID_UsuarioSolicita {get;set;}
        public string TipoSolicitud { get; set; }
        public string NombresSolicitante {get;set;}

        public string ApellidosSolicitante {get;set;}

        public string DireccionSolicitante {get;set;}

        public int ID_DepartamentoSolicitante {get;set;}

        public string CorreoSolicitante {get;set;}

        public string TelefonoSolicitante {get;set;}

        public string NombreRazonSocialImportador {get;set;}

        public string DireccionImportador {get;set;}

        public string CorreoImportador {get;set;}

        public int ID_DepartamentoImportador {get;set;}

        public string NITImportador {get;set;}

        public string TelefonoImportador {get;set;}

        public string NombreRazonSocialExportador {get;set;}

        public string DireccionExportador {get;set;}

        public string CorreoExportador {get;set;}

        public int ID_PaisExportador {get;set;}

        public string NITExportador {get;set;}

        public string TelefonoExportador {get;set;}
        
        #endregion

        #region Motivos de solicitud
        public Boolean Motivo_1 { get; set; }
        public Boolean Motivo_2 { get; set; }
        public Boolean Motivo_3 { get; set; }
        public Boolean Motivo_4 { get; set; }
        public Boolean Motivo_5 { get; set; }
        public Boolean Motivo_6 { get; set; }
        public Boolean Motivo_7 { get; set; }
        public Boolean Motivo_8 { get; set; }
        public Boolean Observacion_Check { get; set; }
        public string Observaciones { get; set; }
        public string OtrosMotivos { get; set; }

        #endregion

        #region Ficha de Adjuntos
        public int ID_Anexo { get; set; }
        public Boolean OficioSAT_Check { get; set; }
        public int IDPrefijoSAT { get; set; }
        public string PrefijoSAT { get; set; }
        public int numeroOficioSAT { get;set;}
        public int anioOficioSAT { get; set; }
        public int numeroReferencia { get; set; }
        public int IdRequisito { get; set; }
        public string NombreDocumentoOriginal { get; set; }
        public string NombreDocumentoSistema { get; set; }
        public string Path { get; set; }
        public string ObservacionesAnexo { get; set; }

        #endregion

        #region Ficha de Producto

        public int ID_Regimem_Importacion { get; set; }
        public string Nombre_Regimen_Importacion { get; set; }
        public int IDAduana { get; set; }
        public string Clasificacion_Arancelaria { get;set;}
        public string Descripcion_Comercial { get; set; }
        public string Descripcion_Factura { get; set; }
        public string ObservacionesProducto { get; set; }

        #endregion

        #region Ficha Importadores
        public int ID_Importador { get; set; }
        public string RazonSocial_Ficha_Importador {get;set;}
        public string Correo_Ficha_Importador { get; set; }

        public string Direccion_Ficha_Importador { get; set; }
        public string Nit_Ficha_Importador { get; set; }
        public string Telefono_Ficha_Importador { get; set; }

        #endregion
    }
}
