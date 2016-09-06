/**
 * Copyright 2009-2014 RED.ES - Desarrollado por TIER1
 * 
 * Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto 
 * sean aprobadas por la comisión Europea- versiones 
 * posteriores de la EUPL (la "Licencia").
 * Solo podrá usarse esta obra si se respeta la Licencia.
 * 
 * http://ec.europa.eu/idabc/eupl.html
 * 
 * Salvo cuando lo exija la legislación aplicable o se acuerde
 * por escrito, el programa distribuido con arreglo a la
 * Licencia se distribuye "TAL CUAL",
 * SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, 
 * ni expresas ni implícitas.
 * Véase la Licencia en el idioma concreto que rige
 * los permisos y limitaciones que establece la Licencia.
 */

package com.comerzzia.servicios.tesoreria.remesas.pagos;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.general.bancos.BancoBean;
import com.comerzzia.persistencia.general.proveedores.ProveedorBean;
import com.comerzzia.persistencia.tesoreria.pagos.DocumentoPagoBean;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.RemesaPagoBean;
import com.comerzzia.persistencia.tesoreria.remesas.pagos.conceptos.ConceptoRemesaPagoBean;
import com.comerzzia.servicios.core.empresas.ServicioEmpresas;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.bancos.ServicioBancos;
import com.comerzzia.servicios.general.proveedores.ServicioProveedores;
import com.comerzzia.servicios.tesoreria.pagos.ServicioPagos;
import com.comerzzia.servicios.tesoreria.remesas.pagos.conceptos.ServicioConceptosRemesasPagos;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.formateo.Formateo;

public class RemesaPago extends MantenimientoBean{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 137838226656447504L;

	private RemesaPagoBean remesaPago;

	/* Atributos necesarios para la exportación de la remesa */
	private String ordenante;
	private String cifOrdenante;
	private String cccAbonoOrdenante;
	private Double sumaImportesOrdenante = 0D;
	private Integer totalDomiciliaciones = 0;
	private Integer totalRegistrosOrdenante = 0;
	private Integer totalRegistrosSoporte = 0;

	protected void initNuevoBean() {
	}

	public RemesaPago() {
		RemesaPagoBean remesaPago = new RemesaPagoBean();
		this.remesaPago = remesaPago;
	}
	
	public RemesaPago(RemesaPagoBean remesaPago) {
		this.remesaPago = remesaPago;
	}

	protected RemesaPagoBean getBean() {
		return remesaPago;
	}

   public void generarFichero(RemesaPago remesaPago, PrintWriter pw, DatosSesionBean datosSesion)throws ExportarRemesaPagoException, RemesaPagoException{
        try {
            // Obtenemos los datos del banco de la remesa
        	BancoBean banco = ServicioBancos.consultar(remesaPago.getCodBanco(), datosSesion);

        	//Obtenemos la empresa del banco
        	EmpresaBean empresa = ServicioEmpresas.consultar(banco.getCodEmp(), datosSesion);
        	
        	//Insertamos los datos del ordenante
        	if (banco.getCcc() != null && !banco.getCcc().isEmpty() && banco.getCcc().length() == 20){
        		remesaPago.setCccAbonoOrdenante(banco.getCcc());
        	}
        	else{
        		throw new ExportarRemesaPagoException("Imposible generar el fichero: Es obligatorio que el banco tenga CCC y que tenga 20 dígitos");
        	}
        	
        	remesaPago.setOrdenante(empresa.getDesEmp());
            if(empresa.getCif() != null && !empresa.getCif().isEmpty()){
            	remesaPago.setCifOrdenante(empresa.getCif());
            }
            else{
            	throw new ExportarRemesaPagoException("Imposible generar el fichero: Es obligatorio que la empresa del banco tenga CIF");
            }

            pw.println(construirCabeceraPresentador(remesaPago));
            pw.println(construirCabeceraOrdenante(remesaPago));
            
            // obtener documentos y conceptos a escribir en el fichero
            consultarDocumentos(remesaPago, datosSesion, pw);
            
            // escribir total ordenante y total general
            pw.println(construirTotalOrdenante(remesaPago));
            pw.println(construirTotalGeneral(remesaPago));
        }
        catch (ExportarRemesaPagoException e) {
            throw new ExportarRemesaPagoException(e.getMessage(), e);
        }
        catch (Exception e) {
            throw new RemesaPagoException(e.getMessage(), e);
        }
    }

    private static String construirCabeceraPresentador(RemesaPago remesaPago) {
        String cabPresentador = "51" + // A1
                                "80" + // A2
                                formateaCampo(remesaPago.getCifOrdenante(), 9) + // NIF
                                "001" + // SUFIJO
                                formateaFecha(Formateo.formateaFecha(new Date(), "dd/MM/yyyy")) + // FECHA CONFECCION
                                formateaCampo("", 6) + // LIBRE
                                formateaCampo(remesaPago.getOrdenante(), 40) + // NOMBRE CLIENTE PRESENTADOR
                                formateaCampo("", 20) + // LIBRE
                                getEntidad(remesaPago.getCccAbonoOrdenante()) + // ENTIDAD RECEPTORA
                                getOficina(remesaPago.getCccAbonoOrdenante()) + // OFICINA
                                formateaCampo("", 12) + // LIBRE
                                formateaCampo("", 40) + // LIBRE
                                formateaCampo("", 14); // LIBRE
        
        return cabPresentador;
    }

    private static String construirCabeceraOrdenante(RemesaPago remesaPago) {
        String cabPresentador = "53" + // A1
                                "80" + // A2
                                formateaCampo(remesaPago.getCifOrdenante(), 9) + // CIF
                                "001" + // SUFIJO
                                formateaFecha(Formateo.formateaFecha(new Date(), "dd/MM/yyyy")) + // FECHA CONFECCION
                                formateaFecha(Formateo.formateaFecha(remesaPago.getFechaRemesa(), "dd/MM/yyyy")) + // FECHA DE CARGO
                                formateaCampo(remesaPago.getOrdenante(), 40) + // NOMBRE CLIENTE PRESENTADOR
                                getEntidad(remesaPago.getCccAbonoOrdenante()) + // ENTIDAD RECEPTORA
                                getOficina(remesaPago.getCccAbonoOrdenante()) + // OFICINA
                                getDC(remesaPago.getCccAbonoOrdenante()) + // DC
                                getNumeroCuenta(remesaPago.getCccAbonoOrdenante()) + // NUMERO DE CUENTA
                                formateaCampo("", 8) + // LIBRE
                                "01" + // PROCEDIMIENTO
                                formateaCampo("", 10) + // LIBRE
                                formateaCampo("", 40) + // LIBRE
                                formateaCampo("", 14); // LIBRE
        
        return cabPresentador;
    }

    private static String getEntidad(String ccc) {
        return ccc.substring(0, 4);
    }
    
    private static String getOficina(String ccc) {
        return ccc.substring(4, 8);
    }

    private static String getDC(String ccc) {
        return ccc.substring(8, 10);
    }
    
    private static String getNumeroCuenta(String ccc) {
        return ccc.substring(10, 20);
    }
    
    public static void consultarDocumentos(RemesaPago remesaPago, DatosSesionBean datosSesion, PrintWriter pw) throws ExportarRemesaPagoException, RemesaPagoException{
        String individualObligatorio = null;

        try {
        	
        	//Obtenemos la lista de los documentos de pago de la remesa
        	List<DocumentoPagoBean> lstDocumentos = ServicioPagos.consultarDocumentosRemesa(remesaPago.getIdRemesa(), datosSesion);

        	//Indicamos el total de domiciliaciones
        	remesaPago.setTotalDomiciliaciones(lstDocumentos.size());
   
        	for (DocumentoPagoBean documentoPago : lstDocumentos) {
        		//Obtenemos el cliente ya que vamos a necesitar su CCC
        		ProveedorBean proveedor = ServicioProveedores.consultar(documentoPago.getCodProveedor(), datosSesion);
        		if(proveedor.getCcc() == null){
        			throw new ExportarRemesaPagoException("Imposible generar el fichero: El código de cuenta del proveedor " + proveedor.getCodPro() + " no es correcto.");
        		}
        		
        		//Vamos sumando los importes de cada documento
        		remesaPago.setSumaImportesOrdenante(documentoPago.getImporte());

        		individualObligatorio = "56" + // A1
                                        "80" + // A2
                                        formateaCampo(remesaPago.getCifOrdenante(), 9) + // CIF
                                        "001" + // SUFIJO
                                        formateaCampoNumero(String.valueOf(documentoPago.getIdPago()), 12) + // CODIGO DE REFERENCIA
                                        formateaCampo(documentoPago.getDesProveedor(), 40); // NOMBRE DEL TITULAR
							            try {
							                individualObligatorio += getCCC(proveedor.getCcc());//NUMERO DE CUENTA
							            }
							            catch(RemesaPagoException e) {
							                throw new ExportarRemesaPagoException("Imposible generar el fichero: El código de cuenta del proveedor " + proveedor.getCodPro() + " no es correcto.");
							            }
							            individualObligatorio += formateaImporte(String.valueOf(documentoPago.getImporte()), 10) + // LIBRE
                                        formateaCampo("", 16) + // LIBRE
                                        formateaCampo(documentoPago.getCodSerie() + "/" + documentoPago.getIdPago(), 40) + // PRIMER CAMPO DE CONCEPTO
                                        formateaCampo("", 8); // LIBRE
                
                pw.println(individualObligatorio);
                
                // Recuperamos la lista de conceptos para un documento
                List<ConceptoRemesaPagoBean> lstConceptos = ServicioConceptosRemesasPagos.consultar(documentoPago.getIdPago(), datosSesion);
                
                int registrosFichero; // Número de registros que se escribirán en el fichero
                
                // Calcular el número de registros que se escribirán en el fichero
                if((lstConceptos.size() % 3) == 0) {
                    registrosFichero = lstConceptos.size() / 3;
                }
                else {
                    registrosFichero = (lstConceptos.size() / 3) + 1;
                }
                
                // El número de registros para los conceptos no puede ser mayor que 5
                if(registrosFichero > 5)
                    registrosFichero = 5;
                
                // Guardar el número de registros del ordenante y del soporte
                remesaPago.setTotalRegistrosOrdenante(remesaPago.getTotalRegistrosOrdenante() + registrosFichero);
                remesaPago.setTotalRegistrosSoporte(remesaPago.getTotalRegistrosSoporte() + registrosFichero);
                
                int n = 0;
                
                // se escribirá en el fichero 3 conceptos por línea, la i representa el número de línea
                for(int i = 1; i <= registrosFichero; i ++) {                    
                    String opcional = "56" + // A1
                                      "8" + (i) + // A2
                                      formateaCampo(remesaPago.getCifOrdenante(), 9) + // CIF
                                      "001" + // SUFIJO
                                      formateaCampoNumero(String.valueOf(documentoPago.getIdPago()), 12); // CODIGO DE REFERENCIA
                                      
                                      // intentar recuperar línea de la lista, si es la ultima línea que se escribe en
                                      // el fichero, es posible que no exista el registro, por tanto se escribirá el espacio
                                      // equivalente vacío
                                      try {
                                          opcional +=  lstConceptos.get(n).getCodSerie() + "/" + lstConceptos.get(n).getNumFactura() + " " + lstConceptos.get(n).getConcepto(); // CONCEPTO 1
                                      }
                                      catch(Exception e) {
                                          opcional += formateaCampo("", 40); // LIBRE
                                      }
                                      try {
                                          opcional +=  lstConceptos.get(n+1).getCodSerie() + "/" + lstConceptos.get(n+1).getNumFactura() + " " + lstConceptos.get(n+1).getConcepto(); // CONCEPTO 2
                                      }
                                      catch(Exception e) {
                                          opcional += formateaCampo("", 40); // LIBRE
                                      }
                                      try {
                                          opcional +=  lstConceptos.get(n+2).getCodSerie() + "/" + lstConceptos.get(n+2).getNumFactura() + " " + lstConceptos.get(n+2).getConcepto(); // CONCEPTO 3
                                      }
                                      catch(Exception e) {
                                          opcional += formateaCampo("", 40); // LIBRE
                                      }
                                      
                                      opcional += formateaCampo("", 14); // LIBRE
                    
                    pw.println(opcional);
                    
                    // Aumentar en tres para leer los próximos 3 registros que se escribirán en la siguiente linea
                    n += 3;
                }
				
			}
        	
        }
        catch (ExportarRemesaPagoException e) {
			throw new ExportarRemesaPagoException(e.getMessage());
		}
        catch (Exception e) {
			throw new RemesaPagoException(e.getMessage());
		}
    }
    
    private static String getCCC(String ccc) throws RemesaPagoException {
        if(ccc.length() == 20)
            return ccc;
        else
            if(ccc.length() < 20) {
                int length = ccc.length();
                for(int i = 0; i < (20 - length); i++)
                    ccc += " ";
              
                return ccc;
            }
            else {
                throw new RemesaPagoException();
            }
    }

    private static String construirTotalOrdenante(RemesaPago remesaPago) {
        String totalOrdenante = "58" + // A1
                                "80" + // A2
                                formateaCampo(remesaPago.getCifOrdenante(), 9) + // CIF
                                "001" + // SUFIJO
                                formateaCampo("", 12) + // LIBRE
                                formateaCampo("", 40) + // LIBRE
                                formateaCampo("", 20) + // LIBRE
                                formateaImporte(String.valueOf(remesaPago.getSumaImportesOrdenante()), 10) + // SUMA IMPORTES ORDENANTE
                                formateaCampo("", 6) + // LIBRE
                                formateaCampoNumero(String.valueOf(remesaPago.getTotalDomiciliaciones()), 10) + // TOTAL DOMICILIACIONES
                                formateaCampoNumero(String.valueOf(remesaPago.getTotalRegistrosOrdenante() + remesaPago.getTotalDomiciliaciones() + 2), 10) + // TOTAL REGISTROS
                                formateaCampo("", 20) + // LIBRE
                                formateaCampo("", 18); // LIBRE
        
        return totalOrdenante;
    }

    private static String construirTotalGeneral(RemesaPago remesaPago) {
        String totalGeneral = "59" + // A1
                              "80" + // A2
                              formateaCampo(remesaPago.getCifOrdenante(), 9) + // CIF
                              "001" + // SUFIJO
                              formateaCampo("", 12) + // LIBRE
                              formateaCampo("", 40) + // LIBRE
                              "0001" + // Nº ORDENANTES
                              formateaCampo("", 16) + // LIBRE
                              formateaImporte(String.valueOf(remesaPago.getSumaImportesOrdenante()), 10) + // SUMA IMPORTES ORDENANTE
                              formateaCampo("", 6) + // LIBRE
                              formateaCampoNumero(String.valueOf(remesaPago.getTotalDomiciliaciones()), 10) + // TOTAL DOMICILIACIONES
                              formateaCampoNumero(String.valueOf(remesaPago.getTotalRegistrosSoporte() + remesaPago.getTotalDomiciliaciones() + 4), 10) + // TOTAL REGISTROS
                              formateaCampo("", 20) + // LIBRE
                              formateaCampo("", 18); // LIBRE
        
        return totalGeneral;
    }

    public static String formateaCampo(String campo, int longitud) {
        if(campo.length() > longitud) {
            campo.substring(longitud);
        }
        
        if(campo.length() < longitud) {
            for(int i = campo.length(); i<longitud; i++) {
                campo += " ";
            }
        }
        
        return campo;
    }

    private static String formateaFecha(String fecha) {        
        StringBuffer fechaAux = new StringBuffer(fecha);
        fechaAux = fechaAux.delete(2, 3);
        fecha = fechaAux.delete(4, 7).toString();
        
        return fecha;
    }

    private static String formateaCampoNumero(String campo, int longitud) {
        for(int i = campo.length(); i<longitud; i++) {
            campo = "0" + campo;
        }
        
        return campo;
    }

    private static String formateaImporte(String campo, int longitud) {
        StringBuffer campoAux = new StringBuffer(campo);
        campoAux.delete(campoAux.length() - 3, campoAux.length() - 2);
        
        while(campoAux.indexOf(".") != -1) {
            campoAux.replace(campoAux.indexOf("."), campoAux.indexOf(".") + 1, "");
        }
        
        return formateaCampoNumero(campoAux.toString(), longitud);
    }

	public void addDocumento(DocumentoPagoBean documento) {
		remesaPago.addDocumento(documento);
	}

	public String getActivo() {
		return remesaPago.getActivo();
	}

	public Long getProveedores() {
		return remesaPago.getProveedores();
	}

	public String getCodBanco() {
		return remesaPago.getCodBanco();
	}

	public String getDesBanco() {
		return remesaPago.getDesBanco();
	}

	public String getDesEstado() {
		return remesaPago.getDesEstado();
	}

	public List<DocumentoPagoBean> getDocumentos() {
		return remesaPago.getDocumentos();
	}

	public Long getEfectos() {
		return remesaPago.getEfectos();
	}

	public Integer getEstado() {
		return remesaPago.getEstado();
	}

	public int getEstadoBean() {
		return remesaPago.getEstadoBean();
	}

	public Date getFechaRemesa() {
		return remesaPago.getFechaRemesa();
	}

	public Long getIdRemesa() {
		return remesaPago.getIdRemesa();
	}

	public Double getImporte() {
		return remesaPago.getImporte();
	}

	public boolean isDocumentosCargados() {
		return remesaPago.isDocumentosCargados();
	}

	public void setProveedores(Long proveedores) {
		remesaPago.setProveedores(proveedores);
	}

	public void setCodBanco(String codBanco) {
		remesaPago.setCodBanco(codBanco);
	}

	public void setDesBanco(String desBanco) {
		remesaPago.setDesBanco(desBanco);
	}

	public void setDocumentos(List<DocumentoPagoBean> documentos) {
		remesaPago.setDocumentos(documentos);
	}

	public void setDocumentosCargados(boolean documentosCargados) {
		remesaPago.setDocumentosCargados(documentosCargados);
	}

	public void setEfectos(Long efectos) {
		remesaPago.setEfectos(efectos);
	}

	public void setEnEdicion(boolean enEdicion) {
		remesaPago.setEnEdicion(enEdicion);
	}

	public void setEstadoBean(int estadoBean) {
		remesaPago.setEstadoBean(estadoBean);
	}

	public void setFechaRemesa(Date fechaRemesa) {
		remesaPago.setFechaRemesa(fechaRemesa);
	}

	public void setIdRemesa(Long idRemesa) {
		remesaPago.setIdRemesa(idRemesa);
	}

	public void setImporte(Double importe) {
		remesaPago.setImporte(importe);
	}

	public String getOrdenante() {
		return ordenante;
	}

	public void setOrdenante(String ordenante) {
		this.ordenante = ordenante;
	}

	
	public String getCccAbonoOrdenante() {
		return cccAbonoOrdenante;
	}

	public void setCccAbonoOrdenante(String cccAbonoOrdenante) {
		this.cccAbonoOrdenante = cccAbonoOrdenante;
	}
	

	public Integer getTotalDomiciliaciones() {
		return totalDomiciliaciones;
	}
	

	public void setTotalDomiciliaciones(Integer totalDomiciliaciones) {
		this.totalDomiciliaciones = totalDomiciliaciones;
	}

	public Integer getTotalRegistrosOrdenante() {
		return totalRegistrosOrdenante;
	}

	public void setTotalRegistrosOrdenante(Integer totalRegistrosOrdenante) {
		this.totalRegistrosOrdenante = totalRegistrosOrdenante;
	}

	public Integer getTotalRegistrosSoporte() {
		return totalRegistrosSoporte;
	}

	public void setTotalRegistrosSoporte(Integer totalRegistrosSoporte) {
		this.totalRegistrosSoporte = totalRegistrosSoporte;
	}
	

	public String getCifOrdenante() {
		return cifOrdenante;
	}

	public void setCifOrdenante(String cifOrdenante) {
		this.cifOrdenante = cifOrdenante;
	}

	
	public Double getSumaImportesOrdenante() {
		return sumaImportesOrdenante;
	}
	
	public void setSumaImportesOrdenante(Double sumaImportesOrdenante) {
		this.sumaImportesOrdenante += sumaImportesOrdenante;
	}

	public String getCodTipoEfecto() {
		return remesaPago.getCodTipoEfecto();
	}

	public String getDesTipoEfecto() {
		return remesaPago.getDesTipoEfecto();
	}

	public void setCodTipoEfecto(String codTipoEfecto) {
		remesaPago.setCodTipoEfecto(codTipoEfecto);
	}

	public void setDesTipoEfecto(String desTipoEfecto) {
		remesaPago.setDesTipoEfecto(desTipoEfecto);
	}

	public Date getFechaGeneracion() {
		return remesaPago.getFechaGeneracion();
	}

	public void setFechaGeneracion(Date fechaGeneracion) {
		remesaPago.setFechaGeneracion(fechaGeneracion);
	}

	public int getESTADO_PREREMESA() {
		return remesaPago.getESTADO_PREREMESA();
	}

	public int getESTADO_REMESA() {
		return remesaPago.getESTADO_REMESA();
	}

	public void setEstadoPreremesa() {
		remesaPago.setEstadoPreremesa();
	}

	public void setEstadoRemesa() {
		remesaPago.setEstadoRemesa();
	}
}
