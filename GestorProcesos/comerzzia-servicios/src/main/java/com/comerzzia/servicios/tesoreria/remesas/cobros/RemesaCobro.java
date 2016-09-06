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

package com.comerzzia.servicios.tesoreria.remesas.cobros;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import com.comerzzia.persistencia.core.empresas.EmpresaBean;
import com.comerzzia.persistencia.general.bancos.BancoBean;
import com.comerzzia.persistencia.general.clientes.ClienteBean;
import com.comerzzia.persistencia.tesoreria.cobros.DocumentoCobroBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.RemesaCobroBean;
import com.comerzzia.persistencia.tesoreria.remesas.cobros.conceptos.ConceptoRemesaCobroBean;
import com.comerzzia.servicios.core.empresas.ServicioEmpresas;
import com.comerzzia.servicios.core.sesion.DatosSesionBean;
import com.comerzzia.servicios.general.bancos.ServicioBancos;
import com.comerzzia.servicios.general.clientes.ServicioClientes;
import com.comerzzia.servicios.tesoreria.cobros.ServicioCobros;
import com.comerzzia.servicios.tesoreria.remesas.cobros.conceptos.ServicioConceptosRemesasCobros;
import com.comerzzia.util.base.MantenimientoBean;
import com.comerzzia.util.formateo.Formateo;

public class RemesaCobro extends MantenimientoBean{

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 137838226656447504L;

	private RemesaCobroBean remesaCobro;

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

	public RemesaCobro() {
		RemesaCobroBean remesaCobro = new RemesaCobroBean();
		this.remesaCobro = remesaCobro;
	}
	
	public RemesaCobro(RemesaCobroBean remesaCobro) {
		this.remesaCobro = remesaCobro;
	}

	protected RemesaCobroBean getBean() {
		return remesaCobro;
	}

    public void generarFichero(RemesaCobro remesaCobro, PrintWriter pw, DatosSesionBean datosSesion)throws ExportarRemesaCobroException, RemesaCobroException{
        try {
            // Obtenemos los datos del banco de la remesa
        	BancoBean banco = ServicioBancos.consultar(remesaCobro.getCodBanco(), datosSesion);

        	//Obtenemos la empresa del banco
        	EmpresaBean empresa = ServicioEmpresas.consultar(banco.getCodEmp(), datosSesion);
        	
        	//Insertamos los datos del ordenante
        	if (banco.getCcc() != null && !banco.getCcc().isEmpty() && banco.getCcc().length() == 20){
        		remesaCobro.setCccAbonoOrdenante(banco.getCcc());
        	}
        	else{
        		throw new ExportarRemesaCobroException("Imposible generar el fichero: Es obligatorio que el banco tenga CCC y que tenga 20 dígitos");
        	}
        	
            remesaCobro.setOrdenante(empresa.getDesEmp());
            if(empresa.getCif() != null && !empresa.getCif().isEmpty()){
                remesaCobro.setCifOrdenante(empresa.getCif());
            }
            else{
            	throw new ExportarRemesaCobroException("Imposible generar el fichero: Es obligatorio que la empresa del banco tenga CIF");
            }

            pw.println(construirCabeceraPresentador(remesaCobro));
            pw.println(construirCabeceraOrdenante(remesaCobro));
            
            // obtener documentos y conceptos a escribir en el fichero
            consultarDocumentos(remesaCobro, datosSesion, pw);
            
            // escribir total ordenante y total general
            pw.println(construirTotalOrdenante(remesaCobro));
            pw.println(construirTotalGeneral(remesaCobro));
        }
        catch (ExportarRemesaCobroException e) {
            throw new ExportarRemesaCobroException(e.getMessage(), e);
        }
        catch (Exception e) {
            throw new RemesaCobroException(e.getMessage(), e);
        }
    }

    private static String construirCabeceraPresentador(RemesaCobro remesaCobro) {
        String cabPresentador = "51" + // A1
                                "80" + // A2
                                formateaCampo(remesaCobro.getCifOrdenante(), 9) + // NIF
                                "001" + // SUFIJO
                                formateaFecha(Formateo.formateaFecha(new Date(), "dd/MM/yyyy")) + // FECHA CONFECCION
                                formateaCampo("", 6) + // LIBRE
                                formateaCampo(remesaCobro.getOrdenante(), 40) + // NOMBRE CLIENTE PRESENTADOR
                                formateaCampo("", 20) + // LIBRE
                                getEntidad(remesaCobro.getCccAbonoOrdenante()) + // ENTIDAD RECEPTORA
                                getOficina(remesaCobro.getCccAbonoOrdenante()) + // OFICINA
                                formateaCampo("", 12) + // LIBRE
                                formateaCampo("", 40) + // LIBRE
                                formateaCampo("", 14); // LIBRE
        
        return cabPresentador;
    }

    private static String construirCabeceraOrdenante(RemesaCobro remesaCobro) {
        String cabPresentador = "53" + // A1
                                "80" + // A2
                                formateaCampo(remesaCobro.getCifOrdenante(), 9) + // CIF
                                "001" + // SUFIJO
                                formateaFecha(Formateo.formateaFecha(new Date(), "dd/MM/yyyy")) + // FECHA CONFECCION
                                formateaFecha(Formateo.formateaFecha(remesaCobro.getFechaRemesa(), "dd/MM/yyyy")) + // FECHA DE CARGO
                                formateaCampo(remesaCobro.getOrdenante(), 40) + // NOMBRE CLIENTE PRESENTADOR
                                getEntidad(remesaCobro.getCccAbonoOrdenante()) + // ENTIDAD RECEPTORA
                                getOficina(remesaCobro.getCccAbonoOrdenante()) + // OFICINA
                                getDC(remesaCobro.getCccAbonoOrdenante()) + // DC
                                getNumeroCuenta(remesaCobro.getCccAbonoOrdenante()) + // NUMERO DE CUENTA
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
    
    public static void consultarDocumentos(RemesaCobro remesaCobro, DatosSesionBean datosSesion, PrintWriter pw) throws ExportarRemesaCobroException, RemesaCobroException{
        String individualObligatorio = null;

        try {
        	
        	//Obtenemos la lista de los documentos de cobro de la remesa
        	List<DocumentoCobroBean> lstDocumentos = ServicioCobros.consultarDocumentosRemesa(remesaCobro.getIdRemesa(), datosSesion);

        	//Indicamos el total de domiciliaciones
        	remesaCobro.setTotalDomiciliaciones(lstDocumentos.size());
   
        	for (DocumentoCobroBean documentoCobro : lstDocumentos) {
        		//Obtenemos el cliente ya que vamos a necesitar su CCC
        		ClienteBean cliente = ServicioClientes.consultar(documentoCobro.getCodCliente(), datosSesion);
        		if(cliente.getCcc() == null){
        			throw new ExportarRemesaCobroException("Imposible generar el fichero: El código de cuenta del cliente " + cliente.getCodCli() + " no es correcto.");
        		}
        		
        		//Vamos sumando los importes de cada documento
        		remesaCobro.setSumaImportesOrdenante(documentoCobro.getImporte());

        		individualObligatorio = "56" + // A1
                                        "80" + // A2
                                        formateaCampo(remesaCobro.getCifOrdenante(), 9) + // CIF
                                        "001" + // SUFIJO
                                        formateaCampoNumero(String.valueOf(documentoCobro.getIdCobro()), 12) + // CODIGO DE REFERENCIA
                                        formateaCampo(documentoCobro.getDesCliente(), 40); // NOMBRE DEL TITULAR
							            try {
							                individualObligatorio += getCCC(cliente.getCcc());//NUMERO DE CUENTA
							            }
							            catch(RemesaCobroException e) {
							                throw new ExportarRemesaCobroException("Imposible generar el fichero: El código de cuenta del cliente " + cliente.getCodCli() + " no es correcto.");
							            }
							            individualObligatorio += formateaImporte(String.valueOf(documentoCobro.getImporte()), 10) + // LIBRE
                                        formateaCampo("", 16) + // LIBRE
                                        formateaCampo(documentoCobro.getCodSerie() + "/" + documentoCobro.getIdCobro(), 40) + // PRIMER CAMPO DE CONCEPTO
                                        formateaCampo("", 8); // LIBRE
                
                pw.println(individualObligatorio);
                
                // Recuperamos la lista de conceptos para un documento
                List<ConceptoRemesaCobroBean> lstConceptos = ServicioConceptosRemesasCobros.consultar(documentoCobro.getIdCobro(), datosSesion);
                
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
                remesaCobro.setTotalRegistrosOrdenante(remesaCobro.getTotalRegistrosOrdenante() + registrosFichero);
                remesaCobro.setTotalRegistrosSoporte(remesaCobro.getTotalRegistrosSoporte() + registrosFichero);
                
                int n = 0;
                
                // se escribirá en el fichero 3 conceptos por línea, la i representa el número de línea
                for(int i = 1; i <= registrosFichero; i ++) {                    
                    String opcional = "56" + // A1
                                      "8" + (i) + // A2
                                      formateaCampo(remesaCobro.getCifOrdenante(), 9) + // CIF
                                      "001" + // SUFIJO
                                      formateaCampoNumero(String.valueOf(documentoCobro.getIdCobro()), 12); // CODIGO DE REFERENCIA
                                      
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
        catch (ExportarRemesaCobroException e) {
			throw new ExportarRemesaCobroException(e.getMessage());
		}
        catch (Exception e) {
			throw new RemesaCobroException(e.getMessage());
		}
    }
    
    private static String getCCC(String ccc) throws RemesaCobroException {
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
                throw new RemesaCobroException();
            }
    }

    private static String construirTotalOrdenante(RemesaCobro remesaCobro) {
        String totalOrdenante = "58" + // A1
                                "80" + // A2
                                formateaCampo(remesaCobro.getCifOrdenante(), 9) + // CIF
                                "001" + // SUFIJO
                                formateaCampo("", 12) + // LIBRE
                                formateaCampo("", 40) + // LIBRE
                                formateaCampo("", 20) + // LIBRE
                                formateaImporte(String.valueOf(remesaCobro.getSumaImportesOrdenante()), 10) + // SUMA IMPORTES ORDENANTE
                                formateaCampo("", 6) + // LIBRE
                                formateaCampoNumero(String.valueOf(remesaCobro.getTotalDomiciliaciones()), 10) + // TOTAL DOMICILIACIONES
                                formateaCampoNumero(String.valueOf(remesaCobro.getTotalRegistrosOrdenante() + remesaCobro.getTotalDomiciliaciones() + 2), 10) + // TOTAL REGISTROS
                                formateaCampo("", 20) + // LIBRE
                                formateaCampo("", 18); // LIBRE
        
        return totalOrdenante;
    }

    private static String construirTotalGeneral(RemesaCobro remesaCobro) {
        String totalGeneral = "59" + // A1
                              "80" + // A2
                              formateaCampo(remesaCobro.getCifOrdenante(), 9) + // CIF
                              "001" + // SUFIJO
                              formateaCampo("", 12) + // LIBRE
                              formateaCampo("", 40) + // LIBRE
                              "0001" + // Nº ORDENANTES
                              formateaCampo("", 16) + // LIBRE
                              formateaImporte(String.valueOf(remesaCobro.getSumaImportesOrdenante()), 10) + // SUMA IMPORTES ORDENANTE
                              formateaCampo("", 6) + // LIBRE
                              formateaCampoNumero(String.valueOf(remesaCobro.getTotalDomiciliaciones()), 10) + // TOTAL DOMICILIACIONES
                              formateaCampoNumero(String.valueOf(remesaCobro.getTotalRegistrosSoporte() + remesaCobro.getTotalDomiciliaciones() + 4), 10) + // TOTAL REGISTROS
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

	public void addDocumento(DocumentoCobroBean documento) {
		remesaCobro.addDocumento(documento);
	}

	public String getActivo() {
		return remesaCobro.getActivo();
	}

	public Long getClientes() {
		return remesaCobro.getClientes();
	}

	public String getCodBanco() {
		return remesaCobro.getCodBanco();
	}

	public String getDesBanco() {
		return remesaCobro.getDesBanco();
	}

	public String getDesEstado() {
		return remesaCobro.getDesEstado();
	}

	public Long getDevueltos() {
		return remesaCobro.getDevueltos();
	}

	public List<DocumentoCobroBean> getDocumentos() {
		return remesaCobro.getDocumentos();
	}

	public Long getEfectos() {
		return remesaCobro.getEfectos();
	}

	public Integer getEstado() {
		return remesaCobro.getEstado();
	}

	public int getEstadoBean() {
		return remesaCobro.getEstadoBean();
	}

	public Date getFechaRemesa() {
		return remesaCobro.getFechaRemesa();
	}

	public Long getIdRemesa() {
		return remesaCobro.getIdRemesa();
	}

	public Double getImporte() {
		return remesaCobro.getImporte();
	}

	public boolean isDocumentosCargados() {
		return remesaCobro.isDocumentosCargados();
	}

	public void setActivo(boolean activo) {
		remesaCobro.setActivo(activo);
	}

	public void setActivo(String activo) {
		remesaCobro.setActivo(activo);
	}

	public void setClientes(Long clientes) {
		remesaCobro.setClientes(clientes);
	}

	public void setCodBanco(String codBanco) {
		remesaCobro.setCodBanco(codBanco);
	}

	public void setDesBanco(String desBanco) {
		remesaCobro.setDesBanco(desBanco);
	}

	public void setDesEstado(String desEstado) {
		remesaCobro.setDesEstado(desEstado);
	}

	public void setDevueltos(Long devueltos) {
		remesaCobro.setDevueltos(devueltos);
	}

	public void setDocumentos(List<DocumentoCobroBean> documentos) {
		remesaCobro.setDocumentos(documentos);
	}

	public void setDocumentosCargados(boolean documentosCargados) {
		remesaCobro.setDocumentosCargados(documentosCargados);
	}

	public void setEfectos(Long efectos) {
		remesaCobro.setEfectos(efectos);
	}

	public void setEnEdicion(boolean enEdicion) {
		remesaCobro.setEnEdicion(enEdicion);
	}

	public void setEstado(Integer estado) {
		remesaCobro.setEstado(estado);
	}

	public void setEstadoBean(int estadoBean) {
		remesaCobro.setEstadoBean(estadoBean);
	}

	public void setFechaRemesa(Date fechaRemesa) {
		remesaCobro.setFechaRemesa(fechaRemesa);
	}

	public void setIdRemesa(Long idRemesa) {
		remesaCobro.setIdRemesa(idRemesa);
	}

	public void setImporte(Double importe) {
		remesaCobro.setImporte(importe);
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

	public int getESTADO_PREREMESA() {
		return remesaCobro.getESTADO_PREREMESA();
	}

	public int getESTADO_REMESA() {
		return remesaCobro.getESTADO_REMESA();
	}

	public void setEstadoPreremesa() {
		remesaCobro.setEstadoPreremesa();
	}

	public void setEstadoRemesa() {
		remesaCobro.setEstadoRemesa();
	}

}
