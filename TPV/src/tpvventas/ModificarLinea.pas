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

unit ModificarLinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTouchKeyboard, RzButton, Grids, DBGrids, RzDBGrid, StdCtrls, Mask,
  RzEdit, RzPanel, ExtCtrls, ImgList, DB, FormBase, RzCommon,
  RzForms, RzLabel, DataMTicket, uMensajeDialog, DataMVariables, DataMImpuestos,
  ActnList;

resourcestring
   STR_DebeEspecificarCantidad = 'Debe especificar una cantidad distinta de 0';
   STR_PrecioCero = 'Esta especificando un precio de 0€.¿Desea continuar?';
   STR_DescuentoNoValido = 'Descuento no válido debe especificar un valor entre 0-100';

type
  TFrmModificarLineaTicket = class(TFrmBase)
    RzGroupBox1: TRzGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ImagenesInsertarApunte: TImageList;
    Label1: TLabel;
    lblTitDesglose1: TLabel;
    lblTitDesglose2: TLabel;
    Label7: TLabel;
    EditPrecio: TRzNumericEdit;
    EditCantidad: TRzNumericEdit;
    lblCodart: TRzLabel;
    lblDesglose1: TRzLabel;
    lblDesglose2: TRzLabel;
    EditDescripcion: TRzEdit;
    TecladoAlfabetico: TAdvTouchKeyboard;
    LabelDescuento: TLabel;
    EditDescuento: TRzNumericEdit;
    LabelPrecioFinal: TLabel;
    EditPrecioFinal: TRzNumericEdit;
    BtnCancelar: TRzBitBtn;
    BtnAceptar: TRzBitBtn;
    procedure BtnAceptarClick(Sender: TObject);
    procedure EditCantidadClick(Sender: TObject);
    procedure EditCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrecioKeyPress(Sender: TObject; var Key: Char);
    procedure EditDescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure EditPrecioChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FTicket: TTicket;
    FLinea: TLineaTicket;
    procedure pintaLineaTicket;
  public
    { Public declarations }
    procedure Inicializa(Ticket: TTicket; LineaTicket: TLineaTicket);
  end;

var
  FrmModificarLineaTicket: TFrmModificarLineaTicket;

implementation
uses
   iGeneral;

{$R *.dfm}

procedure TFrmModificarLineaTicket.EditCantidadClick(Sender: TObject);
begin
   inherited;
   TRzEdit(Sender).SelectAll;
end;

procedure TFrmModificarLineaTicket.EditCantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
     EditPrecio.SetFocus;
end;

procedure TFrmModificarLineaTicket.EditDescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
     EditCantidad.SetFocus;
end;

procedure TFrmModificarLineaTicket.EditPrecioChange(Sender: TObject);
begin
   inherited;
   EditPrecioFinal.Value := iRedondeo(EditPrecio.Value - (EditPrecio.Value * EditDescuento.Value / 100), 4); 
end;

procedure TFrmModificarLineaTicket.EditPrecioKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
     BtnAceptarClick(Sender);
end;

procedure TFrmModificarLineaTicket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if key = VK_ESCAPE then
      BtnCancelar.Click;
end;

procedure TFrmModificarLineaTicket.Inicializa(Ticket: TTicket; LineaTicket: TLineaTicket);
begin
   FTicket := Ticket;
   FLinea := LineaTicket;

   if FLinea.Generico then
   begin
      EditDescripcion.ReadOnly := False;
      EditDescripcion.Enabled := True;
      EditDescripcion.Color := clWhite;
      EditDescripcion.FrameColor := $009E6B43;
   end;

   if DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', '') <> '' then
   begin
      lblTitDesglose1.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', '');
      lblTitDesglose1.Visible := True;
      lblDesglose1.Visible := True;
   end
   else
   begin
      lblTitDesglose1.Visible := False;
      lblDesglose1.Visible := False;
   end;

   if DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', '') <> '' then
   begin
      lblTitDesglose2.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', '');
      lblTitDesglose2.Visible := True;
      lblDesglose2.Visible := True;
   end
   else
   begin
      lblTitDesglose2.Visible := False;
      lblDesglose2.Visible := False;
   end;

   LabelDescuento.Visible := (DMVariables.DameVariable('TICKETS.USA_DESCUENTO_EN_LINEA', 'N') = 'S');
   EditDescuento.Visible := LabelDescuento.Visible;
   LabelPrecioFinal.Visible := LabelDescuento.Visible;
   EditPrecioFinal.Visible := LabelDescuento.Visible;   


   pintaLineaTicket;
end;

procedure TFrmModificarLineaTicket.BtnAceptarClick(Sender: TObject);
var
   TipoImpuesto: TTipoImpuesto;
begin
   if EditCantidad.Value = 0 then
   begin
      if EditCantidad.CanFocus then
         EditCantidad.SetFocus;
      raise Exception.Create(STR_DebeEspecificarCantidad);
   end;

   if (EditDescuento.Value < 0) or (EditDescuento.Value > 100) then
   begin
      if EditDescuento.CanFocus then
         EditDescuento.SetFocus;
      raise Exception.Create(STR_DescuentoNoValido);
   end;

   if EditPrecio.Value = 0 then
      if TPVMessageDlg(STR_PrecioCero, mtWarning, mbYesNo, 0) <> mrYes then
      begin
         EditPrecio.SetFocus;
         Abort;
      end;

   FLinea.Cantidad := EditCantidad.Value;
   FLinea.Descuento := EditDescuento.Value;
   FLinea.PVPSinDescuento := EditPrecio.Value;
   if FLinea.Generico then
      FLinea.Desart := EditDescripcion.Text;

   ModalResult := mrOk;
end;

procedure TFrmModificarLineaTicket.pintaLineaTicket;
begin
   lblCodart.Caption := FLinea.Codart;
   EditDescripcion.Text := FLinea.Desart;
   lblDesglose1.Caption := FLinea.Desglose1;
   lblDesglose2.Caption := FLinea.Desglose2;
   EditCantidad.Value := FLinea.Cantidad;
   EditPrecio.Value := FLinea.PVPSinDescuento;
   EditDescuento.Value := FLinea.Descuento;
   EditPrecioFinal.Value := FLinea.PVP;
end;

end.
