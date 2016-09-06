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

unit uInforme;

interface

uses
   Classes, Variants, Dialogs, uImpresora, XMLIntf, XMLDoc, SysUtils, DataMCore,
   fs_iinterpreter, DataMVariables;

resourcestring
   STR_ErrorContadorDetalle = 'Revise el archivo de configuración TXT'+#13+#10+'Error en los parametros.'+#13+#10+'Función dametotaldetalle'+#13+#10+'No se ha podido encontrar el nodo ';
   STR_ErrorDetalle = 'Revise el archivo de configuración TXT'+#13+#10+'Error de parametro.'+#13+#10+'Función damedetallenodoxml.'+#13+#10+'No se ha podido encontrar el nodo ';
   STR_ErrorCampo = 'Revise el archivo de configuración TXT'+#13+#10+'No se ha encontrado en el detalle el campo ';

type
   TSalidaInforme = (siImpresora, siPantalla, siFichero);

   TInforme = class(TObject)
   private
     FNombreInforme: string;
     FInforme: TStringList;
     FsalidaInforme : TSalidaInforme;
     FTipoCopia: string;
   protected
     Script : TfsScript;
     FXML: IXMLDocument;
   public
     procedure ComponerInforme; virtual;
     procedure LeerXMLOrigen(XML: IXMLDocument);

     procedure Imprimir;

     procedure CargaScript( Fichero : String );
     procedure EjecutaScript;

     procedure ImprimeLinea( Texto : String );
     function DameNodoXml(Cadena: String): String;
     function DameDetalleNodoXml(NodoPadre, NodoHijo, Campo: String; Linea: Integer) : String;
     function DameNodoXmlCurr(Cadena: String): Currency;
     function DameDetalleNodoXmlCurr(NodoPadre, NodoHijo, Campo: String; Linea: Integer) : Currency;
     function DameNumeroHijos(NodoPadre: String; NodoHijo:String; NodoAContar:String): Integer;

     procedure EjecutaFuncionScript(NombreFuncion : String);

     procedure RegistraRuntime; virtual;
     Constructor Create; virtual;
     Destructor Destroy; override;

     property XML: IXMLDocument read FXML;
     property Informe: TStringList read FInforme write FInforme;
     property NombreInforme: string read FNombreInforme write FNombreInforme;
     property SalidaInforme : TSalidaInforme read FSalidaInforme write FSalidaInforme;

     property TipoCopia: String read FTipoCopia write FTipoCopia;
   end;

implementation

uses
   iGeneral, Forms;

(*******************************************************************************
* TInforme                                                                     *
*******************************************************************************)

constructor TInforme.Create;
begin
   inherited Create;
   FXML := TXMLDocument.Create(nil);
   FXML.Active := True;
   FInforme := TStringList.Create;

   Script := TfsScript.Create(nil);

   if (DMVariables.DameVariable('_DESARROLLO.IMPRIMIRAFICHERO', 'N') = 'S') then
      SalidaInforme := siFichero
   else
      SalidaInforme := siImpresora;

   FTipoCopia := 'ORIGINAL';
end;

destructor TInforme.Destroy;
begin
   Script.Free;
   FInforme.Free;

   inherited Destroy;
end;

procedure TInforme.CargaScript( Fichero : String );
begin
   FInforme.Clear;
   
   Script.Clear;
   Script.Parent := fsGlobalUnit;

   RegistraRuntime;

   Script.Lines.LoadFromFile(DMCore.DameRutaRecurso('RPT\' + NombreInforme + '.txt'));

   Script.AddObject('Informe', Self);

   if not Script.Compile then
      Raise Exception.Create(Script.ErrorMsg + chr(13) + chr(10) + Script.ErrorPos);
end;

procedure TInforme.RegistraRuntime;
begin
end;

procedure TInforme.EjecutaScript;
begin
   Script.Execute;
end;

procedure TInforme.EjecutaFuncionScript(NombreFuncion : String);
begin
   Script.CallFunction(NombreFuncion, null);
end;

procedure TInforme.ImprimeLinea( Texto : String );
begin
   FInforme.Add(Texto);
end;

procedure TInforme.ComponerInforme;
begin
end;

procedure TInforme.Imprimir;
begin
   if SalidaInforme = siImpresora then
      DMCore.Dispositivos.Impresora.Imprimir(FInforme.Text)
   else if SalidaInforme = siFichero then
      FInforme.SaveToFile(ExtractFilePath(Application.Exename) + ClassName + '.txt');
//   else if SalidaInforme = siPantalla then
end;

procedure TInforme.LeerXMLOrigen(XML: IXMLDocument);
var
   st: TMemoryStream;
begin
   st := TMemoryStream.Create;
   try
      XML.SaveToStream(st);
      FXML.Active := False;
      FXML.Active := True;
      FXML.LoadFromStream(st, xetUTF_8);
   finally
      st.Free;
   end;
end;

function TInforme.DameNodoXml(Cadena: String): String;
var
   Nodo: IXMLNode;
begin
   Nodo := nil;
   Result := iGetValorRutaXML(FXML, Nodo, Cadena);
end;


function TInforme.DameDetalleNodoXml(NodoPadre, NodoHijo, Campo: String; Linea: Integer) : String;
var
   Nodo, NodoLinea : IXMLNode;
   i : Integer;
begin
   Result := '';
   Nodo := FXML.ChildNodes.FindNode(NodoPadre);

   if Nodo = nil then
      Raise Exception.Create(STR_ErrorDetalle + UpperCase(NodoPadre));

   Nodo := Nodo.ChildNodes.FindNode(NodoHijo);
   if Nodo = nil then
      Raise Exception.Create(STR_ErrorDetalle + UpperCase(NodoHijo));

   for i := 0 to Nodo.ChildNodes.Count - 1 do
   begin
      NodoLinea := Nodo.ChildNodes.Nodes[i];

      if NodoLinea = nil then
         Raise Exception.Create(STR_ErrorDetalle + UpperCase(NodoPadre));

      if i = Linea then
      begin
         NodoLinea := NodoLinea.ChildNodes.FindNode(Campo);
         if NodoLinea = nil then
            Raise Exception.Create(STR_ErrorCampo + UpperCase(Campo));

         Result := NodoLinea.Text;
         Break;
      end
   end;
end;

function TInforme.DameNumeroHijos(NodoPadre: String; NodoHijo:String; NodoAContar:String): Integer;
var
   Nodo: IXMLNode;
begin
   Nodo := FXML.ChildNodes.FindNode(NodoPadre);
   if Nodo = nil then
      Raise Exception.Create(STR_ErrorContadorDetalle + UpperCase(NodoPadre));

   Nodo := Nodo.ChildNodes.FindNode(NodoHijo);

   if Nodo = nil then
      Raise Exception.Create(STR_ErrorContadorDetalle + UpperCase(NodoHijo))
   else
   begin
      if NodoAContar = '' then
         Result := Nodo.ChildNodes.Count
      else
      begin
         Result := 0;
         Nodo := Nodo.ChildNodes.First;

         while nodo <> nil do
         begin
            if nodo.NodeName = NodoAContar then
               Result := Result +1;
            nodo := nodo.NextSibling;
         end;
      end;
   end;
end;

function TInforme.DameDetalleNodoXmlCurr(NodoPadre, NodoHijo, Campo: String; Linea: Integer) : Currency;
begin
   Result := iXMLToCurrFormat(DameDetalleNodoXml(NodoPadre, NodoHijo, Campo,  Linea));
end;

function TInforme.DameNodoXmlCurr(Cadena: String): Currency;
begin
   Result := iXMLToCurrFormat(DameNodoXML(Cadena));
end;


end.
