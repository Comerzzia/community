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

unit Ticket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, DataMBase, DataMTicket, DataMArticulo, DataMCodigoBarras,
  StdCtrls, RzButton, Grids, DBGrids, RzDBGrid, RzDBEdit, Mask, RzEdit, uMensajeDialog,
  AdvTouchKeyboard, RzPanel, RzTabs, ExtCtrls, DB, BaseGrid, AdvGrid, DBAdvGrid,
  ImgList, ComCtrls, RzLabel, DataMTarifas, DataMCliente, DataMMediosPago, ModificarLinea, DataMCaja, DataMTienda,
  ActnList, DataMVariables, uEspera, DataMBaseDatos, DataMConfiguracionDispositivos, DataMCore, uInformeTicket,
  GridsEh, DBGridEh, FramArticulos, uInformeBoleta, DataMMenu;

resourcestring
   STR_Iniciando = 'Iniciando';
   STR_BorrarLinea = '¿Esta seguro de querer eliminar esta línea del ticket?';
   STR_TicketsAparcados = 'Tickets aparcados: %d';
   STR_NoHayTicketsAparcados = 'No hay tickets aparcados';
   STR_ErrorClienteContado = 'No se ha encontrado la configuración del cliente de contado. La pantalla de ventas se cerrará. Revise la configuración del sistema.';
   STR_ErrorMedioPagoEfectivo = 'No se ha encontrado la configuración del medio de pago de efectivo.';
   STR_MedioPagoEfectivoMalConfigurado = 'Se ha configurado un medio de pago por defecto para efectivo que no corresponde a un medio de pago en efectivo. Revise la configuración de medios de pago';
   STR_PrecioNoEncontrado = 'El artículo %s %s no ha sido tarificado, ¿Desea grabar la línea del ticket a precio 0?';
   STR_LineaNoEncontrada = 'No se ha encontrado la línea de ticket a modificar';
   STR_ErrorApertura = 'Se ha producido un error al abrir la caja. La pantalla de ventas se cerrará';
   STR_AbriendoCaja = 'Abriendo Caja';
   STR_NoConfigTienda = 'No se han encontrado los datos de configuración de la tienda';
   STR_Imprimiendo = 'Imprimiendo ticket';
   STR_DebeCerrarPantallas = 'Esta operación cerrarán todas las pantallas abiertas. ¿Desea continuar?';
   STR_CerrarPantallas = 'No se han podido cerrar todas las pantallas abiertas';
   STR_TicketsPendientes = 'Existen datos de TICKETS PENDIENTES de aceptar. Si cierra la pantalla de ventas se perderán. ¿Desea continuar?';
   STR_ClienteInactivo = 'El cliente %s esta inactivo.';
   STR_ArticuloInactivo = 'El artículo esta inactivo y no se puede vender';
   STR_NoSePuedeCambiarCliente = 'No se puede cambiar el cliente de un ticket con líneas.';
   STR_ErrorDescomponerCodBarras = 'Se ha producido un error al intentar descomponer el Código según la configuración de Codigos de Barras';
   STR_CantidadMayorCero = 'Debe especificar una cantidad mayor que 0';
   STR_VerificaTicket = '¿Es correcta la impresión del recibo de pago con tarjeta?';

type
  TFrmTicket = class(TFrmBase)
    Paginas: TRzPageControl;
    TabVenta: TRzTabSheet;
    RZPanel4: TRzPanel;
    RzPanel14: TRzPanel;
    RzGroupBox2: TRzGroupBox;
    RzPanel15: TRzPanel;
    RzGroupBox4: TRzGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    RZPanel5: TRzPanel;
    RZPanel8: TRzPanel;
    RZGroupBox7: TRzGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    RZPanel9: TRzPanel;
    RZGroupBox8: TRzGroupBox;
    RzPanel2: TRzPanel;
    RZPanel10: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel12: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    S_LINEAS: TDataSource;
    ImagenesBotones: TImageList;
    RzPanel13: TRzPanel;
    F3: TRzToolButton;
    F1: TRzToolButton;
    F8: TRzToolButton;
    F9: TRzToolButton;
    F2: TRzToolButton;
    F7: TRzToolButton;
    F6: TRzToolButton;
    F10: TRzToolButton;
    F4: TRzToolButton;
    F5: TRzToolButton;
    RzPanel11: TRzPanel;
    lblTicketsAparcados: TLabel;
    TecladoNumerico: TAdvTouchKeyboard;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    LabelTotal: TRzLabel;
    LabelEntregado: TRzLabel;
    LabelPendiente: TRzLabel;
    LabelCambio: TRzLabel;
    LabelUsuario: TRzLabel;
    LabelCodcli: TRzLabel;
    RzPanel16: TRzPanel;
    Label3: TLabel;
    Image1: TImage;
    AcAparcarTicket: TAction;
    AcAnotarPagos: TAction;
    AcRecuperarTicket: TAction;
    AcBuscarCliente: TAction;
    AcBuscarArticulo: TAction;
    AcCambiarUsuario: TAction;
    AcAbrirCajon: TAction;
    AcBorrarLineaTicket: TAction;
    AcEditarLinea: TAction;
    AcDevolucion: TAction;
    LabelDesUsuario: TRzLabel;
    LabelDesCliente: TRzLabel;
    AcInicio: TAction;
    AcSiguiente: TAction;
    AcAnterior: TAction;
    AcFin: TAction;
    AccionesDemo: TActionList;
    AcAltaAutomaticaTicket: TAction;
    RzPanel3: TRzPanel;
    GridLineas: TDBGridEh;
    FrameArticulos: TFrameArticulos;
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    RzToolButton5: TRzToolButton;
    RzToolButton6: TRzToolButton;
    RzToolButton7: TRzToolButton;
    RzSpacer2: TRzSpacer;
    AcSeleccionarArticulo: TAction;
    RZGroupBox10: TRzGroupBox;
    Label11: TLabel;
    lblEntrada: TLabel;
    Label1: TLabel;
    BtnBuscar: TRzToolButton;
    Shape11: TShape;
    BtnSeleccionarArticulo: TRzToolButton;
    EditEntrada: TRzEdit;
    EditCantidad: TRzNumericEdit;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCancelarBuscarArticuloClick(Sender: TObject);
    procedure S_LINEASDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure GridLineasDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure EditCantidadEnter(Sender: TObject);
    procedure EditCantidadExit(Sender: TObject);
    procedure EditEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure EditCantidadClick(Sender: TObject);
    procedure AcAparcarTicketExecute(Sender: TObject);
    procedure AcAnotarPagosExecute(Sender: TObject);
    procedure AcRecuperarTicketExecute(Sender: TObject);
    procedure AcBuscarClienteExecute(Sender: TObject);
    procedure AcBuscarArticuloExecute(Sender: TObject);
    procedure AcCambiarUsuarioExecute(Sender: TObject);
    procedure AcAbrirCajonExecute(Sender: TObject);
    procedure AcBorrarLineaTicketExecute(Sender: TObject);
    procedure AcEditarLineaExecute(Sender: TObject);
    procedure AcDevolucionExecute(Sender: TObject);
    procedure AcInicioExecute(Sender: TObject);
    procedure AcAltaAutomaticaTicketExecute(Sender: TObject);
    procedure AcSeleccionarArticuloExecute(Sender: TObject);
  private
    { Private declarations }
    DMT: TDMTicket;
    DMA: TDMArticulo;
    DMC: TDMCodigoBarras;
    DMTarifas: TDMTarifas;
    DMCliente: TDMCliente;
    DMCaja: TDMCaja;
    TicketsAparcados: TList;
    Ticket: TTicket;
    ClienteEfectivo: TCliente;
    ClienteActivo: TCliente;
//    FIndiceTicketAparcado: Integer;
    FEditandoCantidad: Boolean;
//    FDesCliente: String;
    FMedioPagoEfectivo: String;
    InfoTienda: TInfoTienda;
    InicioCorrecto : Boolean;

    procedure ValidaEntrada;
    procedure ValidaCantidad;
    procedure RefrescarControles;
    procedure SetEditandoCantidad(Value: Boolean);
    procedure AparcarTicket;
    procedure RecuperarTicket;
    procedure BuscarArticulo;
    procedure BuscarClientes;
    procedure AnotarPagos;
    procedure LimpiarEntrada;
    procedure ModificaLinea;
    procedure CambiaClienteActivo(cif: String);
    function GetUIDDiarioCaja: String;
    procedure NuevoTicket;
    procedure DevolucionLinea;
    function CerrarVentanas: Boolean;

    procedure BotonArticuloClick(Sender: TObject);

    property EditandoCantidad: Boolean read FEditandoCantidad write SetEditandoCantidad;
  public
    { Public declarations }
    class procedure Crea(Titulo : String ; Accion : TMenuItemCargador); override;
    procedure Inicializa; override;
  end;

var
  FrmTicket: TFrmTicket;

implementation

{$R *.dfm}
uses
   iGeneral, RecuperarTicket, BuscarArticulos, BuscarClientes, Pagos;

procedure TFrmTicket.BtnCancelarBuscarArticuloClick(Sender: TObject);
begin
   inherited;
   Paginas.ActivePage := TabVenta;
end;

class procedure TFrmTicket.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
   if iAbreSiExiste( Copy( Self.ClassName, 2, 50 ) ) then Exit;

   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);

   try
      try
         FrmTicket := TFrmTicket.Create( Application );

         FrmTicket.KeyPreview := True; // por alguna razon, despues de pasar a delphi2010, no coge este valor en diseño
         FrmTicket.Caption := Titulo;
         FrmTicket.Accion := Accion;

         FrmTicket.Inicializa;
      except
         FrmTicket.Close;
         Raise;
      end;
   finally
//      ifinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmTicket.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;

   if InicioCorrecto then
   begin
      try
         DMCore.Dispositivos.Visor.Pintar('---CAJA CERRADA---', '');
      except
      end;
   end;

   Action := caFree;
end;

procedure TFrmTicket.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   inherited;

   if InicioCorrecto then
   begin
      Ticket.RefrescaPresentacionLineas;
      if (TicketsAparcados.Count > 0) or (S_LINEAS.DataSet.RecordCount > 0) then
      begin
         CanClose := (TPVMessageDlg(STR_TicketsPendientes, mtConfirmation, mbYesNo, 0) = mrYes);
      end;
   end;
end;

procedure TFrmTicket.FormDestroy(Sender: TObject);
begin
   inherited;
   TicketsAparcados.Free;
   ClienteEfectivo.Free;
   ClienteActivo.Free;
   DMCliente.Free;
   DMTarifas.Free;
   DMC.Free;
   DMA.Free;
   DMT.Free;
   DMCaja.Free;
   InfoTienda.Free;
end;

procedure TFrmTicket.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   inherited;

   if Key = VK_RETURN then
   begin
      Key := 0;
      if EditCantidad.Focused then
      begin
         ValidaCantidad;
         try
            EditEntrada.SetFocus;
         except
         end;
      end
      else
      begin
         if EditEntrada.Text <> '' then
         begin
            ValidaEntrada;
         end;
      end;
   end
   else
      if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_HOME, VK_END] then
      begin
         if not GridLineas.Focused then
         begin
            OnKeyDown := nil;
            try
               SendMessage(GridLineas.Handle, WM_KEYDOWN, key,0);
               SendMessage(GridLineas.Handle, WM_CHAR, key,0);
               SendMessage(GridLineas.Handle, WM_KEYUP, key,0);
            finally
                OnKeyDown := FormKeyDown;
            end;
            Key := 0;
         end;
      end;
      
end;

procedure TFrmTicket.ValidaCantidad;
begin
   EditandoCantidad := False;
   if EditCantidad.Value = 0 then
      EditCantidad.Value := 1
   else
      EditCantidad.Value := iRedondeo(EditCantidad.Value, 2);
end;

procedure TFrmTicket.FormKeyPress(Sender: TObject; var Key: Char);
begin
   inherited;

   // tecla asterisco
   if Ord(key) = 42 then
   begin
      Key := #0;

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

      if EditandoCantidad then
      begin
         if not EditCantidad.Focused then
         begin
            EditCantidad.SetFocus;
            EditCantidad.SelectAll;
            {
            if Ord(key) <> 42 then
            begin
               SendMessage(GetFocus, WM_KEYDOWN, Ord(Key),0);
               SendMessage(GetFocus, WM_CHAR, Ord(Key),0);
               SendMessage(GetFocus, WM_KEYUP, Ord(Key),0);
            end;
            }
         end;
      end
      else
      begin
         if not EditEntrada.Focused then
         begin
            EditEntrada.SetFocus;
            EditEntrada.SelectAll;
            {
            if Ord(key) <> 42 then
            begin
               SendMessage(GetFocus, WM_KEYDOWN, Ord(Key),0);
               SendMessage(GetFocus, WM_CHAR, Ord(Key),0);
               SendMessage(GetFocus, WM_KEYUP, Ord(Key),0);
            end;
            }
         end;
      end;
   end;



//   if Paginas.ActivePage <> TabVenta then
//      Exit;
//   if Ord(key) = 42 then
//   begin
//      if EditandoCantidad then
//      begin
//         EditandoCantidad := False;
//         EditCantidad.Value := 1;
//      end
//      else
//      begin
//         EditandoCantidad := True;
//         EditCantidad.Text := '';
//      end;
//   end
//   else
//   begin
//      if ((Ord(Key) >= 48) and (Ord(Key) <= 57)) or
//         (Ord(Key) = 44) or (Ord(key) = 46) then
//      begin
//         if EditandoCantidad then
//         begin
//            if Ord(key) = 48 then  //cero
//            begin
//               if EditCantidad.Value = 0 then
//                  Exit;
//            end;
//
//            if (Ord(Key) = 44) or (Ord(key) = 46) then
//            begin
//               if (Pos('.', EditCantidad.Text) > 0) or (Pos(',', EditCantidad.Text) > 0) then
//                  Exit;
//
//               EditCantidad.Text := EditCantidad.Text + ',';
//            end
//            else
//               if EditCantidad.Text = '0' then
//                  EditCantidad.Text := key
//               else
//                  EditCantidad.Text := EditCantidad.Text + key;
//         end
//         else
//            EditEntrada.Text := EditEntrada.Text + Key;
//      end;
//   end;
end;

procedure TFrmTicket.FormShow(Sender: TObject);
begin
  inherited;
  try
     EditEntrada.SetFocus;
     iCierraSiExiste('FrmCaja');
  except
  end;
end;

procedure TFrmTicket.Inicializa;
var
   MedioPagoEfectivo: TMedioPago;
   x: Integer;
begin
   CurrencyString := '';

   EditandoCantidad := False;

   InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
   if InfoTienda.Desalm = '' then
      raise Exception.Create(STR_NoConfigTienda);

   //Iniciar controles visuales
   TabVenta.TabVisible := False;
   Paginas.ActivePage := TabVenta;

   //Cargar la configuracion de las acciones
   SetAcciones;

   //Inicidar clases de datos
   DMT := TDMTicket.Create(Self);
   DMA := TDMArticulo.Create(Self);
   DMC := TDMCodigoBarras.Create(Self);
   DMTarifas := TDMTarifas.Create(Self);
   DMCliente := TDMCliente.Create(Self);
   DMCaja := TDMCaja.Create(Self);

   TicketsAparcados := TList.Create;
   Ticket := TTicket.Create(DMT);
   Ticket.UsaDataSetPresentacion := True;
   Ticket.NuevoTicket;
   S_LINEAS.DataSet := Ticket.GetDataSetPresentacionLineas;

   //Desgloses
   for x := 0 to GridLineas.Columns.Count - 1 do
   begin
      if (GridLineas.Columns[x].FieldName = 'DESGLOSE1') then
      begin
         if DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', '') = '' then
         begin
            GridLineas.Columns[x].Visible := False;
         end
         else
         begin
            GridLineas.Columns[x].Visible := True;
            GridLineas.Columns[x].Title.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', '');
         end;
      end;
      if (GridLineas.Columns[x].FieldName = 'DESGLOSE2') then
      begin
         if DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', '') = '' then
         begin
            GridLineas.Columns[x].Visible := False;
         end
         else
         begin
            GridLineas.Columns[x].Visible := True;
            GridLineas.Columns[x].Title.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', '');
         end;
      end;
      if (GridLineas.Columns[x].FieldName = 'DESCUENTO') then
         GridLineas.Columns[x].Visible := (DMVariables.DameVariable('TICKETS.USA_DESCUENTO_EN_LINEA', 'N') = 'S');
   end;

   //Clientes por defecto
   ClienteActivo := TCliente.Create(DMCliente);
   ClienteEfectivo := TCliente.Create(DMCliente);
   ClienteEfectivo.BD_Cargar(InfoTienda.ClientePorDefecto);
   if ClienteEfectivo.Cif = '' then
      raise Exception.Create(STR_ErrorClienteContado);
//   ClienteActivo.Assign(ClienteEfectivo);
   CambiaClienteActivo(ClienteEfectivo.Cif);

   MedioPagoEfectivo := TMedioPago.Create(nil);
   try
      MedioPagoEfectivo.BD_Cargar(ClienteEfectivo.Codmedpag);
      if MedioPagoEfectivo.Codmedpag = '' then
         raise Exception.Create(STR_ErrorMedioPagoEfectivo)
      else
         if not (MedioPagoEfectivo.Efectivo) then
            raise Exception.Create(STR_MedioPagoEfectivoMalConfigurado)
         else
            FMedioPagoEfectivo := MedioPagoEfectivo.Codmedpag;
   finally
      MedioPagoEfectivo.Free;
   end;
   RefrescarControles;

   NuevoTicket;

   FrameArticulos.Inicializa(BotonArticuloClick);

   InicioCorrecto := True;
end;

procedure TFrmTicket.LimpiarEntrada;
begin
   try
      S_LINEAS.DataSet.DisableControls;
      Ticket.RefrescaPresentacionLineas;

      RefrescarControles;
      EditEntrada.Text := '';
      EditCantidad.Value := 1;
      EditandoCantidad := False;
   finally
      S_LINEAS.DataSet.EnableControls;
   end;
end;

procedure TFrmTicket.ValidaEntrada;
var
   Cadena: String;
   Articulo: TArticulo;
   Barras: TCodigoBarras;
   Linea: TLineaTicket;
   PrecioTarifa: TPrecioTarifa;

   sLinea2: String;
   auxDesglose1, auxDesglose2: String;
   auxCantidad: Extended;
   sObligatorio : String;
begin
   Cadena := EditEntrada.Text;
   if Cadena = '' then
      Exit;
   Articulo := TArticulo.Create(DMA);
   Barras := TCodigoBarras.Create(DMC);
   PrecioTarifa := TPrecioTarifa.Create;

   try
      //Cargar el codigo de barras
      Barras.BD_Cargar(Cadena);
      if Barras.Especial then   //Es un codigo especial
      begin
         //Carga los datos del articulo
         Articulo.BD_Cargar(Barras.Codart);
         if Articulo.Codart = '' then
         begin
            EditEntrada.Text := '';
            raise Exception.Create('Articulo no encontrado ' + Articulo.Codart);
         end;
         auxDesglose1 := Barras.Desglose1;
         auxDesglose2 := Barras.Desglose2;
         auxCantidad := Barras.Especial_cantidad;
      end
      else if Barras.Codart <> '' then //Es un codigo de barras normal
      begin
         //Carga los datos del articulo
         Articulo.BD_Cargar(Barras.Codart);
         if Articulo.Codart = '' then
         begin
            EditEntrada.Text := '';
            raise Exception.Create('Articulo no encontrado ' + Articulo.Codart);
         end;
         auxDesglose1 := Barras.Desglose1;
         auxDesglose2 := Barras.Desglose2;
         if Barras.Dun14 then
            auxCantidad := Barras.FactorConversion
         else
            auxCantidad := EditCantidad.Value;
      end
      else  //Es un codigo de articulo
      begin
         Articulo.BD_Cargar(Cadena);
         if Articulo.Codart = '' then
         begin
            EditEntrada.Text := '';
            raise Exception.Create('Articulo no encontrado ' + Articulo.Codart);
         end;
         auxDesglose1 := '*';
         auxDesglose2 := '*';
         auxCantidad := EditCantidad.Value;
      end;

      //Verificar si el articulo esta activo
      if not Articulo.Activo then
      begin
         raise Exception.Create(STR_ArticuloInactivo);
      end;

      if ((Articulo.Desglose1) and (auxDesglose1 = '*')) or
         ((Articulo.Desglose2) and (auxDesglose2 = '*')) then
      begin
         sObligatorio := '';

         if ((Articulo.Desglose1) and (auxDesglose1 = '*')) then
            sObligatorio := ', ' + DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', '');

         if ((Articulo.Desglose2) and (auxDesglose2 = '*')) then
            sObligatorio := sObligatorio + ', ' + DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', '');

         // se controla si algun articulo tiene puesto un desglose obligatorio pero no estan definidos
         if sObligatorio <> '' then
            raise Exception.Create('Para este artículo es obligatorio especificar: ' + Copy(sObligatorio, 3, 200));
      end;

      //Controlar la cantidad
      if auxCantidad <= 0 then
      begin
         raise Exception.Create(STR_CantidadMayorCero);
      end;

      //Insertar la línea
      Linea := TLineaTicket.Create(Ticket);
      Linea.Codart := Articulo.Codart;
      Linea.CodImp := Articulo.CodImp;

      Linea.Desglose1 := auxDesglose1;
      Linea.Desglose2 := auxDesglose2;
      Linea.Cantidad := auxCantidad;

      Linea.Fecha := Date;
      Linea.Desart := Articulo.Desart;
      Linea.Generico := Articulo.Generico;

      if Barras.Especial then
      begin
         Linea.PVPTarifa := Barras.Especial_precio;
         Linea.Descuento := 0;
         Linea.PVPSinDescuento := Barras.Especial_precio;
         Linea.IdPromocion := -1;
         Linea.Puntos := 0;
         Linea.TextoPromocion := '';
      end
      else
      begin
         if not DMTarifas.damePrecioArticulo(Articulo, ClienteActivo, (Ticket.TarjetaFidelizacion <> ''), PrecioTarifa) then
         begin
            if TPVMessageDlg(Format(STR_PrecioNoEncontrado, [Articulo.Codart, Articulo.Desart]), mtWarning, mbYesNo, 0) <> mrYes then
               Abort;
         end;
         Linea.PVPTarifa := PrecioTarifa.PVPTarifa;
         Linea.Descuento := 0;
         Linea.PVPSinDescuento := PrecioTarifa.PVP;

         Linea.IdPromocion := PrecioTarifa.IDPromocion;
         Linea.Puntos := PrecioTarifa.Puntos;
         Linea.TextoPromocion := PrecioTarifa.TextoPromocion;
      end;

      Linea.Linea := Ticket.Lineas.Add(Linea);

      sLinea2 := FloatToStr(Linea.Cantidad) + 'x ' + CurrToStrF(Linea.PVP, ffCurrency, 2);
      DMCore.Dispositivos.Visor.Pintar(Linea.Desart, sLinea2);
  finally
      LimpiarEntrada;
      Articulo.Free;
      Barras.Free;
      PrecioTarifa.Free;
      DMC.Q_CODIGOS_BARRA_ESP.Close;
   end;
end;

procedure TFrmTicket.RefrescarControles;
begin
   LabelUsuario.Caption := DMVariables.CodigoUsuario;
   LabelDesUsuario.Caption := DMVariables.NombreUsuario;

   LabelCodcli.Caption := ClienteActivo.Cif;
   LabelDesCliente.Caption := ClienteActivo.Descli;

   AcInicio.Enabled := not (S_LINEAS.DataSet.Bof);
   AcAnterior.Enabled := not (S_LINEAS.DataSet.Bof);
   AcSiguiente.Enabled := not (S_LINEAS.DataSet.Eof);
   AcFin.Enabled := not (S_LINEAS.DataSet.Eof);

   AcBorrarLineaTicket.Enabled := not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof);
   AcAparcarTicket.Enabled := (Ticket.Lineas.Count > 0);
   AcRecuperarTicket.Enabled := (TicketsAparcados.Count > 0);
   AcAnotarPagos.Enabled := not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof);
   AcEditarLinea.Enabled := not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof);
   AcDevolucion.Enabled := not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof);

   LabelTotal.Caption := FormatFloat('###,###,##0.00', Ticket.Total);
   LabelEntregado.Caption := FormatFloat('###,###,##0.00', Ticket.TotalEntregado);
   LabelPendiente.Caption := FormatFloat('###,###,##0.00', Ticket.TotalPendiente);
   if Ticket.TotalPendiente <> 0 then
   begin
      LabelPendiente.Color := clYellow;
      LabelPendiente.Font.Color := clBlack;
   end
   else
   begin
      LabelPendiente.Color := $00EEEEEE;
      LabelPendiente.Font.Color := $00C15800;
   end;
   LabelCambio.Caption := FormatFloat('###,###,##0.00', Ticket.Cambio);

   if TicketsAparcados.Count > 0 then
      lblTicketsAparcados.Caption := Format(STR_TicketsAparcados, [TicketsAparcados.Count])
   else
      lblTicketsAparcados.Caption := STR_NoHayTicketsAparcados;

   EditEntrada.Text := '';
   EditCantidad.Value := 1;
end;

procedure TFrmTicket.SetEditandoCantidad(Value: Boolean);
begin
   if Value <> FEditandoCantidad then
      FEditandoCantidad := Value;

   if FEditandoCantidad then
   begin
      EditEntrada.Color := clWindow;
      EditCantidad.Color := $0080FFFF;
   end
   else
   begin
      EditEntrada.Color := $0080FFFF;
      EditCantidad.Color := clWindow;
   end;
end;

procedure TFrmTicket.S_LINEASDataChange(Sender: TObject; Field: TField);
begin
   inherited;
   if Field = nil then
      RefrescarControles;   
end;

procedure TFrmTicket.AparcarTicket;
begin
   if Ticket.Lineas.Count > 0 then
   begin
      Ticket.Fecha := now;
      Ticket.Descli := ClienteActivo.Descli;
      if TicketsAparcados.IndexOf(Ticket) < 0 then
         TicketsAparcados.Add(Ticket);

      Ticket := TTicket.Create(DMT);
      Ticket.UsaDataSetPresentacion := True;
      NuevoTicket;
      Ticket.RefrescaPresentacionLineas;
      RefrescarControles;
   end;
end;

procedure TFrmTicket.RecuperarTicket;
var
   FrmRec: TFrmRecupearTicket;
   i: Integer;
   Item: TListItem;
begin
   if TicketsAparcados.Count > 0 then
   begin
      FrmRec := TFrmRecupearTicket.Create(Self);
      try
         for i := 0 to TicketsAparcados.Count - 1 do
         begin
            Item := FrmRec.ListViewTickets.Items.Add;
            Item.Caption := IntToStr(i);
            Item.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:nn:ss', TTicket(TicketsAparcados.Items[i]).Fecha));
            Item.SubItems.Add(TTicket(TicketsAparcados.Items[i]).Descli);
            Item.SubItems.Add(FormatFloat('###,###,##0.00', TTicket(TicketsAparcados.Items[i]).Total));
         end;

         FrmRec.ShowModal;
         if FrmRec.ModalResult = mrOk then
         begin
            AparcarTicket;
            Ticket := TicketsAparcados.Items[StrToInt(FrmRec.ListViewTickets.Items[FrmRec.ListViewTickets.ItemIndex].Caption)];
            TicketsAparcados.Delete(StrToInt(FrmRec.ListViewTickets.Items[FrmRec.ListViewTickets.ItemIndex].Caption));
            CambiaClienteActivo(Ticket.Codcli);
            Ticket.RefrescaPresentacionLineas;
            RefrescarControles;
            DMCore.Dispositivos.Visor.Pintar('TOTAL A PAGAR', iSpace(10 - Length(CurrToStrF(Ticket.Total, ffCurrency, 2))) + CurrToStrF(Ticket.Total, ffCurrency, 2));
         end;
      finally
         FrmRec.Free;
      end;
   end;
end;

procedure TFrmTicket.CambiaClienteActivo(cif: String);
var
   CheckCliente: TCliente;
begin
   if ClienteActivo.Cif <> cif then
   begin
      CheckCliente := TCliente.Create(DMCliente);
      try
         CheckCliente.Cif := cif;
         CheckCliente.BD_Cargar(CheckCliente.Cif);
         if not CheckCliente.Activo then
         begin
            raise Exception.Create(Format(STR_ClienteInactivo, [CheckCliente.Descli]));
         end;
         ClienteActivo.Assign(CheckCliente);
      finally
         CheckCliente.Free;
      end;
   end;
end;

procedure TFrmTicket.AcAltaAutomaticaTicketExecute(Sender: TObject);
var
   l: Integer; //lineas para el ticket
   c: Integer; //cantidad por linea
   t: Integer; //numero de tickets
   i, j: Integer;
   r: Integer; //salto en articulos

   ART: TDataSet;
   FrmPag: TFrmPagos;
   Informe: TInformeTicket;
begin
   inherited;
   if DMVariables.DameVariable('_DESARROLLO.MODO_DEMO', 'N') = 'S' then
   begin
      Randomize;
      t := Random(50);
      if t = 0 then
         t := 1;

      ART := DMA.GetArticulosDemo;
      ART.Open;
      try
         for i := 0 to t - 1 do
         begin
            Randomize;
            l := Random(30);
            if l = 0 then
               l := 5;
            for j := 0 to l - 1 do
            begin
               Randomize;
               r := Random(ART.RecordCount);
               ART.First;
               ART.MoveBy(r);
               c := Random(20);
               if c = 0 then
                  c := 1;
               EditCantidad.Value := c;
               EditEntrada.Text := ART.FieldByName('CODART').AsString;
               ValidaEntrada;
               Sleep(5);
            end;

            Application.ProcessMessages;

            try
               FrmPag := TFrmPagos.Create(Self);
               try
                  FrmPag.Inicializa(Ticket, FMedioPagoEfectivo, GetUIDDiarioCaja, ClienteActivo);
                  FrmPag.Show;
                  FrmPag.EditImporte.Value := Ticket.TotalPendiente;
                  FrmPag.ValidaEntrada;
                  FrmPag.BtnAceptar.Click;
                  Application.ProcessMessages;
                  FrmPag.Close;

                  try
                     PonEspera(STR_Imprimiendo, False);

                     //Abre el cajon

                     AcAbrirCajon.Execute;

                     //Crear el ticket e imprimirlo
                     Informe := TInformeTicket.Create;
                     try
                        Informe.LeerXMLOrigen(Ticket.XMLTicket);
                        Informe.ComponerInforme;
                        Informe.Imprimir;
                     finally
                        Informe.Free;
                     end;

                     //Cortar el papel
                     DMCore.Dispositivos.Impresora.Cortar;
                  finally
                     FinEspera;
                     NuevoTicket;
                     RefrescarControles;
                  end;
                  Sleep(200);
               finally
                  RefrescarControles;
                  FrmPag.Free;
               end;
            except
               FinEspera;
               raise;
            end;
         end;
      finally
         ART.Close;
      end;
   end;
end;

procedure TFrmTicket.AcAnotarPagosExecute(Sender: TObject);
begin
   inherited;
   AnotarPagos;
end;

procedure TFrmTicket.AcAparcarTicketExecute(Sender: TObject);
begin
   inherited;
   AparcarTicket;
end;

procedure TFrmTicket.AcRecuperarTicketExecute(Sender: TObject);
begin
   inherited;
   RecuperarTicket;
end;

procedure TFrmTicket.AcSeleccionarArticuloExecute(Sender: TObject);
begin
   inherited;

   FrameArticulos.Visible := not FrameArticulos.Visible;
   BtnSeleccionarArticulo.Down := FrameArticulos.Visible;
end;

procedure TFrmTicket.AcAbrirCajonExecute(Sender: TObject);
begin
  inherited;
  DMCore.Dispositivos.cajon.Abrir;
end;

procedure TFrmTicket.AcBorrarLineaTicketExecute(Sender: TObject);
begin
   inherited;
   if TPVMessageDlg(STR_BorrarLinea, mtConfirmation, mbYesNo, 0) = mrYes then
   begin
      if not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof) then
      begin
         //No usar el metodo delete de la lista
         Ticket.Lineas.Remove(Ticket.Lineas.Items[S_LINEAS.DataSet.FieldByName('IDX').AsInteger]);
         Ticket.RefrescaPresentacionLineas;
         RefrescarControles;
      end;
   end;
end;

procedure TFrmTicket.AcBuscarArticuloExecute(Sender: TObject);
begin
   inherited;
   ValidaCantidad;
   BuscarArticulo;
end;

procedure TFrmTicket.AcBuscarClienteExecute(Sender: TObject);
begin
   inherited;
   BuscarClientes;
end;

procedure TFrmTicket.AcCambiarUsuarioExecute(Sender: TObject);
begin
   inherited;
   if CerrarVentanas then
   begin
      DMCore.SeleccionUsuario;
      RefrescarControles;
   end;
end;

procedure TFrmTicket.AcDevolucionExecute(Sender: TObject);
begin
   inherited;
   DevolucionLinea;
end;

procedure TFrmTicket.AcEditarLineaExecute(Sender: TObject);
begin
   inherited;
   ModificaLinea;
end;

procedure TFrmTicket.AcInicioExecute(Sender: TObject);
begin
   inherited;
   if S_LINEAS.DataSet.Active then
   begin
      if Sender = AcInicio then
         S_LINEAS.DataSet.First
      else if Sender = AcAnterior then
         S_LINEAS.DataSet.Prior
      else if Sender = AcSiguiente then
         S_LINEAS.DataSet.Next
      else if Sender = AcFin then
         S_LINEAS.DataSet.Last;
      RefrescarControles;
   end;
end;

procedure TFrmTicket.AnotarPagos;
var
   FrmPag: TFrmPagos;
   Informe: TInformeTicket;
   InformeBoleta: TInformeBoleta;
begin
   FrmPag := TFrmPagos.Create(Self);
   try
      FrmPag.Inicializa(Ticket, FMedioPagoEfectivo, GetUIDDiarioCaja, ClienteActivo);
      FrmPag.ShowModal;
      if FrmPag.ModalResult = mrOk then
      begin
         try
            //RefrescarControles;
            Self.Repaint;
            try
               while True do
               begin
                  PonEspera(STR_Imprimiendo, False);
                  if Ticket.OperacionTEF.NumAutorizacion <> '' then
                  begin
                     InformeBoleta := TInformeBoleta.Create;
                     try
                        InformeBoleta.LeerXMLOrigen(Ticket.XMLTicket);
                        InformeBoleta.TipoCopia := 'EMPRESA';
                        InformeBoleta.ComponerInforme;
                     finally
                        InformeBoleta.Free;
                     end;
                  end;

                  //Crear el ticket e imprimirlo
                  Informe := TInformeTicket.Create;
                  try
                     Informe.LeerXMLOrigen(Ticket.XMLTicket);
                     Informe.ComponerInforme;
                  finally
                     Informe.Free;
                  end;
                  if Ticket.OperacionTEF.NumAutorizacion <> '' then
                  begin
                     FinEspera;
                     if TPVMessageDLG(STR_VerificaTicket, mtConfirmation, [mbYes, mbNo], 0, [mbYes]) = mrYes then
                        Break;
                  end
                  else
                     Break;
               end;
            finally
               FinEspera;
               NuevoTicket;
               RefrescarControles;
            end;
         except
            FinEspera;
            raise;
         end;
      end
      else
      begin
         Ticket.Pagos.Clear;
      end;
   finally
      RefrescarControles;
      FrmPag.Free;
   end;
end;

procedure TFrmTicket.BuscarArticulo;
var
   FrmBuscarArt: TFrmBuscarArticulo;
begin
   FrmBuscarArt := TFrmBuscarArticulo.Create(Self);
   try
      FrmBuscarArt.ShowModal;

      if FrmBuscarArt.ModalResult = mrOk then
      begin
         if (FrmBuscarArt.S_BUSCARARTICULO.DataSet.FieldByName('CODIGO_BARRAS').AsString <> '') then
            EditEntrada.Text := FrmBuscarArt.S_BUSCARARTICULO.DataSet.FieldByName('CODIGO_BARRAS').AsString
         else
            EditEntrada.Text := FrmBuscarArt.S_BUSCARARTICULO.DataSet.FieldByName('CODART').AsString;
         ValidaEntrada;
      end;
   finally
      FrmBuscarArt.Free;
   end;
end;

procedure TFrmTicket.BuscarClientes;
var
   FrmBuscarCli: TFrmBuscarClientes;
begin
   if Ticket.Lineas.Count > 0 then
      raise Exception.Create(STR_NoSePuedeCambiarCliente);
   FrmBuscarCli := TFrmBuscarClientes.Create(Self);
   try
      FrmBuscarCli.ShowModal;

      if FrmBuscarCli.ModalResult = mrOk then
      begin
         CambiaClienteActivo(FrmBuscarCli.S_BUSCARCLIENTES.DataSet.FieldByName('CIF').AsString);
         Ticket.Codcli := ClienteActivo.Cif;
         Ticket.Descli := ClienteActivo.Descli;
         Ticket.Id_trat_impuestos := ClienteActivo.Id_trat_impuestos;
         Ticket.RefrescaPresentacionLineas;
         RefrescarControles;
      end;
   finally
      FrmBuscarCli.Free;
   end;
end;

procedure TFrmTicket.ModificaLinea;
var
   FrmModificaLinea: TFrmModificarLineaTicket;
   auxLinea: TLineaTicket;
begin
   if not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof) then
   begin
      FrmModificaLinea := TFrmModificarLineaTicket.Create(Self);
      try
         auxLinea := Ticket.Lineas.Items[S_LINEAS.DataSet.FieldByName('IDX').AsInteger];
         if auxLinea = nil then
            raise Exception.Create(STR_LineaNoEncontrada);
         FrmModificaLinea.inicializa(Ticket, auxLinea);
         FrmModificaLinea.ShowModal;
         if FrmModificaLinea.ModalResult = mrOk then
         begin
            LimpiarEntrada;
         end;
      finally
          FrmModificaLinea.Free;
      end;
   end;
end;

function TFrmTicket.GetUIDDiarioCaja: String;
var
   caja: TCaja;
begin
   result := DMCaja.BD_DameUIDDiarioCajaAbierta(DMVariables.CodigoTienda, DMVariables.CodigoCaja);
   if result = '' then
   begin
      TPVMessageDlg(STR_CajaCerrada, mtWarning, [mbOK], 0);
      //si la caja esta cerrada crea una nueva
      caja := TCaja.Create(DMCaja);
      try
         try
            PonEspera(STR_AbriendoCaja, False);
            DMBaseDatos.IniciaTransaccion;
            caja.BD_Abrir_Caja('', Now, 0);
            DMBaseDatos.CommitTransaccion;
            result := caja.UID_diario_caja;
            FinEspera;
         except
            DMBaseDatos.RollbackTransaccion;
            FinEspera;
            Self.Close;
            raise;
         end;
      finally
         caja.Free;
      end;
   end;
end;

procedure TFrmTicket.GridLineasDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
   inherited;
   if Field <> nil then
   begin
      if Field.DataSet.FieldByName('CANTIDAD').AsFloat < 0 then
         GridLineas.Font.Color := clRed
      else
         GridLineas.Font.Color := $00C15800;
   end;
end;

procedure TFrmTicket.NuevoTicket;
begin
   // limpiar la cache en busqueda de tarifas
   DMTarifas.LimpiaCache;

   Ticket.NuevoTicket;
   Ticket.UID_diario_caja := GetUIDDiarioCaja;
   Ticket.Tienda := DMVariables.CodigoTienda;
   Ticket.Codcaja := DMVariables.CodigoCaja;
   ClienteActivo.Assign(ClienteEfectivo);
   Ticket.Codcli := ClienteActivo.Cif;
   Ticket.Descli := ClienteActivo.Descli;
   Ticket.Id_trat_impuestos := ClienteActivo.Id_trat_impuestos;

   Ticket.EmpresaDescripcion := InfoTienda.Desalm;
   Ticket.EmpresaDomicilio := InfoTienda.Domicilio;
   Ticket.EmpresaPoblacion := InfoTienda.Poblacion;
   Ticket.EmpresaProvincia := InfoTienda.Provincia;
   Ticket.EmpresaTelefono1 := InfoTienda.Telefono1;
   Ticket.EmpresaTelefono2 := InfoTienda.Telefono2;
   Ticket.EmpresaFax := InfoTienda.Fax;
   Ticket.EmpresaCIF := InfoTienda.Cif;
   Ticket.EmpresaNombreComercial := InfoTienda.Nombre_comercial;

   DMCore.Dispositivos.Visor.Pintar('---NUEVO CLIENTE---', '');
end;

procedure TFrmTicket.DevolucionLinea;
var
   auxLinea: TLineaTicket;
   sLinea2: String;
begin
   if not (S_LINEAS.DataSet.Bof and S_LINEAS.DataSet.Eof) then
   begin
      auxLinea := Ticket.Lineas.Items[S_LINEAS.DataSet.FieldByName('IDX').AsInteger];
      if auxLinea = nil then
         raise Exception.Create(STR_LineaNoEncontrada);

      auxLinea.Cantidad := auxLinea.Cantidad * -1;

      sLinea2 := FloatToStr(auxLinea.Cantidad) + 'x ' + CurrToStrF(auxLinea.PVP, ffCurrency, 2);
      DMCore.Dispositivos.Visor.Pintar(auxLinea.Desart, sLinea2);
      Ticket.RefrescaPresentacionLineas;
      RefrescarControles;
   end;
end;

procedure TFrmTicket.EditCantidadClick(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).SelectAll;
end;

procedure TFrmTicket.EditCantidadEnter(Sender: TObject);
begin
   inherited;
   EditandoCantidad := True;
   TRzEdit(Sender).SelectAll;
end;

procedure TFrmTicket.EditCantidadExit(Sender: TObject);
begin
   inherited;
   ValidaCantidad;
   EditandoCantidad := False;
end;

procedure TFrmTicket.EditEntradaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Ord(key) = 42 then
     Key := Chr(0);
end;

function TFrmTicket.CerrarVentanas: Boolean;
begin
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

procedure TFrmTicket.BotonArticuloClick(Sender: TObject);
begin
   EditEntrada.Text := TArticuloBitBtn(Sender).Codart;
   ValidaEntrada;
end;

initialization
   RegisterClass(TFrmTicket);

end.


