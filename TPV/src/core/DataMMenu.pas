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

unit DataMMenu;

interface

uses
  Forms, SysUtils, Classes, xmldom, XMLIntf, msxmldom, XMLDoc, DB, Uni, DBAccess, MemDS, JvJCLUtils,
  uMensajeDialog, Dialogs, Menus;

resourcestring
   STR_NoSeHaEncontradoMenu = 'No se ha encontrado menu para la aplicación [%s]';

type
  TMenuItemCargador = class(TMenuItem)
  public
     IdAccion : Integer; DLL, Accion, Formulario, Titulo, ModoCarga: String;
  end;

  TNivel = packed record
     Nombre : String;
     Nodo : IXMLNode;
  end;

  TDMMenu = class(TDataModule)
    Q_MENU: TUniQuery;
    XMLDoc: TXMLDocument;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CargaMenu(Aplicacion: String);
  end;

var
  DMMenu: TDMMenu;

implementation

{$R *.dfm}

procedure TDMMenu.CargaMenu(Aplicacion: String);
var
   Niveles : array[0..20] of TNivel;
   Camino : String;
   Nivel : Integer;

   procedure NuevoValor( NodoPadre : IXMLNode ; Etiqueta, Campo : String);
   begin
      if Campo = '' then Campo := Etiqueta;

      if Q_MENU.FieldByName(campo).AsSTring <> '' then
         NodoPadre.AddChild(Etiqueta).NodeValue := Q_MENU.FieldByName(campo).AsSTring;
   end;

   procedure CreaNodo(ANivel, IdAccion : Integer ; Nombre, TipoAccion, Ejecucion, Titulo: String);
   var
      NodoPadre : IXMLNode;
      NombreNodo : String;
      sDll, sAccion: String;
   begin
      sDll := '';
      sAccion := '';
      if TipoAccion = 'DLL' then
      begin
         sDll := Copy(Ejecucion, 0, Pos('.', Ejecucion) - 1) + '.DLL';
         sAccion := Copy(Ejecucion, Pos('.', Ejecucion) + 1, Length(Ejecucion));
      end
      else
      if TipoAccion = 'BPL' then
      begin
         sDll := Copy(Ejecucion, 0, Pos('.', Ejecucion) - 1) + '.BPL';
         sAccion := Copy(Ejecucion, Pos('.', Ejecucion) + 1, Length(Ejecucion));
      end
      else
      begin
         sAccion := Ejecucion;
      end;

      if ANivel = 0 then
      begin
         NodoPadre := XMLDoc.DocumentElement;
         NombreNodo := 'menu';
      end
      else
      begin
         NombreNodo := 'menuItem';
         NodoPadre := Niveles[ANivel-1].Nodo;
      end;

      Niveles[ANivel].Nodo := XMLDoc.CreateNode(NombreNodo, ntElement);
      Niveles[ANivel].Nombre := Nombre;

      if (ANivel > 0) then
      begin
         Niveles[ANivel].Nodo.SetAttribute('idaccion', IdAccion);
         Niveles[ANivel].Nodo.SetAttribute('accion', sAccion);
         Niveles[ANivel].Nodo.SetAttribute('titulo', Titulo);
      end
      else
         Niveles[ANivel].Nodo.SetAttribute('titulo', Nombre);

      if (ANivel > 0) and (sAccion <> '') then
      begin
         NuevoValor(Niveles[ANivel].Nodo, 'tecla_rapida', '');
         NuevoValor(Niveles[ANivel].Nodo, 'descripcion', '');
         NuevoValor(Niveles[ANivel].Nodo, 'icono', 'icono');

         Niveles[ANivel].Nodo.AddChild('ModoCarga').NodeValue := TipoAccion;

         if (sDll <> '') and (TipoAccion = 'DLL') then
            Niveles[ANivel].Nodo.AddChild('dll').NodeValue := 'CLIWIN\' + sDll
         else
            Niveles[ANivel].Nodo.AddChild('dll').NodeValue := sDll;

      end;

      NodoPadre.ChildNodes.Add(Niveles[ANivel].Nodo);
   end;

   procedure VerificaNivel;
   var
      x : Integer;
      NombreNivel : String;
   begin
      for x := 0 to Nivel-1 do
      begin
         NombreNivel := ExtractWord(x+1, Q_MENU.FieldByName('OPCION').AsString, ['\']);

         if Niveles[x].Nombre <> NombreNivel then
            CreaNodo( x, 0, NombreNivel, '', '', Q_MENU.FieldByName('TITULO').AsString);
      end;
      // LIMPIAR NIVELES SUPERIORES
      for x := Nivel  to 20 do
      begin
         Niveles[x].Nombre := '';
         Niveles[x].Nodo := nil;
      end;
   end;
begin
   Q_MENU.Close;
   Q_MENU.ParamByName('APLICACION').AsString := Aplicacion;
   Q_MENU.Open;

   if Q_MENU.IsEmpty then
   begin
      TPVMessageDlg(Format(STR_NoSeHaEncontradoMenu, [Aplicacion]), mtError, [mbOk], 0);
      Application.Terminate;
   end;

   XMLDoc.XML.Clear;
   XMLDoc.Active := True;

   XMLDoc.DocumentElement := XMLDoc.CreateElement('menuApp', '');
   XMLDoc.DocumentElement.SetAttribute('aplicacion', Aplicacion);

   while not Q_MENU.Eof do
   begin
      Camino := ExtractFilePath(Q_MENU.FieldByName('OPCION').AsString);
      Nivel := WordCount(Camino, ['\']);

      VerificaNivel;

      while (Camino = ExtractFilePath(Q_MENU.FieldByName('OPCION').AsString)) and
            not Q_MENU.Eof do
      begin
         CreaNodo(Nivel,
                  Q_MENU.FieldByName('ID_ACCION').AsInteger,
                  ExtractFileName(Q_MENU.FieldByName('OPCION').AsString),
                  Q_MENU.FieldByName('TIPO_ACCION').AsString,
                  Q_MENU.FieldByName('EJECUCION').AsString,
                  Q_MENU.FieldByName('TITULO').AsString);
         Q_MENU.Next;
      end;
   end;
end;

end.

