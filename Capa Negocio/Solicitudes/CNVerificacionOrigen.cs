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

        public DataTable SelectDocumentosAnexos(int id_solicitud, string cmd)
        {
            return objCDVerificacionOrigen.SelectDocumentosAnexos(id_solicitud, cmd);
        }

        public DataTable SelectDatosSolicitudEnc(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectDatosSolicitudEnc(id_solicitud);
        }

        public DataTable SelectMotivos(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectMotivos(id_solicitud);
        }

        public Boolean VerificaMotivo(int id_solicitud)
        {
            return objCDVerificacionOrigen.VerificaMotivo(id_solicitud);
        }

        public Boolean ExisteAnexo(int id_solicitud)
        {
            return objCDVerificacionOrigen.ExisteAnexo(id_solicitud);
        }

        public Boolean CumpleAnexoObligatorio(int id_solicitud, string cmd)
        {
            return objCDVerificacionOrigen.CumpleAnexoObligatorio(id_solicitud, cmd);
        }

        public int GeneroExpediente(int id_solicitud)
        {
            return objCDVerificacionOrigen.GeneroExpediente(id_solicitud);
        }

        public DataTable SelectFuncionariosDACE()
        {
            return objCDVerificacionOrigen.SelectFuncionariosDACE();
        }

        public DataTable SelectDatosAnexo(int id_anexo)
        {
            return objCDVerificacionOrigen.SelectDatosAnexo(id_anexo);
        }

        public Boolean UpdateDatosAnexo(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.UpdateDatosAnexo(objCEVerificacion);
        }

        public DataTable SelectComboInstrumentos()
        {
            return objCDVerificacionOrigen.SelectComboInstrumentos();
        }

        public DataTable SelectComboAduanas()
        {
            return objCDVerificacionOrigen.SelectComboAduanas();
        }

        public Boolean ExistenProductos(int id_solicitud)
        {
            return objCDVerificacionOrigen.ExistenProductos(id_solicitud);
        }

        public Boolean InsertBorradorProducto(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.InsertBorradorProducto(objCEVerificacion);
        }

        public Boolean UpdateBorradorProducto(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.UpdateBorradorProducto(objCEVerificacion);
        }

        public DataTable SelectProductos(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectProductos(id_solicitud);
        }

        public DataTable SelectImportadores(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectImportadores(id_solicitud);
        }

        public Boolean InsertImportador(CEVerificacionOrigen objCEVerificacion)
        {
            return objCDVerificacionOrigen.InsertImportador(objCEVerificacion);
        }

        public DataTable SelectImportador(int id_importador)
        {
            return objCDVerificacionOrigen.SelectImportador(id_importador);
        }

        public Boolean DeleteImportador(int id_importador)
        {
            return objCDVerificacionOrigen.DeleteImportador(id_importador);
        }

        public Boolean UpdateImportador(CEVerificacionOrigen objCEImportador)
        {
            return objCDVerificacionOrigen.UpdateImportador(objCEImportador);
        }

        public Boolean ExistenImportadores(int id_solicitud)
        {
            return objCDVerificacionOrigen.ExistenImportadores(id_solicitud);
        }

        public DataTable SelectDatosSolicitudWF(int id_solicitud)
        {
            return objCDVerificacionOrigen.SelectDatosSolicitudWF(id_solicitud);
        }
    }
}
