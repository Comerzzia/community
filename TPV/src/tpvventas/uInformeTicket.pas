unit uInformeTicket;

interface
uses
   Classes, Dialogs, Variants, uInforme, DataMBase, SysUtils, DataMCore,
   fs_iInterpreter, fs_ipascal;

type
   TInformeTicket = class(TInforme)
   private
      function CallMethodImpresionTicket(Instance: TObject; ClassType: TClass;
         const MethodName: String; Caller: TfsMethodHelper): Variant;
   public
      constructor Create; override;
      procedure ComponerInforme; override;
      procedure ComponerInformeVale;

      procedure RegistraRuntime; override;

      function DameDetallePromocionXml(Campo: String; Linea: Integer): String;
//      function DameTotalDetalle(NodoPadre: String; NodoHijo:String): Integer;
   end;

implementation

uses
   iGeneral, fs_impresion, XMLIntf, XMLDoc;

(*******************************************************************************
* TInformeTicket                                                               *
*******************************************************************************)
constructor TInformeTicket.Create;
begin
   inherited Create;
   NombreInforme := 'ticket';
end;

procedure TInformeTicket.ComponerInforme;
begin
   CargaScript(DMCore.DameRutaRecurso('RPT\' + NombreInforme + '.txt'));
   EjecutaScript;
end;

procedure TInformeTicket.ComponerInformeVale;
begin
   NombreInforme := 'vale';
   CargaScript(DMCore.DameRutaRecurso('RPT\' + NombreInforme + '.txt'));
   EjecutaScript;
end;

procedure TInformeTicket.RegistraRuntime;
begin
   inherited;

   with Script.AddClass(TInformeTicket, 'TInforme') do
   begin
      AddMethod('function DameDetallePromocionXml(Campo: String, Linea: Integer): String;', CallMethodImpresionTicket);
//      AddMethod('function DameTotalDetalle(NodoPadre: String, NodoHijo: String): Integer', CallMethodImpresionTicket);
   end;
end;

function TInformeTicket.CallMethodImpresionTicket(Instance: TObject; ClassType: TClass;
  const MethodName: String; Caller: TfsMethodHelper): Variant;
begin
   if MethodName = 'DAMEDETALLEPROMOCIONXML' then
      Result := DameDetallePromocionXml(Caller.Params[0], Caller.Params[1]);
//   else if MethodName = 'DAMETOTALDETALLE' then
//      Result := DameTotalDetalle(Caller.Params[0], Caller.Params[1]);
end;

function TInformeTicket.DameDetallePromocionXml(Campo: String; Linea: Integer): String;
var
   Nodo, NodoLinea : IXMLNode;
   i: Integer;
   resultado: String;
begin
   resultado := '';
   Nodo := FXML.ChildNodes.FindNode('ticket');
   Nodo := Nodo.ChildNodes.FindNode('lineas');
   for i := 0 to Nodo.ChildNodes.Count - 1 do
   begin
      NodoLinea := Nodo.ChildNodes.Nodes[i];
      if i = Linea then
      begin
         NodoLinea := NodoLinea.ChildNodes.FindNode('promocion');
         if NodoLinea <> nil then
            resultado := iGetValorRutaXML(FXML, NodoLinea, Campo)
         else
            resultado := '';
         Break;
      end;
   end;
   Result := resultado;
end;
 {
function TInformeTicket.DameTotalDetalle(NodoPadre: String; NodoHijo:String): Integer;
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
      if NodoHijo = 'pagos' then //contar todos los nodos excepto el OperacionTEF si existe
      begin
         if Nodo.ChildNodes.FindNode('operacionTEF') <> nil then
            result := Nodo.ChildNodes.Count - 1
         else
            result := Nodo.ChildNodes.Count;
      end
      else
         Result := Nodo.ChildNodes.Count;
   end;
end;   }

end.
