/**
 * Copyright 2009-2011 RED.ES - Desarrollado por MP Sistemas
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

﻿// Funciones de validacion y formateo

/*
 * Validación de campos de entrada
 *
 *   Tipos de campos:
 *      - "TEXTO"    : Alfanumérico
 *           esObligatorio
 *      - "COMBO"    : Debe seleccionarse un elemento
 *      - "TABLA"    : Tablas de validación. El campo no puede estar vacio
 *           param1 - Descricion del campo para mensaje
 *      - "NxM"      : Dos numeros de la forma NxM
 *           esObligatorio
 *      - "ENTERO"   : Numero entero
 *           esObligatorio
 *           param1 - Valor mánimo que puede alcanzar (inclusive)
 *           param2 - Valor mínimo que puede alcanzar (inclusive)
 *      - "NUMERICO" : Número
 *           esObligatorio
 *           param1 - Número de cifras decimales
 *           param2 - Puede ser negativo o no
 *           param3 - Valor mínimo que puede alcanzar (inclusive)
 *           param4 - Valor máximo que puede alcanzar (inclusive)
 *      - "HORA:MIN" : Hora y minutos
 *           esObligatorio
 *      - "HORA" : Hora
 *           esObligatorio
 *      - "MINUTOS" : Minutos
 *           esObligatorio
 *      - "FECHA" : Fecha
 *           esObligatorio
 *		- "CIFNIF" : CIF o NIF correcto
 *           esObligatorio
 *      - "AYUDA" : Campos de tipo ayuda con código y descripción
 *      	nombreCampo - id campo código
 *      	tipo - AYUDA
 *      	esObligatorio
 *      	param1 - id campo descripción
 *      	param2 - id Ayuda
 *
 */
function esValido(nombreCampo, tipo, esObligatorio, param1, param2, param3, param4) {
	var strAux = "";
    // Validacion de campo obligatorio
	if ((tipo != "RADIO") && (tipo != "CHECK") && (tipo != "COMBO") && (tipo != "TABLA")) {
		if (trim(document.getElementById(nombreCampo).value) == "") {
			if (esObligatorio) {
				alert ("Campo obligatorio. Debe rellenar el valor del campo");
				document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
				return false;
			}
			else {
				return true;
			}
		}	
	}
	
	switch (tipo) {
	    case "TEXTO":  //validacion de cadenas de texto
	    	break;
        
        case "COMBO":
            if (!validarCombo(nombreCampo)) {
                return false;
            }
            break;
            
        case "TABLA":
            if (trim(document.getElementById(nombreCampo).value) == "") {
                if (param1 == undefined) param1 = "el valor del campo";
                alert ("Campo obligatorio. Debe seleccionar " + param1);
                return false;
            }
            break;
            
        case "NxM":
            if (!validarNxM(trim(document.getElementById(nombreCampo).value))) {
                alert("El valor del campo debe ser de la forma NxM");
                document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
                return false;
            }
            break;

        case "ENTERO":
            if (!esNumeros(trim(document.getElementById(nombreCampo).value), param1, param2)) {
                document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
                return false;
            }
            break;
            
        case "NUMERICO":
            if (!esNumerico(trim(document.getElementById(nombreCampo).value), param1,
            		param2, param3, param4)) {
                document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
                return false;
            }
            break;
            
        case "HORA:MIN":
            if (!validarHora(trim(document.getElementById(nombreCampo).value))) {
                alert("El valor del campo debe ser una hora válida (HH:MM)");
                document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
                return false;
            }
            break;
            
        case "HORA":
            if (!esHora(trim(document.getElementById(nombreCampo).value))) {
                alert("El valor del campo debe ser una hora válida");
                document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
                return false;
            }
            break;
            
        case "MINUTOS":
            if (!esMinutos(trim(document.getElementById(nombreCampo).value))) {
                alert("El valor del campo deben ser minutos válidos");
                document.getElementById(nombreCampo).focus();
                document.getElementById(nombreCampo).select();
                return false;
            }
            break;
        
        case "FECHA":
            if (document.getElementById(nombreCampo).value.length > 0) {
                if (!validacionEsFecha(document.getElementById(nombreCampo).value)) {
                    alert("El valor del campo debe ser una fecha válida (DD/MM/AAAA)");
                    document.getElementById(nombreCampo).focus();
                    document.getElementById(nombreCampo).select();
                    return false;
                }
            }
            break;
            
  		 case "NIF":
            if (document.getElementById(nombreCampo).value.length > 0) {
                if (!validacionNif(document.getElementById(nombreCampo).value)) {
                    alert("El valor del campo debe ser un NIF correcto");
                    document.getElementById(nombreCampo).focus();
                    document.getElementById(nombreCampo).select();
                    return false;
                }
            }
            break;
            
  		 case "CIF":
            if (document.getElementById(nombreCampo).value.length > 0) {
                if (!validacionCif(document.getElementById(nombreCampo).value)) {
                    alert("El valor del campo debe ser un CIF correcto");
                    document.getElementById(nombreCampo).focus();
                    document.getElementById(nombreCampo).select();
                    return false;
                }
            }
            break; 	          

  		 case "AYUDA":
            if (!validacionAyuda(nombreCampo, param1, param2)) {
                 document.getElementById(nombreCampo).focus();
                 document.getElementById(nombreCampo).select();
                 return false;
             }
             break; 	          

	    default:    // Tipo no valido
	    	return false;
	}

	return true;
}


function ltrim (s) {
	return s.replace( /^\s*/, "" );
}

function rtrim (s) {
	return s.replace( /\s*$/, "" );
}

function trim (s) {
	return rtrim(ltrim(s));
}


// La cadena debe ser de la forma Numero x Numero
function validarNxM(cadena) {
    var posX = cadena.indexOf("x");
    if ((posX == -1) || (posX == 0) || (posX == (cadena.length-1))) {
        return false;
    }
    
    var valores = cadena.split("x");
    if (!esNumeros(valores[0]) || (!esNumeros(valores[1]))) {
        return false
    }
    
    return true;
}


// Comprueba que la cadena solo contenga numeros
function esNumeros(variable, min, max) {
    var letra = "";
    if (variable == "") {
    	alert("El valor del campo debe ser numérico entero");
        return false;
    }
    for (i=0; i < variable.length; i++) {
        letra = variable.substring(i, i+1);
        if (letra < '0' || letra > '9') {
        	alert("El valor del campo debe ser numérico entero");
            return false;
        }
    }
    
    var numero = desformateaNumero(variable);
    
    //Comprueba que este entre el rango min..max
    if (numero < min) {
      alert("El valor del campo no puede ser menor de "+min+".");
      return false;
    }
    if (numero > max) {
      alert("El valor del campo no puede ser mayor de "+max+".");
      return false;
    }
        
    return true;
}


function validacionEsFecha(cadena) {
    var elDia  = cadena.split('/')[0];
    var elMes  = cadena.split('/')[1]-1;
    var elAnio = cadena.split('/')[2]; 
    
    var ff = new Date(elAnio, elMes, elDia) ;
    
    if (ff.getDate() != elDia) {
        return false;
    }
    if (ff.getMonth() != elMes) {
        return false;
    }
    if (ff.getFullYear() != elAnio) {
        return false;
    }
    if (elAnio.length != 4) {
        return false;
    }
    
    return true; 
}

	
function validacionNif(sCifNif){

	var strLetras = 'TRWAGMYFPDXBNJZSQVHLCKE';
	var Letra;
	sCifNif=sCifNif.toUpperCase();
			
	if(sCifNif.length<9){
		return(false);
	}else{
		Letra=sCifNif.charAt(sCifNif.length-1);
			
		if(Letra<'A' || Letra>'Z')
				return(false);
			else
			 	Letra=strLetras.charAt((sCifNif.substr(0,sCifNif.length-1))%23);
			
			if(sCifNif.charAt(sCifNif.length-1)==Letra)
					return(true);
				else
					return(false);
			}

}

function validacionCif(texto){ 
         
        var pares = 0; 
        var impares = 0; 
        var suma; 
        var ultima; 
        var unumero; 
        var uletra = new Array("J", "A", "B", "C", "D", "E", "F", "G", "H", "I"); 
        var xxx; 
         
        texto = texto.toUpperCase(); 
         
        var regular = new RegExp(/^[ABCDEFGHKLMNPQS]\d\d\d\d\d\d\d[0-9,A-J]$/g); 
         if (!regular.exec(texto)) return false; 
              
         ultima = texto.substr(8,1); 

         for (var cont = 1 ; cont < 7 ; cont ++){ 
             xxx = (2 * parseInt(texto.substr(cont++,1))).toString() + "0"; 
             impares += parseInt(xxx.substr(0,1)) + parseInt(xxx.substr(1,1)); 
             pares += parseInt(texto.substr(cont,1)); 
         } 
         xxx = (2 * parseInt(texto.substr(cont,1))).toString() + "0"; 
         impares += parseInt(xxx.substr(0,1)) + parseInt(xxx.substr(1,1)); 
          
         suma = (pares + impares).toString(); 
         unumero = parseInt(suma.substr(suma.length - 1, 1)); 
         unumero = (10 - unumero).toString(); 
         if(unumero == 10) unumero = 0; 
          
         if ((ultima == unumero) || (ultima == uletra[unumero])) 
             return true; 
         else 
             return false; 

} 
// Valida un campo de tipo ayuda llamando a la validación xml en el caso
// de que la descripción sea vacía y el código no
function validacionAyuda(campoCodigo, campoDescripcion, nombreAyuda){
	if (document.getElementById(campoCodigo).value.length > 0 && document.getElementById(campoDescripcion).value.length == 0){
		return buscarXML(nombreAyuda, campoCodigo, campoDescripcion);
	}
	return true;
}

//Comprueba que la cadena sea un numero decimal con numDecimales como máximo
// y solo puede ser negativo si el parametro negativo es true
function esNumerico(variable, numDecimales, negativo, min, max) {
   var cadena = trim(variable);

   if (cadena.charAt(0) == '-') {
       if (negativo) {
           cadena = cadena.substring(1, cadena.length);
       }
       else {
           alert("El valor del campo no puede ser negativo");
           return false;
       }
   }

       var longitud = cadena.length;

   var letra = "";
   var sepMiles = ".";
   var sepDec = ",";

   if (cadena == "") {
       alert("El valor del campo debe ser numérico");
       return false;
   }

   for (i=0; i < longitud; i++) {
       letra = cadena.substring(i, i+1);
       if (((letra < '0') || (letra > '9')) && (letra != sepMiles) && (letra != sepDec)) {
           alert("El valor del campo debe ser numérico");
           return false;
       }
   }

   		// Comprobamos posición de los separadores
       posSepDec = cadena.indexOf(sepDec);
       // Solo puede existir un punto decimal
       if (posSepDec != cadena.lastIndexOf(sepDec)) {
               alert("El formato del campo no es válido");
               return false;
       }
       // Los puntos de millar deben ir delante del punto decimal
       posSepMiles = cadena.indexOf(sepMiles);
       if ((posSepDec >= 0) && (posSepMiles >= 0) && (posSepDec < posSepMiles)) {
               alert("El formato del campo no es válido");
               return false;
       }

       // Comprueba la posición de los puntos de millar
       if (posSepMiles >= 0) {
               pos1 = posSepMiles;
               pos2 = cadena.indexOf(sepMiles, pos1+1);
               //separadores decimales en posiciones de millares
               while (pos2 >= 0) {
                       if (pos2 - pos1 != 4) {
                               alert("El formato del campo no es válido");
                               return false;
                       }
                       else {
                               pos1 = pos2;
                               pos2 = cadena.indexOf(sepMiles, pos1+1);
                       }
               }
               // primer separador decimal en unidades de millar
               if (posSepDec >= 0) {
                       pos2 = posSepDec;
               }
               else {
                       pos2 = longitud;
               }
               if (pos2 - pos1 != 4) {
                       alert("El formato del campo no es válido");
                       return false;
               }
       }

       // Comprueba el numero de decimales
       if (posSepDec >= 0) {
               numDec = longitud - posSepDec - 1;
               if (numDec > numDecimales) {
                       alert("El campo no puede tener más de " +
                    		   numDecimales + " cifras decimales");
                       return false;
               }
       }

 numero = desformateaNumero(variable);

 //Comprueba que este entre el rango min..max
 if (numero < min) {
   alert("El valor del campo no puede ser menor de "+min+".");
   return false;
 }
 if (numero > max) {
   alert("El valor del campo no puede ser mayor de "+max+".");
   return false;
 }

 return true;
}


// Desformatea un numero devolviendo un numerico javascript
// Devuelve 0 si el resultado no es un numero
// Entrada: 1.234,56  --> Salida: 1234.56
function desformateaNumero(numero) {
   var punto = /[.]/g;
   var coma  = /[,]/g;
   var num = numero.replace(punto, '').replace(coma, '.');

   if (isNaN(num)) {
       num = 0;
   }

   return num;
}

//Formatea un numero con coma decimal y punto en los miles
function formateaNumero(entrada, numDec, defaultValue) {
	if (entrada == ""){
		if (defaultValue != undefined){
			return defaultValue;
		}
	}
	
	// Redondeamos el número a los decimales indicados
	entrada = Math.round((entrada*(Math.pow(10, numDec))))/(Math.pow(10, numDec));
	
    var sepDec = ",";
    var sepMiles = ".";
    
	var cadena = "";
	var strAux = "";
	var signo = "";
	var longitud = 0;
	var posSepDec = 0;
	var posSepMiles = 0;
	var tope = 0;
	var i = 0;
	
	cadena = trim(entrada.toString());  //convertir en cadena de caracteres
	if (cadena == "") {
		return "";
	}
	
	longitud = cadena.length;
	//extraer el signo si lo tiene
	signo = cadena.substring(0,1);
	if ((signo == "+") || (signo == "-")) {
		strAux = cadena.substring(1,longitud);
		cadena = strAux;
	}
	else {
		signo = "";
	}

	//eliminar los ceros por la izquierda
	if (cadena.substring(0,1)=="." || cadena==""){
		cadena=0+cadena;
	}
	longitud = cadena.length;

	//establecer numero de decimales y separador decimal
	posSepDec = cadena.indexOf(".");
	if (posSepDec >= 0) {
		if (numDec > 0) {
			tope = posSepDec+parseInt(numDec,10)+1;
			strAux = cadena.substring(0,tope);
			if (longitud < tope) {
				for (i=0;i<tope-longitud;i++) {
					strAux = strAux + "0";
				}
			}
			cadena = strAux;
			longitud = cadena.length;
			if (sepDec == ",") {
				strAux = cadena.substring(0,posSepDec) + ",";
				strAux = strAux + cadena.substring(posSepDec+1,longitud);
				cadena = strAux;
				longitud = cadena.length;
			}
			posSepDec = cadena.indexOf(sepDec);
		}
		else {
			strAux = cadena.substring(0,posSepDec);
			cadena = strAux;
			longitud = cadena.length;
			posSepDec = -1;
		}
	}
	else {
		if (numDec > 0) {
			strAux = cadena + sepDec;
			for (i=0;i<numDec;i++) {
				strAux = strAux + "0";
			}
			cadena = strAux;
			longitud = cadena.length;
			posSepDec = cadena.indexOf(sepDec);
		}
	}

	//añadir separadores de miles
	if (posSepDec >= 0) {
		posSepMiles = posSepDec - 3;
	}
	else {
		posSepMiles = longitud - 3;
	}
	while (posSepMiles > 0) {
		strAux = cadena.substring(0,posSepMiles) + sepMiles;
		strAux = strAux + cadena.substring(posSepMiles,longitud);
		posSepMiles = posSepMiles - 3;
		cadena = strAux;
		longitud = cadena.length;
	}
	
	//añadir el signo si lo tiene
	if (signo.length > 0) {
		cadena = signo + cadena;
	}
	
	return cadena;
}

function validarFechaMenorIgualQueHoy(fecha){
    var resultado = false;
	var dia0 = fecha.substr(0, 2);  
    var mes0 = fecha.substr(3, 2);  
    var ano0 = fecha.substr(6, 4);  

	//en estas líneas creamos las fechas 
	miFechaActual = new Date(); 
	miFechaPasada = new Date(ano0,mes0 - 1,dia0); 
	
	dia0 = miFechaPasada.getDate();
	mes0 = parseInt(miFechaPasada.getMonth()) + 1;
	ano0 = miFechaPasada.getFullYear(); 

	var dia1 = miFechaActual.getDate();
	var mes1 = parseInt(miFechaActual.getMonth()) + 1; 
	var ano1 = miFechaActual.getFullYear(); 
	
    if (ano0 < ano1){ 
    	resultado = true;
    }  
    else{
	   	 if (ano0 == ano1){  
	   		 if (mes0 < mes1){
	   			 resultado = true;
	   		 }
		   	 else {  
		   		 if (mes0 == mes1){
		   			 if (dia0 <= dia1){
		   				 resultado = true;
		   			 }
		   		 }
		      }  
	   	 }
     }  
	
    return resultado;  
}

function validarHora(hora) {
    var hh = "";
	var mm = "";
	var separador = hora.indexOf(":");
    
    // Si no hay separador
    if (separador == -1) {
		return false;
	}
    
	hh = hora.substring(0, separador);
	mm = hora.substring(separador + 1, hora.length);

    if (!esHora(hh) || !esMinutos(mm)) {
        return false;
    }
    
    return true;
}

function esHora(hora) {
    if (!esNumeros(hora)) {
        return false;
    }
    
    var valor = parseInt(hora, 10);
    if (valor < 0 || valor > 23) {
        return false;
    }
    
    return true;
}


function esMinutos(minutos) {
    if (!esNumeros(minutos)) {
        return false;
    }
    
    var valor = parseInt(minutos, 10);
    if (valor < 0 || valor > 59) {
        return false;
    }
    
    return true;
}

function _validarNumero(variable) {
    var letra = "";
    if (variable == "") {
        return false;
    }
    for (i=0; i < variable.length; i++) {
        letra = variable.substring(i, i+1);
        if (letra < '0' || letra > '9') {
            return false;
        }
    }
    return true;
}

/*Funcion para validar un email*/
function validacionEmail(mail){
	
	var mailres = true;            
	var cadena = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ1234567890@._-";
		    
	var arroba = mail.indexOf("@",0);
		if ((mail.lastIndexOf("@")) != arroba) arroba = -1;
		    
		    var punto = mail.lastIndexOf(".");
		                
		     for (var contador = 0 ; contador < mail.length ; contador++){
		        if (cadena.indexOf(mail.substr(contador, 1),0) == -1){
		            mailres = false;
		            break;
		     	}
		    }
		
		    if ((arroba > 1) && (arroba + 1 < punto) && (punto + 1 < (mail.length)) && (mailres == true) && (mail.indexOf("..",0) == -1))
		     	mailres = true;
		    else
		     	mailres = false;
		                
		    return mailres;
	
}
