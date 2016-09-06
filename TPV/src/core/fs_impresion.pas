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

unit fs_impresion;

interface

{$i fs.inc}

uses
  SysUtils, Classes, Dialogs, Forms, fs_iinterpreter, fs_iclassesrtti, XMLIntf,
  XMLDoc, uMensajeDialog, Variants, JvJCLUtils, uInforme, DataMCore;

resourcestring
   STR_ErrorContadorDetalle = 'Revise el archivo de configuración TXT'+#13+#10+'Error en los parametros.'+#13+#10+'Función dametotaldetalle'+#13+#10+'No se ha podido encontrar el nodo ';
   STR_ErrorDetalle = 'Revise el archivo de configuración TXT'+#13+#10+'Error de parametro.'+#13+#10+'Función damedetallenodoxml.'+#13+#10+'No se ha podido encontrar el nodo ';
   STR_ErrorCampo = 'Revise el archivo de configuración TXT'+#13+#10+'No se ha encontrado en el detalle el campo ';

implementation

uses iGeneral, iFuncImpresion;

type
  TFunctions = class(TfsRTTIModule)
  private
     function GetProp(Instance: TObject; ClassType: TClass; const PropName: String): Variant;
     procedure SetProp(Instance: TObject; ClassType: TClass; const PropName: String; Value: Variant);

    function CallMethodImpresion(Instance: TObject; ClassType: TClass;
      const MethodName: String; Caller: TfsMethodHelper): Variant;

    function CallMethodUtilidades(Instance: TObject; ClassType: TClass;
      const MethodName: String; Caller: TfsMethodHelper): Variant;

  public
    constructor Create(AScript: TfsScript); override;
  end;

{ TFunctions }

constructor TFunctions.Create(AScript: TfsScript);
begin
  inherited Create(AScript);

  with AScript do
  begin
      with AddClass(TInforme, '') do
      begin
         AddProperty('TipoCopia', 'string', GetProp, SetProp);
         AddProperty('SalidaInforme', 'string', GetProp, SetProp);

         AddMethod('procedure ImprimeLinea( Texto : String )', CallMethodImpresion);
         AddMethod('procedure Imprimir', CallMethodImpresion);
         AddMethod('function DameNodoXml(Cadena: String): String;', CallMethodImpresion);
         AddMethod('function DameNodoXmlCurr(Cadena: String): Currency;', CallMethodImpresion);
         AddMethod('function DameDetalleNodoXml(NodoPadre, NodoHijo, Campo: String; Linea: Integer) : String', CallMethodImpresion);
         AddMethod('function DameDetalleNodoXmlCurr(NodoPadre, NodoHijo, Campo: String; Linea: Integer) : Currency', CallMethodImpresion);
         AddMethod('function DameNumeroHijos(NodoPadre: String, NodoHijo: String; NodoAContar: String): Integer', CallMethodImpresion);
      end;

      AddMethod('procedure cortarpapel', CallMethodImpresion, 'CMZ-CORE', 'Realiza el Corte de Papel');
      AddMethod('procedure abrircajon', CallMethodImpresion, 'CMZ-CORE', 'Realiza la apertura del cajón');

      AddMethod('function padr(Cadena : String ; nLen: integer) : String', CallMethodUtilidades, 'CMZ-CORE', 'Completa a la derecha con espacios en blancos');
      AddMethod('function padl(Cadena : String ; nLen: integer) : String', CallMethodUtilidades, 'CMZ-CORE', 'Completa a la izquierda con espacios en blancos');
      AddMethod('function rellenaespacios(Cadena : String ; nLen: integer) : String', CallMethodUtilidades, 'CMZ-CORE', 'Rellena con espacios por la izquierda');
      AddMethod('function space(nLen: integer) : String', CallMethodUtilidades, 'CMZ-CORE', 'Inserta espacios en blancos');
      AddMethod('function formateafecha(cadena: String) : String', CallMethodUtilidades, 'CMZ-CORE', 'Devuelve la fecha en formato dd-mm-yyyy la fecha de entrada tiene que estar en formato ''yyyy-mm-dd''T''hh:nn:ss');
      AddMethod('function formateafechahoratef(cadena: String) : String', CallMethodUtilidades, 'CMZ-CORE', 'Devuelve la fecha en formato ddmmyy hhmm la fecha de entrada tiene que estar en formato ''yyyy-mm-dd''T''hh:nn:ss');
      AddMethod('function ReplaceStr(const AText: string; const AFromText: string; const AToText: string): string;', CallMethodUtilidades, 'CMZ-CORE', 'Reemplaza la cadena AFromText por AToText en AText');
      AddMethod('function iRedondeo(valor: extended; decimales: Integer): currency;', CallMethodUtilidades, 'CMZ-CORE', 'Redondea un valor a n decimales');
      AddMethod('function dameCodMedPagPromocion: String;', CallMethodUtilidades, 'CMZ-CORE', 'Devuelve el código del medio de pago para los descuentos promocionales');
  end;
end;


function TFunctions.CallMethodImpresion(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
var
   _TInforme : TInforme;
begin
  if ClassType = TInforme then
  begin
    _TInforme := TInforme(Instance);

    if MethodName = 'IMPRIMELINEA' then
      _TInforme.ImprimeLinea(Caller.Params[0])
    else if MethodName = 'IMPRIMIR' then
       _TInforme.Imprimir
    else if MethodName = 'DAMEDETALLENODOXML' then
       Result := _TInforme.DameDetalleNodoXml(Caller.Params[0],
                                              Caller.Params[1],
                                              Caller.Params[2],
                                              Caller.Params[3])
   else if MethodName = 'DAMENUMEROHIJOS' then
      Result := _TInforme.DameNumeroHijos(Caller.Params[0], Caller.Params[1], Caller.Params[2])
    else if MethodName = 'DAMEDETALLENODOXMLCURR' then
       Result := _TInforme.DameDetalleNodoXmlCurr(Caller.Params[0],
                                                  Caller.Params[1],
                                                  Caller.Params[2],
                                                  Caller.Params[3])
    else if MethodName = 'DAMENODOXML' then
       Result := _TInforme.DameNodoXml(Caller.Params[0])
    else if MethodName = 'DAMENODOXMLCURR' then
       Result := _TInforme.DameNodoXmlCurr(Caller.Params[0]);
  end
  else
  begin
     if MethodName = 'CORTARPAPEL' then
        DMCore.Dispositivos.Impresora.Cortar
     else if MethodName = 'ABRIRCAJON' then
        DMCore.Dispositivos.cajon.Abrir;
  end;
end;

function TFunctions.GetProp(Instance: TObject; ClassType: TClass;
  const PropName: String): Variant;
var
   _TInforme : TInforme;
begin
  if ClassType = TInforme then
  begin
    _TInforme := TInforme(Instance);

    if PropName = 'TIPOCOPIA' then
      Result := _TInforme.TipoCopia
    else if PropName = 'SALIDAINFORME' then
    begin
       if _TInforme.SalidaInforme = siImpresora then
          Result := 'impresora'
       else if _TInforme.SalidaInforme = siPantalla then
          Result := 'pantalla'
       else if _TInforme.SalidaInforme = siFichero then
          Result := 'fichero'
       else Result := '';
    end;
  end;
end;

procedure TFunctions.SetProp(Instance: TObject; ClassType: TClass;
  const PropName: String; Value: Variant);
begin

end;

function TFunctions.CallMethodUtilidades(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
begin
   Result := '';

   if MethodName = 'PADR' then
      Result := ipadr(Caller.Params[0], Caller.Params[1])
   else if MethodName = 'PADL' then
      Result := ipadl(Caller.Params[0], Caller.Params[1])
   else if MethodName = 'RELLENAESPACIOS' then
      Result := iRellenaSpace(Caller.Params[0], Caller.Params[1])
   else if MethodName = 'SPACE' then
      Result := iSpace(Caller.Params[0])
   else if MethodName = 'FORMATEAFECHA' then
      result := FormateaFecha(Caller.Params[0])
   else if MethodName = 'FORMATEAFECHAHORATEF' then
      result := FormateaFechaHoraTEF(Caller.Params[0])
   else if MethodName = 'REPLACESTR' then
      result := ReplaceStr(Caller.Params[0], Caller.Params[1], Caller.Params[2])
   else if MethodName = 'IREDONDEO' then
      result := iRedondeo(Caller.Params[0], Caller.Params[1]) ;
end;

initialization
  fsRTTIModules.Add(TFunctions);

finalization
  if fsRTTIModules <> nil then
    fsRTTIModules.Remove(TFunctions);

end.
