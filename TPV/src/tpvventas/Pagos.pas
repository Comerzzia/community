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

unit Pagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTouchKeyboard, RzButton, Grids, DBGrids, RzDBGrid, StdCtrls, Mask,
  RzEdit, RzPanel, ExtCtrls, ImgList, DataMArticulo, DB, FormBase, RzCommon,
  RzForms, DataMMediosPago, DataMTicket, RzTabs, RzLabel, JvJCLUtils, DataMCaja,
  uMensajeDialog, uEspera, DataMBaseDatos, DataMVariables, DataMContadores, DataMCore,
  GridsEh, DBGridEh, ActnList, DataMCliente;

resourcestring
   STR_SeleccionarPago = 'Debe introducir un importe para poder continuar';
   STR_NoMedioPagoEfectivo = 'No se ha encontrado el medio de pago de Efectivo';
   STR_Cancelar = 'Esta seguro de querer cancelar, se perderá toda la información de pagos';
   STR_EliminarPagos = '¿Desea eliminar los pagos efectuados?';
   STR_DebeEspecificarPago = 'Debe especificar los medios de pago del ticket. Importe Pendiente: %n';
   STR_Salvando = 'Grabando ticket';
   STR_OperacionCorrecta = 'Compruebe que la impresión de la boleta es correcta, si es correcto pulse OK, en caso contrario pulse NO';
   STR_OperacionCancelada = 'OPERACION CANCELADA';
   STR_RealizandoOperacionTarjeta = 'Realizando operación de tarjeta';
   STR_ConfirmandoOperacion = 'Confirmando Operación';
   STR_CancelandoOperacion = 'Cancelando Operación';
   STR_OperacionConfirmada = 'Operación Confirmada';
   STR_ErrorInternoDispositivo = 'Se ha producido un error interno en el dispositivo de tarjetas (AV)';

type
  TBtnMedioPago = class(TRzToolButton)
  public
     MedioPago: TMedioPago;
  end;

  TFrmPagos = class(TFrmBase)
    ImagenesPagos: TImageList;
    S_PAGOS: TDataSource;
    ImagenesMonedas: TImageList;
    RzPanel4: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    RzGroupBox2: TRzGroupBox;
    TecladoNumerico: TAdvTouchKeyboard;
    RzPanel7: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    RzGroupBox3: TRzGroupBox;
    RzPanel8: TRzPanel;
    GridFormasPagos: TDBGridEh;
    RzPanel9: TRzPanel;
    BtnAnterior: TRzToolButton;
    BtnSiguiente: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    ImagenesBilletes: TImageList;
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
    LabelTotal: TRzLabel;
    LabelEntregado: TRzLabel;
    LabelPendiente: TRzLabel;
    LabelCambio: TRzLabel;
    Label7: TLabel;
    RzPanel6: TRzPanel;
    RZPanel10: TRzPanel;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnMonedaClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditImporteClick(Sender: TObject);
  private
    { Private declarations }
    FTicket: TTicket;
    FCliente: TCliente;
    FCodMedPagEfectivo: String;
    FMedioPagoActivo: TMedioPago;
    FUIDDiarioCaja: String;
    MedioPagoEfectivo: TMedioPago;
    ListaMediosPago: TListaMediosPagoTPV;
    procedure BotonMedioClick(Sender: TObject);
    procedure SetMedioPagoActivo(Value: TMedioPago);
    procedure CargarMediosPago;
    procedure RefrescarControles;
    procedure SalvaTicket;
    procedure InsertaPago(Valor: Extended; CodigoMedioPago: String; SumaAEntregado: Boolean);
    function IsDevolucion: Boolean;
    procedure EliminaPagos;
    function DameImporteTarjeta: Currency;
  public
    { Public declarations }
    DMMPago: TDMMediosPago;
    DMCaja: TDMCaja;
    procedure ValidaEntrada;
    procedure Inicializa(Ticket: TTicket; CodMedPagEfectivo: String; UIDDiarioCaja: String; Cliente: TCliente);
    property MedioPagoActivo: TMedioPago read FMedioPagoActivo write SetMedioPagoActivo;
  end;

var
  FrmPagos: TFrmPagos;

implementation
uses iGeneral;

{$R *.dfm}

procedure TFrmPagos.FormCreate(Sender: TObject);
begin
   inherited;
   DMMPago := TDMMediosPago.Create(Self);
   DMCaja := TDMCaja.Create(Self);
   ListaMediosPago := TListaMediosPagoTPV.Create(DMMPago);
   ListaMediosPago.BD_Cargar;
end;

procedure TFrmPagos.FormDestroy(Sender: TObject);
begin
   ListaMediosPago.Free;
   DMMPago.Free;
   DMCaja.Free;
   inherited;
end;

procedure TFrmPagos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_ESCAPE then
      BtnCancelar.Click
   else
   if Key = VK_RETURN then
      ValidaEntrada
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

procedure TFrmPagos.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if not EditImporte.Focused then
   begin
      EditImporte.SetFocus;
      EditImporte.SelectAll;
      SendMessage(GetFocus, WM_KEYDOWN, Ord(Key),0);
      SendMessage(GetFocus, WM_CHAR, Ord(Key),0);
      SendMessage(GetFocus, WM_KEYUP, Ord(Key),0);
   end;
end;

procedure TFrmPagos.FormShow(Sender: TObject);
begin
  inherited;
  try
     EditImporte.SetFocus;
  except
  end;
end;

procedure TFrmPagos.Inicializa(Ticket: TTicket; CodMedPagEfectivo: String; UIDDiarioCaja: String; Cliente: TCliente);
begin
   FTicket := Ticket;
   FCliente := Cliente;
   FCodMedPagEfectivo := CodMedPagEfectivo;
   FUIDDiarioCaja := UIDDiarioCaja;
   S_PAGOS.DataSet := FTicket.GetDataSetPresentacionPagos;
   CargarMediosPago;

   FTicket.RefrescaPresentacionPagos;
   RefrescarControles;
   DMCore.Dispositivos.Visor.Pintar('TOTAL A PAGAR', iSpace(10 - Length(CurrToStrF(FTicket.Total, ffCurrency, 2))) + CurrToStrF(FTicket.Total, ffCurrency, 2));
end;

procedure TFrmPagos.PaginasChange(Sender: TObject);
begin
   inherited;
   if Paginas.ActivePage = TabEfectivo then
      MedioPagoActivo := MedioPagoEfectivo;
end;

procedure TFrmPagos.BtnAceptarClick(Sender: TObject);
var
   ImporteTarjeta: Currency;
   ResultadoOperacionTarjeta: String;
begin
   inherited;
   ImporteTarjeta := 0;
   if FTicket.TotalPendiente = 0 then
   begin
      //Si es una operacion de tarjeta
      ImporteTarjeta := DameImporteTarjeta;
      if ImporteTarjeta <> 0 then
      begin
         PonEspera(STR_RealizandoOperacionTarjeta, False);
         DMCore.Dispositivos.Tarjeta.IniciaTransaccion;
         try
            //Rellenar los datos que requiere la operacion de tarjeta
            FTicket.OperacionTEF.Importe := ImporteTarjeta;
            if IsDevolucion then
               FTicket.OperacionTEF.TipoTransaccion := 'd'
            else
               FTicket.OperacionTEF.TipoTransaccion := 'v';
            FTicket.OperacionTEF.CodigoCajera := iif(DMVariables.UsuarioIDU = 0, 1, DMVariables.UsuarioIDU);
            //Pedir numero de ticket ahora pues hace falta para la operacion de tarjeta
            if FTicket.IdTicket = -1 then
            begin
               try
                  DMBaseDatos.IniciaTransaccion;
                  FTicket.IdTicket := DMContador.DameContadorTicket;
                  DMBaseDatos.CommitTransaccion;
               except
                  DMBaseDatos.RollBackTransaccion;
                  FinEspera;
                  raise;
               end;
            end;
            FTicket.OperacionTEF.Ticket := IntToStr(FTicket.IdTicket);
            FTicket.OperacionTEF.TipoMoneda := '1'; //1 euro 0 pesetas

            //Realizar la operacion de tarjeta
            ResultadoOperacionTarjeta := DMCore.Dispositivos.Tarjeta.RealizaTransaccion(FTicket.OperacionTEF);
         except
            on E: EAccessViolation do
            begin
               DMCore.Dispositivos.Tarjeta.FinalizaTransaccion(False);
               FinEspera;
               raise Exception.Create(STR_OperacionCancelada + #13#10 + STR_ErrorInternoDispositivo);
            end;
            on E: Exception do
            begin
               DMCore.Dispositivos.Tarjeta.FinalizaTransaccion(False);
               FinEspera;
               raise Exception.Create(STR_OperacionCancelada + #13#10 + E.Message);
            end;
         end;
         if ResultadoOperacionTarjeta = 'NOCONFIGLECTORTARJETA' then
         begin
            //No hace nada puesto que usa lector externo
         end
         else
         begin //TEF o similares
            if (ResultadoOperacionTarjeta <> '') then
            begin
               DMCore.Dispositivos.Tarjeta.FinalizaTransaccion(False);
               FinEspera;
               raise Exception.Create(STR_OperacionCancelada + #13#10 + ResultadoOperacionTarjeta);
            end;
            if Trim(FTicket.OperacionTEF.NumAutorizacion) = '' then
            begin
               DMCore.Dispositivos.Tarjeta.FinalizaTransaccion(False);
               FinEspera;
               raise Exception.Create(STR_OperacionCancelada + #13#10 + 'Error interno del lector');
            end;
         end;
      end;

      //Salvar el ticket
      try
         PonEspera(STR_Salvando, False);
         DMBaseDatos.IniciaTransaccion;
         SalvaTicket;
         DMBaseDatos.CommitTransaccion;
         if ImporteTarjeta <> 0 then
            DMCore.Dispositivos.Tarjeta.FinalizaTransaccion(True);
         FinEspera;
         ModalResult := mrOk;
      except on E: Exception do
         begin
            DMBaseDatos.rollbackTransaccion;
            if ImporteTarjeta <> 0 then
               DMCore.Dispositivos.Tarjeta.FinalizaTransaccion(False);

   //         FTicket.IdTicket := -1;
            FinEspera;
            raise Exception.Create(STR_OperacionCancelada + #13#10 + E.Message);
         end;
      end;
   end
   else
   begin
      try
         EditImporte.SetFocus;
      except
      end;

      raise Exception.Create(Format(STR_DebeEspecificarPago, [FTicket.TotalPendiente]));
   end;
end;

procedure TFrmPagos.BtnAnteriorClick(Sender: TObject);
begin
  inherited;
  if S_PAGOS.DataSet.Active then
  begin
     if Sender = BtnAnterior then
        S_PAGOS.DataSet.Prior
     else if Sender = BtnSiguiente then
        S_PAGOS.DataSet.Next;
  end;
end;

procedure TFrmPagos.BtnCancelarClick(Sender: TObject);
begin
   inherited;
   if FTicket.Pagos.Count > 0 then
   begin
      if TPVMessageDlg(STR_Cancelar, mtConfirmation, mbYesNo, 0) = mrYes then
      begin
         EliminaPagos;
         ModalResult := mrCancel;
      end;
   end
   else
      ModalResult := mrCancel;
end;

procedure TFrmPagos.BtnEliminarClick(Sender: TObject);
begin
   inherited;
   if TPVMessageDlg(STR_EliminarPagos, mtConfirmation, mbYesNo, 0) = mrYes then
      EliminaPagos;
end;

procedure TFrmPagos.EliminaPagos;
begin
   FTicket.Pagos.Clear;
   FTicket.TotalEntregado := 0;
   FTicket.RefrescaPresentacionPagos;
   RefrescarControles;
end;

procedure TFrmPagos.CargarMediosPago;
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
            if ListaMediosPago.Items[i].Contado or (not ListaMediosPago.Items[i].Contado and FCliente.VentaACredito) then
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
            end;
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
            if FCliente.VentaACredito then
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

procedure TFrmPagos.EditImporteClick(Sender: TObject);
begin
   inherited;
   EditImporte.SelectAll;
end;

procedure TFrmPagos.SetMedioPagoActivo(Value: TMedioPago);
begin
   if (Value <> FMedioPagoActivo) and (Value <> nil) then
   begin
      FMedioPagoActivo := Value;
      lblMedioPago.Caption := FMedioPagoActivo.Desmedpag;
      lblMedioPago.Blinking := True;
      Timer1.Enabled := True;
      if FMedioPagoActivo = MedioPagoEfectivo then
         Paginas.ActivePage := TabEfectivo;
      if FMedioPagoActivo.Tarjeta_credito then
      begin
         EditImporte.Value := FTicket.TotalPendiente;
         EditImporte.ReadOnly := True;
      end
      else
         EditImporte.ReadOnly := False;
   end;
end;

procedure TFrmPagos.Timer1Timer(Sender: TObject);
begin
   inherited;
   Timer1.Enabled := False;
   lblMedioPago.Blinking := False;
end;

procedure TFrmPagos.BotonMedioClick(Sender: TObject);
begin
   MedioPagoActivo := TBtnMedioPago(Sender).MedioPago;
end;

procedure TFrmPagos.RefrescarControles;
begin
   LabelTotal.Caption := FormatFloat('###,###,##0.00', FTicket.Total);
   LabelEntregado.Caption := FormatFloat('###,###,##0.00', FTicket.TotalEntregado);
   LabelPendiente.Caption := FormatFloat('###,###,##0.00', FTicket.TotalPendiente);
   if FTicket.TotalPendiente <> 0 then
   begin
      LabelPendiente.Color := clYellow;
      LabelPendiente.Font.Color := clBlack;
   end
   else
   begin
      LabelPendiente.Color := $00EEEEEE;
      LabelPendiente.Font.Color := $00C15800;
   end;

   LabelCambio.Caption := FormatFloat('###,###,##0.00', FTicket.Cambio);
   MedioPagoActivo := MedioPagoEfectivo;
   BtnAnterior.Enabled := not S_PAGOS.DataSet.Bof;
   BtnSiguiente.Enabled := not S_PAGOS.DataSet.Eof;
   BtnEliminar.Enabled := not (S_PAGOS.DataSet.Bof and S_PAGOS.DataSet.Eof);
end;

procedure TFrmPagos.InsertaPago(Valor: Extended; CodigoMedioPago: String; SumaAEntregado: Boolean);
var
   Pago: TPagoTicket;
begin
   Pago := FTicket.Pagos.GetItem(CodigoMedioPago);
   if Pago = nil then
   begin
      Pago := TPagoTicket.Create(FTicket);
      FTicket.Pagos.Add(Pago);
      Pago.Codmedpag := MedioPagoActivo.Codmedpag;
      Pago.Desmedpag := MedioPagoActivo.Desmedpag;
      Pago.Tarjeta_credito := MedioPagoActivo.Tarjeta_credito;
   end;

   Pago.Importe := Pago.Importe + Valor;
   if SumaAEntregado then
      FTicket.TotalEntregado := FTicket.TotalEntregado + Valor;
end;

procedure TFrmPagos.ValidaEntrada;
var
   Valor: Extended;
begin
   try
      Valor := EditImporte.Value;
      if IsDevolucion then
         Valor := Valor * -1;
      Valor := (iRedondeo(Valor, 2));

      if Valor = 0 then
         Exit;

      InsertaPago(Valor, MedioPagoActivo.Codmedpag, True);

      EditImporte.Value := 0;
      EditImporte.SelectAll;
   finally
      FTicket.RefrescaPresentacionPagos;
      RefrescarControles;
   end;
end;

procedure TFrmPagos.BtnMonedaClick(Sender: TObject);
begin
   EditImporte.Value := (TRzToolButton(Sender).tag / 100);
   ValidaEntrada;
end;

procedure TFrmPagos.SalvaTicket;
var
   i: Integer;
   LineaCaja: TLineaCaja;
begin
   FTicket.Codserie := DMVariables.CodigoTienda;
   FTicket.Codcaja := DMVariables.CodigoCaja;
   if FTicket.UIDTicket = '' then
      FTicket.UIDTicket := DMContador.dameGUID;
   if FTicket.IdTicket = -1 then
      FTicket.IdTicket := DMContador.DameContadorTicket;

   FTicket.Fecha := now;
   FTicket.Tienda := DMVariables.CodigoTienda;
   FTicket.id_usuario := DMVariables.UsuarioIDU;
   FTicket.DesUsuario := DMVariables.NombreUsuario;

   //Insertar la entrada del cambio
   if FTicket.Cambio > 0 then
      InsertaPago(-1 * FTicket.Cambio, MedioPagoEfectivo.Codmedpag, False);

   //Borra los pagos a 0
   for i := FTicket.Pagos.Count - 1 downto 0 do
   begin
      if FTicket.Pagos.Items[i].Importe = 0 then
         FTicket.Pagos.Delete(i);
   end;

   //Si el ticket vale 0 meter un apunte efectivo a 0
   if FTicket.Total = 0 then
   begin
      InsertaPago(0, MedioPagoEfectivo.Codmedpag, True);
   end;

   FTicket.GeneraTicketXML;
   FTicket.BD_SalvarXML;

   //Grabar los pagos
   LineaCaja := TLineaCaja.Create(DMCaja);
   try
      for i := 0 to FTicket.Pagos.Count - 1 do
      begin
         LineaCaja.UID_diario_caja := FUIDDiarioCaja;
         LineaCaja.linea := DMCaja.BD_DameNuevaLinea(DMCaja.BD_DameUIDDiarioCajaAbierta(DMVariables.CodigoTienda, DMVariables.CodigoCaja));
         LineaCaja.Fecha := FTicket.Fecha;
         if  IsDevolucion then
         begin
            LineaCaja.Entrada := 0;
            LineaCaja.Salida := Abs(FTicket.Pagos.Items[i].Importe);
         end
         else
         begin
            if FTicket.Pagos.Items[i].Importe < 0 then
            begin
               LineaCaja.Entrada := 0;
               LineaCaja.Salida := Abs(FTicket.Pagos.Items[i].Importe);
            end
            else
            begin
               LineaCaja.Entrada := Abs(FTicket.Pagos.Items[i].Importe);
               LineaCaja.Salida := 0;
            end;
         end;
         LineaCaja.Concepto := 'Ticket nº ' + IntToStr(FTicket.idTicket);
         LineaCaja.Documento := IntToStr(FTicket.idTicket);
         lineaCaja.UIDTicket := FTicket.UIDTicket;
         LineaCaja.Codmedpag := FTicket.Pagos.Items[i].Codmedpag;
         LineaCaja.BD_InsertarApunte;
      end;
   finally
      LineaCaja.Free;
   end;
end;

function TFrmPagos.IsDevolucion: Boolean;
begin
   result :=  (FTicket.Total < 0);
end;

function TFrmPagos.DameImporteTarjeta: Currency;
var
   i: Integer;
   ImporteTarjeta: Currency;
begin
   ImporteTarjeta := 0;
   for i := 0 to FTicket.Pagos.Count - 1 do
   begin
      if FTicket.Pagos.items[i].Tarjeta_credito then
      begin
         ImporteTarjeta := FTicket.Pagos.items[i].Importe;
         Break;
      end;
   end;
   result := ImporteTarjeta;
end;

end.
