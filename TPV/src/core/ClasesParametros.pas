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

unit ClasesParametros;

interface

uses
  SysUtils, Classes, XMLDoc, XMLIntf, variants;

type
  TMpsParametros = class(TObject)
     FListaPersis : TStringList;
     FListaNormal : TStringList;
  private
     function DameValor( Lista : TStringList ; Parametro : String ) : String;
  public
    procedure LimpiaParametros;

    procedure CargaParametrosXML( Documento : IXMLDocument ; NodoOrigen : IXMLNode ; Persistentes : Boolean);

    function DameValorParametro( Parametro : String ) : String;

    procedure ReemplazaParametro(Parametro, NuevoValor : String);    
    function DameValorParametroNormal( Parametro : String ) : String;
    function DameValorParametroPersis( Parametro : String ) : String;

    procedure NuevoParametro(Parametro, Valor : String ; Persistente : Boolean ); overload;
    procedure NuevoParametro(Parametro, Valor : String ; Persistente, ReemplazarSiExiste : Boolean ); overload;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

constructor TMpsParametros.Create;
begin
   FListaPersis := TStringList.Create;
   FListaPersis.Sorted := True;
   FListaPersis.Duplicates := dupError;

   FListaNormal := TStringList.Create;
   FListaNormal.Sorted := True;
   FListaNormal.Duplicates := dupError;
end;

destructor TMpsParametros.Destroy;
begin
   FListaPersis.Free;
   FListaNormal.Free;

   inherited Destroy;
end;

procedure TMpsParametros.LimpiaParametros;
begin
// LOS PERSISTENTES NO SE LIMPIAN
//   FListaPersis.Clear;
   FListaNormal.Clear;
end;

function TMpsParametros.DameValor( Lista : TStringList ; Parametro : String ) : String;
var
   Indice : Integer;
   Cadena : String;
begin
   Indice := Lista.IndexOfName(Parametro);

   if Indice > -1 then
   begin
      Cadena := Lista[Indice];

      result := Copy(Cadena, Pos('=', Cadena) +1, Length(Cadena));
   end
   else Result := '';
end;

function TMpsParametros.DameValorParametro( Parametro : String ) : String;
var
   Resultado : String;
begin
   Resultado := DameValorParametroNormal(Parametro);

   if Resultado = '' then Resultado := DameValorParametroPersis(Parametro);

   Result := Resultado;
end;

function TMpsParametros.DameValorParametroNormal( Parametro : String ) : String;
begin
   Result := DameValor(FListaNormal, Parametro);
end;

function TMpsParametros.DameValorParametroPersis( Parametro : String ) : String;
begin
   Result := DameValor(FListaPersis, Parametro);
end;

procedure TMpsParametros.NuevoParametro(Parametro, Valor : String ; Persistente : Boolean );
begin
   NuevoParametro(Parametro, Valor, Persistente, True);
end;

procedure TMpsParametros.ReemplazaParametro(Parametro, NuevoValor : String);
var
   Indice : Integer;
begin
   Indice := FListaPersis.IndexOfName(Parametro);

   if Indice > -1 then
   begin
      FListaPersis.Delete(Indice);
      FListaPersis.Add(Parametro + '=' + NuevoValor);
   end;

   Indice := FListaNormal.IndexOfName(Parametro);

   if Indice > -1 then
   begin
      FListaNormal.Delete(Indice);
      FListaNormal.Add(Parametro + '=' + NuevoValor);
   end;
end;

procedure TMpsParametros.NuevoParametro(Parametro, Valor : String ; Persistente, ReemplazarSiExiste : Boolean );
var
   Lista : TStringList;
begin
   Parametro := UpperCase(Parametro);

   if Persistente then Lista := FListaPersis
   else Lista := FListaNormal;

   if (DameValorParametro(Parametro) <> '') then
   begin
      if ReemplazarSiExiste then
         ReemplazaParametro( Parametro, Valor )
      else Raise Exception.CreateFmt('El parametro %s ya existe', [Parametro]);
   end
   else Lista.Add(Parametro + '=' + Valor);
end;


procedure TMpsParametros.CargaParametrosXML( Documento : IXMLDocument ; NodoOrigen : IXMLNode ; Persistentes : Boolean);
var
   Variable, Valor : String;

   procedure Carga( Grupo : String ; NodoPadre : IXMLNode );
   var
      NodoActual : IXMLNode;
   begin
      NodoActual := NodoPadre.ChildNodes.First;

      if Grupo <> '' then Grupo := Grupo + '.';

      while NodoActual <> nil do
      begin
         if NodoActual.HasChildNodes then
            Carga( Grupo + NodoActual.NodeName, NodoActual )
         else
         begin
            Variable := Copy(Grupo, 1, Length(Grupo) -1);
            if VarIsNull(NodoActual.NodeValue) then
               Valor := ''
            else
               Valor := NodoActual.NodeValue;

//            if (Valor <> '') and (Valor <> '') then
               NuevoParametro(Variable, Valor, Persistentes);
         end;

         NodoActual := NodoActual.NextSibling;
      end;
   end;

begin
   if NodoOrigen = nil then
      NodoOrigen := Documento.ChildNodes.FindNode('Parametros');

   if NodoOrigen <> nil then
      Carga( '', NodoOrigen );
end;

end.
