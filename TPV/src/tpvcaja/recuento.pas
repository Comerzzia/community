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

unit Recuento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTouchKeyboard, RzButton, Grids, DBGrids, RzDBGrid, StdCtrls, Mask,
  RzEdit, RzPanel, ExtCtrls, ImgList, DataMArticulo, DB, FormBase, RzCommon,
  RzForms, DataMMediosPago, DataMTicket, RzTabs, RzLabel, JvJCLUtils, DataMCaja,
  uMensajeDialog, uEspera, DataMBaseDatos, ActnList;

resourcestring
   STR_SeleccionarPago = 'Debe introducir un importe para poder continuar';
   STR_NoMedioPagoEfectivo = 'No se ha encontrado el medio de pago de Efectivo';
   STR_Cancelar = 'Esta seguro de querer cancelar, se perderá toda la información de pagos';
   STR_EliminarRecuento = '¿Desea eliminar el recuento seleccionado?';
   STR_Salvando = 'Grabando información de recuento';


type
  TBtnMedioPago = class(TRzToolButton)
  public
     MedioPago: TMedioPago;
  end;

  TFrmRecuento = class(TFrmBase)
    S_RECUENTO: TDataSource;
    RzPanel4: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzGroupBox2: TRzGroupBox;
    TecladoNumerico: TAdvTouchKeyboard;
    RzPanel7: TRzPanel;
    RzGroupBox3: TRzGroupBox;
    RzPanel8: TRzPanel;
    GridFormasPagos: TRzDBGrid;
    RzPanel9: TRzPanel;
    BtnAnterior: TRzToolButton;
    BtnSiguiente: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    BtnEliminar: TRzToolButton;
    Shape6: TShape;
    Paginas: TRzPageControl;
    TabEfectivo: TRzTabSheet;
    RzGroupBox4: TRzGroupBox;
    RzPanel5: TRzPanel;
    RzToolButton12: TRzToolButton;
    Shape10: TShape;
    RzToolButton13: TRzToolButton;
    RzToolButton14: TRzToolButton;
    RzToolButton15: TRzToolButton;
    RzToolButton16: TRzToolButton;
    RzToolButton17: TRzToolButton;
    RzToolButton18: TRzToolButton;
    RzToolButton19: TRzToolButton;
    RzToolButton20: TRzToolButton;
    RzToolButton21: TRzToolButton;
    RzToolButton22: TRzToolButton;
    RzToolButton23: TRzToolButton;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    TabContado: TRzTabSheet;
    TabTarjeta: TRzTabSheet;
    TabOtros: TRzTabSheet;
    RzGroupBox7: TRzGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    EditImporte: TRzNumericEdit;
    lblMedioPago: TRzLabel;
    Timer1: TTimer;
    Label6: TLabel;
    Label7: TLabel;
    RzPanel6: TRzPanel;
    Label1: TLabel;
    EditCantidad: TRzNumericEdit;
    RzGroupBox1: TRzGroupBox;
    Label2: TLabel;
    LabelTotal: TRzLabel;
    RZPanel10: TRzPanel;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    ImagenesPagos: TImageList;
    ImagenesMonedas: TImageList;
    ImagenesBilletes: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnMonedaClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure EditImporteKeyPress(Sender: TObject; var Key: Char);
    procedure EditCantidadEnter(Sender: TObject);
    procedure EditCantidadExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditImporteClick(Sender: TObject);
  private
    { Private declarations }
    FCodMedPagEfectivo: String;
    FMedioPagoActivo: TMedioPago;
    FUIDDiarioCaja: String;
    MedioPagoEfectivo: TMedioPago;
    ListaMediosPago: TListaMediosPagoTPV;
    RecuentoCaja: TRecuentoCaja;
    FEditandoCantidad: Boolean;
    procedure BotonMedioClick(Sender: TObject);
    procedure SetMedioPagoActivo(Value: TMedioPago);
    procedure CargarMediosPago;
    procedure RefrescarControles;
    procedure ValidaEntrada;
    procedure ValidaCantidad;
    procedure InsertaRecuento(Cantidad: Integer; Valor: Currency; CodigoMedioPago: String);
    procedure SetEditandoCantidad(Value: Boolean);
    property EditandoCantidad: Boolean read FEditandoCantidad write SetEditandoCantidad;
  public
    { Public declarations }
    DMMPago: TDMMediosPago;
    DMCaja: TDMCaja;
    procedure Inicializa(CodMedPagEfectivo: String; UIDDiarioCaja: String);
    property MedioPagoActivo: TMedioPago read FMedioPagoActivo write SetMedioPagoActivo;
  end;

var
  FrmRecuento: TFrmRecuento;

implementation
uses
   iGeneral;

{$R *.dfm}

procedure TFrmRecuento.FormCreate(Sender: TObject);
begin
   inherited;
   DMMPago := TDMMediosPago.Create(Self);
   DMCaja := TDMCaja.Create(Self);

   RecuentoCaja := TRecuentoCaja.Create(DMCaja);

   ListaMediosPago := TListaMediosPagoTPV.Create(DMMPago);
   ListaMediosPago.BD_Cargar;
end;

procedure TFrmRecuento.FormDestroy(Sender: TObject);
begin
   ListaMediosPago.Free;
   DMMPago.Free;
   DMCaja.Free;
   RecuentoCaja.Free;
   inherited;
end;

procedure TFrmRecuento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if Key = VK_RETURN then
//      ValidaEntrada;

   if Key = VK_RETURN then
   begin
      if EditCantidad.Focused then
      begin
         try
            EditImporte.SetFocus;
         except
         end;
      end
      else
      begin
         if EditImporte.Text <> '' then
         begin
            ValidaEntrada;
         end;
      end;
   end
   else if key = VK_ESCAPE then
      BtnCancelar.Click
   else
      if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_HOME, VK_END] then
      begin
         if not GridFormasPagos.Focused then
         begin
            OnKeyDown := nil;
            try
               SendMessage(GridFormasPagos.Handle, WM_KEYDOWN, key,0);
               SendMessage(GridFormasPagos.Handle, WM_CHAR, key,0);
               SendMessage(GridFormasPagos.Handle, WM_KEYUP, key,0);
            finally
                OnKeyDown := FormKeyDown;
            end;
         end;
      end;
end;

procedure TFrmRecuento.FormKeyPress(Sender: TObject; var Key: Char);
begin
//   if not EditImporte.Focused then
//   begin
//      EditImporte.SetFocus;
//      EditImporte.SelectAll;
//      SendMessage(GetFocus, WM_KEYDOWN, Ord(Key),0);
//      SendMessage(GetFocus, WM_CHAR, Ord(Key),0);
//      SendMessage(GetFocus, WM_KEYUP, Ord(Key),0);
//   end;
   if Ord(key) = 42 then
   begin
      if EditandoCantidad then
      begin
         EditandoCantidad := False;
         EditCantidad.Value := 1;
      end
      else
      begin
         EditandoCantidad := True;
         EditCantidad.Text := '';
      end;
   end;

   if EditandoCantidad then
   begin
      if not EditCantidad.Focused then
      begin
         EditCantidad.SetFocus;
         EditCantidad.SelectAll;
         if Ord(key) <> 42 then
         begin
            SendMessage(GetFocus, WM_KEYDOWN, Ord(Key),0);
            SendMessage(GetFocus, WM_CHAR, Ord(Key),0);
            SendMessage(GetFocus, WM_KEYUP, Ord(Key),0);
         end;
      end;
   end
   else
   begin
      if not EditImporte.Focused then
      begin
         EditImporte.SetFocus;
         EditImporte.SelectAll;
         if Ord(key) <> 42 then
         begin
            SendMessage(GetFocus, WM_KEYDOWN, Ord(Key),0);
            SendMessage(GetFocus, WM_CHAR, Ord(Key),0);
            SendMessage(GetFocus, WM_KEYUP, Ord(Key),0);
         end;
      end;
   end;
end;

procedure TFrmRecuento.FormShow(Sender: TObject);
begin
  inherited;
  try
     EditImporte.SetFocus;
  except
  end;
end;

procedure TFrmRecuento.Inicializa(CodMedPagEfectivo: String; UIDDiarioCaja: String);
begin
   FUIDDiarioCaja := UIDDiarioCaja;
   FCodMedPagEfectivo := CodMedPagEfectivo;

   RecuentoCaja.UsaDataSetPresentacion := True;
   RecuentoCaja.BD_Cargar(FUIDDiarioCaja);
   S_RECUENTO.DataSet := RecuentoCaja.GetDataSetPresentacionLineas;

   CargarMediosPago;
   RefrescarControles;
//   iPintaEnVisor('--- CAJA CERRADA ---', '');
end;

procedure TFrmRecuento.PaginasChange(Sender: TObject);
begin
   inherited;
   if Paginas.ActivePage = TabEfectivo then
      MedioPagoActivo := MedioPagoEfectivo;
end;

procedure TFrmRecuento.BtnAceptarClick(Sender: TObject);
begin
  inherited;
  try
     PonEspera(STR_Salvando, False);
     DMBaseDatos.IniciaTransaccion;
     RecuentoCaja.BD_Salvar;
     DMBaseDatos.CommitTransaccion;
     FinEspera;
     ModalResult := mrOk;
  except
     DMBaseDatos.RollbackTransaccion;
     FinEspera;
     raise;
  end;
end;

procedure TFrmRecuento.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  if S_RECUENTO.DataSet.Active then
  begin
     if Sender = BtnAnterior then
        S_RECUENTO.DataSet.Prior
     else if Sender = BtnSiguiente then
        S_RECUENTO.DataSet.Next;
  end;
  RefrescarControles;
end;

procedure TFrmRecuento.BtnEliminarClick(Sender: TObject);
begin
   inherited;
   if TPVMessageDlg(STR_EliminarRecuento, mtConfirmation, mbYesNo, 0) = mrYes then
   begin
      RecuentoCaja.Lineas.Delete(S_RECUENTO.DataSet.FieldByName('IDX').AsInteger);
      RecuentoCaja.RefrescaPresentacionLineas;
      RefrescarControles;
   end;
end;

procedure TFrmRecuento.CargarMediosPago;
var
   i: Integer;
   Boton: TBtnMedioPago;
   Tarjetas_X, Tarjetas_Y: Integer;
   Contado_X, Contado_Y: Integer;
   Otros_X, Otros_Y: Integer;
   OffSet: Integer;
   nBotonesXFila: Integer;
   nTarjetasBotonesCreados, nContadoBotonesCreados, nOtrosBotonesCreados: Integer;
   lTieneMediosTarjeta, lTieneMediosContado, lTieneMediosOtros: Boolean;
begin
   OffSet := 3;
   Tarjetas_X := 10;
   Tarjetas_Y := 10;
   Contado_X := 10;
   Contado_Y := 10;
   Otros_X := 10;
   Otros_Y := 10;
   nBotonesXFila := 3;
   nTarjetasBotonesCreados := 0;
   nContadoBotonesCreados := 0;
   nOtrosBotonesCreados := 0;
   lTieneMediosTarjeta := False;
   lTieneMediosContado := False;
   lTieneMediosOtros := False;

   for i := 0 to ListaMediosPago.Count - 1 do
   begin
      if ListaMediosPago.Items[i].Codmedpag <> FCodMedPagEfectivo then
      begin
         if ListaMediosPago.Items[i].Tarjeta_credito then
         begin
            Boton := TBtnMedioPago.Create(TabTarjeta);
            Boton.Parent := TabTarjeta;
            Boton.MedioPago := ListaMediosPago.Items[i];
            Boton.Width := 100;
            Boton.Height := 50;
            Boton.Left := Tarjetas_X;
            Boton.Top := Tarjetas_Y;
            Boton.Caption := Boton.MedioPago.Desmedpag;
            Boton.ShowCaption := True;
            Boton.OnClick := BotonMedioClick;
            inc(nTarjetasBotonesCreados);
            Tarjetas_X := Tarjetas_X + Boton.Width + OffSet;
            if nTarjetasBotonesCreados > nBotonesXFila then
            begin
               nTarjetasBotonesCreados := 0;
               Tarjetas_X := 10;
               Tarjetas_Y := Tarjetas_Y + Boton.Height + OffSet;
            end;
            lTieneMediosTarjeta := True;
         end
         else
         if ListaMediosPago.Items[i].Contado then
         begin
            Boton := TBtnMedioPago.Create(TabContado);
            Boton.Parent := TabContado;
            Boton.MedioPago := ListaMediosPago.Items[i];
            Boton.Width := 100;
            Boton.Height := 50;
            Boton.Left := Contado_X;
            Boton.Top := Contado_Y;
            Boton.Caption := Boton.MedioPago.Desmedpag;
            Boton.ShowCaption := True;
            Boton.OnClick := BotonMedioClick;
            inc(nContadoBotonesCreados);
            Contado_X := Contado_X + Boton.Width + OffSet;
            if nContadoBotonesCreados > nBotonesXFila then
            begin
               nContadoBotonesCreados := 0;
               Contado_X := 10;
               Contado_Y := Contado_Y + Boton.Height + OffSet;
            end;
            lTieneMediosContado := True;
         end
         else
         begin
            Boton := TBtnMedioPago.Create(TabOtros);
            Boton.Parent := TabOtros;
            Boton.MedioPago := ListaMediosPago.Items[i];
            Boton.Width := 100;
            Boton.Height := 50;
            Boton.Left := Otros_X;
            Boton.Top := Otros_Y;
            Boton.Caption := Boton.MedioPago.Desmedpag;
            Boton.ShowCaption := True;
            Boton.OnClick := BotonMedioClick;
            inc(nOtrosBotonesCreados);
            Contado_X := Contado_X + Boton.Width + OffSet;
            if nOtrosBotonesCreados > nBotonesXFila then
            begin
               nOtrosBotonesCreados := 0;
               Otros_X := 10;
               Otros_Y := Otros_Y + Boton.Height + OffSet;
            end;
            lTieneMediosOtros := True;
         end;
      end
      else
         MedioPagoEfectivo := ListaMediosPago.Items[i];
   end;

   TabTarjeta.TabVisible := lTieneMediosTarjeta;
   TabContado.TabVisible := lTieneMediosContado;
   TabOtros.TabVisible := lTieneMediosOtros;
   Paginas.ActivePage := TabEfectivo;
   if MedioPagoEfectivo = nil then
   begin
      TabEfectivo.TabVisible := False;
      TPVMessageDlg(STR_NoMedioPagoEfectivo, mtInformation, [mbOK], 0);
   end
   else
      MedioPagoActivo := MedioPagoEfectivo;
end;

procedure TFrmRecuento.EditCantidadEnter(Sender: TObject);
begin
  inherited;
  EditandoCantidad := True;
end;

procedure TFrmRecuento.EditCantidadExit(Sender: TObject);
begin
  inherited;
  ValidaCantidad;
  EditandoCantidad := False;
end;

procedure TFrmRecuento.EditImporteClick(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).SelectAll;
end;

procedure TFrmRecuento.EditImporteKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Ord(key) = 42 then
     Key := Chr(0);
end;

procedure TFrmRecuento.SetMedioPagoActivo(Value: TMedioPago);
begin
   if (Value <> FMedioPagoActivo) and (Value <> nil) then
   begin
      FMedioPagoActivo := Value;
      lblMedioPago.Caption := FMedioPagoActivo.Desmedpag;
      lblMedioPago.Blinking := True;
      Timer1.Enabled := True;
      if FMedioPagoActivo = MedioPagoEfectivo then
         Paginas.ActivePage := TabEfectivo;
   end;
end;

procedure TFrmRecuento.Timer1Timer(Sender: TObject);
begin
   inherited;
   Timer1.Enabled := False;
   lblMedioPago.Blinking := False;
end;

procedure TFrmRecuento.BotonMedioClick(Sender: TObject);
begin
   MedioPagoActivo := TBtnMedioPago(Sender).MedioPago;
end;

procedure TFrmRecuento.RefrescarControles;
begin
   MedioPagoActivo := MedioPagoEfectivo;
   BtnAnterior.Enabled := not S_RECUENTO.DataSet.Bof;
   BtnSiguiente.Enabled := not S_RECUENTO.DataSet.Eof;
   BtnEliminar.Enabled := not (S_RECUENTO.DataSet.Bof and S_RECUENTO.DataSet.Eof);

   LabelTotal.Caption := FormatFloat('###,###,##0.00', RecuentoCaja.TotalRecuento);
end;

procedure TFrmRecuento.InsertaRecuento(Cantidad: Integer; Valor: Currency; CodigoMedioPago: String);
var
   Linea: TLineaRecuentoCaja;
begin
   Linea := RecuentoCaja.Lineas.GetItem(CodigoMedioPago, Valor);
   if Linea = nil then
   begin
      Linea := TLineaRecuentoCaja.Create;
      Linea.UID_diario_caja := FUIDDiarioCaja;
      RecuentoCaja.Lineas.Add(Linea);
      Linea.Cantidad := 0;
      Linea.Codmedpag := MedioPagoActivo.Codmedpag;
      Linea.Desmedpag := MedioPagoActivo.Desmedpag;
   end;

   Linea.Cantidad := Linea.Cantidad + Cantidad;
   Linea.Valor := Valor;
end;

procedure TFrmRecuento.ValidaEntrada;
var
   Valor: Currency;
   Cantidad: Integer;
begin
   try
      Valor := EditImporte.Value;
      Valor := (iRedondeo(Valor, 2));
      Cantidad := EditCantidad.IntValue;

      if (Valor = 0) or (Cantidad = 0) then
         Exit;

      InsertaRecuento(Cantidad, Valor, MedioPagoActivo.Codmedpag);

      EditImporte.Value := 0;
      EditCantidad.Value := 1;
      EditImporte.SelectAll;
   finally
      RecuentoCaja.RefrescaPresentacionLineas;
      RefrescarControles;
   end;
end;

procedure TFrmRecuento.BtnMonedaClick(Sender: TObject);
begin
   EditImporte.Value := (TRzToolButton(Sender).tag / 100);
   ValidaEntrada;
end;

procedure TFrmRecuento.ValidaCantidad;
begin
   EditandoCantidad := False;
   if EditCantidad.Value = 0 then
      EditCantidad.Value := 1
   else
      EditCantidad.Value := iRedondeo(EditCantidad.Value, 2);
end;

procedure TFrmRecuento.SetEditandoCantidad(Value: Boolean);
begin
   if Value <> FEditandoCantidad then
      FEditandoCantidad := Value;

   if FEditandoCantidad then
   begin
      EditImporte.Color := clWindow;
      EditCantidad.Color := $0080FFFF;
   end
   else
   begin
      EditImporte.Color := $0080FFFF;
      EditCantidad.Color := clWindow;
   end;
end;


end.
