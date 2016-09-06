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

unit DataMCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, JvJCLUtils,
  Dialogs, DataMBase, DB, Uni, DBAccess, MemDS, Contnrs, DBClient, Provider, XMLIntf, XMLDoc,
  DataMTienda, DataMContadores, DataMVariables;

resourcestring
  STR_MasdeunaCajaAbierta = 'Existe más de una caja abierta';
  STR_CajaCerrada = 'No existe ninguna caja abierta, se creara una nueva caja automáticamente.';

type
  { Forward declarations }
  TDMCaja = class;
  TLineaCaja = class;
  TListaLineasCaja = class;
  TTotalesCaja = class;
  TResumenVentas = class;
  TListaResumenVentas = class;
  TRecuentoCaja = class;
  TListaLineasRecuentoCaja = class;
  TLineaRecuentoCaja = class;
  TCaja = class;

  TDMCaja = class(TDMBase)
    Q_CAJA_CAB: TUniQuery;
    Q_CAJA_DET: TUniQuery;
    INSERTAR_CAB_CAJA: TUniQuery;
    Q_ESTADO_APERTURA: TUniQuery;
    INSERTAR_DET_CAJA: TUniQuery;
    Q_ULTIMA_LINEA_DET: TUniQuery;
    ELIMINA_DET_CAJA: TUniQuery;
    LINEAS: TClientDataSet;
    LINEASIDX: TIntegerField;
    LINEASLINEA: TIntegerField;
    LINEASFECHA: TDateField;
    LINEASENTRADA: TFloatField;
    LINEASSALIDA: TFloatField;
    LINEASCONCEPTO: TStringField;
    LINEASDOCUMENTO: TStringField;
    LINEASCODMEDPAG: TStringField;
    LINEASDESMEDPAG: TStringField;
    IMPORTE_MOVIMIENTOS: TUniQuery;
    IMPORTE_TICKETS: TUniQuery;
    NUMERO_DEVOLUCIONES: TUniQuery;
    NUMERO_TICKETS: TUniQuery;
    Q_RESUMEN_VENTAS: TUniQuery;
    RESUMEN: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    RESUMENTOTAL: TCurrencyField;
    RESUMENENTRADA: TCurrencyField;
    RESUMENSALIDA: TCurrencyField;
    LINEAS_VENTAS: TClientDataSet;
    IntegerField2: TIntegerField;
    IntegerField4: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    LINEAS_RECUENTO: TClientDataSet;
    IntegerField6: TIntegerField;
    StringField9: TStringField;
    StringField10: TStringField;
    LINEAS_RECUENTOCANTIDAD: TIntegerField;
    LINEAS_RECUENTOVALOR: TCurrencyField;
    LINEAS_RECUENTOIMPORTE: TCurrencyField;
    Q_CAJA_DET_RECUENTO: TUniQuery;
    INSERTAR_CAJA_DET_RECUENTO: TUniQuery;
    BORRAR_RECUENTO: TUniQuery;
    RESUMENRECUENTO: TCurrencyField;
    RESUMENDIFERENCIA: TCurrencyField;
    IMPORTE_RECUENTO: TUniQuery;
    CIERRA_CAJA: TUniQuery;
    Q_ULTIMA_CAJA: TUniQuery;
    LINEAS_VENTASFECHA: TDateTimeField;
    LINEAS_VENTASUID_TICKET: TStringField;
    LINEASUID_TICKET: TStringField;
    LINEASUID_DIARIO_CAJA: TStringField;
    LINEAS_VENTASUID_DIARIO_CAJA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BD_CerrarCaja( Caja : TCaja); //UIDDiarioCaja: String; fecha_cierre: TDateTime);
    function BD_DameFechaApertura(caja: String): TDate;
    function BD_DameUIDDiarioCajaAbierta(almacen: String; caja: String): String;
    function BD_DameNuevaLinea(UIDDiarioCaja: String): Integer;
    function BD_DameUIDDiarioUltimaCaja(almacen: String; caja: String): String;

    constructor Create(AOwner: TComponent); override;
  end;

  TCaja = class(TDBDataObject)
  private
     FXMLCaja : IXMLDocument;
     FLineasCaja: TListaLineasCaja;
     FUsaDataSetPresentacion: Boolean;
     FUsaDataSetPresentacionResumen: Boolean;

     FUID_diario_caja: String;
     FCodalm: String;
     FCodcaja: String;
     FFecha_apertura: TDateTime;
     FFecha_cierre: TDateTime;
     FId_Usuario: Integer;
     FSaldo_inicial: Extended;
     FTotalesCaja: TTotalesCaja;
     FListaResumenVentas: TListaResumenVentas;

     procedure SetUsaDataSetPresentacion(Value: Boolean);
     procedure PresentacionMovAdd(DataSet: TDataSet; LineaCaja: TLineaCaja; Indice: Integer);
     procedure PresentacionResumenAdd(DataSet: TDataSet; Resumen: TResumenVentas; Indice: Integer);
  public
     property XMLCaja : IXMLDocument read FXMLCaja write FXMLCaja;
     property UID_diario_caja: String read FUID_diario_caja write FUID_diario_caja;
     property Codalm: String read FCodalm write FCodalm;
     property Codcaja: String read FCodcaja write FCodcaja;
     property Fecha_apertura: TDateTime read FFecha_apertura write FFecha_apertura;
     property Fecha_cierre: TDateTime read FFecha_cierre write FFecha_cierre;
     property Id_Usuario: Integer read FId_Usuario write FId_Usuario;
     property Saldo_inicial: Extended read FSaldo_inicial write FSaldo_inicial;
     property TotalesCaja: TTotalesCaja read FTotalesCaja;
     property ResumenVentas: TListaResumenVentas read FListaResumenVentas;

     property UsaDataSetPresentacion: Boolean read FUsaDataSetPresentacion write SetUsaDataSetPresentacion;
     property UsaDataSetPresentacionResumen: Boolean read FUsaDataSetPresentacionResumen write FUsaDataSetPresentacionResumen;
     property Lineas: TListaLineasCaja read FLineasCaja write FLineasCaja;

     constructor Create(DataModule: TDMCaja);
     destructor Destroy; override;

     procedure BD_Cargar(UIDDiarioCaja: String);
     procedure BD_Abrir_Caja(UIDDiarioCaja: String; FechaApertura: TDateTime; SaldoInicial: Currency);
     procedure RefrescaPresentacionMov;
     function GetDataSetPresentacionMov: TDataSet;
     function GetDataSetPresentacionMovVentas: TDataSet;
     procedure RefrescaPresentacionResumen;
     function GetDataSetPresentacionResumen: TDataSet;
     procedure CalcularTotalesCaja;
     procedure CalcularResumenVentas;
     procedure GeneraCajaXML;
  end;

  TTotalesCaja = class(TOBject)
  private
     FImporteMovEntradas: Currency;
     FImporteMovSalidas: Currency;
     FImporteVenta: Currency;
     FImporteDevoluciones: Currency;
     FImporteTotalEntradas: Currency;
     FImporteTotalSalidas: Currency;
     FNumeroTickets: Integer;
     FNumeroTicketsVenta: Integer;
     FNumeroTicketsDevoluciones: Integer;
     FImporteRecuento: Currency;
     FImporteDescuadre: Currency;
  public
     property ImporteMovEntradas: Currency read FImporteMovEntradas;
     property ImporteMovSalidas: Currency read FImporteMovSalidas;
     property ImporteVenta: Currency read FImporteVenta;
     property ImporteDevoluciones: Currency read FImporteDevoluciones;
     property ImporteTotalEntradas: Currency read FImporteTotalEntradas;
     property ImporteTotalSalidas: Currency read FImporteTotalSalidas;
     property NumeroTickets: Integer read FNumeroTickets;
     property NumeroTicketsVenta: Integer read FNumeroTicketsVenta;
     property NumeroTicketsDevoluciones: Integer read FNumeroTicketsDevoluciones;
     property ImporteRecuento: Currency read FImporteRecuento;
     property ImporteDescuadre: Currency read FImporteDescuadre;
  end;

  TResumenVentas = class(TOBject)
  private
     FCodMedPag: String;
     FDesMedPag: String;
     FEntrada: Currency;
     FSalida: Currency;
     FTotal: Currency;
     FRecuento: Currency;
     FDescuadre: Currency;
  public
     property CodMedPag: String read FCodMedPag;
     property DesMedPag: String read FDesMedPag;
     property Entrada: Currency read FEntrada;
     property Salida: Currency read FSalida;
     property Total: Currency read FTotal;
     property Recuento: Currency read FRecuento;
     property Descuadre: Currency read FDescuadre;
  end;

  TListaResumenVentas = class(TObjectList)
  protected
     function GetItem(Index: Integer): TResumenVentas;
     procedure SetItem(Index: Integer; AObject: TResumenVentas);
  public
     function Add(AObject: TResumenVentas): Integer;
     function Remove(AObject: TResumenVentas): Integer;
     function IndexOf(AObject: TResumenVentas): Integer;
     procedure Insert(Index: Integer; AObject: TResumenVentas);
     property Items[Index: Integer]: TResumenVentas read GetItem write SetItem; default;
     constructor Create;
  end;


  TLineaCaja = class(TDBDataObject)
  private
     FUID_diario_caja: String;
     Flinea: Integer;
     FFecha: TDateTime;
     FEntrada: Currency;
     FSalida: Currency;
     FConcepto: string;
     FDocumento: string;
     FCodmedpag: String;
     FDesmedpag: String;
     FUIDTicket: String;
  public
     property UID_diario_caja: String read FUID_diario_caja write FUID_diario_caja;
     property linea: Integer read Flinea write Flinea;
     property Fecha: TDateTime read FFecha write FFecha;
     property Entrada: Currency read FEntrada write FEntrada;
     property Salida: Currency read FSalida write FSalida;
     property Concepto: string read FConcepto write FConcepto;
     property Documento: string read FDocumento write FDocumento;
     property Codmedpag: string read FCodmedpag write FCodmedpag;
     property Desmedpag: string read FDesmedpag write FDesmedpag;
     property UIDTicket: String read FUIDTicket write FUIDTicket;

     procedure BD_InsertarApunte;
     procedure BD_EliminarApunte;

     constructor Create(DataModule: TDMCaja);
     destructor Destroy; override;
  end;

  TListaLineasCaja = class(TObjectList)
  protected
     function GetItem(Index: Integer): TLineaCaja;
     procedure SetItem(Index: Integer; AObject: TLineaCaja);
  public
     function Add(AObject: TLineaCaja): Integer;
     function Remove(AObject: TLineaCaja): Integer;
     function IndexOf(AObject: TLineaCaja): Integer;
     procedure Insert(Index: Integer; AObject: TLineaCaja);
     property Items[Index: Integer]: TLineaCaja read GetItem write SetItem; default;
     constructor Create;
  end;

  TRecuentoCaja = class(TDBDataObject)
  private
     FLineas: TListaLineasRecuentoCaja;
     FUsaDataSetPresentacion: Boolean;
     FUID_diario_caja: String;

     procedure PresentacionLineasAdd(DataSet: TDataSet; LineaRecuentoCaja: TLineaRecuentoCaja; Indice: Integer);
     function GetTotalRecuento: Currency;
  public
     property UID_diario_caja: String read FUID_diario_caja write FUID_diario_caja;
     property Lineas: TListaLineasRecuentoCaja read FLineas write FLineas;
     property UsaDataSetPresentacion: Boolean read FUsaDataSetPresentacion write FUsaDataSetPresentacion;
     property TotalRecuento: Currency read GetTotalRecuento;

     constructor Create(DataModule: TDMCaja);
     destructor Destroy;

     procedure RefrescaPresentacionLineas;
     function GetDataSetPresentacionLineas: TDataSet;
     procedure BD_Cargar(UID: String);
     procedure BD_Salvar;
  end;

  TListaLineasRecuentoCaja = class(TObjectList)
  protected
     function GetItem(Index: Integer): TLineaRecuentoCaja; overload;
     procedure SetItem(Index: Integer; AObject: TLineaRecuentoCaja);
  public
     function GetItem(CodMedPag: String; Valor: Currency): TLineaRecuentoCaja; overload;
     function Add(AObject: TLineaRecuentoCaja): Integer;
     function Remove(AObject: TLineaRecuentoCaja): Integer;
     function IndexOf(AObject: TLineaRecuentoCaja): Integer;
     procedure Insert(Index: Integer; AObject: TLineaRecuentoCaja);
     property Items[Index: Integer]: TLineaRecuentoCaja read GetItem write SetItem; default;
     constructor Create;
  end;

  TLineaRecuentoCaja = class(TDBDataObject)
  protected
     FUID_diario_caja: String;
     FLinea: Integer;
     FCodmedpag: String;
     FDesmedpag: String;
     FCantidad: Integer;
     FValor: Currency;
     FTotal: Currency;

     procedure SetCantidad(Value: Integer);
     procedure SetValor(Value: Currency);
  public
     property UID_diario_caja: String read FUID_diario_caja write FUID_diario_caja;
     property Linea: Integer read FLinea write FLinea;
     property Codmedpag: String read FCodmedpag write FCodmedpag;
     property Desmedpag: String read FDesmedpag write FDesmedpag;
     property Cantidad: Integer read FCantidad write SetCantidad;
     property Valor: Currency read FValor write SetValor;
     property Total: Currency read FTotal;
  end;

implementation

{$R *.dfm}
uses iGeneral;

(*******************************************************************************
*   Clase TDMCaja                                                       *
*******************************************************************************)
   constructor TDMCaja.Create(AOwner: TComponent);
   begin
      inherited Create(AOwner);
   end;

   function TDMCaja.BD_DameUIDDiarioCajaAbierta(almacen: string; caja: string): String;
   begin
      with Q_ESTADO_APERTURA do
      begin
         Close;
         ParamByName('CODALM').AsString := almacen;
         ParamByName('CODCAJA').AsString := caja;
         Open;
         if RecordCount > 1 then
            raise Exception.Create(STR_MasdeunaCajaAbierta);

         if not IsEmpty then
            Result := FieldByName('UID_DIARIO_CAJA').AsString    //La Caja está Abierta.
         else
            Result := '';  //La Caja está Cerrada.
         Close;
      end;
   end;

   function TDMCaja.BD_DameUIDDiarioUltimaCaja(almacen: String; caja: String): String;
   begin
      with Q_ULTIMA_CAJA do
      begin
         Close;
         ParamByName('CODALM').AsString := almacen;
         ParamByName('CODCAJA').AsString := caja;
         Open;

         if not IsEmpty then
            Result := FieldByName('UID_DIARIO_CAJA').AsString    //Ultima caja
         else
            Result := '';  //No se encontro caja
         Close;
      end;
   end;


   function TDMCaja.BD_DameNuevaLinea(UIDDiarioCaja: String): Integer;
   begin
      with Q_ULTIMA_LINEA_DET do
      begin
         Close;
         ParamByName('UID_DIARIO_CAJA').AsString := UIDDiarioCaja;
         Open;
         Result := FieldByName('LINEA').AsInteger + 1;
         Close;
      end;
   end;

   function TDMCaja.BD_DameFechaApertura(caja: string): TDate;
   begin
      with Q_ESTADO_APERTURA do
      begin
         Close;
         ParamByName('CODCAJA').AsString := caja;
         Open;
         result := FieldByName('FECHA_APERTURA').AsDateTime;
         Close;
      end;
   end;

   procedure TDMCaja.BD_CerrarCaja(Caja : TCaja); //UIDDiarioCaja: String; fecha_cierre: TDateTime);
   begin
      CIERRA_CAJA.ParamByName('UID_DIARIO_CAJA').AsString := Caja.UID_diario_caja;// UIDDiarioCaja;
      CIERRA_CAJA.ParamByName('FECHA_CIERRE').AsDateTime := Caja.Fecha_cierre; // fecha_cierre;
      CIERRA_CAJA.Execute;
   end;

(*******************************************************************************
*   Clase TCaja                                                                *
*******************************************************************************)
   constructor TCaja.Create(DataModule: TDMCaja);
   begin
      //Si el acceso a datos no viene preestablecido crea uno
      if DataModule = nil then
      begin
         FDataModule := TDMCaja.Create(nil);
         FDataModuleInterno := True;
      end
      else
      begin
         FDataModule := DataModule;
         FDataModuleInterno := False;
      end;
      FLineasCaja := TListaLineasCaja.Create();
      FUsaDataSetPresentacion := False;
      FTotalesCaja := TTotalesCaja.Create;
      FListaResumenVentas := TListaResumenVentas.Create;
      FXMLCaja := TXMLDocument.Create(nil);
   end;

   destructor TCaja.Destroy;
   begin
      FTotalesCaja.Free;
      FListaResumenVentas.Free;
      FLineasCaja.Free;
      inherited Destroy;
   end;

   procedure TCaja.BD_Cargar(UIDDiarioCaja: String);
   var
      Linea: TLineaCaja;
   begin
      with TDMCaja(FDataModule).Q_CAJA_CAB do
      begin
         Close;
         ParamByName('UID_DIARIO_CAJA').AsString := UIDDiarioCaja;
         Open;
         if not IsEmpty then
         begin
            Self.UID_diario_caja := FieldByName('UID_DIARIO_CAJA').AsString;
            Self.Codalm := FieldByName('CODALM').AsString;
            Self.Codcaja := FieldByName('CODCAJA').AsString;
            Self.Fecha_apertura := FieldByName('FECHA_APERTURA').AsDateTime;
            Self.Fecha_cierre := FieldByName('FECHA_CIERRE').AsDateTime;
            Self.Id_usuario := FieldByName('ID_USUARIO').AsInteger;
            Self.Saldo_inicial := FieldByName('SALDO_INICIAL').AsFloat;
         end;
         Close;
      end;

      with TDMCaja(FDataModule) do
      begin
         Q_CAJA_DET.Close;
         Q_CAJA_DET.ParamByName('CODALM').AsString := DMVariables.CodigoAlmacen;
         Q_CAJA_DET.ParamByName('UID_DIARIO_CAJA').AsString := UIDDiarioCaja;
         Q_CAJA_DET.Open;

         if FUsaDataSetPresentacion then
         begin
            LINEAS.Close;
            LINEAS.CreateDataSet;
            LINEAS.Open;

            LINEAS_VENTAS.Close;
            LINEAS_VENTAS.CreateDataSet;
            LINEAS_VENTAS.Open;
         end;

         FLineasCaja.Clear;

         while not Q_CAJA_DET.Eof do
         begin
             Linea := TLineaCaja.Create(TDMCaja(FDataModule));
             Linea.UID_diario_caja := Q_CAJA_DET.FieldByName('UID_DIARIO_CAJA').AsString;
             Linea.linea := Q_CAJA_DET.FieldByName('LINEA').AsInteger;
             Linea.Fecha := Q_CAJA_DET.FieldByName('FECHA').AsDateTime;
             Linea.Entrada := Q_CAJA_DET.FieldByName('ENTRADA').AsFloat;
             Linea.Salida := Q_CAJA_DET.FieldByName('SALIDA').AsFloat;
             Linea.Concepto := Q_CAJA_DET.FieldByName('CONCEPTO').AsString;
             Linea.Documento := Q_CAJA_DET.FieldByName('DOCUMENTO').AsString;
             Linea.Codmedpag := Q_CAJA_DET.FieldByName('CODMEDPAG').AsString;
             Linea.Desmedpag := Q_CAJA_DET.FieldByName('DESMEDPAG').AsString;
             Linea.UIDTicket := Q_CAJA_DET.FieldByName('UID_TICKET').AsString;

             FLineasCaja.Add(Linea);

             Q_CAJA_DET.Next;
         end;
         Q_CAJA_DET.Close;
      end;

      CalcularResumenVentas;
      CalcularTotalesCaja;
      
      RefrescaPresentacionMov;
   end;

   procedure TCaja.BD_Abrir_Caja(UIDDiarioCaja: String; FechaApertura: TDateTime; SaldoInicial: Currency);
   var
      Linea: TLineaCaja;
   begin
      if UIDDiarioCaja = '' then
         Self.UID_diario_caja := DMContador.DameGUID;

      with TDMCaja(FDataModule).INSERTAR_CAB_CAJA do
      begin
         ParamByName('UID_DIARIO_CAJA').AsString := Self.UID_diario_caja;
         ParamByName('CODALM').AsString := DMVariables.CodigoAlmacen;
         ParamByName('CODCAJA').AsString := DMVariables.CodigoCaja;
         ParamByName('FECHA_APERTURA').AsDateTime := FechaApertura;
         ParamByName('FECHA_CIERRE').Clear;
         ParamByName('ID_USUARIO').AsInteger := DMVariables.UsuarioIDU;
         Execute;
         if SaldoInicial <> 0 then
         begin
            Linea := TLineaCaja.Create(TDMCaja(Self.FDataModule));
            try
               Linea.FUID_diario_caja := Self.UID_diario_caja;
               Linea.Flinea := 1;
               Linea.FFecha := now;
               if SaldoInicial > 0 then
               begin
                  Linea.FEntrada := SaldoInicial;
                  Linea.FSalida := 0;
               end
               else
               begin
                  Linea.FEntrada := 0;
                  Linea.FSalida := SaldoInicial;
               end;
               Linea.FConcepto := 'SALDO INICIAL';
               Linea.FDocumento := '';
               Linea.FCodmedpag := '0000';
               Linea.BD_InsertarApunte;
            finally
               Linea.Free;
            end;

         end;         
      end;
      Self.BD_Cargar(Self.UID_diario_caja);
   end;

   procedure TCaja.SetUsaDataSetPresentacion(Value: Boolean);
   begin
      if Value <> FUsaDataSetPresentacion then
         FUsaDataSetPresentacion := Value;
   end;

   procedure TCaja.RefrescaPresentacionMov;
   var
     i: Integer;
   begin
     if FUsaDataSetPresentacion then
     begin
        with TDMCaja(FDataModule) do
        begin
           LINEAS.Close;
           LINEAS.CreateDataSet;
           LINEAS.Open;

           LINEAS_VENTAS.Close;
           LINEAS_VENTAS.CreateDataSet;
           LINEAS_VENTAS.Open;

           for i := 0 to FLineasCaja.Count - 1 do
           begin
              if FLineasCaja.Items[i].UIDTicket <> '' then
                 PresentacionMovAdd(LINEAS_VENTAS, FLineasCaja.Items[i], i)
              else
                 PresentacionMovAdd(LINEAS, FLineasCaja.Items[i], i);
           end;
        end;
     end;
   end;

  procedure TCaja.PresentacionMovAdd(DataSet: TDataSet; LineaCaja: TLineaCaja; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('UID_DIARIO_CAJA').AsString := LineaCaja.UID_diario_caja;
     DataSet.FieldByName('LINEA').AsInteger := LineaCaja.linea;
     DataSet.FieldByName('FECHA').AsDateTime := LineaCaja.Fecha;
     DataSet.FieldByName('ENTRADA').AsFloat := LineaCaja.Entrada;
     DataSet.FieldByName('SALIDA').AsFloat := LineaCaja.Salida;
     DataSet.FieldByName('CONCEPTO').AsString := LineaCaja.Concepto;
     DataSet.FieldByName('DOCUMENTO').AsString := LineaCaja.Documento;
     DataSet.FieldByName('CODMEDPAG').AsString := LineaCaja.Codmedpag;
     DataSet.FieldByName('DESMEDPAG').AsString := LineaCaja.Desmedpag;
     DataSet.FieldByName('UID_TICKET').AsString := LineaCaja.UIDTicket;
     DataSet.Post;
  end;

  function TCaja.GetDataSetPresentacionMov: TDataSet;
  begin
     result := TDataSet(TDMCaja(FDataModule).LINEAS);
  end;

  function TCaja.GetDataSetPresentacionMovVentas: TDataSet;
  begin
     result := TDataSet(TDMCaja(FDataModule).LINEAS_VENTAS);
  end;

  procedure TCaja.RefrescaPresentacionResumen;
  var
    i: Integer;
  begin
    if FUsaDataSetPresentacionResumen then
    begin
       with TDMCaja(FDataModule) do
       begin
          RESUMEN.Close;
          RESUMEN.CreateDataSet;
          RESUMEN.Open;
          for i := 0 to FListaResumenVentas.Count - 1 do
             PresentacionResumenAdd(RESUMEN, FListaResumenVentas.Items[i], i);
       end;
    end;
  end;

  procedure TCaja.PresentacionResumenAdd(DataSet: TDataSet; Resumen: TResumenVentas; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('CODMEDPAG').AsString := Resumen.CodMedPag;
     DataSet.FieldByName('DESMEDPAG').AsString := Resumen.DesMedPag;
     DataSet.FieldByName('ENTRADA').AsCurrency := Resumen.Entrada;
     DataSet.FieldByName('SALIDA').AsCurrency := Resumen.Salida;
     DataSet.FieldByName('TOTAL').AsCurrency := Resumen.Entrada - Resumen.Salida;
     DataSet.FieldByName('RECUENTO').AsCurrency := Resumen.Recuento;
     DataSet.FieldByName('DESCUADRE').AsCurrency := Resumen.Descuadre;
     DataSet.Post;
  end;

  function TCaja.GetDataSetPresentacionResumen: TDataSet;
  begin
     result := TDataSet(TDMCaja(FDataModule).RESUMEN);
  end;


  procedure TCaja.CalcularTotalesCaja;
  begin
     with TDMCaja(FDataModule) do
     begin
        IMPORTE_MOVIMIENTOS.Close;
        IMPORTE_MOVIMIENTOS.ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
        IMPORTE_MOVIMIENTOS.Open;
        FTotalesCaja.FImporteMovEntradas := IMPORTE_MOVIMIENTOS.FieldByName('ENTRADA').AsCurrency;
        FTotalesCaja.FImporteMovSalidas := IMPORTE_MOVIMIENTOS.FieldByName('SALIDA').AsCurrency;

        IMPORTE_TICKETS.Close;
        IMPORTE_TICKETS.ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
        IMPORTE_TICKETS.Open;
        FTotalesCaja.FImporteVenta := IMPORTE_TICKETS.FieldByName('ENTRADA').AsCurrency;
        FTotalesCaja.FImporteDevoluciones := IMPORTE_TICKETS.FieldByName('SALIDA').AsCurrency;

        FTotalesCaja.FImporteTotalEntradas := FTotalesCaja.FImporteMovEntradas + FTotalesCaja.FImporteVenta;
        FTotalesCaja.FImporteTotalSalidas := FTotalesCaja.FImporteMovSalidas + FTotalesCaja.FImporteDevoluciones;

        NUMERO_DEVOLUCIONES.Close;
        NUMERO_DEVOLUCIONES.ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
        NUMERO_DEVOLUCIONES.Open;
        FTotalesCaja.FNumeroTicketsDevoluciones := NUMERO_DEVOLUCIONES.FieldByName('CONTADOR').AsInteger;

        NUMERO_TICKETS.Close;
        NUMERO_TICKETS.ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
        NUMERO_TICKETS.Open;
        FTotalesCaja.FNumeroTicketsVenta := NUMERO_TICKETS.FieldByName('CONTADOR').AsInteger;

        FTotalesCaja.FNumeroTickets := FTotalesCaja.NumeroTicketsDevoluciones + FTotalesCaja.NumeroTicketsVenta;

        IMPORTE_RECUENTO.Close;
        IMPORTE_RECUENTO.ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
        IMPORTE_RECUENTO.Open;
        FTotalesCaja.FImporteRecuento := IMPORTE_RECUENTO.FieldByName('RECUENTO').AsCurrency;
        FTotalesCaja.FImporteDescuadre := FTotalesCaja.FImporteRecuento - (FTotalesCaja.FImporteTotalEntradas - FTotalesCaja.FImporteTotalSalidas);
     end;
  end;

  procedure TCaja.CalcularResumenVentas;
  var
     Resum: TResumenVentas;
  begin
     with TDMCaja(FDataModule) do
     begin
        Q_RESUMEN_VENTAS.Close;
        Q_RESUMEN_VENTAS.ParamByName('CODALM').AsString := DMVariables.CodigoAlmacen;
        Q_RESUMEN_VENTAS.ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
        Q_RESUMEN_VENTAS.Open;
        Self.ResumenVentas.Clear;
        while not Q_RESUMEN_VENTAS.Eof do
        begin
           Resum := TResumenVentas.Create;
           Resum.FCodMedPag := Q_RESUMEN_VENTAS.FieldByName('CODMEDPAG').AsString;
           Resum.FDesMedPag := Q_RESUMEN_VENTAS.FieldByName('DESMEDPAG').AsString;
           Resum.FEntrada := Q_RESUMEN_VENTAS.FieldByName('ENTRADA').AsCurrency;
           Resum.FSalida := Q_RESUMEN_VENTAS.FieldByName('SALIDA').AsCurrency;
           Resum.FTotal := Resum.FEntrada - Resum.FSalida;
           Resum.FRecuento := Q_RESUMEN_VENTAS.FieldByName('RECUENTO').AsCurrency;
           Resum.FDescuadre := Resum.FRecuento - Resum.FTotal;
           Self.ResumenVentas.Add(Resum);
           Q_RESUMEN_VENTAS.Next;
        end;
     end;
  end;

  procedure TCaja.GeneraCajaXML;
  var
     i: Integer;
     iCaja: IXMLNode;
     iCabecera: IXMLNode;
     iLineas: IXMLNode;
     iTotales: IXMLNode;
     iResumen: IXMLNode;
     iNode : IXMLNode;
     iRegistro: IXMLNode;
     iEmpresa: IXMLNode;
     InfoTienda: TInfoTienda;
  begin
     if FXMLCaja.Active then
        FXMLCaja.Active := False;

     FXMLCaja.Active := True;

     //Genera la cabecera
     FXMLCaja.Encoding := 'UTF-8';
     FXMLCaja.Version := '1.0';
     iCaja := FXMLCaja.AddChild('caja');
     iCabecera := iCaja.AddChild('cabecera');

     iNode := iCabecera.AddChild('uid_diario_caja');
     iNode.Text := Self.UID_diario_caja;
     iNode := iCabecera.AddChild('codalm');
     iNode.Text := Self.Codalm;
     iNode := iCabecera.AddChild('codcaja');
     iNode.Text := Self.Codcaja;
     iNode := iCabecera.AddChild('fecha_apertura');
     iNode.Text := FormatDateTime('yyyy-mm-dd''T''hh:nn:ss', Self.Fecha_apertura);
     iNode := iCabecera.AddChild('fecha_cierre');
     iNode.Text := FormatDateTime('yyyy-mm-dd''T''hh:nn:ss', Self.Fecha_cierre);
     iNode := iCabecera.AddChild('id_usuario');
     iNode.Text := IntToStr(Self.Id_Usuario);
     iNode := iCabecera.AddChild('saldo_inicial');
     iNode.Text := iCurrToXMLFormat(Self.Saldo_inicial);

     //Datos de la empresa

     InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
     try
        iEmpresa := iCabecera.AddChild('empresa');
        iNode := iEmpresa.AddChild('descripcion');
        iNode.Text := InfoTienda.Desalm;
        iNode := iEmpresa.AddChild('domicilio');
        iNode.Text := InfoTienda.Domicilio;
        iNode := iEmpresa.AddChild('poblacion');
        iNode.Text := InfoTienda.Poblacion;
        iNode := iEmpresa.AddChild('provincia');
        iNode.Text := InfoTienda.Provincia;
        iNode := iEmpresa.AddChild('telefono1');
        iNode.Text := InfoTienda.Telefono1;
        iNode := iEmpresa.AddChild('telefono2');
        iNode.Text := InfoTienda.Telefono2;
        iNode := iEmpresa.AddChild('fax');
        iNode.Text := InfoTienda.Fax;
        iNode := iEmpresa.AddChild('nombre_comercial');
        iNode.Text := InfoTienda.Nombre_comercial;
     finally
        InfoTienda.Free;
     end;

     //Genera Lineas Caja
     iLineas := iCaja.AddChild('lineascaja');
     for i := 0 to Self.lineas.Count - 1 do
     begin
        iRegistro := iLineas.AddChild('lineacaja');
        iNode := iRegistro.AddChild('linea');
        iNode.Text := IntToStr(Self.Lineas.Items[i].linea);
        iNode := iRegistro.AddChild('fecha');
        iNode.Text := FormatDateTime('yyyy-mm-dd''T''hh:nn:ss', Self.Lineas.Items[i].Fecha);
        iNode := iRegistro.AddChild('entrada');
        iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].Entrada);
        iNode := iRegistro.AddChild('salida');
        iNode.Text := iCurrToXMLFormat(Self.Lineas.Items[i].Salida);
        iNode := iRegistro.AddChild('concepto');
        iNode.Text := Self.Lineas.Items[i].Concepto;
        iNode := iRegistro.AddChild('documento');
        iNode.Text := Self.Lineas.Items[i].Documento;
        iNode := iRegistro.AddChild('codmedpag');
        iNode.Text := Self.Lineas.Items[i].Codmedpag;
        iNode := iRegistro.AddChild('desmedpag');
        iNode.Text := Self.Lineas.Items[i].Desmedpag;
        iNode := iRegistro.AddChild('uid_ticket');
        iNode.Text := Self.Lineas.Items[i].UIDTicket;
     end;

     //Genera Totales Caja
     iTotales := iCabecera.AddChild('totalescaja');
     iNode := iTotales.AddChild('importemoventradas');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteMovEntradas);
     iNode := iTotales.AddChild('importemovsalidas');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteMovSalidas);
     iNode := iTotales.AddChild('importeventa');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteVenta);
     iNode := iTotales.AddChild('importedevoluciones');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteDevoluciones);
     iNode := iTotales.AddChild('importetotalentradas');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteTotalEntradas);
     iNode := iTotales.AddChild('importetotalsalidas');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteTotalSalidas);
     iNode := iTotales.AddChild('totalentradasysalidas');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteTotalEntradas - Self.TotalesCaja.ImporteTotalSalidas);
     iNode := iTotales.AddChild('numerotickets');
     iNode.Text := IntToStr(Self.TotalesCaja.NumeroTickets);
     iNode := iTotales.AddChild('numeroticketsventa');
     iNode.Text := IntToStr(Self.TotalesCaja.NumeroTicketsVenta);
     iNode := iTotales.AddChild('numeroticketsdevoluciones');
     iNode.Text := IntToStr(Self.TotalesCaja.NumeroTicketsDevoluciones);
     iNode := iTotales.AddChild('importerecuento');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteRecuento);
     iNode := iTotales.AddChild('importedescuadre');
     iNode.Text := iCurrToXMLFormat(Self.TotalesCaja.ImporteDescuadre);

     //Genera Resumen Caja
     iResumen := iCaja.AddChild('lineasresumen');
     for i := 0 to Self.ResumenVentas.Count - 1 do
     begin
        iRegistro := iResumen.AddChild('resumen');
        iNode := iRegistro.AddChild('codmedpag');
        iNode.Text := Self.ResumenVentas.Items[i].CodMedPag;
        iNode := iRegistro.AddChild('desmedpag');
        iNode.Text := Self.ResumenVentas.Items[i].DesMedPag;
        iNode := iRegistro.AddChild('entrada');
        iNode.Text := iCurrToXMLFormat(Self.ResumenVentas.Items[i].Entrada);
        iNode := iRegistro.AddChild('salida');
        iNode.Text := iCurrToXMLFormat(Self.ResumenVentas.Items[i].Salida);
        iNode := iRegistro.AddChild('total');
        iNode.Text := iCurrToXMLFormat(Self.ResumenVentas.Items[i].Total);
        iNode := iRegistro.AddChild('recuento');
        iNode.Text := iCurrToXMLFormat(Self.ResumenVentas.Items[i].Recuento);
        iNode := iRegistro.AddChild('descuadre');
        iNode.Text := iCurrToXMLFormat(Self.ResumenVentas.Items[i].Descuadre);
     end;
  end;

(*******************************************************************************
*   Clase TLineaCaja                                                            *
*******************************************************************************)
   constructor TLineaCaja.Create(DataModule: TDMCaja);
   begin
      //Si el acceso a datos no viene preestablecido crea uno
      if DataModule = nil then
      begin
         FDataModule := TDMCaja.Create(nil);
         FDataModuleInterno := True;
      end
      else
      begin
         FDataModule := DataModule;
         FDataModuleInterno := False;
      end;
      FUIDTicket := '';
   end;

   destructor TLineaCaja.Destroy;
   begin
      inherited Destroy;
   end;

   procedure TLineaCaja.BD_InsertarApunte;
   begin
      with TDMCaja(FDataModule).INSERTAR_DET_CAJA do
      begin
         ParamByName('UID_DIARIO_CAJA').AsString := Self.UID_diario_caja;
         ParamByName('LINEA').AsInteger := Self.linea;
         ParamByName('FECHA').AsDatetime := Self.Fecha;
         ParamByName('ENTRADA').AsFloat := Self.Entrada;
         ParamByName('SALIDA').AsFloat := Self.Salida;
         ParamByName('CONCEPTO').AsString := Self.Concepto;
         ParamByName('DOCUMENTO').AsString := Self.Documento;
         ParamByName('CODMEDPAG').AsString := Self.Codmedpag;
         if Self.UIDTicket <> '' then
            ParamByName('UID_TICKET').AsString := Self.UIDTicket
         else
            ParamByName('UID_TICKET').Clear;

         Execute;
      end;
   end;

   procedure TLineaCaja.BD_EliminarApunte;
   begin
      with TDMCaja(FDataModule).ELIMINA_DET_CAJA do
      begin
         ParamByName('UID_DIARIO_CAJA').AsString := FUID_diario_caja;
         ParamByName('LINEA').AsInteger := FLinea;
         Execute;
      end;
   end;

(*******************************************************************************
*   Clase TListaLineasCaja                                                     *
*******************************************************************************)
  constructor TListaLineasCaja.Create;
  begin
     inherited Create;
  end;

  function TListaLineasCaja.Add(AObject: TLineaCaja): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaLineasCaja.GetItem(Index: Integer): TLineaCaja;
  begin
     Result := TLineaCaja(inherited Items[Index]);
  end;

  function TListaLineasCaja.IndexOf(AObject: TLineaCaja): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaLineasCaja.Insert(Index: Integer; AObject: TLineaCaja);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaLineasCaja.Remove(AObject: TLineaCaja): Integer;
  begin
     Result := inherited Remove(AObject);
  end;

  procedure TListaLineasCaja.SetItem(Index: Integer; AObject: TLineaCaja);
  begin
     inherited Items[Index] := AObject;
  end;

(*******************************************************************************
*   Clase TTotalesCaja                                                         *
*******************************************************************************)



(*******************************************************************************
*   Clase TResumenVentas                                                       *
*******************************************************************************)


(*******************************************************************************
*   Clase TListaResumenVentas                                                  *
*******************************************************************************)
  constructor TListaResumenVentas.Create;
  begin
     inherited Create;
  end;

  function TListaResumenVentas.Add(AObject: TResumenVentas): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaResumenVentas.GetItem(Index: Integer): TResumenVentas;
  begin
     Result := TResumenVentas(inherited Items[Index]);
  end;

  function TListaResumenVentas.IndexOf(AObject: TResumenVentas): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaResumenVentas.Insert(Index: Integer; AObject: TResumenVentas);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaResumenVentas.Remove(AObject: TResumenVentas): Integer;
  begin
     Result := inherited Remove(AObject);
  end;

  procedure TListaResumenVentas.SetItem(Index: Integer; AObject: TResumenVentas);
  begin
     inherited Items[Index] := AObject;
  end;



(*******************************************************************************
*   Clase TRecuentoCaja                                                   *
*******************************************************************************)
  constructor TRecuentoCaja.Create(DataModule: TDMCaja);
  begin
     //Si el acceso a datos no viene preestablecido crea uno
     if DataModule = nil then
     begin
        FDataModule := TDMCaja.Create(nil);
        FDataModuleInterno := True;
     end
     else
     begin
        FDataModule := DataModule;
        FDataModuleInterno := False;
     end;
     FLineas := TListaLineasRecuentoCaja.Create();
     FUsaDataSetPresentacion := False;
  end;

  destructor TRecuentoCaja.Destroy;
  begin
     FLineas.Free;
     inherited Destroy;
  end;

  function TRecuentoCaja.GetDataSetPresentacionLineas: TDataSet;
  begin
     result := TDataSet(TDMCaja(FDataModule).LINEAS_RECUENTO);
  end;

  procedure TRecuentoCaja.PresentacionLineasAdd(DataSet: TDataSet; LineaRecuentoCaja: TLineaRecuentoCaja; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('CODMEDPAG').AsString := LineaRecuentoCaja.Codmedpag;
     DataSet.FieldByName('DESMEDPAG').AsString := LineaRecuentoCaja.Desmedpag;
     DataSet.FieldByName('CANTIDAD').AsInteger := LineaRecuentoCaja.Cantidad;
     DataSet.FieldByName('VALOR').AsCurrency := LineaRecuentoCaja.Valor;
     DataSet.FieldByName('TOTAL').AsCurrency := LineaRecuentoCaja.Total;
     DataSet.Post;
  end;

  procedure TRecuentoCaja.BD_Cargar(UID: String);
  var
     Linea: TLineaRecuentoCaja;
  begin
     Self.FUID_diario_caja := UID;
     with TDMCaja(FDataModule) do
     begin
        Q_CAJA_DET_RECUENTO.Close;
        Q_CAJA_DET_RECUENTO.ParamByName('CODALM').AsString := DMVariables.CodigoAlmacen;
        Q_CAJA_DET_RECUENTO.ParamByName('UID_DIARIO_CAJA').AsString := UID;
        Q_CAJA_DET_RECUENTO.Open;

        if FUsaDataSetPresentacion then
        begin
           LINEAS_RECUENTO.Close;
           LINEAS_RECUENTO.CreateDataSet;
           LINEAS_RECUENTO.Open;
        end;

        FLineas.Clear;

        while not Q_CAJA_DET_RECUENTO.Eof do
        begin
            Linea := TLineaRecuentoCaja.Create;
            Linea.FUID_diario_caja := Q_CAJA_DET_RECUENTO.FieldByName('UID_DIARIO_CAJA').AsString;
            Linea.FLinea := Q_CAJA_DET_RECUENTO.FieldByName('LINEA').AsInteger;
            Linea.FCodmedpag := Q_CAJA_DET_RECUENTO.FieldByName('CODMEDPAG').AsString;
            Linea.FDesmedpag := Q_CAJA_DET_RECUENTO.FieldByName('DESMEDPAG').AsString;
            Linea.FCantidad := Q_CAJA_DET_RECUENTO.FieldByName('CANTIDAD').AsInteger;
            Linea.FValor := Q_CAJA_DET_RECUENTO.FieldByName('VALOR').AsCurrency;
            Linea.FTotal := Linea.FCantidad * Linea.FValor;

            FLineas.Add(Linea);

            Q_CAJA_DET_RECUENTO.Next;
        end;
        Q_CAJA_DET_RECUENTO.Close;
     end;

     RefrescaPresentacionLineas;
  end;

  procedure TRecuentoCaja.BD_Salvar;
  var
     i: Integer;
  begin
     with TDMCaja(FDataModule) do
     begin
        BORRAR_RECUENTO.ParamByName('UID_DIARIO_CAJA').AsString := Self.FUID_diario_caja;
        BORRAR_RECUENTO.Execute;

        for i := 0 to Self.Lineas.Count - 1 do
        begin
           INSERTAR_CAJA_DET_RECUENTO.Close;
           INSERTAR_CAJA_DET_RECUENTO.ParamByName('UID_DIARIO_CAJA').AsString := Self.FUID_diario_caja;
           INSERTAR_CAJA_DET_RECUENTO.ParamByName('LINEA').AsInteger := i;
           INSERTAR_CAJA_DET_RECUENTO.ParamByName('CODMEDPAG').AsString := Self.Lineas.Items[i].Codmedpag;
           INSERTAR_CAJA_DET_RECUENTO.ParamByName('CANTIDAD').AsFloat := Self.Lineas.Items[i].Cantidad;           
           INSERTAR_CAJA_DET_RECUENTO.ParamByName('VALOR').AsFloat := Self.Lineas.Items[i].Valor;
           INSERTAR_CAJA_DET_RECUENTO.Execute
        end;
     end;
  end;

  procedure TRecuentoCaja.RefrescaPresentacionLineas;
  var
    i: Integer;
  begin
    if FUsaDataSetPresentacion then
    begin
       with TDMCaja(FDataModule) do
       begin
          LINEAS_RECUENTO.Close;
          LINEAS_RECUENTO.CreateDataSet;
          LINEAS_RECUENTO.Open;

          for i := 0 to FLineas.Count - 1 do
             PresentacionLineasAdd(LINEAS_RECUENTO, FLineas.Items[i], i);
       end;
    end;
  end;

  function TRecuentoCaja.GetTotalRecuento: Currency;
  var
     i: Integer;
  begin
     result := 0;
     for i := 0 to Lineas.Count - 1 do
     begin
        result := result + (Lineas.Items[i].Cantidad * Lineas.Items[i].Valor);
     end;
  end;

(*******************************************************************************
*   Clase TListaLineasRecuentoCaja                                             *
*******************************************************************************)
  constructor TListaLineasRecuentoCaja.Create;
  begin
     inherited Create;
  end;

  function TListaLineasRecuentoCaja.Add(AObject: TLineaRecuentoCaja): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaLineasRecuentoCaja.GetItem(Index: Integer): TLineaRecuentoCaja;
  begin
     Result := TLineaRecuentoCaja(inherited Items[Index]);
  end;

  function TListaLineasRecuentoCaja.GetItem(CodMedPag: String; Valor: Currency): TLineaRecuentoCaja;
  var
     x: Integer;
  begin
     result := nil;
     for x := 0 to Count - 1 do
     begin
        if (Items[x].CodMedPag = CodMedPag) and (Items[x].Valor = Valor) then
        begin
           result := TLineaRecuentoCaja(Items[x]);
           Break;
        end;
     end;
  end;

  function TListaLineasRecuentoCaja.IndexOf(AObject: TLineaRecuentoCaja): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaLineasRecuentoCaja.Insert(Index: Integer; AObject: TLineaRecuentoCaja);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaLineasRecuentoCaja.Remove(AObject: TLineaRecuentoCaja): Integer;
  begin
     Result := inherited Remove(AObject);
  end;

  procedure TListaLineasRecuentoCaja.SetItem(Index: Integer; AObject: TLineaRecuentoCaja);
  begin
     inherited Items[Index] := AObject;
  end;

(*******************************************************************************
*   Clase TLineaRecuentoCaja                                                   *
*******************************************************************************)
  procedure TLineaRecuentoCaja.SetCantidad(Value: Integer);
  begin
     if Value <> FCantidad then
     begin
        FCantidad := Value;
        FTotal := FCantidad * FValor;
     end;
  end;
  procedure TLineaRecuentoCaja.SetValor(Value: Currency);
  begin
     if Value <> FValor then
     begin
        FValor := Value;
        FTotal := FCantidad * FValor;
     end;
  end;



end.
