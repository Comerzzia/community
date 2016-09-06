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

unit DataMTicket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataMBase, DB, Uni, DBAccess, MemDS, Contnrs, DBClient, Provider,
  XMLIntf, XMLDoc, DataMVariables, DataMImpuestos, uOperacionTEF, JvJCLUtils;

type
  { Forward declarations }
  TDMTicket = class;
  TListaLineasTicket = class;
  TLineaTicket = class;
  TListaPagosTicket = class;
  TPagoTicket = class;
  TListaImpuestosTicket = class;
  TImpuestoTicket = class;

  TTicket = class(TDBDataObject)
  private
     FXMLTicket : IXMLDocument;
     FLineasTicket : TListaLineasTicket;
     FPagosTicket: TListaPagosTicket;
     FImpuestosTicket: TListaImpuestosTicket;
     FUsaDataSetPresentacion: Boolean; //Actualmente no se usa internamente, para uso futuro de refresco automatico de las tablas de memoria

     FUidTicket: String;
     FIdTicket: Integer;
     FCodserie: String;
     FFecha: TDateTime;
     FCodcli: String;
     FDescli: String;
     FTienda: String;
     FId_grupo_impuestos: Integer;
     FId_trat_impuestos: Integer;
     FCodcaja: String;
     FUID_diario_caja: String;
     FBase: Currency;
     FImpuestos: Currency;
     FTotal: Currency;
     FId_usuario: Integer;
     FDesUsuario: String;
     FTotalEntregado: Currency;
     FTotalPendiente: Currency;
     FCambio: Currency;
     FTarjetaFidelizacion: String;

     //Datos solo para impresion del ticket a nivel de empresa
     FEmpresaCodEmp: String;
     FEmpresaDescripcion: String;
     FEmpresaDomicilio: String;
     FEmpresaPoblacion: String;
     FEmpresaProvincia: String;
     FEmpresaTelefono1: String;
     FEmpresaTelefono2: String;
     FEmpresaFax: String;
     FEmpresaCIF: String;
     FEmpresaNombreComercial: String;
     FOperacionTEF: TOperacionTEF;

     procedure SetCodserie(Value: String);

     procedure SetUsaDataSetPresentacion(Value: Boolean);
     procedure Clear;
     procedure PresentacionLineasAdd(DataSet: TDataSet; LineaTicket: TLineaTicket; Indice: Integer);
     procedure PresentacionPagosAdd(DataSet: TDataSet; PagoTicket: TPagoTicket; Indice: Integer);
     procedure PresentacionImpuestosAdd(DataSet: TDataSet; ImpuestoTicket: TImpuestoTicket; Indice: Integer);
     procedure CalculaPublico;
     procedure CalculaPendiente;
     procedure SetEntregado(Value: Currency);
  public
     property XMLTicket : IXMLDocument read FXMLTicket write FXMLTicket;
     property UIDTicket: String read FUidTicket write FUidTicket;
     property IdTicket: Integer read FIdTicket write FIdTicket;
     property Codserie: String read FCodserie write SetCodSerie;
     property Fecha: TDateTime read FFecha write FFecha;
     property Codcli: String read FCodcli write FCodcli;
     property Descli: String read FDescli write FDescli;
     property Tienda: String read FTienda write FTienda;
     property Id_grupo_impuestos: Integer read FId_grupo_impuestos write FId_grupo_impuestos;
     property Id_trat_impuestos: Integer read FId_trat_impuestos write FId_trat_impuestos;
     property Codcaja: String read FCodCaja write FCodcaja;
     property UID_diario_caja: String read FUID_diario_caja write FUID_diario_caja;
     property TotalBase: Currency read FBase write FBase;
     property TotalImpuestos: Currency read FImpuestos write FImpuestos;
     property Total: Currency read FTotal write FTotal;
     property Id_usuario: Integer read FId_usuario write FId_usuario;
     property DesUsuario: String read FDesUsuario write FDesUsuario;
     property TotalEntregado: Currency read FTotalEntregado write SetEntregado;
     property TotalPendiente: Currency read FTotalPendiente;
     property Cambio: Currency read FCambio;

     property Pagos: TListaPagosTicket read FPagosTicket write FPagosTicket;
     property Lineas: TListaLineasTicket read FLineasTicket write FLineasTicket;
     property Impuestos: TListaImpuestosTicket read FImpuestosTicket write FImpuestosTicket;
     property TarjetaFidelizacion: String read FTarjetaFidelizacion write FTarjetaFidelizacion;
     property EmpresaCodEmp: String read FEmpresaCodEmp write FEmpresaCodEmp;
     property EmpresaDescripcion: String read FEmpresaDescripcion write FEmpresaDescripcion;
     property EmpresaDomicilio: String read FEmpresaDomicilio write FEmpresaDomicilio;
     property EmpresaPoblacion: String read FEmpresaPoblacion write FEmpresaPoblacion;
     property EmpresaProvincia: String read FEmpresaProvincia write FEmpresaProvincia;
     property EmpresaTelefono1: String read FEmpresaTelefono1 write FEmpresaTelefono1;
     property EmpresaTelefono2: String read FEmpresaTelefono2 write FEmpresaTelefono2;
     property EmpresaFax: String read FEmpresaFax write FEmpresaFax;
     property EmpresaCIF: String read FEmpresaCIF write FEmpresaCIF;
     property EmpresaNombreComercial: String read FEmpresaNombreComercial write FEmpresaNombreComercial;

     property UsaDataSetPresentacion: Boolean read FUsaDataSetPresentacion write SetUsaDataSetPresentacion;

     property OperacionTEF: TOperacionTEF read FOperacionTEF;

     constructor Create(DataModule: TDMTicket);
     destructor Destroy; override;
     procedure BD_CargarXML(UID: String);
     procedure BD_SalvarXML;
     function GetDataSetPresentacionLineas: TDataSet;
     function GetDataSetPresentacionPagos: TDataSet;
     function GetDataSetPresentacionImpuestos: TDataSet;
     procedure NuevoTicket;
     procedure RefrescaPresentacionLineas;
     procedure RefrescaPresentacionPagos;
     procedure RefrescaPresentacionImpuestos;
     procedure GeneraTicketXML;
   end;

   TLineaTicket = class(TDBDataObject)
   private
      FTicket: TTicket;
      FDataModule: TDMTicket;

      FLinea: Integer;
      FFecha: TDateTime;
      FCodart: String;
      FDesglose1: String;
      FDesglose2: String;
      FDesart: String;
      FCantidad: Extended;
      FPrecio: Currency;
      FDescuento: Extended;
      FPVPSinDescuento: Currency; //precio con impuestos
      FPVP: Currency; //precio final con impuestos
      FImporte: Currency;
      FImporteTotal: Currency; //importe con impuestos
      FCodImp: String;
      FGenerico: Boolean;
      FIdPromocion: Integer;
      FPrecioTarifa: Currency;
      FPVPTarifa: Currency; //Precio tarifa con impuestos
      FPuntos: Integer;
      FTextoPromocion: String;
      FAhorro: Currency;

      procedure CalculaPublico;
      procedure SetDescuento(Value: Extended);
      procedure SetPVPSinDescuento(Value: Currency);
      procedure SetPVPTarifa(Value: Currency);
      procedure SetCantidad(Value: Extended);
      procedure SetIdPromocion(Value: Integer);
   public
      constructor Create(Ticket: TTicket);

      property Linea: Integer read FLinea write FLinea;
      property Fecha: TDateTime read FFecha write FFecha;
      property Codart: String read FCodart write FCodart;
      property Desglose1: String read FDesglose1 write FDesglose1;
      property Desglose2: String read FDesglose2 write FDesglose2;
      property Desart: String read FDesart write FDesart;
      property Cantidad: Extended read FCantidad write SetCantidad;
      property Precio: Currency read FPrecio write FPrecio;
      property Descuento: Extended read FDescuento write SetDescuento;
      property PVPSinDescuento: Currency read FPVPSinDescuento write SetPVPSinDescuento;
      property PVP: Currency read FPVP write FPVP;
      property Importe: Currency read FImporte write FImporte;
      property ImporteTotal: Currency read FImporteTotal write FImporteTotal;
      property CodImp: String read FCodImp write FCodImp;
      property Generico: Boolean read FGenerico write FGenerico;
      //Propiedades relativas a la promocion
      property IdPromocion: Integer read FIdPromocion write SetIdPromocion;
      property PrecioTarifa: Currency read FPrecioTarifa write FPrecioTarifa;
      property PVPTarifa: Currency read FPVPTarifa write SetPVPTarifa;
      property Ahorro: Currency read FAhorro;
      property Puntos: Integer read FPuntos write FPuntos;
      property TextoPromocion: String read FTextoPromocion write FTextoPromocion;
   end;

   TListaLineasTicket = class(TObjectList)
   private
     FTicket: TTicket;
     FDataModule: TDMTicket;
     FOwnsObjects: Boolean;
   protected
     function GetItem(Index: Integer): TLineaTicket;
     procedure SetItem(Index: Integer; AObject: TLineaTicket);
   public
     procedure Clear; override;
     function Add(AObject: TLineaTicket): Integer;
     function Remove(AObject: TLineaTicket): Integer;
     function IndexOf(AObject: TLineaTicket): Integer;
     procedure Insert(Index: Integer; AObject: TLineaTicket);
     property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
     property Items[Index: Integer]: TLineaTicket read GetItem write SetItem; default;
     constructor Create(Ticket: TTicket);
   end;

   TPagoTicket = class(TObject)
   private
     FTicket: TTicket;
     FLinea: Integer;
     FCodmedpag: String;
     FDesmedpag: String;
     FImporte: Currency;
     FNumero_operacion: String;
     FTarjeta_credito: Boolean;
     procedure SetImporte(Value: Currency);
   public
     property Linea: Integer read FLinea write FLinea;
     property Codmedpag: String read FCodmedpag write FCodmedpag;
     property Desmedpag: String read FDesmedpag write FDesmedpag;
     property Importe: Currency read FImporte write SetImporte;
     property Numero_operacion: String read FNumero_operacion write FNumero_operacion;
     property Tarjeta_credito: Boolean read FTarjeta_credito write FTarjeta_credito;
     constructor Create(Ticket: TTicket);
   end;

   TListaPagosTicket = class(TObjectList)
   private
     FTicket: TTicket;
     FDataModule: TDMTicket;
     FOwnsObjects: Boolean;
   protected
     function GetItem(Index: Integer): TPagoTicket; overload;
     procedure SetItem(Index: Integer; AObject: TPagoTicket);
   public
     procedure Clear; override;
     function GetItem(CodMedPag: String): TPagoTicket; overload;
     function Add(AObject: TPagoTicket): Integer;
     function Remove(AObject: TPagoTicket): Integer;
     function IndexOf(AObject: TPagoTicket): Integer;
     procedure Insert(Index: Integer; AObject: TPagoTicket);
     property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
     property Items[Index: Integer]: TPagoTicket read GetItem write SetItem; default;
     constructor Create(Ticket: TTicket);
   end;

   TImpuestoTicket = class(TObject)
   private
     FCodImp: String;
     FBase: Currency;
     FImpuestos: Currency;
     FTotal: Currency;
   public
     property CodImp: String read FCodImp write FCodImp;
     property Base: Currency read FBase write FBase;
     property Impuestos: Currency read FImpuestos write FImpuestos;
     property Total: Currency read FTotal write FTotal;
   end;

   TListaImpuestosTicket = class(TObjectList)
   private
     FTicket: TTicket;
     FDataModule: TDMTicket;
     FOwnsObjects: Boolean;
   protected
     function GetItem(Index: Integer): TImpuestoTicket; overload;
     function GetItem(CodImp: String): TImpuestoTicket; overload;
     procedure SetItem(Index: Integer; AObject: TImpuestoTicket);
   public
     function Add(AObject: TImpuestoTicket): Integer;
     function Remove(AObject: TImpuestoTicket): Integer;
     function IndexOf(AObject: TImpuestoTicket): Integer;
     procedure Insert(Index: Integer; AObject: TImpuestoTicket);
     property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
     property Items[Index: Integer]: TImpuestoTicket read GetItem write SetItem; default;
     constructor Create(Ticket: TTicket);
   end;

  TDMTicket = class(TDMBase)
    LINEAS: TClientDataSet;
    LINEASIDX: TIntegerField;
    LINEASLINEA: TIntegerField;
    LINEASCODART: TStringField;
    LINEASDESGLOSE1: TStringField;
    LINEASDESGLOSE2: TStringField;
    LINEASCANTIDAD: TFloatField;
    LINEASPRECIO: TFloatField;
    LINEASIMPORTE: TFloatField;
    LINEASDESART: TStringField;
    PAGOS: TClientDataSet;
    IntegerField1: TIntegerField;
    IMPUESTOS: TClientDataSet;
    IntegerField3: TIntegerField;
    IMPUESTOSCODIVA: TStringField;
    IMPUESTOSBASE: TFloatField;
    IMPUESTOSIMPUESTOS: TFloatField;
    IMPUESTOSTOTAL: TFloatField;
    PAGOSDESMEDPAG: TStringField;
    INSERTA_CAB_TICKET: TUniQuery;
    INSERTA_DET_TICKET: TUniQuery;
    INSERTA_IMP_TICKET: TUniQuery;
    INSERTA_PAG_TICKET: TUniQuery;
    Q_INSERTA_TICKET_XML: TUniQuery;
    Q_TICKET_XML: TUniQuery;
    Q_TICKET_HIST_XML: TUniQuery;
    PAGOSIMPORTE: TCurrencyField;
    LINEASGENERICO: TBooleanField;
    LINEASPRECIO_TOTAL_SIN_DTO: TFloatField;
    LINEASDESCUENTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses iGeneral, StrUtils;

(*******************************************************************************
*   Clase TDataMTicket                                                         *
*******************************************************************************)

(*******************************************************************************
*   Clase TTicket                                                              *
*******************************************************************************)

  constructor TTicket.Create(DataModule: TDMTicket);
  begin
     Clear;
     if DataModule = nil then
     begin
        FDataModuleInterno := True;
        FDataModule := TDMTicket.Create(nil);
     end
     else
     begin
        FDataModuleInterno := False;
        FDataModule := DataModule;
     end;

     FLineasTicket := TListaLineasTicket.Create(Self);
     FPagosTicket := TListaPagosTicket.Create(Self);
     FImpuestosTicket := TListaImpuestosTicket.Create(Self);
     FXMLTicket := TXMLDocument.Create(nil);
     FOperacionTEF := TOperacionTEF.Create;
  end;

  destructor TTicket.Destroy;
  begin
     FPagosTicket.Free;
     FLineasTicket.Free;
     FImpuestosTicket.Free;
     FOperacionTEF.Free;
     inherited Destroy;
  end;

  procedure TTicket.GeneraTicketXML;
  var
     i: Integer;
     iRegistro, iNode : IXMLNode;
     iTicket: IXMLNode;
     iCabecera: IXMLNode;
     iCliente: IXMLNode;
     iCajero: IXMLNode;
     iEmpresa: IXMLNode;
     iTotales: IXMLNode;
     iDetalle: IXMLNode;
     iPromocion: IXMLNode;
     iPagos: IXMLNode;
     iImpuestos: IXMLNode;
     iOperacionTEF: IXMLNode;
  begin
     CurrencyString := '';

     if FXMLTicket.Active then
        FXMLTicket.Active := False;

     FXMLTicket.Active := True;

     //Genera la cabecera
     FXMLTicket.Encoding := 'UTF-8';
     FXMLTicket.Version := '1.0';
     iTicket := FXMLTicket.AddChild('ticket');
     iCabecera := iTicket.AddChild('cabecera');

     iNode := iCabecera.AddChild('uid_ticket');
     iNode.Text := Self.UIDTicket;
     iNode := iCabecera.AddChild('id_ticket');
     iNode.Text := IntToStr(Self.IdTicket);
     iNode := iCabecera.AddChild('fecha');
     iNode.Text := FormatDateTime('yyyy-mm-dd''T''hh:nn:ss', Self.Fecha);
     iNode := iCabecera.AddChild('tienda');
     iNode.Text := Self.Tienda;
     iNode := iCabecera.AddChild('codcaja');
     iNode.Text := Self.Codcaja;
     iNode := iCabecera.AddChild('uid_diario_caja');
     iNode.Text := Self.UID_diario_caja;

     //Datos del cliente
     iCliente := iCabecera.AddChild('cliente');
     iNode := iCliente.AddChild('codcli');
     iNode.Text := Self.Codcli;
     iNode := iCliente.AddChild('descli');
     iNode.Text := Self.Descli;
     iNode := iCliente.AddChild('id_grupo_impuestos');
     iNode.Text := IntToStr(Self.Id_grupo_impuestos);
     iNode := iCliente.AddChild('id_trat_impuestos');
     iNode.Text := IntToStr(Self.Id_trat_impuestos);

     //Daos del cajero
     iCajero := iCabecera.AddChild('cajero');
     iNode := iCajero.AddChild('id_usuario');
     iNode.Text := IntToStr(Self.Id_usuario);
     iNode := iCajero.AddChild('desusuario');
     iNode.Text := Self.DesUsuario;

     //Datos de la empresa
     iEmpresa := iCabecera.AddChild('empresa');
     iNode := iEmpresa.AddChild('descripcion');
     iNode.Text := Self.EmpresaDescripcion;
     iNode := iEmpresa.AddChild('domicilio');
     iNode.Text := Self.EmpresaDomicilio;
     iNode := iEmpresa.AddChild('poblacion');
     iNode.Text := Self.EmpresaPoblacion;
     iNode := iEmpresa.AddChild('provincia');
     iNode.Text := Self.EmpresaProvincia;
     iNode := iEmpresa.AddChild('telefono1');
     iNode.Text := Self.EmpresaTelefono1;
     iNode := iEmpresa.AddChild('telefono2');
     iNode.Text := Self.EmpresaTelefono2;
     iNode := iEmpresa.AddChild('fax');
     iNode.Text := Self.EmpresaFax;
     iNode := iEmpresa.AddChild('cif');
     iNode.Text := Self.EmpresaCIF;
     iNode := iEmpresa.AddChild('nombre_comercial');
     iNode.Text := Self.EmpresaNombreComercial;

     //Totalizados del ticket
     //No usar DecimalSeparator, se graba siempre punto en los floats
     iTotales := iCabecera.AddChild('totales');
     iNode := iTotales.AddChild('base');
     iNode.Text := iCurrToXMLFormat(Self.TotalBase);
     iNode := iTotales.AddChild('impuestos');
     iNode.Text := iCurrToXMLFormat(Self.TotalImpuestos);
     iNode := iTotales.AddChild('total');
     iNode.Text := iCurrToXMLFormat(Self.Total);
     iNode := iTotales.AddChild('entregado');
     iNode.Text := iCurrToXMLFormat(Self.TotalEntregado);
     iNode := iTotales.AddChild('cambio');
     iNode.Text := iCurrToXMLFormat(Self.Cambio);

     //Genera Impuestos
     iImpuestos := iCabecera.AddChild('lineasimpuestos');
     for i := 0 to Self.Impuestos.Count - 1 do
     begin
        iRegistro := iImpuestos.AddChild('lineaimpuestos');
        iNode := iRegistro.AddChild('codImp');
        iNode.Text := Self.Impuestos.Items[i].CodImp;
        iNode := iRegistro.AddChild('base');
        iNode.Text := iCurrToXMLFormat(Self.Impuestos.Items[i].Base);
        iNode := iRegistro.AddChild('impuestos');
        iNode.Text := iCurrToXMLFormat(Self.Impuestos.Items[i].Impuestos);
        iNode := iRegistro.AddChild('total');
        iNode.Text := iCurrToXMLFormat(Self.Impuestos.Items[i].Total);
     end;

     //Generar el detalle
     iDetalle := iTicket.AddChild('lineas');
     for i := 0 to Self.Lineas.Count - 1 do
     begin
        iRegistro := iDetalle.AddChild('linea');
        iNode := FXMLTicket.CreateNode('idlinea', ntAttribute);
        iNode.Text := IntToStr(Self.Lineas.Items[i].Linea);
        iRegistro.AttributeNodes.Add(iNode);

        iNode := iRegistro.AddChild('codart');
        iNode.Text := Self.Lineas.Items[i].Codart;
        iNode := iRegistro.AddChild('desglose1');
        iNode.Text := Self.Lineas.Items[i].Desglose1;
        iNode := iRegistro.AddChild('desglose2');
        iNode.Text := Self.Lineas.Items[i].Desglose2;
        iNode := iRegistro.AddChild('desart');
        iNode.Text := Self.Lineas.Items[i].Desart;
        iNode := iRegistro.AddChild('cantidad');
        iNode.Text := AnsiReplaceStr(FormatFloat('######0.00', Self.Lineas.Items[i].Cantidad), ',', '.');
        //iNode.Text :=  FloatToStr(Self.Lineas.Items[i].Cantidad);
        iNode := iRegistro.AddChild('precio');
        iNode.Text := iCurrToXMLFormat4(Self.Lineas.Items[i].Precio);
        iNode := iRegistro.AddChild('descuento');
        iNode.Text := AnsiReplaceStr(FormatFloat('######0.00', Self.Lineas.Items[i].Descuento), ',', '.');
        //iNode.Text := FloatToStr(Self.Lineas.Items[i].Descuento);
        iNode := iRegistro.AddChild('precio_total_sin_dto');
        iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].PVPSinDescuento);
        iNode := iRegistro.AddChild('precio_total');
        iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].PVP);
        iNode := iRegistro.AddChild('importe');
        iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].Importe);
        iNode := iRegistro.AddChild('importe_total');
        iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].ImporteTotal);
        iNode := iRegistro.AddChild('codImp');
        iNode.Text := Self.Lineas.Items[i].CodImp;

        //promocion
        if Self.Lineas.Items[i].IdPromocion > 0 then
        begin
           iPromocion := iRegistro.AddChild('promocion');

           iNode := iPromocion.AddChild('idpromocion');
           iNode.Text := IntToStr(Self.Lineas.Items[i].IdPromocion);

           iNode := iPromocion.AddChild('precio_tarifa');
           iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].PrecioTarifa);

           iNode := iPromocion.AddChild('precio_tarifa_total');
           iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].PVPTarifa);

           iNode := iPromocion.AddChild('puntos');
           iNode.Text := IntToStr(Self.Lineas.Items[i].Puntos);

           iNode := iPromocion.AddChild('texto_promocion');
           iNode.Text := Self.Lineas.Items[i].TextoPromocion;

           iNode := iPromocion.AddChild('ahorro');
           iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].Ahorro);
        end;
     end;

     //Genera Pagos
     iPagos := iTicket.AddChild('pagos');
     for i := 0 to Self.Pagos.Count - 1 do
     begin
        iRegistro := iPagos.AddChild('pago');
        iNode := iRegistro.AddChild('codmedpag');
        iNode.Text := Self.Pagos.Items[i].Codmedpag;
        iNode := iRegistro.AddChild('desmedpag');
        iNode.Text := Self.Pagos.Items[i].Desmedpag;
        iNode := iRegistro.AddChild('importe');
        iNode.Text := iCurrToXMLFormat(Self.Pagos.Items[i].Importe);
        iNode := iRegistro.AddChild('numero_operacion');
        iNode.Text := Self.Pagos.Items[i].Numero_operacion;
     end;

     //Operacion TEF
     if Self.OperacionTEF.NumAutorizacion <> '' then
     begin
        iOperacionTEF := iPagos.AddChild('operacionTEF');

        iNode := iOperacionTEF.AddChild('pos');
        iNode.Text := IntToStr(Self.OperacionTEF.Pos);

        iNode := iOperacionTEF.AddChild('codigocentro');
        iNode.Text := IntToStr(Self.OperacionTEF.CodigoCentro);

        iNode := iOperacionTEF.AddChild('codigotienda');
        iNode.Text := IntToStr(Self.OperacionTEF.CodigoTienda);

        iNode := iOperacionTEF.AddChild('codigocajera');
        iNode.Text := IntToStr(Self.OperacionTEF.CodigoCajera);

        iNode := iOperacionTEF.AddChild('tipotransaccion');
        iNode.Text := Self.OperacionTEF.TipoTransaccion;

        iNode := iOperacionTEF.AddChild('importe');
        iNode.Text := iCurrToXMLFormat(Self.OperacionTEF.Importe);

        iNode := iOperacionTEF.AddChild('id_ticket');
        iNode.Text := Self.OperacionTEF.Ticket;

        iNode := iOperacionTEF.AddChild('tipomoneda');
        iNode.Text := Self.OperacionTEF.TipoMoneda;

        iNode := iOperacionTEF.AddChild('fuc');
        iNode.Text := Self.OperacionTEF.FUC;

        iNode := iOperacionTEF.AddChild('terminal');
        iNode.Text := Self.OperacionTEF.Terminal;

        iNode := iOperacionTEF.AddChild('nombreentidad');
        iNode.Text := Self.OperacionTEF.NombreEntidad;

        iNode := iOperacionTEF.AddChild('nombrecliente');
        iNode.Text := Self.OperacionTEF.NombreCliente;

        iNode := iOperacionTEF.AddChild('aid');
        iNode.Text := Self.OperacionTEF.Aid;

        iNode := iOperacionTEF.AddChild('pan');
        iNode.Text := Self.OperacionTEF.PAN;

        iNode := iOperacionTEF.AddChild('p23');
        iNode.Text := Self.OperacionTEF.P23;

        iNode := iOperacionTEF.AddChild('applicationlabel');
        iNode.Text := Self.OperacionTEF.ApplicationLabel;

        iNode := iOperacionTEF.AddChild('fechatransaccion');
        iNode.Text := FormatDateTime('yyyy-mm-dd''T''hh:nn:ss', Self.OperacionTEF.FechaTransaccion);

        iNode := iOperacionTEF.AddChild('numautorizacion');
        iNode.Text := Self.OperacionTEF.NumAutorizacion;

        iNode := iOperacionTEF.AddChild('establecimiento');
        iNode.Text := Self.OperacionTEF.Establecimiento;

        iNode := iOperacionTEF.AddChild('direccionestablecimiento');
        iNode.Text := Self.OperacionTEF.DireccionEstablecimiento;

        iNode := iOperacionTEF.AddChild('requestcode');
        iNode.Text := Self.OperacionTEF.RequestCode;

        iNode := iOperacionTEF.AddChild('terminalid');
        iNode.Text := Self.OperacionTEF.TerminalId;

        iNode := iOperacionTEF.AddChild('verificaciontitular');
        iNode.Text := Self.OperacionTEF.VerificacionTitular;

        iNode := iOperacionTEF.AddChild('authmode');
        iNode.Text := IntToStr(Self.OperacionTEF.AuthMode);

        iNode := iOperacionTEF.AddChild('tipolectura');
        iNode.Text := IntToStr(Self.OperacionTEF.TipoLectura);
     end;
  end;


  procedure TTicket.BD_CargarXML(UID: String);
  var
    st: TMemoryStream;
  begin
     //Primero mirar en la tala de tickets, si no encuentra el ticket mirar en la tabla de historicos
     with TDMTicket(FDataModule) do
     begin
        Q_TICKET_XML.Close;
        Q_TICKET_XML.ParamByName('UID_TICKET').AsString := UID;
        Q_TICKET_XML.Open;
        if not Q_TICKET_XML.IsEmpty then
        begin
           st := TMemoryStream.Create;
           try
              TBlobField(Q_TICKET_XML.FieldByName('TICKET')).SaveToStream(st);
              FXMLTicket.LoadFromStream(st, xetUTF_8);
           finally
              st.Free;
           end;
        end
        //Cargar las estructuras del TTicket

     end;
  end;

  function TTicket.GetDataSetPresentacionLineas: TDataSet;
  begin
     result := TDataSet(TDMTicket(FDataModule).LINEAS);
  end;

  function TTicket.GetDataSetPresentacionPagos: TDataSet;
  begin
     result := TDataSet(TDMTicket(FDataModule).PAGOS);
  end;

  function TTicket.GetDataSetPresentacionImpuestos: TDataSet;
  begin
     result := TDataSet(TDMTicket(FDataModule).IMPUESTOS);
  end;

  procedure TTicket.SetUsaDataSetPresentacion(Value: Boolean);
  begin
     if Value <> FUsaDataSetPresentacion then
        FUsaDataSetPresentacion := Value;
  end;

  procedure TTicket.NuevoTicket;
  begin
     Self.Clear;
     FOperacionTEF.Clear;
     FLineasTicket.Clear;
     FPagosTicket.Clear;
     FImpuestosTicket.Clear;
     if FUsaDataSetPresentacion then
     begin
        with TDMTicket(FDataModule).LINEAS do
        begin
           if Active then
              Clear;
           Close;
        end;
        with TDMTicket(FDataModule).PAGOS do
        begin
           if Active then
              Clear;
           Close;
        end;
        with TDMTicket(FDataModule).IMPUESTOS do
        begin
           if Active then
              Clear;
           Close;
        end;
     end;
     Self.UIDTicket := '';
     Self.IdTicket := -1;
  end;

  procedure TTicket.Clear;
  begin
     FUIDTicket := '';
     FIdTicket := -1;
     FCodserie := '';
     FFecha := 0;
     FCodcli := '';
     FDescli := '';
     FTienda := '';
     FId_grupo_impuestos := DMImpuestos.GrupoActivo(Date);
     FId_trat_impuestos := 1;
     FCodcaja := '';
     FUID_diario_caja := '';
     FBase := 0;
     FImpuestos := 0;
     FTotal := 0;
     FId_usuario := 0;
     FTotalEntregado := 0;
     FTotalPendiente := 0;
     FCambio := 0;
  end;

  procedure TTicket.PresentacionLineasAdd(DataSet: TDataSet; LineaTicket: TLineaTicket; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('LINEA').AsInteger := LineaTicket.Linea;
     DataSet.FieldByName('CODART').AsString := LineaTicket.Codart;
     DataSet.FieldByName('DESGLOSE1').AsString := LineaTicket.Desglose1;
     DataSet.FieldByName('DESGLOSE2').AsString := LineaTicket.Desglose2;
     DataSet.FieldByName('DESART').AsString := LineaTicket.Desart;
     DataSet.FieldByName('CANTIDAD').AsFloat := LineaTicket.Cantidad;
     DataSet.FieldByName('PRECIO_TOTAL_SIN_DTO').AsFloat := LineaTicket.PVPSinDescuento;
     DataSet.FieldByName('DESCUENTO').AsFloat := LineaTicket.Descuento;
     DataSet.FieldByName('PRECIO_TOTAL').AsFloat := LineaTicket.PVP;
     DataSet.FieldByName('IMPORTE_TOTAL').AsFloat := LineaTicket.ImporteTotal;
     DataSet.Post;
  end;

  procedure TTicket.PresentacionPagosAdd(DataSet: TDataSet; PagoTicket: TPagoTicket; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('DESMEDPAG').AsString := PagoTicket.Desmedpag;
     DataSet.FieldByName('IMPORTE').AsFloat := PagoTicket.Importe;
     DataSet.Post;
  end;

  procedure TTicket.PresentacionImpuestosAdd(DataSet: TDataSet; ImpuestoTicket: TImpuestoTicket; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('CODIMP').AsString := ImpuestoTicket.CodImp;
     DataSet.FieldByName('BASE').AsFloat := ImpuestoTicket.Base;
     DataSet.FieldByName('IMPUESTOS').AsFloat := ImpuestoTicket.Impuestos;
     DataSet.FieldByName('TOTAL').AsFloat := ImpuestoTicket.Total;
     DataSet.Post;
  end;

  procedure TTicket.RefrescaPresentacionLineas;
  var
     i: Integer;
  begin
     if FUsaDataSetPresentacion then
     begin
        with TDMTicket(FDataModule) do
        begin
           LINEAS.Close;
           LINEAS.CreateDataSet;
           LINEAS.Open;
           for i := 0 to FLineasTicket.Count - 1 do
              PresentacionLineasAdd(LINEAS, FLineasTicket.Items[i], i);
        end;
     end;
  end;

  procedure TTicket.RefrescaPresentacionPagos;
  var
     i: Integer;
  begin
     if FUsaDataSetPresentacion then
     begin
        with TDMTicket(FDataModule) do
        begin
           PAGOS.Close;
           PAGOS.CreateDataSet;
           PAGOS.Open;
           for i := 0 to FPagosTicket.Count - 1 do
              PresentacionPagosAdd(PAGOS, FPagosTicket.Items[i], i);
        end;
     end;
  end;

  procedure TTicket.RefrescaPresentacionImpuestos;
  var
     i: Integer;
  begin
     if FUsaDataSetPresentacion then
     begin
        with TDMTicket(FDataModule) do
        begin
           IMPUESTOS.Close;
           IMPUESTOS.CreateDataSet;
           IMPUESTOS.Open;
           for i := 0 to FImpuestosTicket.Count - 1 do
              PresentacionImpuestosAdd(IMPUESTOS, FImpuestosTicket.Items[i], i);
        end;
     end;
  end;

  procedure TTicket.SetCodserie(Value: String);
  begin
     if Value <> FCodserie then
        if iCheckLengthCadena(Value, 4, 'Serie', True) then
           FCodserie := Value;
  end;

//n/a ticket//  procedure TTicket.SetReferencia_cliente(Value: String);
//  begin
//     if Value <> FReferencia_cliente then
//        if iCheckLengthCadena(Value, 45, 'Referencia cliente', True) then
//           FReferencia_cliente := Value;
//  end;

  procedure TTicket.CalculaPublico;
  var
     i: Integer;
     Impuesto: TImpuestoTicket;
     TipoImpuesto: TTipoImpuesto;
  begin
     Self.TotalBase := 0;
     Self.TotalImpuestos := 0;
     Self.Total := 0;
     Self.Id_grupo_impuestos := DMImpuestos.GrupoActivo(Date);
     Impuestos.Clear;

     //Suma las lineas y crea tantas lineas de impuestos como sean necesarias
     for i := 0 to Lineas.Count - 1 do
     begin
        Impuesto := Impuestos.GetItem(Lineas.Items[i].CodImp);
        if Impuesto = nil then
        begin
           Impuesto := TImpuestoTicket.Create;
           Impuesto.Total := 0;
           Impuestos.Add(Impuesto);
        end;

        Impuesto.CodImp := Lineas.Items[i].CodImp;
        Impuesto.Total := Impuesto.Total + Lineas.Items[i].ImporteTotal;
     end;

     //Calcula los impuestos del total del ticket
     for i := 0 to Impuestos.Count - 1 do
     begin
         //Obtener el tipo de impuesto con sus porcentajes
         TipoImpuesto := TTipoImpuesto.Create(Id_grupo_impuestos, Id_trat_impuestos, Impuestos.Items[i].CodImp);
         try
            //Calcular el total de Impuesto
            Impuestos.Items[i].Impuestos := iRedondeo(Impuestos.Items[i].Total - TipoImpuesto.DameBaseDeImporte(Impuestos.Items[i].Total), 2);

            //Calcular totales
            Impuestos.Items[i].Base := iRedondeo(Impuestos.Items[i].Total - Impuestos.Items[i].Impuestos, 2);

            //Calcular los totales del ticket
            Self.TotalBase := Self.TotalBase + Impuestos.Items[i].Base;
            Self.TotalImpuestos := Self.TotalImpuestos + Impuestos.Items[i].Impuestos;
            Self.Total := Self.Total + Impuestos.Items[i].Total;
         finally
            TipoImpuesto.Free;
         end;
     end;
     CalculaPendiente;
  end;

  procedure TTicket.SetEntregado(Value: Currency);
  begin
     //No se asocia con las líneas de pago los pagos son los pagos y el dinero entregado es distinto
     if FTotalEntregado <> Value then
     begin
        FTotalEntregado := Value;
        CalculaPendiente;
     end;
  end;

  procedure TTicket.CalculaPendiente;
  begin
     if FTotal < 0 then
     begin
        if FTotalEntregado > FTotal then
        begin
           FTotalPendiente := (FTotalEntregado - FTotal);
           FCambio := 0;
        end
        else
        begin
           FTotalPendiente := 0;
           FCambio := (FTotalEntregado - FTotal);
        end;
     end
     else
     begin
        if FTotalEntregado < FTotal then
        begin
           FTotalPendiente := (FTotal - FTotalEntregado);
           FCambio := 0;
        end
        else
        begin
           FTotalPendiente := 0;
           FCambio := (FTotalEntregado - FTotal);
        end;
     end;
  end;

  procedure TTicket.BD_SalvarXML;
  var
     ST: TMemoryStream;
  begin
     if (Self.IdTicket < 0) or (Self.UIDTicket = '') then
        raise Exception.Create('Identificador único de ticket no especificado');

     if not FXMLTicket.Active then
        FXMLTicket.Active := True;

     if FXMLTicket.IsEmptyDoc then
        GeneraTicketXML;

     if FXMLTicket.IsEmptyDoc then
        raise Exception.Create('No se ha generado el xml del ticket');

     CalculaPublico;

     ST := TMemoryStream.Create;
     try
        with TDMTicket(FDataModule) do
        begin
           Q_INSERTA_TICKET_XML.ParamByName('UID_TICKET').AsString := Self.UIDTicket;
           Q_INSERTA_TICKET_XML.ParamByName('CODALM').AsString := Self.Tienda;
           Q_INSERTA_TICKET_XML.ParamByName('ID_TICKET').AsInteger := Self.IdTicket;
           Q_INSERTA_TICKET_XML.ParamByName('FECHA').AsDateTime := Self.Fecha;
           FXMLTicket.SaveToStream(ST);
           if Q_INSERTA_TICKET_XML.Connection.ProviderName = 'Oracle' then
              Q_INSERTA_TICKET_XML.ParamByName('TICKET').LoadFromStream(ST, ftOraBlob)
           else
              Q_INSERTA_TICKET_XML.ParamByName('TICKET').LoadFromStream(ST, ftBlob);

           Q_INSERTA_TICKET_XML.Execute;
        end;
     finally
        ST.Free;
     end;
  end;

(*******************************************************************************
*   Clase TListaLineasTicket                                                   *
*******************************************************************************)
  constructor TListaLineasTicket.Create(Ticket: TTicket);
  begin
     inherited Create;
     FTicket := Ticket;
     FDataModule := TDMTicket(FTicket.FDataModule);
     FOwnsObjects := True;
  end;

  procedure TListaLineasTicket.Clear;
  begin
     inherited Clear;
     FTicket.CalculaPublico;
  end;

  function TListaLineasTicket.Add(AObject: TLineaTicket): Integer;
  begin
     Result := inherited Add(AObject);
     FTicket.CalculaPublico;
  end;

  function TListaLineasTicket.GetItem(Index: Integer): TLineaTicket;
  begin
     Result := TLineaTicket(inherited Items[Index]);
  end;

  function TListaLineasTicket.IndexOf(AObject: TLineaTicket): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaLineasTicket.Insert(Index: Integer; AObject: TLineaTicket);
  begin
     inherited Insert(Index, AObject);
     FTicket.CalculaPublico;
  end;

  function TListaLineasTicket.Remove(AObject: TLineaTicket): Integer;
  begin
     Result := inherited Remove(AObject);
     FTicket.CalculaPublico;
  end;

  procedure TListaLineasTicket.SetItem(Index: Integer; AObject: TLineaTicket);
  begin
     inherited Items[Index] := AObject;
  end;

(*******************************************************************************
*   Clase TLineaTicket                                                        *
*******************************************************************************)
  constructor TLineaTicket.Create(Ticket: TTicket);
  begin
     inherited Create;
     FTicket := Ticket;
     FDataModule := TDMTicket(FTicket.FDataModule);
     FIdPromocion := -1;
  end;

  procedure TLineaTicket.CalculaPublico;
  var
     TipoImpuesto: TTipoImpuesto;
  begin
     TipoImpuesto := TTipoImpuesto.Create(FTicket.FId_grupo_impuestos, FTicket.FId_trat_impuestos, Self.FCodImp);
     try
        //Calcula el PVP final
        Self.FPVP := iRedondeo(Self.FPVPSinDescuento - (Self.FPVPSinDescuento * Self.FDescuento / 100), 4);
        //Calcula el importe total con impuestos
        Self.FImporteTotal := iRedondeo(Self.FPVP * Self.FCantidad, 2);
        //Calcula el precio sin impuestos
        Self.FPrecio := iRedondeo(TipoImpuesto.DameBaseDeImporte(Self.FImporteTotal) / Self.FCantidad, 4);
        //Calcula el importe sin impuestos
        Self.FImporte := iRedondeo(Self.Cantidad * Self.FPrecio, 2);

        if (Self.FIdPromocion > 0) and (Self.FPVPTarifa > Self.FPVP) then
           FAhorro := (Self.FPVPTarifa - Self.FPVP) * FCantidad
        else
           FAhorro := 0;

        FTicket.CalculaPublico;
     finally
        TipoImpuesto.Free;
     end;
  end;

  procedure TLineaTicket.SetPVPSinDescuento(Value: Currency);
  begin
     if Value <> FPVPSinDescuento then
     begin
        FPVPSinDescuento := Value;
        CalculaPublico;
     end;
  end;

  procedure TLineaTicket.SetPVPTarifa(Value: Currency);
  begin
     if Value <> FPVPTarifa then
     begin
        FPVPTarifa := Value;
        CalculaPublico;
     end;
  end;

  procedure TLineaTicket.SetCantidad(Value: Extended);
  begin
     if Value <> FCantidad then
     begin
        FCantidad := Value;
        CalculaPublico;
     end;
  end;

  procedure TLineaTicket.SetDescuento(Value: Extended);
  begin
     if Value <> FDescuento then
     begin
        FDescuento := Value;
        CalculaPublico;
     end;
  end;

  procedure TLineaTicket.SetIdPromocion(Value: Integer);
  begin
     if Value <> FIdPromocion then
     begin
        FIdPromocion := Value;
        CalculaPublico;
     end;
  end;


(*******************************************************************************
*   Clase TPagoTicket                                                   *
*******************************************************************************)
constructor TPagoTicket.Create(Ticket: TTicket);
begin
   FTicket := Ticket;
end;

procedure TPagoTicket.SetImporte(Value: Currency);
begin
   if Importe <> Value then
   begin
      FImporte := Value;
   end;
end;

(*******************************************************************************
*   Clase TListaPagosTicket                                                   *
*******************************************************************************)
  constructor TListaPagosTicket.Create(Ticket: TTicket);
  begin
     inherited Create;
     FTicket := Ticket;
     FDataModule := TDMTicket(FTicket.FDataModule);
     FOwnsObjects := True;
  end;

  procedure TListaPagosTicket.Clear;
  begin
     inherited Clear;
  end;

  function TListaPagosTicket.Add(AObject: TPagoTicket): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaPagosTicket.GetItem(Index: Integer): TPagoTicket;
  begin
     Result := TPagoTicket(inherited Items[Index]);
  end;

  function TListaPagosTicket.GetItem(CodMedPag: String): TPagoTicket;
  var
     x: Integer;
  begin
     result := nil;
     for x := 0 to Count - 1 do
     begin
        if Items[x].CodMedPag = CodMedPag then
        begin
           result := TPagoTicket(Items[x]);
           Break;
        end;
     end;
  end;

  function TListaPagosTicket.IndexOf(AObject: TPagoTicket): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaPagosTicket.Insert(Index: Integer; AObject: TPagoTicket);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaPagosTicket.Remove(AObject: TPagoTicket): Integer;
  begin
     Result := inherited Remove(AObject);
  end;

  procedure TListaPagosTicket.SetItem(Index: Integer; AObject: TPagoTicket);
  begin
     inherited Items[Index] := AObject;
  end;

(*******************************************************************************
*   Clase TImpuestoTicket                                                      *
*******************************************************************************)

(*******************************************************************************
*   Clase TListaImpuestosTicket                                                   *
*******************************************************************************)
  constructor TListaImpuestosTicket.Create(Ticket: TTicket);
  begin
     inherited Create;
     FTicket := Ticket;
     FDataModule := TDMTicket(FTicket.FDataModule);
     FOwnsObjects := True;
  end;

  function TListaImpuestosTicket.Add(AObject: TImpuestoTicket): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaImpuestosTicket.GetItem(Index: Integer): TImpuestoTicket;
  begin
     Result := TImpuestoTicket(inherited Items[Index]);
  end;

  function TListaImpuestosTicket.GetItem(CodImp: String): TImpuestoTicket;
  var
     x: Integer;
  begin
     result := nil;
     for x := 0 to Count - 1 do
     begin
        if Items[x].CodImp = CodImp then
        begin
           result := TImpuestoTicket(Items[x]);
           Break;
        end;
     end;
  end;


  function TListaImpuestosTicket.IndexOf(AObject: TImpuestoTicket): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaImpuestosTicket.Insert(Index: Integer; AObject: TImpuestoTicket);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaImpuestosTicket.Remove(AObject: TImpuestoTicket): Integer;
  begin
     Result := inherited Remove(AObject);
     FTicket.CalculaPublico;
  end;

  procedure TListaImpuestosTicket.SetItem(Index: Integer; AObject: TImpuestoTicket);
  begin
     inherited Items[Index] := AObject;
  end;

  end.
