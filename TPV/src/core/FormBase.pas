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

unit FormBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  RzCommon, RzForms, XMLIntf, XMLDoc, ActnList, Menus, RzButton, DataMVariables,
  DataMCore, DataMMenu;

type
  TFrmBase = class(TForm)
    RzFormState1: TRzFormState;
    RzRegIniFile1: TRzRegIniFile;
    Acciones: TActionList;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FAccion : TMenuItemCargador;
    procedure SetFAccion(AccionPantalla : TMenuItemCargador );
  public
    { Public declarations }

    class procedure Crea(Titulo : String ; Accion : TMenuItemCargador); virtual; abstract;

    procedure AdministraPermisos;

    procedure Inicializa; virtual; abstract;
    procedure SetAcciones;

    property Accion : TMenuItemCargador read FAccion write SetFAccion;
  end;

  TFrmBaseClass = class of TFrmBase;

var
  FrmBase: TFrmBase;

implementation

uses iGeneral, AdvTouchKeyboard;

{$R *.dfm}

procedure TFrmBase.FormCreate(Sender: TObject);
var
   AnchoPantalla, AltoPantalla : String;
   TecladoNumerico : TAdvTouchKeyboard;
begin
   RzRegIniFile1.Path := DMVariables.ClaveRegistro + '\Formularios';

   AnchoPantalla := DMVariables.DameVariable('_PANTALLA.ANCHO');
   if AnchoPantalla <> '' then
   begin
      AltoPantalla := DMVariables.DameVariable('_PANTALLA.ALTO');

      Width := StrToInt(AnchoPantalla);
      Height := StrToInt(AltoPantalla);
   end;

   Position := poScreenCenter;

   // Buscar teclado numerico y asignar valor de tecla decimal
   TecladoNumerico := TAdvTouchKeyboard(FindComponent('TecladoNumerico'));

   if (TecladoNumerico <> nil) then
      TecladoNumerico.Keys[10].Caption := SysUtils.DecimalSeparator;
end;

procedure TFrmBase.SetAcciones;
var
   i: Integer;
   XML: IXMLDocument;
   iFormulario: IXMLNode;
   iAccion: IXMLNode;
   iValor: IXMLNode;
   Boton: TComponent;
begin
   XML := TXMLDocument.Create(Self);
   XML.FileName := DMCore.DameRutaRecurso('conf\acciones\acciones.xml');
   try
      XML.Active := True;
      iFormulario := XML.DocumentElement.ChildNodes.FindNode(Self.Name);
      if iFormulario <> nil then
      begin
         for i := 0 to Acciones.ActionCount - 1 do
         begin
            iAccion := iFormulario.ChildNodes.FindNode(Acciones.Actions[i].Name);
            if iAccion <> nil then
            begin
               //Caption
               iValor := iAccion.ChildNodes.FindNode('titulo');
               if iValor <> nil then
                  TAction(Acciones.Actions[i]).Caption := iif(VarIsNull(iValor.NodeValue), '', iValor.NodeValue);

               //Hint
               iValor := iAccion.ChildNodes.FindNode('descripcion');
               if iValor <> nil then
                  TAction(Acciones.Actions[i]).Hint := iif(VarIsNull(iValor.NodeValue), '', iValor.NodeValue);

               //ShortCut
               iValor := iAccion.ChildNodes.FindNode('atajo');
               if iValor <> nil then
               begin
                  if not VarIsNull(iValor.NodeValue) then
                  begin
                     TAction(Acciones.Actions[i]).ShortCut := TextToShortCut(iValor.NodeValue);
                     TAction(Acciones.Actions[i]).Caption := TAction(Acciones.Actions[i]).Caption + #13#10 + iValor.NodeValue; 
                     Boton := Self.FindComponent(iValor.NodeValue);
                     if Boton <> nil then
                     begin
                        if Boton is TRzToolButton then
                           TRzToolButton(Boton).Action := TAction(Acciones.Actions[i]);
                     end;
                  end;
               end;
            end;
         end;
      end;

      //Asignar el disableIndex para las imagenes de los botones(no soportado por TAction)
      for i := 0 to ComponentCount - 1 do
      begin
         if Components[i] is TRzToolButton then
            if TRzToolButton(Components[i]).ImageIndex >= 0 then
               TRzToolButton(Components[i]).DisabledIndex := TRzToolButton(Components[i]).ImageIndex + 1;
      end;
   finally
      XML.Active := False;
   end;
end;

procedure TFrmBase.AdministraPermisos;
begin
   if (Accion = nil) then Exit;

   // NO IMPLEMENTADO
end;

procedure TFrmBase.SetFAccion(AccionPantalla : TMenuItemCargador );
begin
   FAccion := AccionPantalla;

   if FAccion <> nil then
   begin
      // NO IMPLEMENTADO
   end;
end;


initialization
   RegisterClass(TFrmBase);

end.
