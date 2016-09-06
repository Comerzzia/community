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

// Funciones con combos


// Carga en el combo el XML pasado con codigo y descripcion
function loadComboCodDes(objCombo, strXML, blanco) {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = false;
    xmlDoc.loadXML(strXML);

    unloadCombo(objCombo);
            
    if (blanco == true) {
        insertarElementoComboCod(objCombo, "");
    }

    var codigo = "";
    var descripcion = "";
    var objNodeList = xmlDoc.getElementsByTagName("o");

    if (objNodeList.length > 0) {
        for (var i=0; i < objNodeList.length; i++) {
            codigo = objNodeList.item(i).childNodes.item(0).text;
            descripcion = objNodeList.item(i).childNodes.item(1).text;
                    
            insertarElementoComboCodDes(objCombo, codigo, descripcion);
        }
    }
}


// Carga en el combo el XML pasado con codigo
function loadComboCod(objCombo, strXML, blanco) {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = false;
    xmlDoc.loadXML(strXML);

    unloadCombo(objCombo);
            
    if (blanco == true) {
        insertarElementoComboCod(objCombo, "");
    }

    var codigo = "";
    var objNodeList = xmlDoc.getElementsByTagName("o");

    if (objNodeList.length > 0) {
        for (var i=0; i < objNodeList.length; i++) {
            codigo = objNodeList.item(i).childNodes.item(0).text;
                    
            insertarElementoComboCod(objCombo, codigo);
        }
    }
}


// Carga en el combo el XML pasado con codigo, descripcion y valor2
function loadComboCodDesV2(objCombo, strXML, blanco) {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = false;
    xmlDoc.loadXML(strXML);

    unloadCombo(objCombo);
    
    if (blanco == true) {
        insertarElementoComboCod(objCombo, "");
    }

    var codigo = "";
    var descripcion = "";
    var valor2 = "";
    var objNodeList = xmlDoc.getElementsByTagName("o");

    if (objNodeList.length > 0) {
        for (var i=0; i < objNodeList.length; i++) {
            codigo = objNodeList.item(i).childNodes.item(0).text;
            descripcion = objNodeList.item(i).childNodes.item(1).text;
            valor2 = objNodeList.item(i).childNodes.item(2).text;

            insertarElementoEnCombo(objCombo, codigo, descripcion, valor2);
        }
    }
}


// Carga en el combo el XML pasado con codigo y value2 igual a valor2
function loadComboCodV2(objCombo, strXML, blanco) {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = false;
    xmlDoc.loadXML(strXML);

    unloadCombo(objCombo);
            
    if (blanco == true) {
        insertarElementoComboCod(objCombo, "");
    }

    var codigo = "";
    var valor2 = "";
    var objNodeList = xmlDoc.getElementsByTagName("o");

    if (objNodeList.length > 0) {
        for (var i=0; i < objNodeList.length; i++) {
            codigo = objNodeList.item(i).childNodes.item(0).text;
            valor2 = objNodeList.item(i).childNodes.item(1).text;

            insertarElementoComboCodV2(objCombo, codigo, valor2);
        }
    }
}


// Carga en el combo el XML pasado con codigo, value2 y value2
function loadComboCodV2V3(objCombo, strXML, blanco) {
    var xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = false;
    xmlDoc.loadXML(strXML);

    unloadCombo(objCombo);
            
    if (blanco == true) {
        insertarElementoComboCod(objCombo, "");
    }

    var codigo = "";
    var valor2 = "";
    var valor3 = "";
    var objNodeList = xmlDoc.getElementsByTagName("o");

    if (objNodeList.length > 0) {
        for (var i=0; i < objNodeList.length; i++) {
            codigo = objNodeList.item(i).childNodes.item(0).text;
            valor2 = objNodeList.item(i).childNodes.item(1).text;
            valor3 = objNodeList.item(i).childNodes.item(2).text;

            insertarElementoComboCodV2V3(objCombo, codigo, valor2, valor3);
        }
    }
}


function insertarElementoEnCombo(combo, id, descripcion, valor2) {
    var elemento = new Option(descripcion, id, false, false);
    elemento.value2 = valor2;
    combo.options[combo.length] = elemento;
}


// Inserta un nuevo elemento en el combo, con valor codigo
// y elemento descipcion. La descripcion se guarda en value2
function insertarElementoComboCodDes(objCombo, codigo, descripcion) {
    var opcionTmp = null;
    opcionTmp = new Option(descripcion, codigo, false, false);
    opcionTmp.value2 = descripcion;
    objCombo.options[objCombo.length] = opcionTmp;
    opcionTmp = null;
}


// Inserta un nuevo elemento en el combo con valor y descripcion codigo
function insertarElementoComboCod(objCombo, codigo) {
    var opcionTmp = null;
    opcionTmp = new Option(codigo, codigo, false, false);
    objCombo.options[objCombo.length] = opcionTmp;
    opcionTmp = null;
}


// Inserta un nuevo elemento en el combo con valor y descripcion codigo
// y con value2 igual a valor2
function insertarElementoComboCodV2(objCombo, codigo, valor2) {
    var opcionTmp = null;
    opcionTmp = new Option(codigo, codigo, false, false);
    opcionTmp.value2 = valor2;
    objCombo.options[objCombo.length] = opcionTmp;
    opcionTmp = null;
}


// Inserta un nuevo elemento en el combo con valor y descripcion codigo
// y con value2 igual a valor2  value3 igual a valor3
function insertarElementoComboCodV2V3(objCombo, codigo, valor2, valor3) {
    var opcionTmp = null;
    opcionTmp = new Option(codigo, codigo, false, false);
    opcionTmp.value2 = valor2;
    opcionTmp.value3 = valor3;
    objCombo.options[objCombo.length] = opcionTmp;
    opcionTmp = null;
}


// Borrar los elementos existentes en el combo
function unloadCombo(objCombo) {
    for (var i = objCombo.length-1; i>=0; i--){
        objCombo.options[i] = null;
    }
}


// Selecciona en el combo el elemento con valor el codigo pasado
function seleccionaElemento(objCombo, codigo) {        
    for (var i=0; i < objCombo.length; i++) {
        if (objCombo.options[i].value == codigo) {
            objCombo.selectedIndex = i;
            return;
        }
    }
}


// Selecciona en el combo el elemento con descripcion la indicada
function seleccionaElementoPorDescripcion(objCombo, descripcion) {
    for (var i=0; i < objCombo.length; i++) {
        if (objCombo.options[i].text == descripcion) {
            objCombo.selectedIndex = i;
            return;
        }
    }
}


// Carga el combo pasado con los meses, con c�digo el n�mero del mes y 
// descripcion el nombre del mes
function loadComboMeses(objCombo, blanco) {
    if (blanco == true) {
        insertarElementoComboCod(objCombo, "");
    }

    insertarElementoComboCodDes(objCombo, "1", "Enero");
    insertarElementoComboCodDes(objCombo, "2", "Febrero");
    insertarElementoComboCodDes(objCombo, "3", "Marzo");
    insertarElementoComboCodDes(objCombo, "4", "Abril");
    insertarElementoComboCodDes(objCombo, "5", "Mayo");
    insertarElementoComboCodDes(objCombo, "6", "Junio");
    insertarElementoComboCodDes(objCombo, "7", "Julio");
    insertarElementoComboCodDes(objCombo, "8", "Agosto");
    insertarElementoComboCodDes(objCombo, "9", "Septiembre");
    insertarElementoComboCodDes(objCombo, "10", "Octubre");
    insertarElementoComboCodDes(objCombo, "11", "Noviembre");
    insertarElementoComboCodDes(objCombo, "12", "Diciembre");
}


