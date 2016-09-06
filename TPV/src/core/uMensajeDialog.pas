//
// Copyright 2009-2011 RED.ES - Desarrollado por Tier1
// 
// Licencia con arreglo a la EUPL, versi�n 1.1 o -en cuanto 
// sean aprobadas por la comisi�n Europea- versiones 
// posteriores de la EUPL (la "Licencia").
// Solo podr� usarse esta obra si se respeta la Licencia.
// 
// http://ec.europa.eu/idabc/eupl.html
// 
// Salvo cuando lo exija la legislaci�n aplicable o se acuerde
// por escrito, el programa distribuido con arreglo a la
// Licencia se distribuye "TAL CUAL",
// SIN GARANT�AS NI CONDICIONES DE NING�N TIPO, 
// ni expresas ni impl�citas.
// V�ase la Licencia en el idioma concreto que rige
// los permisos y limitaciones que establece la Licencia.
//

unit uMensajeDialog;

interface
uses Forms, Dialogs, FormMensaje, Classes;

function TPVMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer; overload;
function TPVMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; boton_Activo: TMsgDlgButtons): Integer; overload;
function TPVExeption(Mensaje: String; MensajeOriginal: String; VerDebug: Boolean; CodigoError: String): Integer;

implementation

function TPVMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): Integer;
begin
   result := TPVMessageDlg(Msg, DlgType, Buttons ,HelpCtx, []);
end;

function TPVMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint; boton_Activo: TMsgDlgButtons): Integer;
begin
   FrmMensaje := TFrmMensaje.Create(Application);
   try
      FrmMensaje.InicializaDlg(Msg, DlgType, Buttons, HelpCtx, boton_Activo);
      result := FrmMensaje.ShowModal;
   finally
      FrmMensaje.Free;
   end;
end;

function TPVExeption(Mensaje: String; MensajeOriginal: String; VerDebug: Boolean; CodigoError: String): Integer;
begin
   FrmMensaje := TFrmMensaje.Create(Application);
   try
      FrmMensaje.ExceptionDlg(Mensaje, MensajeOriginal, VerDebug, CodigoError);
      result := FrmMensaje.ShowModal;
   finally
      FrmMensaje.Free;
   end;
end;

end.
