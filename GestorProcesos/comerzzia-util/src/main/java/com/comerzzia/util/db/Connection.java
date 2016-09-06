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

package com.comerzzia.util.db;

import java.sql.Array;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.DatabaseMetaData;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Struct;

import java.util.Map;
import java.util.Properties;


/**
 * Implementación del interfaz Connection
 * Añade funciones iniciaTransaccion() y finalizaTransaccion()
 */
public class Connection implements java.sql.Connection {

    protected java.sql.Connection conn;

    public Connection() {
	}

    // ****** Functiones propias ****** //
    
    public void iniciaTransaccion() throws SQLException {
        setAutoCommit(false);
    }
    
    public void finalizaTransaccion() throws SQLException {
        setAutoCommit(true);
    }
    
    public void deshacerTransaccion() {
    	try {
    		if (conn != null){
    			rollback();
    		}
    	}
    	catch (Exception e) {
    	}
    }
    
    public void abrirConexion(java.sql.Connection conn){
    	this.conn = conn;
    }

    public void cerrarConexion() {
    	try {
    		if (conn != null){
    			close();
    		}
    	}
    	catch (Exception e) {
    	}
    }
    
    public Connection(java.sql.Connection conn) {
        this.conn = conn;
    }
    

	protected java.sql.Connection getConnection() {
        return conn;
    }
    
    // **** Fin Functiones propias **** //
    
    
    /********************************************************************************/
	/* implement Connection
	/********************************************************************************/
	@Override
	public void clearWarnings() throws SQLException {
		conn.clearWarnings();
	}

	@Override
	public void close() throws SQLException {
		conn.close();
	}

	@Override
	public void commit() throws SQLException {
		conn.commit();
	}

	@Override
	public Array createArrayOf(String s, Object[] aobj) throws SQLException {
		return conn.createArrayOf(s, aobj);
	}

	@Override
	public Blob createBlob() throws SQLException {
		return conn.createBlob();
	}

	@Override
	public Clob createClob() throws SQLException {
		return conn.createClob();
	}

	@Override
	public NClob createNClob() throws SQLException {
		return conn.createNClob();
	}

	@Override
	public SQLXML createSQLXML() throws SQLException {
		return conn.createSQLXML();
	}

	@Override
	public Statement createStatement() throws SQLException {
		return conn.createStatement();
	}

	@Override
	public Statement createStatement(int i, int j) throws SQLException {
		return conn.createStatement(i, j);
	}

	@Override
	public Statement createStatement(int i, int j, int k) throws SQLException {
		return conn.createStatement(i, j, k);
	}

	@Override
	public Struct createStruct(String s, Object[] aobj) throws SQLException {
		return conn.createStruct(s, aobj);
	}

	@Override
	public boolean getAutoCommit() throws SQLException {
		return conn.getAutoCommit();
	}

	@Override
	public String getCatalog() throws SQLException {
		return conn.getCatalog();
	}

	@Override
	public Properties getClientInfo() throws SQLException {
		return conn.getClientInfo();
	}

	@Override
	public String getClientInfo(String s) throws SQLException {
		return conn.getClientInfo(s);
	}

	@Override
	public int getHoldability() throws SQLException {
		return conn.getHoldability();
	}

	@Override
	public DatabaseMetaData getMetaData() throws SQLException {
		return conn.getMetaData();
	}

	@Override
	public int getTransactionIsolation() throws SQLException {
		return conn.getTransactionIsolation();
	}

	@Override
	public Map<String, Class<?>> getTypeMap() throws SQLException {
		return conn.getTypeMap();
	}

	@Override
	public SQLWarning getWarnings() throws SQLException {
		return conn.getWarnings();
	}

	@Override
	public boolean isClosed() throws SQLException {
		return conn.isClosed();
	}

	@Override
	public boolean isReadOnly() throws SQLException {
		return conn.isReadOnly();
	}

	@Override
	public boolean isValid(int i) throws SQLException {
		return conn.isValid(i);
	}

	@Override
	public String nativeSQL(String s) throws SQLException {
		return conn.nativeSQL(s);
	}

	@Override
	public CallableStatement prepareCall(String s) throws SQLException {
		return conn.prepareCall(s);
	}

	@Override
	public CallableStatement prepareCall(String s, int i, int j) throws SQLException {
		return conn.prepareCall(s, i, j);
	}

	@Override
	public CallableStatement prepareCall(String s, int i, int j, int k) throws SQLException {
		return conn.prepareCall(s, i, j, k);
	}

	@Override
	public PreparedStatement prepareStatement(String s) throws SQLException {
		return conn.prepareStatement(s);
	}

	@Override
	public PreparedStatement prepareStatement(String s, int i) throws SQLException {
		return conn.prepareStatement(s, i);
	}

	@Override
	public PreparedStatement prepareStatement(String s, int[] ai) throws SQLException {
		return conn.prepareStatement(s, ai);
	}

	@Override
	public PreparedStatement prepareStatement(String s, String[] as) throws SQLException {
		return conn.prepareStatement(s, as);
	}

	@Override
	public PreparedStatement prepareStatement(String s, int i, int j) throws SQLException {
		return conn.prepareStatement(s, i, j);
	}

	@Override
	public PreparedStatement prepareStatement(String s, int i, int j, int k) throws SQLException {
		return conn.prepareStatement(s, i, j, k);
	}

	@Override
	public void releaseSavepoint(Savepoint savepoint) throws SQLException {
		conn.releaseSavepoint(savepoint);
	}

	@Override
	public void rollback() throws SQLException {
		conn.rollback();
	}

	@Override
	public void rollback(Savepoint savepoint) throws SQLException {
		conn.rollback(savepoint);
	}

	@Override
	public void setAutoCommit(boolean flag) throws SQLException {
		conn.setAutoCommit(flag);
	}

	@Override
	public void setCatalog(String s) throws SQLException {
		conn.setCatalog(s);
	}

	@Override
	public void setClientInfo(Properties properties) throws SQLClientInfoException {
		conn.setClientInfo(properties);
	}

	@Override
	public void setClientInfo(String s, String s1)
			throws SQLClientInfoException {
		conn.setClientInfo(s, s1);
	}

	@Override
	public void setHoldability(int i) throws SQLException {
		conn.setHoldability(i);
	}

	@Override
	public void setReadOnly(boolean flag) throws SQLException {
		conn.setReadOnly(flag);
	}

	@Override
	public Savepoint setSavepoint() throws SQLException {
		return conn.setSavepoint();
	}

	@Override
	public Savepoint setSavepoint(String s) throws SQLException {
		return conn.setSavepoint(s);
	}

	@Override
	public void setTransactionIsolation(int i) throws SQLException {
		conn.setTransactionIsolation(i);
	}

	@Override
	public void setTypeMap(Map<String, Class<?>> map) throws SQLException {
		conn.setTypeMap(map);
	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		return conn.isWrapperFor(iface);
	}

	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		return conn.unwrap(iface);
	}
}
