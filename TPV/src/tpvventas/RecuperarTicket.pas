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

unit RecuperarTicket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzButton, ExtCtrls, RzPanel, StdCtrls, RzLstBox, RzCommon,
  RzForms, ComCtrls, RzListVw, AdvListV, ImgList, ActnList;

type
  TFrmRecupearTicket = class(TFrmBase)
    RZGroupBox8: TRzGroupBox;
    RzPanel6: TRzPanel;
    RzPanel11: TRzPanel;
    BtnInicio: TRzToolButton;
    BtnAnterior: TRzToolButton;
    BtnSiguiente: TRzToolButton;
    BtnFin: TRzToolButton;
    ListViewTickets: TAdvListView;
    Imagenes: TImageList;
    RZPanel10: TRzPanel;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListViewTicketsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSiguienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRecupearTicket: TFrmRecupearTicket;

implementation

{$R *.dfm}

procedure TFrmRecupearTicket.BtnAceptarClick(Sender: TObject);
begin
  inherited;
  if ListViewTickets.ItemIndex >= 0 then
     ModalResult := mrOk;
end;

procedure TFrmRecupearTicket.BtnSiguienteClick(Sender: TObject);
var
   i : Integer;
begin
   inherited;
   try
      i := ListViewTickets.ItemIndex;
      if ListViewTickets.Items.Count > 0 then
      begin
         if Sender = BtnInicio then
            i := 0
         else if (Sender = BtnAnterior) and  (ListViewTickets.ItemIndex <> 0) then
            i := i - 1
         else if (Sender = BtnSiguiente) and (ListViewTickets.ItemIndex <> ListViewTickets.Items.Count - 1) then
            inc(i)
         else if Sender = BtnFin then
            i := ListViewTickets.Items.Count - 1;

         ListViewTickets.SelectItem(i);
      end;
   except
      ListViewTickets.SelectItem(0);
   end;
end;

procedure TFrmRecupearTicket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if key = VK_ESCAPE then
      ModalResult := mrCancel;

end;

procedure TFrmRecupearTicket.FormShow(Sender: TObject);
begin
  inherited;
  ListViewTickets.SelectItem(0);
end;

procedure TFrmRecupearTicket.ListViewTicketsDblClick(Sender: TObject);
begin
   inherited;
   BtnAceptar.Click;
end;

end.
