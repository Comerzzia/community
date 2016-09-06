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

package com.comerzzia.web.core.informes.applet;


import java.awt.BorderLayout;
import java.net.URL;

import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.plaf.metal.MetalLookAndFeel;

import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.util.JRLoader;

public class EmbeddedViewerApplet extends javax.swing.JApplet{

	private static final long serialVersionUID = -7028456367686968477L;

	private static final boolean DEBUG = true;

	private JasperPrint jasperPrint = null;
    private String url = null;
	private javax.swing.JPanel pnlMain;

	/** Creates new form AppletViewer */
	public EmbeddedViewerApplet(){
		initComponents();
	}


	
	/**
	*
	*/
	public void init(){
        this.url = getParameter("JASPER_PRINT_URL");
		if (url != null){
            try	{
            	debug("Cargando jasperPrint a partir de url " + getCodeBase() +  this.url);
            	jasperPrint = (JasperPrint)JRLoader.loadObject(new URL(getCodeBase(), url));
            	//jasperPrint = (JasperPrint)JRLoader.loadObject(new URL("http://localhost" + url)); //EN DEBUG
				if (jasperPrint != null){
                    debug("Instanciando viewer...");
					JRViewerSimple viewer = new JRViewerSimple(jasperPrint);
					debug("Añadiendo viewer al panel...");
					this.pnlMain.add(viewer, BorderLayout.CENTER);
				}
			}
			catch (Exception e)	{
				e.printStackTrace();
				JOptionPane.showMessageDialog(this, "Se ha producido un error al ejecutar el informe solicitado.");
			}
		}
		else{
			JOptionPane.showMessageDialog(this, "Error de configuración. No se ha especificado url.");
		}
	}


	private void debug(String string) {
		if (DEBUG){
			System.out.println(">>> " + string);
		}
		
	}



	private void initComponents() {
		debug("Inicializando componentes del applet...");
		pnlMain = new javax.swing.JPanel();
		pnlMain.setLayout(new java.awt.BorderLayout());
		getContentPane().add(pnlMain, java.awt.BorderLayout.CENTER);
		
		debug("Estableciendo Look and Feel...");
		try{
		   UIManager.setLookAndFeel(new MetalLookAndFeel());
		}
		catch (Exception ignore){;}

	}
	
	

/*
	     public static void main(String[] args) {// EN DEBUG
	         EmbeddedViewerApplet applet = new EmbeddedViewerApplet();
	         JFrame frame = new JFrame();
	         frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	         frame.getContentPane().add(applet, BorderLayout.CENTER);
	         frame.setTitle("Jasper Report");
	         
	         applet.idInforme = "98";
	         try {
	             // Inicializamos parametros entrada y datos de sesion
	             applet.url = "/WebInformes/jasperPrint";
	             
	             //applet.getRecursos();
	             applet.init();
	         }
	         catch (Exception e) {
	             e.printStackTrace();
	             String mensaje = "Se ha producido un error en la inicializaci�n de la aplicacion.";
                 System.err.println(mensaje);
	         }
	         
	         applet.start();
	         frame.setSize(900, 700);
	         Dimension d = Toolkit.getDefaultToolkit().getScreenSize();
	         Dimension frameSize = frame.getSize();
	         frame.setLocation((d.width - frameSize.width) / 2, (d.height - frameSize.height) / 2);
	         frame.setVisible(true);
	     }
*/
}
