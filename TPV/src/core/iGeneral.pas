//
// Copyright 2009-2011 RED.ES - Desarrollado por Tier1
//
// Licencia con arreglo a la EUPL, versión 1.1 o -en cuanto
// sean aprobadas por la comisión Europea- versiones
// posteriores de la EUPL (la "Licencia").
// Solo podrá usarse esta obra si se respeta la Licencia.
//
// http://ec.europa.eu/idabc/eupl.html
//
// Salvo cuando lo exija la legislación aplicable o se acuerde
// por escrito, el programa distribuido con arreglo a la
// Licencia se distribuye "TAL CUAL",
// SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO,
// ni expresas ni implícitas.
// Véase la Licencia en el idioma concreto que rige
// los permisos y limitaciones que establece la Licencia.
//

unit iGeneral;

(*******************************************************************************
Unidad de funciones generales usadas por las diferentes aplicaciones.
*******************************************************************************)

interface

uses Windows, Variants, Controls, Forms, DB, SysUtils, Dialogs,
     Classes, Stdctrls, graphics, XMLIntf;

const
   clAmarillo = $0080FFFF;

//Funcion que encripta una clave
function iEncripta(clave: string): string;

//Funcion que evalua la condicion pasada por parametro y devuelve el valor verdadero o falso como resultado
function iif(condicion: boolean; verdadero, falso: variant): variant;

// >>>>> Cadenas <<<<<
function irZero(Cadena: string; Longitud: shortInt): string;
function iStrRem(sString, sSubString: string): string;
function iReplicate(c: char; nLen: integer): string;
function iSpace(nLen: integer): string;
function iPadR(cString: AnsiString; nLen: integer): string;
function iPadL(cString: AnsiString; nLen: integer): string;
function iAtRepl(CadenaBuscar, Cadena, CadenaReemplazar: string): string;
function iRellenaCeros(cadena: string; digitos: integer): string;
function iRellenaSpace(cadena: string; digitos: integer): string;
function iProx(cString: string): string;
function iPadRC(cString: string; nLen: integer; cCar: char): string;
function iLeftStr(cString: string; nLen: integer): string;
function iRightStr(cString: string; nLen: integer): string;
function iEmpty(cString: string): boolean;
function iZero(cString: string; nLen: integer): string;
function iCheckLengthCadena(sString: string; nLenMax: Integer; sNombre: string; Error: Boolean): Boolean;
procedure iDameListaCadenasDelimitadas(Cadena: String; Delimitador: Char; var Resultado: TStringList);


// >>>>> Matemáticas <<<<<
function iRedondeo(valor: extended; decimales: integer): currency; overload;

// >>>>> Red <<<<<
function iDimeUsuarioMicrosoft: string;

// >>>>> Fecha y hora <<<<<
function iMonth(fecha: TDateTime): word;
function iDay(fecha: TDateTime): word;
function iYear(fecha: TDateTime): word;
function iEOM(fecha: TDateTime): TDateTime;
function iBOM(fecha: TDateTime): TDateTime;
function iExtHora(hora: TDateTime): word;
function icMonth(fecha: TDateTime; mascara: string): string;
function idiaJuliano(fecha: TDateTime): integer;
function icDay(fecha: TDateTime; mascara: string): string;
function iXMLDateTime(Cadena: String): TDateTime;

// >>>>> Informes <<<<<

// >>>>>  Ficheros <<<<<
function iborraFicheros(directorio, mascara: string; eliminaDirectorio: boolean): boolean;


// >>>>>  Utiles varios de B.D. <<<<<
procedure iReemplaza( Origen, Destino : TDataSet ; Campo : String );
procedure iReemplazaTodos( Origen, Destino : TDataSet );

procedure iReemplazaSV(Origen, Destino : TDataSet ; Campo : String ; Valor : Variant);
procedure iReemplazaTodosSV( Origen, Destino : TDataSet );

procedure eliminaValidacionesCampos( DataSet : TDataSet );


// >>>>> Funciones de conversión <<<<<<
function iStrToFloatDef(cadena: string; defecto: double): double;

function ivalidaNIF(NIF: string): boolean;
function ivalidaCIF(CIF: string): boolean;

function DameValorNodo( NodoPadre : IXMLNode ; NombreNodo : String ) : String;
function iGetValorRutaXML(XML: IXMLDocument; NodoOrigen: IXMLNode; ruta: String): String;

function DirectorioTemporalWindows : String;
function iCurrToXMLFormat(Value: Currency): String;
function iCurrToXMLFormat4(Value: Currency): String;
function iXMLToCurrFormat(Value: String): Currency;

// >>>>> Funciones misc <<<<<<
function iAbreSiExiste(nombreVentana: string): boolean;
function iCierraSiExiste(nombreVentana: string): boolean;
//Devuelve verdadero si hay ventanas abiertas diferentes a la que recibe por parametro
function iOtrasVentanasAbiertas(Ventana: TForm): boolean;
//Cierra todas las ventanas hijas excepto la que recibe por parametro
function iCerrarOtrasVentanas(Ventana: TForm): boolean;

function iDameMD5(const Value: AnsiString): string;

var
   TeclaEspecial: TShortCut;
   ProcDameFuncion : function(valores: array of variant) : FARPROC; stdcall;

implementation

uses Strutils, JvJCLUtils, JclAnsiStrings, XMLDoc, Wcrypt2;

function DirectorioTemporalWindows : String;
var
   PWindowsDir: array [0..255] of Char;
begin
   GetTempPath(255, PWindowsDir);
   Result := StrPas(PWindowsDir) + '\';
end;

function iCurrToXMLFormat(Value: Currency): String;
begin
   result := AnsiReplaceStr(FormatFloat('######0.00', Value), ',', '.');
end;

function iCurrToXMLFormat4(Value: Currency): String;
begin
   result := AnsiReplaceStr(FormatFloat('######0.0000', Value), ',', '.');
end;

function iXMLToCurrFormat(Value: String): Currency;
begin
   Result := StrToCurrDef(AnsiReplaceStr(Value, '.', SysUtils.DecimalSeparator), 0);
end;

// >>>>> MISC <<<<<

// Parametros:
//    Nombre: string
// Devuelve:
//    Boolean: Si exsite ventana con ese nombre
function iAbreSiExiste(nombreVentana: string): boolean;
var
   ventana: TForm;
begin
   ventana := TForm(Application.FindComponent(nombreVentana));

   if ventana <> nil then
   begin
      result := true;

      ventana.WindowState := wsMaximized;
      ventana.Show;
   end
   else
      result := false;
end;

function iCierraSiExiste(nombreVentana: string): boolean;
var
   ventana: TForm;
begin
   ventana := TForm(Application.FindComponent(nombreVentana));

   if ventana <> nil then
   begin
      result := true;

      ventana.Close;
   end
   else
      result := false;
end;

function iOtrasVentanasAbiertas(Ventana: TForm): boolean;
var
   i: Integer;
begin
   result := False;
   with Application.mainForm do
   begin
      for i := MDIChildCount-1 downto 0 do
      begin
         if MDIChildren[i] <> Ventana then
         begin
            result := True;
            Break;
         end;
      end;
   end;
end;

function iCerrarOtrasVentanas(Ventana: TForm): boolean;
var
   i: Integer;
begin
   with Application.mainForm do
   begin
      for i := MDIChildCount-1 downto 0 do
      begin
         if MDIChildren[i] <> Ventana then
         begin
            MDIChildren[i].Close;
            Application.ProcessMessages;
         end;
      end;
   end;
   Result := True;
end;


// Parametros:
//    Clave: Palabra a encriptar
// Devuelve:
//    String: Clave encriptada
function iEncripta(clave: string): string;
var
   i1, i2: integer;
   lc: integer;
   cc: char;
begin
   if clave = '' then
      result := '****'
   else
   begin
      result := '';
      lc := length(clave);
      i2 := 1;
      for i1 := 1 to 15 do
      begin
         if i2 > lc then i2 := 1;
         if (i1 mod 2) = (lc mod 2) then
            cc := Chr(Ord('0') + (Ord(clave[i2]) * i1) mod 10)
         else
            cc := Chr(Ord('A') + (Ord(clave[i2]) * i1) mod 26);
         result := result + cc;
         inc(i2);
      end;
   end;
end;

// >>>>> Cadenas <<<<<

// Elimina una subcadena de una cadena
// Parametros:
//   cString: cadena
//   cSubString: cadena a eliminar
// Devuelve:
//   String: Resultado de la cadena
function iStrRem(sString, sSubString: string): string;
var
   p: integer;
   cString, cSubString: string;
begin
   cString := sString;
   cSubString := sSubString;
   p := Pos(cSubString, cString);
   while p > 0 do
   begin
      Delete(cString, p, Length(cSubString));
      p := Pos(cSubString, cString);
   end;
   result := cString;
end;

// Replica un caracter x veces
// Parametros:
//    c: caracter a replicar
//    nLen: número de veces
// Devuelve:
//    string: cadena obtenida
function iReplicate(c: char; nLen: integer): string;
var
   cChar: char;
   cAux: string;
begin
   cAux := c;
   cChar := cAux[1];

   result := StringOfChar(cChar, nLen);
end;

// Replica el caracter espacio x veces
// Parametros:
//    nLen: número de veces
// Devuelve:
//     string: cadena de espacios
function iSpace(nLen: integer): string;
begin
   result := StringOfChar(' ', nLen);
end;

// Elimina caracteres por la derecha
// Parametros:
//    cString: cadena original
//    nLen: longitud a devolver
function iPadR(cString: AnsiString; nLen: integer): string;
begin
   Result := StrPadRight(cString, nLen, ' ');
end;

// Elimina caracteres por la izquierda
// Parametros:
//    cString: cadena original
//    nLen: longitud a devolver
function iPadL(cString: AnsiString; nLen: integer): string;
begin
   Result := StrPadLeft(cString, nLen, ' ');
end;

// Reemplaza una subcadena por otra dentro de una cadena
// Parametros:
//    cSubStringA: cadena que se reemplaza
//    cString: cadena maestra
//    cSubStringB: cadena que reemplaza
// Devuelve:
//    string: cadena modificada
function iAtRepl(CadenaBuscar, Cadena, CadenaReemplazar: string): string;
var
   p, maxp: integer;
   cSubStringA, cString, cSubStringB: string;
begin
   cSubStringA := CadenaBuscar;
   cString := Cadena;
   cSubStringB := CadenaReemplazar;

   maxp := -1;
   p := Pos(cSubStringA, cString);
   while (p > 0) and (p > maxp) do
   begin
      Delete(cString, p, Length(cSubStringA));
      maxp := p + Length(cSubStringB);
      Insert(cSubStringB, cString, p);
      p := Pos(cSubStringA, cString);
   end;
   result := cString;
end;

// RellenaCeros debe recibir la cadena completa sin espacios detras o delante
// Parametros:
//    cadena: cadena a rellenar
//    digitos: número de ceros
// Devuelve:
//    string: cadena de resultado
function iRellenaCeros(cadena: string; digitos: integer): string;
var
   iLongitud, iContador: integer;
   sCadenaTemp: String;
begin
   sCadenaTemp := cadena;
   iLongitud := Length(SCadenaTemp);

   for iContador := 1 to (digitos - iLongitud) do
      sCadenaTemp := '0' + sCadenaTemp;

   result := sCadenaTemp;
end;

function iRellenaSpace(cadena: string; digitos: integer): string;
var
   iLongitud, iContador: integer;
   sCadenaTemp: String;
begin
   sCadenaTemp := cadena;
   iLongitud := Length(SCadenaTemp);

   for iContador := 1 to (digitos - iLongitud) do
      sCadenaTemp := ' ' + sCadenaTemp;

   result := sCadenaTemp;
end;

// Suma 1 al ascii del ultimo caracter encontrado
// Parametros:
//    cString: caractar a sumar 1
// Devuleve
//    string: caracter con el 1 sumado
function iProx(cString: string): string;
var
   l: integer;
begin
   l := Length(cString);
   result := Copy(cString,1, l-1) + Chr(Ord(cString[l])+1);
end;

// Rellena una cadena con un caracter dado hasta alcanzar la longitud especificada
// Parametros:
//    cString: cadena origen
//    nLen: longitud que debe alcanzar
//    cCar: caracter a utilizar para alcanzar la longitud deseada
// Devuelve:
//    string: cadena definitiva
function iPadRC(cString: string; nLen: integer; cCar: char): string;
begin
   if (Length(cString) <> nLen) then
      if Length(cString) > nLen then
         result := Copy(cString, 1, nLen)
      else
         result := cString + ireplicate(cCar, nLen-Length(cString))
   else
      result := cString;
end;

// Devuelve los nLen caracteres de la izquierda de una cadena
// Parametros:
//    cString: cadena
//    nLen: número de caracteres
// Devuelve:
//    string: cadena obtenida
function iLeftStr(cString: string; nLen: integer): string;
begin
   if (Length(cString) > nLen) then
      result := Copy(cString, 1, nLen)
   else
      result := cString;
end;

// Devuelve los nLen caracteres de la derecha de una cadena
// Parametros:
//    cString: cadena
//    nLen: número de caracteres
// Devuelve:
//    string: cadena obtenida
function iRightStr(cString: string; nLen: integer): string;
begin
   if (Length(cString) > nLen) then
      result := Copy(cString, 1+(Length(cString)-nLen), nLen)
   else
      result := cString;
end;

// Devuelve si una cadena está o no vacía
// Parametros:
//    cString: cadena a verificar
// Devuelve:
//    boolean: si la cadena está o no vacia
function iEmpty(cString: string): boolean;
begin
   result := Trim(cString) = '';
end;

// Rellena de ceros por la izquierda
// Parametros:
//    cString: cadena a rellenar
//    nLen: longitud a obtener
// Devuelve:
//    string: cadena obtenida
function iZero(cString: string; nLen: integer): string;
begin
   cString := Trim(cString);
   result := iReplicate('0', nLen-Length(cString)) + cString;
end;

// >>>>> Matematicas <<<<<

// Convierte Pesetas a Euros al "cambio"
// Parametros:
//    ptas: importe en pesetas
// Devuelve:
//    currency: importe en Euros
function iEuros(ptas: currency): currency;
const cambio = 166.386;
var
   cambioNormal, soloMilesimas: currency;
begin
   cambioNormal := ptas / cambio;
   soloMilesimas := (cambioNormal * 100) - Trunc(cambioNormal * 100);
   if (soloMilesimas) >= 0.5 then
      result := (ptas + 1) / cambio
   else
      result := (ptas - 1) / cambio;
end;

function iRedondeo(valor: extended; decimales: integer): currency;
var
   cValor : String;
   aux: String;
begin
   //Se modifica para corregir el error de redondeo con determinados tipos de datos
   aux := FloatToStr(valor);
   valor := StrToFloat(aux);

   Result := 0;

   // Si se le envia -1 pone por defecto el configurado
   if (Decimales = -1) then
      Decimales := 2;

   try
      cValor := FloatToStrF(valor, ffFixed, 18, decimales);
      result := StrToCurr(cValor);
   except
   end;
end;

// >>>>> Red <<<<<

// Devuelve el usuario de Microsoft
// Parametros:
// Devuelve:
//    string: Nombre del usuario con se ha conectado a Microsoft.
function iDimeUsuarioMicrosoft: string;
var x: Cardinal;
    UserName: pChar;
begin
   UserName:=StrAlloc(255);
   x := 255;

   GetUserName(UserName, x);

   result := UpperCase(String(UserName));

   StrDispose(UserName);
end;

// Devuelve el nombre de una tabla sin prefijo alguno
// Parametros:
//    tabla: Nombre de la tabla
// Devuelve
//    string: Nombre de la tabla sin prefijo
function iTablaSinPrefijo(tabla: string): string;
var
   punto, lugares: integer;
begin
   punto := Pos('.', tabla);
   try
      StrToInt(Copy(tabla, punto+4, 1));
      lugares := 8;
   except
      lugares := 4;
   end;
   result := Copy(tabla, punto+lugares, Length(tabla));
end;

// >>>>> Fecha y hora <<<<<

// Extrae el mes de la fecha dada.
// Parametros:
//    fecha: Fecha a procesar
// Devuelve:
//    word: Mes de la fecha dada
function iMonth(fecha: TDateTime): word;
var Dia, Mes, Ano: Word;
begin
   DecodeDate( fecha, Ano, Mes, Dia);
   result := Mes;
end;

// Extrae el día de la fecha dada.
// Parametros:
//    fecha: Fecha a procesar
// Devuelve:
//    word: día de la fecha dada
function iDay(fecha: TDateTime): word;
var Dia, Mes, Ano: Word;
begin
   DecodeDate(fecha, Ano, Mes, Dia);
   result := Dia;
end;

// Extrae el año de la fecha dada.
// Parametros:
//    fecha: Fecha a procesar
// Devuelve:
//    word: año de la fecha dada
function iYear(fecha: TDateTime): word;
var Dia, Mes, Ano: Word;
begin
   DecodeDate(fecha, Ano, Mes, Dia);
   result := Ano;
end;

// Obtiene el último día del mes de la fecha dada
// Parametros:
//    fecha: Fecha a procesar
// Devuelve:
//    TDateTime: Fecha con el último día del mes
function iEOM(fecha: TDateTime): TDateTime;
var Dia, Mes, Ano: word;
begin
   DecodeDate(fecha, Ano, Mes, Dia);
   if Mes = 12 then
      result := EncodeDate(Ano, 12, 31)
   else
      result := EncodeDate(Ano, Mes + 1, 1) - 1;
end;

// Obtiene el primer día del mes de la fecha dada
// Parametros:
//    fecha: Fecha a procesar
// Devuelve:
//    TDateTime: Fecha con el primer día del mes
function iBOM(fecha: TDateTime): TDateTime;
var Dia, Mes, Ano: word;
begin
   DecodeDate(fecha, Ano, Mes, Dia);
   result := EncodeDate(Ano, Mes, 1);
end;

// Obtiene la hora de la hora dada
// Parametros:
//    hora: Hora a procesar
// Devuelve:
//    word: hora de la hora dada
function iExtHora(hora: TDateTime): word;
var nHora, nMinuto, nSec, nMSec : Word;
begin
   DecodeTime(hora, nHora, nMinuto, nSec, nMSec);
   Result := nHora;
end;

// Obtiene los minutos de la hora dada
// Parametros:
//    hora: Hora a procesar
// Devuelve:
//    word: minutos de la hora dada
function iExtMinuto(hora: TDateTime): word;
var nHora, nMinuto, nSec, nMSec: word;
begin
   DecodeTime(hora, nHora, nMinuto, nSec, nMSec);
   result := nMinuto;
end;

// Obtiene el mes en formato cadena de la fecha dada
// Parametros:
//    fecha: Fecha a procesar
//    mascara: String -> Xx: Primera mayúscula
//                       XX: Todo mayúscula
//                       xx: Todo minúscula
// Devuelve:
//    string: Nombre del mes de la fecha dada
function icMonth(fecha: TDateTime; mascara: string): string;
const
   meses: array [1..12] of string = ('Enero', 'Febrero', 'Marzo', 'Abril',
                                     'Mayo', 'Junio', 'Julio', 'Agosto',
                                     'Septiembre', 'Octubre', 'Noviembre',
                                     'Diciembre');
begin
   result := meses[integer(iMonth(fecha))];
   if mascara = 'XX' then
      result := UpperCase(result)
   else if mascara = 'xx' then
      result := LowerCase(result);
end;

// Devuelve el día juliano (número de día del año)
// Parametros:
//    fecha: Fecha a procesar
// Devuelve:
//    dia: Número de día del año
function idiaJuliano(fecha: TDateTime): integer;
begin
   result := trunc(fecha - StrToDate('01/01/' + IntToStr(iYear(fecha)))) + 1;
end;

// Obtiene el día en formato cadena de la fecha dada
// Parametros:
//    fecha: Fecha a procesar
//    mascara: String -> Xx: Primera mayúscula
//                       XX: Todo mayúscula
//                       xx: Todo minúscula
// Devuelve:
//    string: Nombre del día de la fecha dada
function icDay(fecha: TDateTime; mascara: string): string;
const
   dias: array [1..7] of string = ('Domingo', 'Lunes', 'Martes', 'Miércoles',
                                   'Jueves', 'Viernes', 'Sábado');
begin
   result := dias[DayOfWeek(fecha)];
   if mascara = 'XX' then
      result := UpperCase(result)
   else if mascara = 'xx' then
      result := LowerCase(result);
end;

// rZero rellena de ceros las cadenas cuando se recibe un "430.1" a una
// longitud en concreto
// Parametros:
//    cadena: cadena a tratar
//    digitos: longitud maxima de la cadena
// Devuelve:
//    string: cadena de resultado
function irZero(Cadena: string; Longitud: shortInt): string;
var
   NumeroCeros, Posicion: Integer;
   CadenaUno, CadenaDos: String;
   x: Integer;
begin
   Posicion := Pos('.', Cadena);
   Result   := Cadena;

   if Posicion = 0 then exit;

   CadenaUno := Copy(Cadena, 1, Posicion -1);
   CadenaDos := Trim( Copy(Cadena, Posicion +1, Longitud) );

   NumeroCeros := Longitud - ( Length(CadenaUno) + Length(CadenaDos) );

   for x := 1 to NumeroCeros do
      CadenaUno := CadenaUno + '0';

   CadenaUno := CadenaUno + CadenaDos;

   Result := CadenaUno;
end;

// >>>>>  Utiles varios de B.D. <<<<<

procedure iReemplaza( Origen, Destino : TDataSet ; Campo : String );
begin
   Destino.FieldByName( Campo ).Value := Origen.FieldByName( Campo ).Value;
end;

procedure iReemplazaSV(Origen, Destino : TDataSet ; Campo : String ; Valor : Variant);
var
   FOnValidate: TFieldNotifyEvent;
   FOnChange: TFieldNotifyEvent;
   FOnSetText: TFieldSetTextEvent;
   CampoReadOnly : Boolean;
begin
   FOnValidate := Destino.FieldByName(Campo).OnValidate;
   FOnChange   := Destino.FieldByName(Campo).OnChange;
   FOnSetText  := Destino.FieldByName(Campo).OnSetText;

   Destino.FieldByName(Campo).OnValidate := nil;
   Destino.FieldByName(Campo).OnChange   := nil;
   Destino.FieldByName(Campo).OnSetText  := nil;

   CampoReadOnly := Destino.FieldByName(Campo).ReadOnly;
   Destino.FieldByName(Campo).ReadOnly := False;

   if Origen = nil then
      Destino.FieldByName(Campo).Value := Valor
   else
      Destino.FieldByName(Campo).Value := Origen.FieldByName(Campo).Value;

   Destino.FieldByName(Campo).OnValidate := FOnValidate;
   Destino.FieldByName(Campo).OnChange   := FOnChange;
   Destino.FieldByName(Campo).OnSetText  := FOnSetText;
   Destino.FieldByName(Campo).ReadOnly   := CampoReadOnly;
end;

procedure iReemplazaTodosSV( Origen, Destino : TDataSet );
var
   x : Integer;
begin
   for x := 0 to Destino.FieldCount -1 do
      if (Destino.Fields[x].FieldKind = fkData) and
         (Origen.FindField( Destino.Fields[x].FieldName ) <> nil) then
         iReemplazaSV( Origen, Destino, Destino.Fields[x].FieldName, null);
end;


procedure iReemplazaTodos( Origen, Destino : TDataSet );
var
   x : Integer;
begin
   for x := 0 to Destino.FieldCount -1 do
      if (Destino.Fields[x].FieldKind = fkData) and
         (Origen.FindField( Destino.Fields[x].FieldName ) <> nil) then
         Destino.Fields[x].Value := Origen.FieldByName( Destino.Fields[x].FieldName ).Value;
end;


procedure eliminaValidacionesCampos( DataSet : TDataSet );
var
   x : Integer;
begin
   // DESACTIVAR EVENTOS DE VALIDACION
   for x := 0 to DataSet.FieldCount -1 do
   begin
      DataSet.Fields[x].OnChange   := nil;
      DataSet.Fields[x].OnSetText  := nil;
      DataSet.Fields[x].OnValidate := nil;
   end;
end;


//****************************************************************

function DameValorNodo( NodoPadre : IXMLNode ; NombreNodo : String ) : String;
var
   NodoTmp : IXMLNode;
begin
   NodoTmp := NodoPadre.ChildNodes.FindNode(NombreNodo);

   if NodoTmp <> nil then
   begin
      if VarIsNull(NodoTmp.NodeValue) then
         Result := ''
      else
         Result := NodoTmp.NodeValue;
   end
   else Result := '';
end;

//****************************************************************


function iif(condicion: boolean; verdadero, falso: variant): variant;
begin
   if condicion then
      result := verdadero
   else
      result := falso;
end;


// Elimina los ficheros que estén contenidos en la máscara especificada y
//   opcionalmente el directorio
// Parámetros:
//   directorio: string. Directorio de archivos
//   máscara: string. Máscara de archivos
//   eliminaDirectorio: boolean. Indica si se borra el directorio
// Devuelve:
//   boolean: Indica si todo fue correcto
function iborraFicheros(directorio, mascara: string; eliminaDirectorio: boolean): boolean;
var
   DirInfo: TSearchRec;
   r : Integer;
begin
   result := true;
   directorio := iAtRepl('\\', directorio + '\', '\');
   r := FindFirst(directorio + mascara, FaAnyfile, DirInfo);
   while r = 0 do
   begin
      if ((DirInfo.Attr and FaDirectory <> FaDirectory)) then
//            (DirInfo.Attr and FaVolumeId <> FaVolumeID)) then
         if DeleteFile(pChar(directorio + DirInfo.Name)) = false then
         begin
            {Si no puede borrar el fichero}
            ShowMessage('Imposible borrar fichero: ' + directorio + DirInfo.Name);
            result := false;
            break;
         end;
         r := FindNext(DirInfo);
   end;
   SysUtils.FindClose(DirInfo);
   if (eliminaDirectorio) and (result) then
   begin
      if RemoveDirectory(PChar(directorio)) = false then
      begin
         {Si no puedes borrar el directorio}
         ShowMessage('Imposible borrar directorio: ' + directorio);
         result := false;
      end;
   end;
end;


// Convierte una cadena en valor de coma flotante pero pudiendo devolver en caso
//    de no poderse convertir un valor por defecto
// Parámetros:
//    cadena: Cadena a convertir
//    valorDefecto: Valor por defecto en caso de no poder convertirse
// Devuelve:
//    double: Valor obtenido
function iStrToFloatDef(cadena: string; defecto: double): double;
begin
   try
      result := StrToFloat(cadena);
   except
      result := defecto;
   end;
end;


// Verifica si un NIF es correcto
// Parámetros:
//    cadena: NIF a verificar
// Devuelve:
//    boolean: Indica si el NIF es correcto o no
function ivalidaNIF(NIF: string): boolean;
begin
   result := iRightStr(NIF, 1) = Copy('TRWAGMYFPDXBNJZSQVHLCKET', StrToIntDef(Copy(NIF, 1, 8), 0) mod 23+1,1)[1];
end;

// Verifica si un CIF es correcto
// Parámetros:
//    cadena: CIF a verificar
// Devuelve:
//    boolean: Indica si el CIF es correcto o no
function ivalidaCIF(CIF: string): boolean;
var
   Suma, Control: integer;
   n: byte;
begin
   {El cif debe ser de 9 cifras}
   if Length(cif)=9 then
   begin
      Suma:= StrToInt(Cif[3])+
             StrToInt(Cif[5])+
             StrToInt(Cif[7]);

      for n := 1 to 4 do
         Suma := Suma + ((2 * StrToInt(cif[2*n])) mod 10) +
                 ((2 * StrToInt(cif[2*n])) div 10);

      Control := 10 - (Suma mod 10);
      if Control = 10 then
         Control := 0;

      if Pos(cif[1], 'XP') <> 0 then   // Control tipo letra
         result := (cif[9] = Chr(64 + Control))
      else  // Control tipo número
         try
            result := (StrToInt(cif[9]) = Control);
         except
            result := false;
         end;
   end
   else
      result := false;
end;

function iCheckLengthCadena(sString: string; nLenMax: Integer; sNombre: string; Error: Boolean): Boolean;
begin
   if Length(sString) > nLenMax then
   begin
      if Error then
         raise Exception.Create('El valor de ' + sNombre + ' (' + sString + ') supera el tamaño máximo permitido ' + '(' + IntToStr(nLenMax) + ') ' )
      else
         result := False;
   end
   else
      result := True;
end;

function iGetValorRutaXML(XML: IXMLDocument; NodoOrigen: IXMLNode; ruta: String): String;
var
   x, wcount: Integer;
   c: String;
   w: String;
   Nodo: IXMLNode;
begin
   result := '';
   if NodoOrigen = nil then
   begin
      //No se puede preguntar por un documento válido en caso de que el objeto venga vacío
      //falla al intentar acceder a sus propiedades
      //si falla se interpreta que esta vacío.
      try
         Nodo := XML.DocumentElement;
      except
         Nodo := nil;
      end;
   end
   else
      Nodo := NodoOrigen;

   if Nodo = nil then
   begin
      result := '';
      Exit;
   end;
   c := ruta;
   wcount := WordCount(c, ['/']);
   for x := 1 to wcount do
   begin
      w := ExtractWord(1, c, ['/']);
      Delete(c, Pos(w, c), Length(w) + 1);

      Nodo := Nodo.ChildNodes.FindNode(w);
      
      if Nodo = nil then
      begin
         result := '';
         Exit;
      end
      else
         if (x = wcount) then
            result := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
   end;
end;

procedure iDameListaCadenasDelimitadas(Cadena: String; Delimitador: Char; var Resultado: TStringList);
var
   substr: String;
   i: Integer;
   lDelimitador: Boolean;
begin
   substr := '';
   lDelimitador := False;
   i := 0;
   if cadena <> '' then
   begin
      while (i <= length(cadena)) do
      begin
         if cadena[i] = Delimitador then
         begin
            lDelimitador := not lDelimitador;
            if substr <> '' then
            begin
               Resultado.Add(substr);
               substr := '';
            end;
         end
         else
            if lDelimitador then
               substr := substr + cadena[i];

          inc(i);
      end;
   end;
end;

function iDameMD5(const Value: AnsiString): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7F] of Byte;
  dwHashLen: dWord;
  i: Integer;
begin
  dwHashLen := 16;

  if (Value = '') then
  begin
    Result := 'd41d8cd98f00b204e9800998ecf8427e';
    exit;
  end
  else
    Result := '';

  {get context for crypt default provider}
  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    {create hash-object MD5}
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      {get hash from password}
      if CryptHashData(hHash, @Value[1], Length(Value), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen-1 do
            Result := Result + IntToHex(bHash[i], 2);
        end;
      end;
      {destroy hash-object}
      CryptDestroyHash(hHash);
    end;
    {release the context for crypt default provider}
    CryptReleaseContext(hCryptProvider, 0);
  end;

  Result := AnsiLowerCase(Result);
end;


function iXMLDateTime(Cadena: String): TDateTime;
var
   Fecha, Hora: TDateTime;
   a, m, d, h, n: Word;
begin
   //la fecha viene en este formato
   //'yyyy-mm-dd''T''hh:nn:ss'

   a := StrToInt(Copy(Cadena, 1, 4));
   m := StrToInt(Copy(Cadena, 6, 2));
   d := StrToInt(Copy(Cadena, 9, 2));
   h := StrToInt(Copy(Cadena, 12, 2));
   n := StrToInt(Copy(Cadena, 15, 2));

   Fecha := EncodeDate(a, m, d);
   Hora := EncodeTime(h, n, 0, 0);

   result := Fecha + Hora;
end;

end.
