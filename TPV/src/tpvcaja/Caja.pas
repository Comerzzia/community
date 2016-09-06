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

unit Caja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, StdCtrls, RzButton, Calendario,
  Grids, DBGrids, RzDBGrid, RzDBEdit, Mask, RzEdit, AdvTouchKeyboard, RzPanel,
  RzTabs, ExtCtrls, DB, BaseGrid, AdvGrid, DBAdvGrid,ImgList, JvJCLUtils, ComCtrls,
  RzLabel, DataMCaja, DataMMediosPago, DataMCliente, recuento, uMensajeDialog,
  ActnList, DataMVariables, DataMBaseDatos, uEspera, DataMContadores, DataMCore,
  uInformeCaja, uInformeTicket, uInformeBoleta, DataMTicket, GridsEh, DBGridEh, DataMTienda,
  DataMMenu;

resourcestring
   STR_Iniciando = 'Iniciando';
   STR_DebeEspecificarFechaApertura = 'Debe indicar una Fecha de Apertura';
   STR_DebeEspecificarSaldoApertura = 'Debe indicar un Saldo de Apertura';
   STR_DebeEspecificarFechaApunte = 'Debe indicar una Fecha de Apunte';
   STR_DebeEspecificarImporteApunte = 'Debe indicar un Importe';
   STR_DebeEspecificarConceptoApunte = 'Debe indicar un Concepto';
   STR_DebeEspecificarFechaCierre = 'Debe indicar una Fecha de Cierre';
   STR_AperturaCaja = 'La apertura de la caja se ha realizado correctamente';
   STR_BorrarLinea = '¿Esta seguro de querer eliminar esta línea de Caja?';
   STR_RealizarCierre = '¿Seguro de realizar el Cierre?';
   STR_CierreOk = 'Cierre realizado correctamente';
   STR_ErrorClienteContado = 'No se ha encontrado la configuración del cliente de contado. Revise la configuración del sistema.';
   STR_ErrorMedioPagoEfectivo = 'No se ha encontrado la configuración del medio de pago de efectivo.';
   STR_MedioPagoEfectivoMalConfigurado = 'Se ha configurado un medio de pago por defecto para efectivo que no corresponde a un medio de pago en efectivo. Revise la configuración de medios de pago';
   STR_NoSePuedeBorrarMovTicket = 'No se pueden eliminar los movimientos de ventas';
   STR_VerificarFecha = 'La fecha de apertura es diferente a la fecha de hoy, ¿desea continuar?';
   STR_DebeCerrarPantallas = 'Esta operación cerrará todas las pantallas abiertas. ¿Desea continuar?';
   STR_CerrarPantallas = 'No se han podido cerrar todas las pantallas abiertas';
   STR_NoSeHaEncontradoCajaCerrada = 'No se encontro la última caja cerrada';
   STR_ImprimiendoUltimaCajaCerrada = 'Imprimiendo el último cierre de caja';
   STR_ImprimiendoCaja = 'Imprimiendo cierre de caja';
   STR_CerrandoCaja = 'Cerrando caja';
   STR_DebeSeleccionarTicket = 'Debe seleccionar un ticket para su reimpresión';
   STR_ReimprimiendoTicket = 'Imprimiendo Ticket';
   STR_NoConfigTienda = 'No se han encontrado los datos de configuración de la tienda';
   STR_FechaCierreMenorQueApertura = 'La fecha de cierre no puede ser inferior a la de apertura';   

type
  TFrmCaja = class(TFrmBase)
    Paginas: TRzPageControl;
    TabCaja: TRzTabSheet;
    RZPanel5: TRzPanel;
    RZPanel10: TRzPanel;
    S_CIERRE: TDataSource;
    RzGroupBox1: TRzGroupBox;
    RzPanel1: TRzPanel;
    F3: TRzToolButton;
    F9: TRzToolButton;
    F10: TRzToolButton;
    F8: TRzToolButton;
    F7: TRzToolButton;
    F2: TRzToolButton;
    F6: TRzToolButton;
    F4: TRzToolButton;
    F5: TRzToolButton;
    F1: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    S_MOVIMIENTOS: TDataSource;
    Label2: TLabel;
    RzPanel3: TRzPanel;
    RzPanel12: TRzPanel;
    RZGroupBox7: TRzGroupBox;
    Label1: TLabel;
    LabelUsuario: TRzLabel;
    S_MOVIMIENTOS_VENTAS: TDataSource;
    PaginasCaja: TRzPageControl;
    TabMovimiento: TRzTabSheet;
    PaginasMovimientos: TRzPageControl;
    TabMov: TRzTabSheet;
    RZGroupBox8: TRzGroupBox;
    RzPanel2: TRzPanel;
    GridMovimientos: TDBGridEh;
    RzPanel6: TRzPanel;
    BtnEliminar: TRzToolButton;
    BtnInicio: TRzToolButton;
    BtnAnterior: TRzToolButton;
    BtnSiguiente: TRzToolButton;
    BtnFin: TRzToolButton;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    TabVentas: TRzTabSheet;
    RzGroupBox2: TRzGroupBox;
    RzPanel9: TRzPanel;
    GridMovimientosVentas: TDBGridEh;
    RzPanel11: TRzPanel;
    BtnInicioMovVentas: TRzToolButton;
    BtnAnteriorMovVentas: TRzToolButton;
    BtnSiguienteMovVentas: TRzToolButton;
    BtnFinMovVentas: TRzToolButton;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    TabAperturaCaja: TRzTabSheet;
    RzGroupBox4: TRzGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    EditSaldoApertura: TRzNumericEdit;
    EditFechaApertura: TRzDateTimeEdit;
    RzPanel14: TRzPanel;
    BtnAbrir: TRzBitBtn;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    TabInsertarApunte: TRzTabSheet;
    RzGroupBox3: TRzGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label15: TLabel;
    lblTipoMovCaja: TLabel;
    EditConceptoApunte: TRzEdit;
    EditImporteApunte: TRzNumericEdit;
    RzPanel13: TRzPanel;
    BtnInsertarApunte: TRzBitBtn;
    AdvTouchKeyboard2: TAdvTouchKeyboard;
    EditDocumentoApunte: TRzEdit;
    TabCierreCaja: TRzTabSheet;
    RzGroupBox5: TRzGroupBox;
    Label11: TLabel;
    Label13: TLabel;
    EditFechaInicioCierre: TRzLabel;
    RzPanel15: TRzPanel;
    BtnCerraCaja: TRzBitBtn;
    EditFechaFinCierre: TRzDateTimeEdit;
    RzPanel7: TRzPanel;
    RzGroupBox6: TRzGroupBox;
    RzPanel4: TRzPanel;
    GridPagos: TDBGridEh;
    RzPanel8: TRzPanel;
    BtnAnteriorResumen: TRzToolButton;
    BtnSiguienteResumen: TRzToolButton;
    Shape11: TShape;
    Shape12: TShape;
    BtnRecuento: TRzToolButton;
    RzPanel16: TRzPanel;
    RzGroupBox10: TRzGroupBox;
    Label18: TLabel;
    EditEntradasMov: TRzLabel;
    Label19: TLabel;
    EditSalidasMov: TRzLabel;
    Label3: TLabel;
    EditEntradasVentas: TRzLabel;
    Label4: TLabel;
    EditTotalEntradas: TRzLabel;
    EditSalidasDev: TRzLabel;
    Label5: TLabel;
    EditTotalSalidas: TRzLabel;
    Label8: TLabel;
    lblEnNTicketsVentas: TLabel;
    lblEnNTicketsDev: TLabel;
    RzGroupBox9: TRzGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    EditTotal: TRzLabel;
    Label12: TLabel;
    EditTotalRecuento: TRzLabel;
    Label14: TLabel;
    EditTotalDescuadre: TRzLabel;
    ImagenesBotones: TImageList;
    Shape18: TShape;
    BtnImprimirMov: TRzToolButton;
    BtnImprimirVentas: TRzToolButton;
    BtnFechaCierre: TRzBitBtn;
    BtnFechaApertura: TRzBitBtn;
    LabelDesUsuario: TRzLabel;
    RzPanel17: TRzPanel;
    Image1: TImage;
    lblEstadoCaja: TLabel;
    AcAbrirCaja: TAction;
    AcMovimientos: TAction;
    AcImprimirUltimoCierre: TAction;
    AcCambiarUsuario: TAction;
    AcCierre: TAction;
    AcInsertarApunte: TAction;
    AcAbrirCajon: TAction;
    AcReimprimirTicket: TAction;
    AcInicio: TAction;
    AcAnterior: TAction;
    AcSiguiente: TAction;
    AcFin: TAction;
    AcEliminarMovimiento: TAction;
    AcConfirmarAbrirCaja: TAction;
    AcConfirmarInsertarApunte: TAction;
    AcConfirmarCerrarCaja: TAction;
    AcRecuento: TAction;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure EditImporteApunteChange(Sender: TObject);
    procedure EditImporteApunteDblClick(Sender: TObject);
    procedure S_MOVIMIENTOSDataChange(Sender: TObject; Field: TField);
    procedure BtnInicioResumenClick(Sender: TObject);
    procedure EditFechaAperturaClick(Sender: TObject);
    procedure EditImporteApunteClick(Sender: TObject);
    procedure BtnFechaCierreClick(Sender: TObject);
    procedure BtnFechaAperturaClick(Sender: TObject);
    procedure AcAbrirCajaExecute(Sender: TObject);
    procedure AcMovimientosExecute(Sender: TObject);
    procedure AcImprimirUltimoCierreExecute(Sender: TObject);
    procedure AcCambiarUsuarioExecute(Sender: TObject);
    procedure AcCierreExecute(Sender: TObject);
    procedure AcInsertarApunteExecute(Sender: TObject);
    procedure AcAbrirCajonExecute(Sender: TObject);
    procedure AcReimprimirTicketExecute(Sender: TObject);
    procedure AcInicioExecute(Sender: TObject);
    procedure AcEliminarMovimientoExecute(Sender: TObject);
    procedure AcConfirmarAbrirCajaExecute(Sender: TObject);
    procedure AcConfirmarInsertarApunteExecute(Sender: TObject);
    procedure AcConfirmarCerrarCajaExecute(Sender: TObject);
    procedure AcRecuentoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    DMC: TDMCaja;
    CajaCab: TCaja;
    MedioPagoEfectivo: TMedioPago;
    InfoTienda: TInfoTienda;
    procedure AbrirCaja;
    procedure InsertarApunte;
    procedure RefrescaGridMovimientos;
    procedure ReiniciaValoresPantalla;
    procedure PintaEstadoCaja;
    procedure RefrescarControles;
    procedure RefrescarControlesCierre;
    function CerrarVentanas: Boolean;
    function GetDataSetParaAcciones: TDataSet;
  public
    { Public declarations }
    class procedure Crea(Titulo: String ; Accion : TMenuItemCargador); override;
    procedure Inicializa; override;
  end;

var
  FrmCaja: TFrmCaja;

implementation

{$R *.dfm}
uses
   iGeneral;

procedure TFrmCaja.AcAbrirCajaExecute(Sender: TObject);
begin
   inherited;
   PaginasCaja.ActivePage := TabAperturaCaja;
   ReiniciaValoresPantalla;
end;

procedure TFrmCaja.AcAbrirCajonExecute(Sender: TObject);
begin
   inherited;
   DMCore.Dispositivos.Cajon.Abrir;
end;

procedure TFrmCaja.AcCambiarUsuarioExecute(Sender: TObject);
begin
   inherited;
   if CerrarVentanas then
   begin
      DMCore.SeleccionUsuario;
      RefrescarControles;
   end;
end;

procedure TFrmCaja.AcCierreExecute(Sender: TObject);
begin
   inherited;
   if CerrarVentanas then
   begin
      ReiniciaValoresPantalla;
      EditFechaInicioCierre.Caption := DateToStr(DMC.BD_DameFechaApertura(DMVariables.CodigoCaja));
      EditFechaFinCierre.Date := Date;

      RefrescarControlesCierre;

      PaginasCaja.ActivePage := TabCierreCaja;
   end;
end;

procedure TFrmCaja.AcConfirmarAbrirCajaExecute(Sender: TObject);
begin
   inherited;
   if EditFechaApertura.Text = '' then
      raise Exception.Create(STR_DebeEspecificarFechaApertura);

   if EditFechaApertura.Date <> Date then
      if TPVMessageDlg(STR_VerificarFecha, mtConfirmation, mbYesNo, 0) <> mrYes then
         Abort;

   try
      DMBaseDatos.IniciaTransaccion;
      AbrirCaja;
      DMBaseDatos.CommitTransaccion;
   except
      DMBaseDatos.RollbackTransaccion;
      raise;
   end;

   TPVMessageDlg(STR_AperturaCaja, mtInformation, [mbOK], 0);
   ReiniciaValoresPantalla;
   CajaCab.BD_Cargar(CajaCab.UID_diario_caja);
   PaginasCaja.ActivePage := TabMovimiento;
   PintaEstadoCaja;
end;

procedure TFrmCaja.AcConfirmarCerrarCajaExecute(Sender: TObject);
var
   Informe: TInformeCaja;
begin
   inherited;

   if StrToDate(DateToStr(CajaCab.Fecha_apertura)) > EditFechaFinCierre.Date then
      raise Exception.Create(STR_FechaCierreMenorQueApertura);

   if CerrarVentanas then
   begin
      if TPVMessageDlg(STR_RealizarCierre, mtConfirmation, mbYesNo, 0) = mrYes then
      begin
         if EditFechaFinCierre.Text = '' then
            raise Exception.Create(STR_DebeEspecificarFechaCierre);

         try
            PonEspera(STR_CerrandoCaja, False);
            DMBaseDatos.IniciaTransaccion;

            // si la fecha de cierre es la de hoy, guardar tambien la hora
            if EditFechaFinCierre.Date = Date then
               CajaCab.Fecha_cierre := Now
            else
               CajaCab.Fecha_cierre := EditFechaFinCierre.Date;

            DMC.BD_CerrarCaja(CajaCab);

            DMBaseDatos.CommitTransaccion;

            try
               PonEspera(STR_ImprimiendoCaja, false);

               Informe := TInformeCaja.Create;
               try
                  CajaCab.GeneraCajaXML;
                  Informe.LeerXMLOrigen(CajaCab.XMLCaja);
                  Informe.ComponerInforme;
               finally
                  Informe.Free;
               end;

            finally
               FinEspera;
            end;

            ReiniciaValoresPantalla;
            PaginasCaja.ActivePage := TabMovimiento;
            PintaEstadoCaja;
         except
            DMBaseDatos.RollbackTransaccion;
            FinEspera;
            raise;
         end;
      end;
   end;
end;

procedure TFrmCaja.AcConfirmarInsertarApunteExecute(Sender: TObject);
begin
   inherited;
   if (EditImporteApunte.Value = 0) or (EditImporteApunte.Value = Null) then
      raise Exception.Create(STR_DebeEspecificarImporteApunte);
   if EditConceptoApunte.Text = '' then
      raise Exception.Create(STR_DebeEspecificarConceptoApunte);

   try
      DMBaseDatos.IniciaTransaccion;
      InsertarApunte;
      DMBaseDatos.CommitTransaccion;
      ReiniciaValoresPantalla;
      RefrescaGridMovimientos;
      Paginas.ActivePage := TabMovimiento;
      PaginasMovimientos.ActivePage := TabMov;
   except
      DMBaseDatos.RollbackTransaccion;
      raise;
   end;
end;

procedure TFrmCaja.AcEliminarMovimientoExecute(Sender: TObject);
begin
  inherited;
   if PaginasCaja.ActivePage = TabMovimiento then
   begin
      if not (S_MOVIMIENTOS.DataSet.Bof and S_MOVIMIENTOS.DataSet.Eof) then
      begin
         if TPVMessageDlg(STR_BorrarLinea, mtConfirmation, mbYesNo, 0) = mrYes then
         begin
            if not (S_MOVIMIENTOS.DataSet.Bof and S_MOVIMIENTOS.DataSet.Eof) then
            begin
               if CajaCab.Lineas.Items[S_MOVIMIENTOS.DataSet.FieldByName('IDX').AsInteger].UIDTicket <> '' then
                  raise Exception.Create(STR_NoSePuedeBorrarMovTicket);
               try
                  DMBaseDatos.IniciaTransaccion;
                  CajaCab.Lineas.Items[S_MOVIMIENTOS.DataSet.FieldByName('IDX').AsInteger].BD_EliminarApunte;
                  CajaCab.Lineas.Delete(S_MOVIMIENTOS.DataSet.FieldByName('IDX').AsInteger);

                  CajaCab.RefrescaPresentacionMov;
                  DMBaseDatos.CommitTransaccion;
               except
                  DMBaseDatos.RollbackTransaccion;
                  raise;
               end;
            end;
         end;
      end;
   end;
end;

procedure TFrmCaja.AcImprimirUltimoCierreExecute(Sender: TObject);
var
   uid: String;
   UltimaCaja: TCaja;
   Informe: TInformeCaja;
begin
   inherited;

   uid := DMC.BD_DameUIDDiarioUltimaCaja(DMVariables.CodigoAlmacen, DMVariables.CodigoCaja);
   if uid = '' then
      raise Exception.Create(STR_NoSeHaEncontradoCajaCerrada)
   else
   begin
      try
         PonEspera(STR_ImprimiendoUltimaCajaCerrada, false);
         UltimaCaja := TCaja.Create(nil);
         Informe := TInformeCaja.Create;
         try
            UltimaCaja.BD_Cargar(uid);
            UltimaCaja.GeneraCajaXML;
            Informe.LeerXMLOrigen(UltimaCaja.XMLCaja);
            Informe.ComponerInforme;
         finally
            UltimaCaja.Free;
            Informe.Free;
         end;
      finally
         FinEspera;
      end;
   end;
end;

procedure TFrmCaja.AcInicioExecute(Sender: TObject);
var
   DataSet: TDataSet;
begin
   inherited;

   DataSet := GetDataSetParaAcciones;
   if DataSet.Active then
   begin
      if Sender = AcInicio then
         DataSet.First
      else if Sender = AcAnterior then
         DataSet.Prior
      else if Sender = AcSiguiente then
         DataSet.Next
      else if Sender = AcFin then
         DataSet.Last;
   end;
end;

procedure TFrmCaja.AcInsertarApunteExecute(Sender: TObject);
begin
   inherited;
   ReiniciaValoresPantalla;
   PaginasCaja.ActivePage := TabInsertarApunte;
   try
      EditImporteApunte.SetFocus;
   except
   end;
end;

procedure TFrmCaja.AcMovimientosExecute(Sender: TObject);
begin
   inherited;
   RefrescaGridMovimientos;
end;

procedure TFrmCaja.AcRecuentoExecute(Sender: TObject);
var
   FrmRec: TFrmRecuento;
begin
   inherited;
   CerrarVentanas;
   FrmRec := TFrmRecuento.Create(Self);
   try
      FrmRec.Inicializa(MedioPagoEfectivo.Codmedpag, CajaCab.UID_diario_caja);
      FrmRec.ShowModal;
      RefrescarControlesCierre;
   finally
      FrmRec.Free;
   end;
end;


procedure TFrmCaja.AcReimprimirTicketExecute(Sender: TObject);
var
   Informe: TInformeTicket;
   InformeBoleta: TInformeBoleta;
   Ticket: TTicket;
begin
   inherited;
   if PaginasMovimientos.ActivePage = TabVentas then
   begin
      if not (S_MOVIMIENTOS_VENTAS.DataSet.Bof and S_MOVIMIENTOS_VENTAS.DataSet.Eof) then
      begin
         try
            PonEspera(STR_ReimprimiendoTicket, False);
            Ticket := TTicket.Create(nil);
            Ticket.BD_CargarXML(S_MOVIMIENTOS_VENTAS.DataSet.FieldByName('UID_TICKET').AsString);
            Informe := TInformeTicket.Create;
            try
               Informe.LeerXMLOrigen(Ticket.XMLTicket);
               if informe.damenodoxml('pagos/operacionTEF/numautorizacion') <> '' then
               begin
                  InformeBoleta := TInformeBoleta.Create;
                  try
                     InformeBoleta.LeerXMLOrigen(Ticket.XMLTicket);
                     InformeBoleta.TipoCopia := 'COPIA';
                     InformeBoleta.ComponerInforme;
                  finally
                     InformeBoleta.Free;
                  end;
               end;
               Informe.ComponerInforme;
            finally
               Informe.Free;
               Ticket.Free;
            end;
         finally
            FinEspera;
         end;
      end
      else
         TPVMessageDlg(STR_DebeSeleccionarTicket, mtInformation, [mbOK], 0);
   end;
end;

procedure TFrmCaja.RefrescarControlesCierre;
var
   DataSet: TDataSet;
begin
   CajaCab.UsaDataSetPresentacionResumen := True;
   CajaCab.CalcularResumenVentas;
   CajaCab.RefrescaPresentacionResumen;
   S_CIERRE.DataSet := CajaCab.GetDataSetPresentacionResumen;
   S_CIERRE.DataSet.First;

   CajaCab.CalcularTotalesCaja;

   EditEntradasMov.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteMovEntradas);
   EditEntradasVentas.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteVenta);
   EditSalidasMov.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteMovSalidas);
   EditSalidasDev.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteDevoluciones);
   EditTotalEntradas.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteTotalEntradas);
   EditTotalSalidas.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteTotalSalidas);
   EditTotal.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteTotalEntradas - CajaCab.TotalesCaja.ImporteTotalSalidas);
   EditTotalRecuento.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteRecuento);
   EditTotalDescuadre.Caption := FormatFloat('###,###,##0.00', CajaCab.TotalesCaja.ImporteRecuento - (CajaCab.TotalesCaja.ImporteTotalEntradas - CajaCab.TotalesCaja.ImporteTotalSalidas));
   lblEnNTicketsVentas.Caption := 'En ' + IntToStr(CajaCab.TotalesCaja.NumeroTicketsVenta) + ' Tickets';
   lblEnNTicketsDev.Caption := 'En ' + IntToStr(CajaCab.TotalesCaja.NumeroTicketsDevoluciones) + ' Tickets';

   DataSet := GetDataSetParaAcciones;
   AcInicio.Enabled := not DataSet.Bof;
   AcSiguiente.Enabled := not DataSet.Eof;
   AcAnterior.Enabled := not DataSet.Bof;
   AcFin.Enabled := not DataSet.Eof;
end;

procedure TFrmCaja.BtnFechaAperturaClick(Sender: TObject);
var
   FrmCalendario: TFrmCalendario;
begin
   FrmCalendario := TFrmCalendario.Create(Self);
   try
      FrmCalendario.Caption := 'Fecha de Apertura';
      FrmCalendario.ShowModal;

      if FrmCalendario.ModalResult = mrOk then
      begin
         EditFechaApertura.Date := FrmCalendario.Calendario.Date;
      end;
   finally
      FrmCalendario.Free;
   end;
end;

procedure TFrmCaja.BtnFechaCierreClick(Sender: TObject);
var
   FrmCalendario: TFrmCalendario;
begin
   FrmCalendario := TFrmCalendario.Create(Self);
   try
      FrmCalendario.Caption := 'Fecha de Cierre';
      FrmCalendario.Calendario.Date := EditFechaFinCierre.Date;
      FrmCalendario.ShowModal;

      if FrmCalendario.ModalResult = mrOk then
      begin
         EditFechaFinCierre.Date := FrmCalendario.Calendario.Date;
      end;
   finally
      FrmCalendario.Free;
   end;
end;

class procedure TFrmCaja.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
   if iAbreSiExiste( Copy( Self.ClassName, 2, 50 ) ) then Exit;

   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);
   PonEspera(STR_Iniciando, False);
   try
      try
         FrmCaja := Self.Create( Application );

         FrmCaja.Caption := Titulo;
         FrmCaja.Accion := Accion;

         FrmCaja.Inicializa;

         FinEspera;
      except
         FrmCaja.Close;
         FinEspera;
         Raise;
      end;
   finally
      FinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmCaja.EditFechaAperturaClick(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).SelectAll;
end;

procedure TFrmCaja.EditImporteApunteChange(Sender: TObject);
begin
   inherited;
   if EditImporteApunte.Value > 0 then
      lblTipoMovCaja.Caption := 'SALIDA DE CAJA'
   else if EditImporteApunte.Value < 0 then
      lblTipoMovCaja.Caption := 'ENTRADA EN CAJA'
   else
      lblTipoMovCaja.Caption := '';
end;

procedure TFrmCaja.EditImporteApunteClick(Sender: TObject);
begin
   inherited;
   TRzEdit(Sender).SelectAll;
end;

procedure TFrmCaja.EditImporteApunteDblClick(Sender: TObject);
begin
  inherited;
  EditImporteApunte.SelectAll;
end;

procedure TFrmCaja.Inicializa;
var
   ClienteEfectivo: TCliente;
begin
   //Iniciar controles visuales
   TabCaja.TabVisible := False;
   TabMovimiento.TabVisible := False;
   TabAperturaCaja.TabVisible := False;
   TabInsertarApunte.TabVisible := False;
   TabCierreCaja.TabVisible := False;
   EditFechaApertura.Date := Date;
   PaginasCaja.ActivePage := TabMovimiento;
   LabelUsuario.Caption := DMVariables.CodigoUsuario;
   LabelDesUsuario.Caption := DMVariables.NombreUsuario;
   PaginasMovimientos.ActivePage := TabMov;

   SetAcciones;

   //Iniciar clases de datos
   DMC := TDMCaja.Create(Self);
   CajaCab := TCaja.Create(DMC);
   //Label Estado Caja
   PintaEstadoCaja;

   //Iniciar Dataset
   CajaCab.UsaDataSetPresentacion := True;
   S_MOVIMIENTOS.DataSet := CajaCab.GetDataSetPresentacionMov;
   S_MOVIMIENTOS_VENTAS.DataSet := CajaCab.GetDataSetPresentacionMovVentas;

   //Carga de Datos
   CajaCab.UID_diario_caja := DMC.BD_DameUIDDiarioCajaAbierta(DMVariables.CodigoAlmacen, DMVariables.CodigoCaja);
   RefrescaGridMovimientos;

   InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
   if InfoTienda.Desalm = '' then
      raise Exception.Create(STR_NoConfigTienda);
   

   //Obtener el medio de pago por defecto
   ClienteEfectivo := TCliente.Create(nil);
   try
      ClienteEfectivo.BD_Cargar(InfoTienda.ClientePorDefecto);
      if ClienteEfectivo.Cif = '' then
         raise Exception.Create(STR_ErrorClienteContado);

      MedioPagoEfectivo := TMedioPago.Create(nil);
      MedioPagoEfectivo.BD_Cargar(ClienteEfectivo.Codmedpag);
      if MedioPagoEfectivo.Codmedpag = '' then
         raise Exception.Create(STR_ErrorMedioPagoEfectivo)
      else
         if not (MedioPagoEfectivo.Efectivo) then
            raise Exception.Create(STR_MedioPagoEfectivoMalConfigurado);
   finally
      ClienteEfectivo.Free;
   end;
end;

procedure TFrmCaja.PintaEstadoCaja;
begin
   if DMC.BD_DameUIDDiarioCajaAbierta(DMVariables.CodigoAlmacen, DMVariables.CodigoCaja) = '' then
   begin
      lblEstadoCaja.Caption := 'Caja CERRADA';
      AcInsertarApunte.Enabled := False;
      AcCierre.Enabled := False;
      AcAbrirCaja.Enabled := True;
      AcRecuento.Enabled := False;
   end
   else
   begin
      lblEstadoCaja.Caption := 'Caja ABIERTA';
      AcInsertarApunte.Enabled := True;
      AcCierre.Enabled := True;
      AcAbrirCaja.Enabled := False;
      AcRecuento.Enabled := True;
   end;
end;

procedure TFrmCaja.BtnInicioResumenClick(Sender: TObject);
begin
  inherited;
   if S_CIERRE.DataSet.Active then
   begin
      if Sender = BtnAnteriorResumen then
         S_CIERRE.DataSet.Prior
      else if Sender = BtnSiguienteResumen then
         S_CIERRE.DataSet.Next;
   end;
end;

procedure TFrmCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;


procedure TFrmCaja.FormDestroy(Sender: TObject);
begin
   DMC.Free;
   CajaCab.Free;
   MedioPagoEfectivo.Free;
   InfoTienda.Free;
end;

procedure TFrmCaja.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   Grid: TDBGridEh;
begin
   inherited;

   if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_HOME, VK_END] then
   begin
      Grid := nil;
      if PaginasCaja.ActivePage = TabMovimiento then
      begin
         if PaginasMovimientos.ActivePage = TabMov then
            Grid := GridMovimientos
         else
            Grid := GridMovimientosVentas
      end
      else
         if PaginasCaja.ActivePage = TabCierreCaja then
            Grid := GridPagos;

      if Grid <> nil then
      begin
         if not Grid.Focused then
         begin
            OnKeyDown := nil;
            try
               SendMessage(Grid.Handle, WM_KEYDOWN, key,0);
               SendMessage(Grid.Handle, WM_CHAR, key,0);
               SendMessage(Grid.Handle, WM_KEYUP, key,0);
            finally
                OnKeyDown := FormKeyDown;
            end;
         end;
      end;
   end;
end;

procedure TFrmCaja.AbrirCaja;
begin
   CajaCab.UID_diario_caja := DMContador.DameGUID;
   CajaCab.Codalm := DMVariables.CodigoAlmacen;
   CajaCab.Codcaja := DMVariables.CodigoCaja;
   CajaCab.Id_Usuario := DMVariables.UsuarioIDU;

   // si la fecha de apertura es la de hoy, incluir hora
   if EditFechaApertura.Date = Date then
      CajaCab.Fecha_apertura := Now
   else
      CajaCab.Fecha_apertura := EditFechaApertura.Date;

   CajaCab.BD_Abrir_Caja(CajaCab.UID_diario_caja, CajaCab.Fecha_apertura, EditSaldoApertura.Value);
end;

procedure TFrmCaja.InsertarApunte;
var
   Apunte: TLineaCaja;
begin
   Apunte := TLineaCaja.Create(DMC);
   Apunte.UID_diario_caja := DMC.BD_DameUIDDiarioCajaAbierta(DMVariables.CodigoAlmacen, DMVariables.CodigoCaja);
   Apunte.linea := DMC.BD_DameNuevaLinea(DMC.BD_DameUIDDiarioCajaAbierta(DMVariables.CodigoAlmacen, DMVariables.CodigoCaja));
   Apunte.Fecha := Now;
   Apunte.Entrada := 0;
   Apunte.Salida := 0;
   if EditImporteApunte.Value > 0 then
      Apunte.Salida := Abs(EditImporteApunte.Value)
   else
      Apunte.Entrada := Abs(EditImporteApunte.Value);
   Apunte.Concepto := EditConceptoApunte.Text;
   Apunte.Documento := EditDocumentoApunte.Text;
   Apunte.Codmedpag := MedioPagoEfectivo.Codmedpag;
   CajaCab.Lineas.Add(Apunte);
   Apunte.BD_InsertarApunte;
end;

procedure TFrmCaja.RefrescaGridMovimientos;
begin
   CajaCab.BD_Cargar(CajaCab.UID_diario_caja);
   PaginasCaja.ActivePage := TabMovimiento;
end;

procedure TFrmCaja.ReiniciaValoresPantalla;
begin
   //Apertura Caja
   EditFechaApertura.Date := Date;
   EditSaldoApertura.Value := 0;

   //Insertar Movimientos
   EditImporteApunte.Value := 0;
   EditConceptoApunte.Text := '';
   EditDocumentoApunte.Text := '';
end;

procedure TFrmCaja.S_MOVIMIENTOSDataChange(Sender: TObject; Field: TField);
begin
  inherited;
   if Field = nil then
      RefrescarControles;
end;

procedure TFrmCaja.RefrescarControles;
var
   DataSet: TDataSet;
begin
   LabelUsuario.Caption := DMVariables.CodigoUsuario;
   LabelDesUsuario.Caption := DMVariables.NombreUsuario;

   DataSet := GetDataSetParaAcciones;
   AcInicio.Enabled := not DataSet.Bof;
   AcSiguiente.Enabled := not DataSet.Eof;
   AcAnterior.Enabled := not DataSet.Bof;
   AcFin.Enabled := not DataSet.Eof;

   AcReimprimirTicket.Enabled := not (S_MOVIMIENTOS_VENTAS.DataSet.Bof and S_MOVIMIENTOS_VENTAS.DataSet.Eof);

   if not (S_MOVIMIENTOS.DataSet.Bof and S_MOVIMIENTOS.DataSet.Eof) then
   begin
      AcEliminarMovimiento.Enabled := (S_MOVIMIENTOS.DataSet.FieldByName('UID_TICKET').AsString = '');
   end
   else
   begin
      AcEliminarMovimiento.Enabled := False;
   end;
end;

function TFrmCaja.CerrarVentanas: Boolean;
begin
   result := False;
   if iOtrasVentanasAbiertas(Self) then
   begin
      if TPVMessageDlg(STR_DebeCerrarPantallas, mtConfirmation, mbYesNo, 0) = mrYes then
      begin
          iCerrarOtrasVentanas(Self);
          if iOtrasVentanasAbiertas(Self) then
             raise Exception.Create(STR_CerrarPantallas)
          else
             result := True;
      end
      else
         result := False;
   end
   else
      result := True;
end;

function TFrmCaja.GetDataSetParaAcciones: TDataSet;
var
   DataSet: TDataSet;
begin
   DataSet := S_MOVIMIENTOS.DataSet;
   if PaginasCaja.ActivePage = TabMovimiento then
   begin
      if PaginasMovimientos.ActivePage = TabMov then
         DataSet := S_MOVIMIENTOS.DataSet
      else
         DataSet := S_MOVIMIENTOS_VENTAS.DataSet;
   end
   else
      if PaginasCaja.ActivePage = TabCierreCaja then
         DataSet := S_CIERRE.DataSet;
   result := DataSet;
end;

initialization
   RegisterClass(TFrmCaja);

end.
