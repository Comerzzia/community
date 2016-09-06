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

unit FormMensaje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, RzDBEdit, RzLabel, RzButton,
  ExtCtrls, RzPanel, RzEdit, RzForms, RzCommon, ImgList;

type
  TFrmMensaje = class(TForm)
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    btnCerrar: TRzBitBtn;
    PanelDebug: TRzPanel;
    btnDebug: TRzBitBtn;
    memoMensajeOriginal: TRzRichEdit;
    lblMensaje: TRzMemo;
    ImagenesBotones: TImageList;
    ImagenesInformacion: TImageList;
    BtnAceptar: TRzBitBtn;
    Image1: TImage;
    procedure btnDebugClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   // procedure InicializaDlg(const Msg: String; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint);
    procedure InicializaDlg(const Msg: String; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; boton_Activo: TMsgDlgButtons); 
    procedure ExceptionDlg(Mensaje: String; MensajeOriginal: String; VerDebug: Boolean; CodigoError: String);
  end;

var
  FrmMensaje: TFrmMensaje;

implementation

uses DataMCore;

{$R *.dfm}

procedure TFrmMensaje.btnDebugClick(Sender: TObject);
begin
   if PanelDebug.Visible then
   begin
      PanelDebug.Visible := false;
      lblMensaje.Height := lblMensaje.Height + 74;
      RzPanel1.Height := RzPanel1.Height + 74;
   end
   else
   begin
      PanelDebug.Visible := true;
      lblMensaje.Height := lblMensaje.Height - 74;
      RzPanel1.Height := RzPanel1.Height - 74;
   end;
end;

procedure TFrmMensaje.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
   begin
      Key := 0;
      ModalResult := mrCancel;
   end;
end;

procedure TFrmMensaje.FormShow(Sender: TObject);
begin
   Beep;
end;

(*procedure TFrmMensaje.InicializaDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint);
begin
   InicializaDlg(Msg, DlgType, Buttons, HelpCtx, []);
end;    *)

procedure TFrmMensaje.InicializaDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; boton_Activo: TMsgDlgButtons);
begin
   lblMensaje.Text := Msg;
   if DlgType = mtConfirmation then
      ImagenesInformacion.GetBitmap(0, Image1.Picture.Bitmap)
   else
   if DlgType = mtError then
      ImagenesInformacion.GetBitmap(1, Image1.Picture.Bitmap)
   else
   if DlgType = mtInformation then
      ImagenesInformacion.GetBitmap(2, Image1.Picture.Bitmap)
   else
   if DlgType = mtWarning then
      ImagenesInformacion.GetBitmap(3, Image1.Picture.Bitmap)
   else
   if DlgType = mtCustom then
      ImagenesInformacion.GetBitmap(4, Image1.Picture.Bitmap);

   if Buttons = [mbYes] then
   begin
      BtnAceptar.Visible := False;
      btnCerrar.Caption := 'Si';
      btnCerrar.ImageIndex := 0;
      btnCerrar.ModalResult := mrYes;

      if boton_Activo = [mbYes] then
      begin
         BtnAceptar.TabOrder := 1;
         BtnCerrar.TabOrder := 0;
      end;
   end;
   if Buttons = [mbNo] then
   begin
      BtnAceptar.Visible := False;
      btnCerrar.Caption := 'No';
      btnCerrar.ImageIndex := 0;
      btnCerrar.ModalResult := mrNo;

      if boton_Activo = [mbNo] then
      begin
         BtnAceptar.TabOrder := 1;
         BtnCerrar.TabOrder := 0;
      end;
   end;
   
   if (Buttons = mbYesNo) or (Buttons = [mbYes, mbNo]) then
   begin
      BtnAceptar.Caption := 'Si';
      BtnAceptar.ImageIndex := 0;
      BtnAceptar.ModalResult := mrYes;
      btnCerrar.Caption := 'No';
      btnCerrar.ImageIndex := 2;
      btnCerrar.ModalResult := mrNo;

      if boton_Activo = [mbYes] then
      begin
         BtnAceptar.TabOrder := 0;
         BtnCerrar.TabOrder := 1;
      end
      else if boton_Activo = [mbNo] then
      begin
         BtnAceptar.TabOrder := 1;
         BtnCerrar.TabOrder := 0;
      end;
   end;

   if Buttons = [mbOK] then
   begin
      BtnAceptar.Visible := False;
      btnCerrar.Caption := 'Aceptar';
      btnCerrar.ImageIndex := 0;
      btnCerrar.ModalResult := mrOk;

      if boton_Activo = [mbOK] then
      begin
         BtnAceptar.TabOrder := 1;
         BtnCerrar.TabOrder := 0;
      end;
   end;
   if Buttons = [mbCancel] then
   begin
      BtnAceptar.Visible := False;
      btnCerrar.Caption := 'Cancelar';
      btnCerrar.ImageIndex := 2;
      btnCerrar.ModalResult := mrCancel;

      if boton_Activo = [mbCancel] then
      begin
         BtnAceptar.TabOrder := 1;
         BtnCerrar.TabOrder := 0;
      end;
   end;
   if (Buttons = mbOKCancel) or (Buttons = [mbOK, mbCancel]) then
   begin
      BtnAceptar.Caption := 'Aceptar';
      BtnAceptar.ImageIndex := 0;
      BtnAceptar.ModalResult := mrOk;
      btnCerrar.Caption := 'Cancelar';
      btnCerrar.ImageIndex := 2;
      btnCerrar.ModalResult := mrCancel;

      if (boton_Activo = [mbOK]) AND (BtnAceptar.Visible = True) then
      begin
         BtnAceptar.TabOrder := 0;
         BtnCerrar.TabOrder := 1;
      end
      else if (boton_Activo = mbOKCancel) OR (boton_Activo = [mbCancel]) then
      begin
         BtnAceptar.TabOrder := 1;
         BtnCerrar.TabOrder := 0;
      end;
   end;
end;

procedure TFrmMensaje.ExceptionDlg(Mensaje: String; MensajeOriginal: String; VerDebug: Boolean; CodigoError: String);
begin
   lblMensaje.ReadOnly := false;
   memoMensajeOriginal.ReadOnly := false;

   lblMensaje.Text := Mensaje;
   btnDebug.Visible := (VerDebug);

   if VerDebug then
   begin
      with memoMensajeOriginal do
      begin
         Visible := True;
         SelAttributes.Color := clBlue;
         Lines.Add('');
         if CodigoError <> '' then
         begin
            SelAttributes.Color := clRed;
            Lines.Add('Código de Error: ' + CodigoError);
         end;

         SelAttributes.Color := clBlack;
         Lines.Add(MensajeOriginal);

         Lines.Add('');
         SelAttributes.Color := clBlack;
      end;
   end;

   ImagenesInformacion.GetBitmap(0, Image1.Picture.Bitmap);
   BtnAceptar.Visible := False;
   btnCerrar.Caption := 'Aceptar';
   btnCerrar.ImageIndex := 0;
   btnCerrar.ModalResult := mrOk;

   lblMensaje.ReadOnly := true;
   memoMensajeOriginal.ReadOnly := true;

end;

end.
