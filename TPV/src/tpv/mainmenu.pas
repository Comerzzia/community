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

unit mainmenu;

interface

uses
  Windows, Forms, Messages, SysUtils, RzBHints, Menus, Classes, Controls,
  xmldom, XMLIntf, AdvToolBar, AdvToolBarStylers,
  ImgList, msxmldom, XMLDoc, AdvMenus, RzPanel, RzStatus, RzPrgres,
  ExtCtrls,
  OleCtrls, Splash, RzButton, Buttons, Graphics, AdvOfficeStatusBar,
  AdvOfficeStatusBarStylers, AdvNavBar, RzBmpBtn,
  DataMCore, DataMBaseDatos, DataMVariables, DataMMenu, jpeg, variants, FormBase,
  uMensajeDialog, AppEvnts, uOPOS, Uni, DB, RzForms, JvComponentBase,
  JvFormPlacement, pngimage;

resourcestring
  MENU002   = 'ERROR [MENU002]' + #13 + 'Error en la inicialización del MSE [%s]';
  MENU003   = 'ERROR [MENU003]' + #13 + 'No existe configuración de usuario [%s]';
  MENU004   = 'ERROR [MENU004]' + #13 + 'DLL no definida';
  MENU005   = 'ERROR [MENU005]' + #13 + 'Función no definida';
  STR_DeberaReiniciar = 'Deberá reiniciar la aplicación para que los cambios tengan efecto.';

type
  TMenuBitBtn = class(TRzBitBtn)
  protected
     Item: TMenuItemCargador;
  end;

  TMainForm = class(TForm)
    MenuPrincipal: TAdvMainMenu;
    RzBalloonHints1: TRzBalloonHints;
    XMLMensaje: TXMLDocument;
    ImagenesEstado: TImageList;
    ImagenesBarra: TImageList;
    FormStorage: TJvFormStorage;
    PopupBarra: TPopupMenu;
    CerrarVentana: TMenuItem;
    ToolBarOfficeStyler: TAdvToolBarOfficeStyler;
    StatusBar: TAdvOfficeStatusBar;
    StatusBarOfficeStyler: TAdvOfficeStatusBarOfficeStyler;
    NavBarMenu: TAdvNavBar;
    RzKeyStatus1: TRzKeyStatus;
    RzKeyStatus2: TRzKeyStatus;
    RzKeyStatus3: TRzKeyStatus;
    Reloj: TRzPanel;
    RzBmpButton1: TRzBmpButton;
    RzClockStatus1: TRzClockStatus;
    AppEvents: TApplicationEvents;
    Image1: TImage;
    RzBmpButton2: TRzBmpButton;
    procedure NavBarMenuCollapsedClick(Sender: TObject);
    procedure RzBmpButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AppEventsException(Sender: TObject; E: Exception);
    procedure AppEventsHint(Sender: TObject);
    procedure RzBmpButton2Click(Sender: TObject);
  private
    procedure CargaMenu( XMLMenu : IXMLDocument );
    function DameValorNodo( NodoPadre : IXMLNode ; NombreNodo : String ) : String;
    procedure EventoMenu(Sender : TObject);
  public
  end;

procedure RefrescaPanelesEstado; stdcall;

var
  MainForm: TMainForm;

implementation

uses
   iGeneral, DataMTienda, AcercaDe;

{$R *.DFM}

procedure DisableProcessWindowsGhosting;
var
  DisableProcessWindowsGhostingProc: procedure;
begin
  DisableProcessWindowsGhostingProc := GetProcAddress(
    GetModuleHandle('user32.dll'),
    'DisableProcessWindowsGhosting');
  if Assigned(DisableProcessWindowsGhostingProc) then
    DisableProcessWindowsGhostingProc;
end;

procedure TMainForm.NavBarMenuCollapsedClick(Sender: TObject);
begin
   NavBarMenu.Collapsed := False;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
   FrmSplash := TFrmSplash.Create(Application);
   try
      FrmSplash.Show;
      FrmSplash.Update;
      FrmSplash.Estado.Caption := 'Cargando...';

      try
         DMCore := TDMCore.Create(Self);
         DMCore.IniciaAplicacion;
         FrmSplash.Estado.Caption := 'Conectando...';
         DMBaseDatos.ConectarBD;
         FrmSplash.Estado.Caption := 'Iniciando...';
         DMCore.InicializaCore;
      except on E: Exception do
      begin
         Self.OnShow := nil; // para que no siga con la inicializacion de pantalla

         FrmSplash.Hide; // ocultar splash
         TPVExeption('Se ha producido un error iniciando la aplicacion.', E.Message, True, '20000');
         Application.Terminate;
         Exit;
      end;
      end;
      Sleep(300);
   finally
      FrmSplash.Hide;
      FrmSplash.Close;
      FrmSplash := nil;
   end;

   DisableProcessWindowsGhosting;
   
   DMMenu.CargaMenu(DMVariables.Aplicacion);
   CargaMenu(DMMenu.XMLDoc);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
   OnShow := nil;
   WindowState := wsMaximized;
   BorderStyle := bsNone;

   DMCore.InicioCheckConfiguracion;
   DMCore.InicioSeleccionUsuario;
   DMCore.IniciarDispositivos;
   RefrescaPanelesEstado;
end;

procedure TMainForm.RzBmpButton1Click(Sender: TObject);
begin
   if Self.ActiveMDIChild <> nil then
      Self.ActiveMDIChild.Close
   else
      Self.Close;
end;

procedure TMainForm.RzBmpButton2Click(Sender: TObject);
begin
   FrmAcercaDe := TFrmAcercaDe.Create(Self);
   try
      FrmAcercaDe.ShowModal;
   finally
      FrmAcercaDe.Free;
   end;
end;

procedure TMainForm.AppEventsException(Sender: TObject; E: Exception);
var
   Cadena : String;
   lVerDebug: Boolean;
   CodigoError: String;
   MensajeOriginal: String;
   lCerrarApp: Boolean;
begin
   lVerDebug := false;
   lCerrarApp := false;
   Cadena := '';
   CodigoError := '';
   MensajeOriginal := '';

   if E.ClassNameIs('EOPOSException') then
   begin
      lVerDebug := True;
      Cadena := 'Se ha producido un error en un dispositivo.' + #13#10 + E.Message;
      CodigoError := IntToStr(EOPOSException(E).ErrorCode);
      MensajeOriginal := 'Se ha producido un error ' + IntToStr(EOPOSException(E).ErrorCode) + ' al llamar a ' + EOPOSException(E).Debug;
   end
   else
   if (E is EAccessViolation) or (E is EVariantError) or (E is EOutOfMemory) then
   begin
      lVerDebug := true;
      Cadena := 'Se ha producido un error interno. Contacte con el administrador. ' + #13#10 +  'Disculpe las molestias.';
      MensajeOriginal := E.Message;
   end
   else if (E is EUniError) then
   begin
      lVerDebug := true;
      CodigoError := IntToStr(EUniError(E).ErrorCode);
      if Pos('ORA-00001', EUniError(E).Message) > 0 then
         Cadena := 'Código ya existe en la Base de datos'
      else if Pos('Duplicate entry',EUniError(E).Message) > 0 then
         Cadena := 'Código ya existe en la Base de datos'
      else
         Cadena := 'Se ha producido un error en el servidor.';
      MensajeOriginal := EUniError(E).Message;
   end
   else if (E is EDatabaseError) then
   begin
       lVerDebug := true;
       Cadena := 'Se ha producido un error de base de datos.';
       MensajeOriginal := EDatabaseError(E).Message;
   end
   else
   begin
      Cadena := E.Message;
   end;

   TPVExeption(Cadena, MensajeOriginal, lVerDebug, CodigoError);

   if lCerrarApp then
      Application.Terminate;
end;

procedure TMainForm.AppEventsHint(Sender: TObject);
begin
   StatusBar.Panels[5].Text := Application.Hint;
end;

procedure TMainForm.CargaMenu( XMLMenu : IXMLDocument );
var
   NodoMenu : IXMLNode;
   MenuPrincipal : TAdvMainMenu;
   icono: String;

   procedure PrivCargaMenu(ItemMenuPadre : TMenuItem ; NodoMenuPadre : IXMLNode);
   var
      ItemMenu : TMenuItemCargador;
      NodoSubMenu : IXMLNode;
      NombreNodo : String;
   begin
      if ItemMenuPadre = nil then NombreNodo := 'menu'
      else NombreNodo := 'menuItem';

      NodoSubMenu := NodoMenuPadre.ChildNodes.FindNode(NombreNodo);

      while NodoSubMenu <> nil do
      begin
         ItemMenu := TMenuItemCargador.Create(Application);
         ItemMenu.GroupIndex := 1;
         ItemMenu.Caption := NodoSubMenu.GetAttribute('titulo');

         if not VarIsNull(NodoSubMenu.GetAttribute('accion')) and
            (NodoSubMenu.GetAttribute('accion') <> '') then
         begin
            ItemMenu.IdAccion := NodoSubMenu.GetAttribute('idaccion');
            ItemMenu.Accion := NodoSubMenu.GetAttribute('accion');
            ItemMenu.Titulo := NodoSubMenu.GetAttribute('titulo');

            ItemMenu.DLL := DameValorNodo(NodoSubMenu, 'dll');
            ItemMenu.ModoCarga := DameValorNodo(NodoSubMenu, 'ModoCarga');
            ItemMenu.Hint := DameValorNodo(NodoSubMenu, 'descripcion');
            icono := DameValorNodo(NodoSubMenu, 'icono');
            if icono <> '' then
            begin
               try
                  icono := 'IMG\MENU\' + icono;
                  icono := DMCore.DameRutaRecurso(icono);
                  if (icono <> '') and (Pos('.bmp', icono) > 0) then
                     ItemMenu.Bitmap.LoadFromFile(icono)
                  else
                  begin
                     icono := 'IMG\MENU\generico.bmp';
                     icono := DMCore.DameRutaRecurso(icono);
                     if (icono <> '') and (Pos('.bmp', icono) > 0) then
                        ItemMenu.Bitmap.LoadFromFile(icono)
                  end;
               except
               end;
            end
            else
            begin
               icono := 'IMG\MENU\generico.bmp';
               icono := DMCore.DameRutaRecurso(icono);
               if (icono <> '') and (Pos('.bmp', icono) > 0) then
                  ItemMenu.Bitmap.LoadFromFile(icono);
            end;

            ItemMenu.OnClick := EventoMenu;
         end;

         if ItemMenuPadre = nil then
            MenuPrincipal.Items.Insert(iif((MenuPrincipal.Items.Count - 1) < 0, 0, MenuPrincipal.Items.Count - 1), ItemMenu)
         else ItemMenuPadre.Add(ItemMenu);
//         Insert(iif((ItemMenuPadre.Count - 1) < 0, 0, ItemMenuPadre.Count - 1), ItemMenu);

         PrivCargaMenu( ItemMenu, NodoSubMenu );

         NodoSubMenu := NodoSubMenu.NextSibling;
      end;
   end;

   procedure PrivCargaNavBar(menu: TMainMenu);
   var
      NavBar: TAdvNavBar;
      Scroll: TScrollBox;
      AdvNavPanel: TAdvNavBarPanel;
      AdvNavPanelSection: TAdvNavBarPanelSection;
      BtnOpcion: TMenuBitBtn;
      i, j: Integer;
   begin
      NavBar := MainForm.NavBarMenu;
      while NavBar.PanelCount > 0 do
         NavBar.Panels[0].Free;

      for i := 0 to MenuPrincipal.Items.Count - 1 do
      begin
         AdvNavPanel := NavBar.AddPanel;
         AdvNavPanelSection := AdvNavPanel.Sections.Add;
         Scroll := TScrollBox.Create(MainForm);
         AdvNavPanelSection.Control := Scroll;
         Scroll.Align := alClient;

         AdvNavPanel.Caption := TMenuItemCargador(MenuPrincipal.Items[i]).Caption;

         for j := MenuPrincipal.Items[i].Count -1 downto  0 do
         begin
            BtnOpcion := TMenuBitBtn.Create(Scroll);
            BtnOpcion.Parent := Scroll;
            BtnOpcion.Align := alTop;
            BtnOpcion.Height := 64;
            BtnOpcion.Caption := TMenuItemCargador(MenuPrincipal.Items[i].Items[j]).Caption;
            BtnOpcion.Glyph := MenuPrincipal.Items[i].Items[j].Bitmap;
            BtnOpcion.OnClick := TMenuItemCargador(MenuPrincipal.Items[i].Items[j]).OnClick;
            BtnOpcion.Item := TMenuItemCargador(MenuPrincipal.Items[i].Items[j]);
            BtnOpcion.HotTrack := True;
            BtnOpcion.Font.Size := 10;
            BtnOpcion.Font.Style := BtnOpcion.Font.Style + [fsBold];
            BtnOpcion.Color := clWindow;
         end;
      end;

      NavBar.SplitterPosition := NavBar.PanelCount;
   end;
begin
   MenuPrincipal := MainForm.MenuPrincipal;

   NodoMenu := XMLMenu.ChildNodes.FindNode('menuApp');

   if NodoMenu = nil then Raise Exception.Create('No se ha encontrado el menu');

   PrivCargaMenu(Nil, NodoMenu);
   PrivCargaNavBar(MenuPrincipal);
end;

procedure TMainForm.EventoMenu(Sender : TObject);
var
   FormActivo : TForm;
   ProcMenu : procedure(Titulo, Accion: PChar); stdcall;
   Objeto: TMenuItemCargador;
begin
   FormActivo := Screen.ActiveForm;
   Objeto := nil;

   if Sender is TMenuItem then
      Objeto := TMenuItemCargador(Sender)
   else
      if Sender is TMenuBitBtn then
         Objeto := TMenuItemCargador(TMenuBitBtn(Sender).Item);

   if Objeto <> nil then
   begin
      with Objeto do
      begin
         if ModoCarga = 'BPL' then
         begin
            LoadPackage(DLL);
            TFrmBaseClass(GetClass(Accion)).Crea(Titulo, Objeto);
         end
         else
         begin
            ProcMenu := DMCore.DameFuncion(DLL, Accion);
            ProcMenu(PChar(Titulo), PChar(Accion));
         end;

         if (Screen.ActiveForm <> FormActivo) and (Screen.ActiveForm <> nil) then
         begin
//            FormActivo := Screen.ActiveForm;
            Formulario := Screen.ActiveForm.Name;
         end;
         MainForm.NavBarMenu.Collapsed := True;
      end;
   end;
end;

function TMainForm.DameValorNodo( NodoPadre : IXMLNode ; NombreNodo : String ) : String;
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

procedure RefrescaPanelesEstado;
var
   InfoTienda: TInfoTienda;
begin
   with MainForm do
   begin
      InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
      try
         StatusBar.Panels[0].Text := 'Tienda: ' + InfoTienda.Codalm + '/' +
            InfoTienda.Desalm + ' Caja: ' + DMVariables.CodigoCaja;
      finally
         InfoTienda.Free;
      end;
      StatusBar.Panels[2].Text := DMVariables.Aplicacion;
      StatusBar.Panels[3].Text := DMVariables.DameVariable('TPV.VERSION');
      StatusBar.Panels[4].Text := Copy(DMVariables.UIDTPV, Length(DMVariables.UIDTPV) - 6 , 6);
   end;
end;

exports RefrescaPanelesEstado;

end.


