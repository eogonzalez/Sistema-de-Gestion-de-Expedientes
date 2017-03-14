using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_Datos.Solicitudes;
using System.Data;
using Capa_Entidad.Solicitudes;

namespace Capa_Negocio.Solicitudes
{
    public class CNVerificacionOrigen
    {
        VerificacionOrigen objCDVerificacionOrigen = new VerificacionOrigen();

        public DataTable SelectDatosSolicitante(int idUsuario)
        {
            return objCDVerificacionOrigen.SelectDatosSolicitante(idUsuario);
        }

        public DataTable SelectComboPaises()
        {
            return objCDVerificacionOrigen.SelectComboPaises();
        }

        public DataTable SelectRequisitosVerificacion()
        {
            return objCDVerificacionOrigen.SelectRequisitosVerificacion();
        }

        public DataTable SelectRequisitosOpinion()
        {
            return objCDVerificacionOrigen.SelectRequisitosOpinion();
        }

        public int InsertBorradorSolicitud(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.InsertBorradorSolicitud(objCEVerificacion);
        }

        public Boolean UpdateBorradorSolicitud(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.UpdateBorradorSolicitud(objCEVerificacion);
        }

        public Boolean InsertBorradorMotivos(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.InsertBorradorMotivos(objCEVerificacion);
        }

        public Boolean ExisteMotivo(int id_solicitud)
        {
            return objCDVerificacionOrigen.ExisteMotivo(id_solicitud);
        }

        public Boolean UpdateBorradorMotivos(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.UpdateBorradorMotivos(objCEVerificacion);
        }

        public Boolean InsertDocumentoAnexo(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.InsertDocumentoAnexo(objCEVerificacion);
        }

        public DataTable SelectDocumentosAnexos(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectDocumentosAnexos(id_solicitud);
        }

        public DataTable SelectDatosSolicitudEnc(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectDatosSolicitudEnc(id_solicitud);
        }

        public DataTable SelectMotivos(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectMotivos(id_solicitud);
        }
    }
}
