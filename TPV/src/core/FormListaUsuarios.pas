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

unit FormListaUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ButtonGroup, RzTabs, StdCtrls, RzLabel,
  jpeg, ExtCtrls, Mask, RzEdit, RzButton, uMensajeDialog,
  AdvTouchKeyboard, RzPanel, JvGIF, DB, GIFImg, pngimage;

resourcestring
   STR_ValidaUsuario = 'La contraseña no es correcta';

type
   TUserMPSBitBtn = class(TRzBitBtn)
   public
      Usuario: String;
      NombreUsuario: String;
      Clave: String;
   end;

type
  TFrmListaUsuarios = class(TForm)
    MPSPanel2: TRzPanel;
    MPSLabel1: TRzLabel;
    MPSPanel5: TRzPanel;
    MPSLabel4: TRzLabel;
    LabelUsuario: TLabel;
    Image1: TImage;
    Paginas: TRzPageControl;
    TabListaUsuarios: TRzTabSheet;
    MPSScrollBox1: TScrollBox;
    TabPideClave: TRzTabSheet;
    MPSPanel1: TRzPanel;
    LabelContrasena: TLabel;
    Image2: TImage;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    MPSPanel7: TRzPanel;
    MPSLabel6: TRzLabel;
    MPSPanel8: TRzPanel;
    MPSLabel7: TRzLabel;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    EditClave: TRzEdit;
    Logo: TImage;
    RzBitBtn3: TRzBitBtn;
    ImagenesUsuarios: TImageList;
    LabelNombre: TLabel;
    RzPanel1: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnCancelarClick(Sender: TObject);
    procedure TabPideClaveExit(Sender: TObject);
    procedure BtnSalirClick(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure EditClaveClick(Sender: TObject);
  private
    { Private declarations }
    Usuarios: TDataSet;
    
    procedure ValidaClave;
  public
    { Public declarations }
    Usuario: String;
    Nombre: String;
    Clave: String;
    procedure CargaListaUsuarios;
    procedure ButtonClick(Sender: TObject);
  end;

var
  FrmListaUsuarios: TFrmListaUsuarios;

implementation
uses iGeneral, DataMCore, DataMUsuarios;

{$R *.dfm}

procedure TFrmListaUsuarios.BtnCancelarClick(Sender: TObject);
begin
   Paginas.ActivePage := TabListaUsuarios;
   LabelUsuario.Caption := 'Usuarios';
end;

procedure TFrmListaUsuarios.BtnSalirClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TFrmListaUsuarios.ButtonClick(Sender: TObject);
begin
   Usuario := TUserMPSBitBtn(Sender).Usuario;
   Nombre := TUserMPSBitBtn(Sender).NombreUsuario;
   Clave := TUserMPSBitBtn(Sender).Clave;
   if Clave <> '' then
   begin
      EditClave.Text := '';
      Paginas.ActivePage := TabPideClave;
      LabelUsuario.Caption := Usuario;
      LabelNombre.Caption := Nombre;
      if EditClave.CanFocus then
         EditClave.SetFocus;
   end
   else
      ValidaClave;
end;

procedure TFrmListaUsuarios.FormCreate(Sender: TObject);
begin
   TabListaUsuarios.TabVisible := False;
   TabPideClave.TabVisible := False;
   Paginas.ActivePage := TabListaUsuarios;
end;

procedure TFrmListaUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Paginas.ActivePage = TabPideClave then
   begin
      if key = VK_RETURN then
         ValidaClave
      else if key = VK_ESCAPE then
         Paginas.ActivePage := TabListaUsuarios;
   end;
end;

procedure TFrmListaUsuarios.RzBitBtn1Click(Sender: TObject);
begin
   ValidaClave;
end;

procedure TFrmListaUsuarios.TabPideClaveExit(Sender: TObject);
begin
   EditClave.Text := '';
end;

procedure TFrmListaUsuarios.ValidaClave;
begin
   if (iDameMD5(EditClave.Text) = Clave) or (Clave = '') then
      ModalResult := mrOk
   else
   begin
      TPVMessageDlg(STR_ValidaUsuario, mtWarning, [mbOK], 0);
      EditClave.Text := '';
      EditClave.SetFocus;
   end;
end;
procedure TFrmListaUsuarios.CargaListaUsuarios;
var

   Boton: TUserMPSBitBtn;
   x, y, n, iOffSet: Integer;
begin
   Usuarios := DMUsuarios.GetDataSetListaUsuarios;
   Usuarios.First;
   iOffSet := 3;
   n := 1;
   x := 3;
   y := 3;
   while not Usuarios.Eof do
   begin
      Boton := TUserMPSBitBtn.Create(MPSScrollBox1);
      Boton.Parent := MPSScrollBox1;
      Boton.Caption := Usuarios.FieldByName('USUARIO').AsString + #13 +
                       Usuarios.FieldByName('DESUSUARIO').AsString;
      Boton.Usuario := Usuarios.FieldByName('USUARIO').AsString;
      Boton.NombreUsuario := Usuarios.FieldByName('DESUSUARIO').AsString;
      Boton.Clave := Usuarios.FieldByName('CLAVE').AsString;
      Boton.OnClick := ButtonClick;
      Boton.Images :=  ImagenesUsuarios;
      Boton.ImageIndex := 0;
      Boton.HotTrack := True;
      Boton.Width := 160;
      Boton.Height := 64;
      Boton.Margins.Top := 0;
      Boton.Margins.Right := 15;
      Boton.Margins.Bottom := 0;
      Boton.Align := alCustom;
      Boton.Color := clNone;
      Boton.Font.Charset := DEFAULT_CHARSET;
      Boton.Font.Color := $00C15800;
      Boton.FrameColor := $009E6B43;
      Boton.Font.Height := -11;
      Boton.Font.Name := 'Arial';
      Boton.Font.Style := [];
      Boton.HotTrack := True;
      Boton.ParentFont := False;
      Boton.ParentShowHint := False;
      Boton.ShowHint := False;
      Boton.TabOrder := 0;
      Boton.DisabledIndex := 7;
      Boton.Top := y;
      Boton.Left := x;
      x := x + Boton.Width + iOffSet;
      if n > 3 then
      begin
         x := 3;
         y := y + Boton.Height + iOffSet;
         n := 0;
      end;
      inc(n);
      Usuarios.Next;
   end;
end;

procedure TFrmListaUsuarios.EditClaveClick(Sender: TObject);
begin
   EditClave.SelectAll;
end;

end.
