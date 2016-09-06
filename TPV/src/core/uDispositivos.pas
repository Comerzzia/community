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

unit uDispositivos;

interface

uses
  Forms, Windows, Messages, SysUtils, Variants, Classes, XMLIntf, XMLDoc, uOPOS, uOPOSDisplay, uOPOSPrn,
  ComObj, OoMisc, AdPort, uImpresora, uOperacionTEF;

type
  TVisor = class;
  TCajon = class;
  TImpresora = class;
  TTarjeta = class;

  TDispositivos = class(TObject)
  private
    { Private declarations }
    FVisor: TVisor;
    FCajon: TCajon;
    FImpresora: TImpresora;
    FTarjeta: TTarjeta;
    procedure LiberaDispositivos;
  public
    { Public declarations }
    property Visor: TVisor read FVisor;
    property Cajon: TCajon read FCajon;
    property Impresora: TImpresora read FImpresora;
    property Tarjeta: TTarjeta read FTarjeta;

    constructor Create;
    destructor Destroy; override;
    procedure CargarConfiguracion(XML: IXMLDocument);
    function GetVisorClassName(sTipoConexion: String): String;
    function GetCajonClassName(sTipoConexion: String): String;
    function GetImpresoraClassName(sTipoConexion: String): String;
    function GetTarjetaClassName(sTipoConexion: String): String;
  end;

  TDispositivo = class(TPersistent)
  private
    { Private declarations }
    FActivo: Boolean;
  published
    property Activo: Boolean read FActivo;
  public
    { Public declarations }
    procedure Conecta; virtual;
    procedure Desconecta; virtual;
    procedure CargaConfiguracion(Config: IXMLNode); virtual; abstract;
    procedure Log(str: String);
    constructor Create; virtual;
  end;

  TVisor = class(TDispositivo)
  public
     procedure Pintar(linea1, linea2: String); virtual; abstract;
     procedure Conecta; override; abstract;
     procedure Desconecta; override; abstract;
     procedure CargaConfiguracion(Config: IXMLNode); override; abstract;
  end;

  TVisorClass = class of TVisor;

  TVisorNoConfig = class(TVisor)
  private
  public
     procedure Pintar(linea1, linea2: String); override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
  end;

  TVisorOPOS = class(TVisor)
  private
     FLineDisplay: Variant;
     FOleClassName: String;
     FNombreDispositivoOPOS: String;
  public
     procedure Pintar(linea1, linea2: String); override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
     destructor Destroy; override;
  end;

  TVisorSerie = class(TVisor)
  private
     FComPort: TApdComPort;
     FPuerto: Integer;
     FBaudios: Integer;
     FBitsDatos: Integer;
     FBitsParada: Integer;

     procedure SetPuerto(Value: Integer);
     procedure SetBaudios(Value: Integer);
     procedure SetBitsDatos(Value: Integer);
     procedure SetBitsParada(Value: Integer);
   published
     property Puerto: Integer read FPuerto write SetPuerto;
     property Baudios: Integer read FBaudios write SetBaudios;
     property BitsDatos: Integer read FBitsDatos write SetBitsDatos;
     property BitsParada: Integer read FBitsParada write SetBitsParada;
   protected
   public
     procedure Pintar(linea1, linea2: String); override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
     Constructor Create; override;
     Destructor Destroy; override;
   end;

   TCajon = class(TDispositivo)
   private
   published
   protected
   public
     procedure Abrir; virtual; abstract;
     procedure Conecta; override; abstract;
     procedure Desconecta; override; abstract;
     procedure CargaConfiguracion(Config: IXMLNode); override; abstract;
   end;

   TCajonClass = class of TCajon;

   TCajonNoConfig = class(TCajon)
   private
   published
   protected
   public
     procedure Abrir; override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
   end;

   TCajonOPOS = class(TCajon)
   private
      FCashDrawer: Variant;
      FOleClassName: String;
      FNombreDispositivoOPOS: String;
   published
   protected
   public
     procedure Abrir; override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
     destructor Destroy; override;
   end;

   TCajonImpresora = class(TCajon)
   private
     FSecuenciaAperturaCajon: String;
   published
   protected
   public
     procedure Abrir; override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
   end;

   TImpresora = class(TDispositivo)
   public
      procedure Imprimir(str: String); virtual; abstract;
      procedure Cortar; virtual; abstract;
      procedure Conecta; override; abstract;
      procedure Desconecta; override; abstract;
      procedure CargaConfiguracion(Config: IXMLNode); override; abstract;
   end;

   TImpresoraClass = class of TImpresora;

   TImpresoraNoConfig = class(TImpresora)
   private
   public
      procedure Imprimir(str: String); override;
      procedure Cortar; override;
      procedure Conecta; override;
      procedure Desconecta; override;
      procedure CargaConfiguracion(Config: IXMLNode); override;
   end;

   TImpresoraOPOS = class(TImpresora)
   private
      FPrinter: Variant;
      FOleClassName: String;
      FNombreDispositivoOPOS: String;
      FPorcentajeCorte: Integer;
   published
      property PorcentajeCorte: Integer read FPorcentajeCorte write FPorcentajeCorte;
   protected
   public
     procedure Imprimir(str: String); override;
     procedure Cortar; override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
     destructor Destroy; override;
   end;

   TImpresoraGenerica = class(TImpresora)
   private
     FSecuenciaCorte: String;
   published
   protected
   public
     procedure Imprimir(str: String); override;
     procedure Cortar; override;
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
   end;

  TTarjeta = class(TDispositivo)
  public
     procedure Conecta; virtual; abstract;
     procedure Desconecta; virtual; abstract;
     procedure CargaConfiguracion(Config: IXMLNode); virtual; abstract;
     procedure IniciaTransaccion; virtual; abstract;
     function RealizaTransaccion(OperacionTEF: TOperacionTEF): string; virtual; abstract;
     procedure FinalizaTransaccion(correcta: boolean); virtual; abstract;
     procedure IniciaPendientes; virtual; abstract;
     procedure EnviaPendientes; virtual; abstract;
     procedure AbreConfiguracion; virtual; abstract;
  end;

  TTarjetaClass = class of TTarjeta;

  TTarjetaNoConfig = class(TTarjeta)
  private
  public
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
     procedure IniciaTransaccion; override;
     function RealizaTransaccion(OperacionTEF: TOperacionTEF): string; override;
     procedure FinalizaTransaccion(correcta: boolean); override;
     procedure IniciaPendientes; override;
     procedure EnviaPendientes; override;
     procedure AbreConfiguracion; override;
  end;

  TTarjetaTEF = class(TTarjeta)
  private
     FModulo: HMODULE;
     FDLL: String;

     procedure CargaDLL;
     procedure DescargaDLL;
  public
     procedure Conecta; override;
     procedure Desconecta; override;
     procedure CargaConfiguracion(Config: IXMLNode); override;
     procedure IniciaTransaccion; override;
     function RealizaTransaccion(OperacionTEF: TOperacionTEF): string; override;
     procedure FinalizaTransaccion(correcta: boolean); override;
     procedure IniciaPendientes; override;
     procedure EnviaPendientes; override;
     procedure AbreConfiguracion; override;
  end;

implementation
uses
   iGeneral;

(*******************************************************************************
* TDispositivos                                                                *
*******************************************************************************)

constructor TDispositivos.Create;
var
   nombreFichero: String;
begin
   inherited;
   nombreFichero := DirectorioTemporalWindows + 'dispositivos.log';
   DeleteFile(nombreFichero);
end;

destructor TDispositivos.Destroy;
begin
   LiberaDispositivos;
   inherited Destroy;
end;

procedure TDispositivos.LiberaDispositivos;
begin
   if FVisor <> nil then
      FVisor.Free;
   if FCajon <> nil then
      FCajon.Free;
   if FImpresora <> nil then
      FImpresora.Free;
   if FTarjeta <> nil then
      FTarjeta.Free;
end;

procedure TDispositivos.CargarConfiguracion(XML: IXMLDocument);
var
   NodoParametros: IXMLNode;
   NodoDispositivos: IXMLNode;
   NodoVisor: IXMLNode;
   NodoCajon: IXMLNode;
   NodoImpresora: IXMLNode;
   NodoTarjeta: IXMLNode;
   Nodo: IXMLNode;
   sClase: String;
   sTipoConexion: String;
begin
   LiberaDispositivos;

   if not XML.Active then
      XML.Active := True;

   NodoParametros := XML.ChildNodes.FindNode('Parametros');
   if NodoParametros <> nil then
      NodoDispositivos := NodoParametros.ChildNodes.FindNode('dispositivos');

   if NodoDispositivos = nil then
      raise Exception.Create('No se ha encontrado la configuración de dispositivos');

   //Cargar el visor
   sClase := 'TVisorNoConfig';
   sTipoConexion := '';
   NodoVisor := NodoDispositivos.ChildNodes.FindNode('visor');
   if NodoVisor <> nil then
   begin
      Nodo := NodoVisor.ChildNodes.FindNode('tipoconexion');
      if Nodo <> nil then
         sTipoConexion := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
   end;

   sClase := GetVisorClassName(sTipoConexion);
   FVisor := TVisorClass(GetClass(sClase)).Create;
   FVisor.CargaConfiguracion(NodoVisor);

   //Cargar el cajon
   sClase := 'TCajonNoConfig';
   sTipoConexion := '';
   NodoCajon := NodoDispositivos.ChildNodes.FindNode('cajon');
   if NodoCajon <> nil then
   begin
      Nodo := NodoCajon.ChildNodes.FindNode('tipoconexion');
      if Nodo <> nil then
         sTipoConexion := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
   end;

   sClase := GetCajonClassName(sTipoConexion);
   FCajon := TCajonClass(GetClass(sClase)).Create;
   FCajon.CargaConfiguracion(NodoCajon);

   //Cargar la impresora
   sClase := 'TImpresoraNoConfig';
   sTipoConexion := '';
   NodoImpresora := NodoDispositivos.ChildNodes.FindNode('impresora');
   if NodoImpresora <> nil then
   begin
      Nodo := NodoImpresora.ChildNodes.FindNode('tipoconexion');
      if Nodo <> nil then
         sTipoConexion := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
   end;

   sClase := GetImpresoraClassName(sTipoConexion);
   FImpresora := TImpresoraClass(GetClass(sClase)).Create;
   FImpresora.CargaConfiguracion(NodoImpresora);

   //Cargar el lector de tarjetas
   sClase := 'TTarjetaNoConfig';
   sTipoConexion := '';
   NodoTarjeta := NodoDispositivos.ChildNodes.FindNode('tarjeta');
   if NodoTarjeta <> nil then
   begin
      Nodo := NodoTarjeta.ChildNodes.FindNode('tipoconexion');
      if Nodo <> nil then
         sTipoConexion := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
   end;
   sClase := GetTarjetaClassName(sTipoConexion);
   FTarjeta := TTarjetaClass(GetClass(sClase)).Create;
   FTarjeta.CargaConfiguracion(NodoTarjeta);
end;

function TDispositivos.GetVisorClassName(sTipoConexion: String): String;
begin
   if sTipoConexion = 'OPOS' then
      result := 'TVisorOPOS'
   else if sTipoConexion = 'puertoSerie' then
      result := 'TVisorSerie'
   else
      result := 'TVisorNoConfig';
end;

function TDispositivos.GetCajonClassName(sTipoConexion: String): String;
begin
   if sTipoConexion = 'OPOS' then
      result := 'TCajonOPOS'
   else if sTipoConexion = 'puertoImpresora' then
      result := 'TCajonImpresora'
   else
      result := 'TCajonNoConfig';
end;

function TDispositivos.GetImpresoraClassName(sTipoConexion: String): String;
begin
   if sTipoConexion = 'OPOS' then
      result := 'TImpresoraOPOS'
   else if sTipoConexion = 'puertoImpresora' then
      result := 'TImpresoraGenerica'
   else
      result := 'TImpresoraNoConfig';
end;

function TDispositivos.GetTarjetaClassName(sTipoConexion: String): String;
begin
   if sTipoConexion = 'TEF' then
      result := 'TTarjetaTEF'
   else
      result := 'TTarjetaNoConfig';
end;

(*******************************************************************************
* TDispositivo                                                                 *
*******************************************************************************)
constructor TDispositivo.Create;
begin
//Paa las clases descendientes que lo necesiten no se implementa abstracto para no
//tener que implementarlo en todos los descendientes
   inherited Create;
end;

procedure TDispositivo.Log(str: String);
var
   nombreFichero: String;
   Fichero: TStringList;
begin
   nombreFichero := DirectorioTemporalWindows + 'dispositivos.log';
   Fichero := TStringList.Create;
   try
      try
         Fichero.LoadFromFile(nombreFichero);
      except
      end;
      Fichero.Add(DateTimeToStr(now) + '[' + Self.ClassName + '] ' + str);
      Fichero.SaveToFile(nombreFichero);
   finally
      Fichero.Free;
   end;
end;

procedure TDispositivo.Conecta;
begin
   FActivo := True;
end;

procedure TDispositivo.Desconecta;
begin
   FActivo := False;
end;

(*******************************************************************************
* TVisorNoConfig                                                               *
*******************************************************************************)
procedure TVisorNoConfig.Pintar(linea1, linea2: String);
begin
 //N/A
end;

procedure TVisorNoConfig.Conecta;
begin
   inherited;
end;

procedure TVisorNoConfig.Desconecta;
begin
   inherited;
end;

procedure TVisorNoConfig.CargaConfiguracion(Config: IXMLNode);
begin
 //N/A
end;



(*******************************************************************************
* TVisorOPOS                                                                   *
*******************************************************************************)

destructor TVisorOPOS.Destroy;
begin
   if FActivo then
      Desconecta;
   inherited Destroy;
end;

procedure TVisorOPOS.CargaConfiguracion(Config: IXMLNode);
var
   NodoMetodoConexion: IXMLNode;
   NodoOPOS: IXMLNode;
   Nodo: IXMLNode;
begin
   FOleClassName := 'OPOS.LineDisplay';
   FNombreDispositivoOPOS := '';

   NodoMetodoConexion := Config.ChildNodes.FindNode('metodoconexion');
   if NodoMetodoConexion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de método de conexion para el dispositivo visor');

   NodoOPOS := NodoMetodoConexion.ChildNodes.FindNode('OPOS');
   if NodoOPOS = nil then
      raise Exception.Create('No se ha encontrado la configuración OPOS para el dispositivo Visor');

   Nodo := NodoOPOS.ChildNodes.FindNode('NombreClase');
   if Nodo <> nil then
      FOleClassName := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);

   Nodo := NodoOPOS.ChildNodes.FindNode('NombreDispositivo');
   if Nodo <> nil then
      FNombreDispositivoOPOS := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
end;

procedure TVisorOPOS.Conecta;
var
   r: Integer;
begin
   try
      FLineDisplay := CreateOleObject(FOleClassName);
      r := FLineDisplay.Open(FNombreDispositivoOPOS);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el dispositivo: ' + FNombreDispositivoOPOS, 'Open');
      r := FLineDisplay.ClaimDevice(2000);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el dispositivo: ' + FNombreDispositivoOPOS, 'Claim Device');
      FLineDisplay.DeviceEnabled := True;

      FActivo := True;

      inherited;
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TVisorOPOS.Desconecta;
begin
   try
      FLineDisplay.ReleaseDevice;
      FLineDisplay.Close;
      FActivo := False;      
   except on E: Exception do
      Log(E.Message);
   end;
   inherited;
end;

procedure TVisorOPOS.Pintar(linea1: string; linea2: string);
var
   r: Integer;
begin
   try
      if not FActivo then
         Conecta;

      r := FLineDisplay.ClearText;
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'Error al pintar en el dispositivo: ' + FNombreDispositivoOPOS, 'ClearText');

      r := FLineDisplay.DisplayTextAt(0, 0, Copy(linea1, 1, 20) + iSpace(20 - Length(linea1)), DISP_DT_NORMAL);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'Error al pintar en el dispositivo: ' + FNombreDispositivoOPOS, 'DisplayTextAt');

      r := FLineDisplay.DisplayTextAt(1, 0, Copy(linea2, 1, 20) + iSpace(20 - Length(linea2)), DISP_DT_NORMAL);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'Error al pintar en el dispositivo: ' + FNombreDispositivoOPOS, 'DisplayTextAt');
   except on E: Exception do
      Log(E.Message);
   end;
end;






(*******************************************************************************
* TVisorSerie                                                                  *
*******************************************************************************)

constructor TVisorSerie.Create;
begin
   FComPort := TApdComPort.Create(nil);
end;

destructor TVisorSerie.Destroy;
begin
   FComPort.Free;
   inherited Destroy;
end;

procedure TVisorSerie.Conecta;
begin
   try
      FComPort.Open := True;
      FActivo := True;      
      inherited;
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TVisorSerie.Desconecta;
begin
   try
      FComPort.Open := False;
      FActivo := False;      
      inherited;
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TVisorSerie.Pintar(linea1: string; linea2: string);
begin
   try
      if not FActivo then
         Conecta;
      if FComPort.Open = True then
      begin
         if FComPort.ComNumber <> 0 then
         begin
            FComPort.PutString(#12);
            FComPort.PutString(Copy(linea1, 1, 20) + iSpace(20 - Length(linea1)));
            FComPort.PutString(Copy(linea2, 1, 20) + iSpace(20 - Length(linea2)));
         end;
         FActivo := True;
      end;
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TVisorSerie.SetPuerto(Value: Integer);
begin
   if Value <> FPuerto then
   begin
      FPuerto := Value;
      FComPort.ComNumber := FPuerto;
   end;
end;

procedure TVisorSerie.SetBaudios(Value: Integer);
begin
   if Value <> FBaudios then
   begin
      FBaudios := Value;
      FComPort.Baud := FBaudios;
   end;
end;

procedure TVisorSerie.SetBitsDatos(Value: Integer);
begin
   if Value <> FBitsDatos then
   begin
      FBitsDatos := Value;
      FComPort.DataBits := FBitsDatos;
   end;
end;

procedure TVisorSerie.SetBitsParada(Value: Integer);
begin
   if Value <> FBitsParada then
   begin
      FBitsParada := Value;
      FComPort.StopBits := FBitsParada;
   end;
end;

procedure TVisorSerie.CargaConfiguracion(Config: IXMLNode);
var
   NodoMetodoConexion: IXMLNode;
   NodoPuerto: IXMLNode;
   Nodo: IXMLNode;
begin
   NodoMetodoConexion := Config.ChildNodes.FindNode('metodoconexion');
   if NodoMetodoConexion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de método de conexion para el dispositivo visor');

   NodoPuerto := NodoMetodoConexion.ChildNodes.FindNode('puertoSerie');
   if NodoPuerto = nil then
      raise Exception.Create('No se ha encontrado la configuración "puertoSerie" para el dispositivo Visor');

   Nodo := NodoPuerto.ChildNodes.FindNode('PuertoCOM');
   if Nodo <> nil then
      Puerto := iif(Nodo.NodeValue = null, 0, Nodo.NodeValue);

   Nodo := NodoPuerto.ChildNodes.FindNode('Baudios');
   if Nodo <> nil then
      Baudios := iif(Nodo.NodeValue = null, 0, Nodo.NodeValue);

   Nodo := NodoPuerto.ChildNodes.FindNode('BitsDatos');
   if Nodo <> nil then
      BitsDatos := iif(Nodo.NodeValue = null, 0, Nodo.NodeValue);

   Nodo := NodoPuerto.ChildNodes.FindNode('BitsParada');
   if Nodo <> nil then
      BitsParada := iif(Nodo.NodeValue = null, 0, Nodo.NodeValue);
end;

(*******************************************************************************
* TCajonNoConfig                                                                   *
*******************************************************************************)

procedure TCajonNoConfig.Abrir;
begin
 //N/A
end;

procedure TCajonNoConfig.Conecta;
begin
   inherited;
end;

procedure TCajonNoConfig.Desconecta;
begin
   inherited;
end;

procedure TCajonNoConfig.CargaConfiguracion(Config: IXMLNode);
begin
 //N/A
end;


(*******************************************************************************
* TCajonOPOS                                                                   *
*******************************************************************************)
destructor TCajonOPOS.Destroy;
begin
   if FActivo then
      Desconecta;
   inherited Destroy;
end;

procedure TCajonOPOS.CargaConfiguracion(Config: IXMLNode);
var
   NodoMetodoConexion: IXMLNode;
   NodoOPOS: IXMLNode;
   Nodo: IXMLNode;
begin
   FOleClassName := 'OPOS.CashDrawer';
   FNombreDispositivoOPOS := '';

   NodoMetodoConexion := Config.ChildNodes.FindNode('metodoconexion');
   if NodoMetodoConexion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de método de conexion para el dispositivo Cajon');

   NodoOPOS := NodoMetodoConexion.ChildNodes.FindNode('OPOS');
   if NodoOPOS = nil then
      raise Exception.Create('No se ha encontrado la configuración OPOS para el dispositivo Cajon');

   Nodo := NodoOPOS.ChildNodes.FindNode('NombreClase');
   if Nodo <> nil then
      FOleClassName := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);

   Nodo := NodoOPOS.ChildNodes.FindNode('NombreDispositivo');
   if Nodo <> nil then
      FNombreDispositivoOPOS := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
end;

procedure TCajonOPOS.Conecta;
var
   r: Integer;
begin
   try
      FCashDrawer := CreateOleObject(FOleClassName);
      r := FCashDrawer.Open(FNombreDispositivoOPOS);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el dispositivo: ' + FNombreDispositivoOPOS, 'Open');
      r := FCashDrawer.ClaimDevice(2000);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el dispositivo: ' + FNombreDispositivoOPOS, 'Claim Device');
      FCashDrawer.DeviceEnabled := True;
      FActivo := True;

      inherited;
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TCajonOPOS.Desconecta;
begin
   try
      FCashDrawer.ReleaseDevice;
      FCashDrawer.Close;
      FActivo := False;      
   except on E: Exception do
      Log(E.Message);
   end;

   inherited;
end;

procedure TCajonOPOS.Abrir;
var
   r: Integer;
begin
   try
      if not FActivo then
         Conecta;

      r := FCashDrawer.OpenDrawer;
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el cajon: ' + FNombreDispositivoOPOS, 'OpenDrawer');
   except on E: Exception do
      Log(E.Message);
   end;
end;

(*******************************************************************************
* TCajonImpresora                                                              *
*******************************************************************************)
procedure TCajonImpresora.Abrir;
begin
   try
      if not FActivo then
         Conecta;
      SendControlCode(FSecuenciaAperturaCajon);
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TCajonImpresora.Conecta;
begin
   inherited;
   FActivo := True;
end;

procedure TCajonImpresora.Desconecta;
begin
   inherited;
   FActivo := False;
end;

procedure TCajonImpresora.CargaConfiguracion(Config: IXMLNode);
var
   NodoOperacion: IXMLNode;
   Nodo: IXMLNode;
   vSecuencia: TStringList;
   x: Integer;
begin
   NodoOperacion := Config.ChildNodes.FindNode('operaciones');
   if NodoOperacion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de operaciones para el dispositivo cajon');

   Nodo := NodoOperacion.ChildNodes.FindNode('secuenciaapertura');
   if Nodo <> nil then
      FSecuenciaAperturaCajon := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);

   //Carga la secuencia de apertura
   vSecuencia := TStringList.Create;
   try
      ExtractStrings([';'], [' '], pchar(FSecuenciaAperturaCajon), vSecuencia);
      FSecuenciaAperturaCajon := '';
      for x := 0 to vSecuencia.Count -1 do
      begin
         FSecuenciaAperturaCajon := FSecuenciaAperturaCajon + Chr(StrtoInt(vSecuencia[x]));
      end;
   finally
      vSecuencia.Free;
   end;
end;





(*******************************************************************************
* TImpresoraNoConfig                                                           *
*******************************************************************************)

procedure TImpresoraNoConfig.Imprimir(str: String);
begin
 //N/A
end;

procedure TImpresoraNoConfig.Cortar;
begin
 //N/A
end;

procedure TImpresoraNoConfig.Conecta;
begin
   inherited;
end;

procedure TImpresoraNoConfig.Desconecta;
begin
   inherited;
end;

procedure TImpresoraNoConfig.CargaConfiguracion(Config: IXMLNode);
begin
 //N/A
end;

(*******************************************************************************
* TImpresoraOPOS                                                               *
*******************************************************************************)
destructor TImpresoraOPOS.Destroy;
begin
   if FActivo then
      Desconecta;
   inherited Destroy;
end;

procedure TImpresoraOPOS.Imprimir(str: String);
var
   r: Integer;
begin
   try
      if not FActivo then
         Conecta;

      r :=  FPrinter.PrintNormal(PTR_S_RECEIPT, str);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido imprimir en el dispositivo: ' + FNombreDispositivoOPOS, 'PrintNormal');
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TImpresoraOPOS.Cortar;
var
   r: Integer;
begin
   try
      if not FActivo then
         Conecta;

      r := FPrinter.CutPaper(FPorcentajeCorte);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido ejecutar la acción de corte: ' + FNombreDispositivoOPOS, 'CutPaper');
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TImpresoraOPOS.Conecta;
var
   r: Integer;
begin
   try
      FPrinter := CreateOleObject(FOleClassName);
      r := FPrinter.Open(FNombreDispositivoOPOS);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el dispositivo: ' + FNombreDispositivoOPOS, 'Open');
      r := FPrinter.ClaimDevice(2000);
      if r <> OPOS_SUCCESS then
         raise EOPOSException.Create(r, 'No se ha podido abrir el dispositivo: ' + FNombreDispositivoOPOS, 'Claim Device');
      FPrinter.DeviceEnabled := True;
      FActivo := True;

      inherited;
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TImpresoraOPOS.Desconecta;
begin
   try
      FPrinter.ReleaseDevice;
      FPrinter.Close;
      FActivo := False;      
   except on E: Exception do
      Log(E.Message);
   end;

   inherited;
end;

procedure TImpresoraOPOS.CargaConfiguracion(Config: IXMLNode);
var
   NodoMetodoConexion: IXMLNode;
   NodoOPOS: IXMLNode;
   NodoOperacion: IXMLNode;
   Nodo: IXMLNode;
begin
   FOleClassName := 'OPOS.POSPrinter';
   FNombreDispositivoOPOS := '';

   NodoMetodoConexion := Config.ChildNodes.FindNode('metodoconexion');
   if NodoMetodoConexion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de método de conexion para el dispositivo Impresora');

   NodoOperacion := Config.ChildNodes.FindNode('operaciones');
   if NodoOperacion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de operaciones para el dispositivo Impresora');

   Nodo := NodoOperacion.ChildNodes.FindNode('porcentajecorte');
   if Nodo <> nil then
      FPorcentajeCorte := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);

   NodoOPOS := NodoMetodoConexion.ChildNodes.FindNode('OPOS');
   if NodoOPOS = nil then
      raise Exception.Create('No se ha encontrado la configuración OPOS para el dispositivo Impresora');

   Nodo := NodoOPOS.ChildNodes.FindNode('NombreClase');
   if Nodo <> nil then
      FOleClassName := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);

   Nodo := NodoOPOS.ChildNodes.FindNode('NombreDispositivo');
   if Nodo <> nil then
      FNombreDispositivoOPOS := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);


end;

(*******************************************************************************
* TImpresoraGenerica                                                           *
*******************************************************************************)

procedure TImpresoraGenerica.Imprimir(str: String);
begin
   try
      if not FActivo then
         Conecta;

      ImprimeRAW(str);
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TImpresoraGenerica.Cortar;
begin
   try
      if not FActivo then
         Conecta;

      SendControlCode(FSecuenciaCorte);
   except on E: Exception do
      Log(E.Message);
   end;
end;

procedure TImpresoraGenerica.Conecta;
begin
   inherited;
   FActivo := True;
end;

procedure TImpresoraGenerica.Desconecta;
begin
   inherited;
   FActivo := False;   
end;

procedure TImpresoraGenerica.CargaConfiguracion(Config: IXMLNode);
var
   NodoOperacion: IXMLNode;
   Nodo: IXMLNode;
   vSecuencia: TStringList;
   x: Integer;
begin
   NodoOperacion := Config.ChildNodes.FindNode('operaciones');
   if NodoOperacion = nil then
      raise Exception.Create('No se ha encontrado la configuracion de operaciones para el dispositivo Impresora');

   Nodo := NodoOperacion.ChildNodes.FindNode('secuenciacorte');
   if Nodo <> nil then
      FSecuenciaCorte := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);

   //Carga la secuencia de apertura
   vSecuencia := TStringList.Create;
   try
      ExtractStrings([';'], [' '], pchar(FSecuenciaCorte), vSecuencia);
      FSecuenciaCorte := '';
      for x := 0 to vSecuencia.Count -1 do
      begin
         FSecuenciaCorte := FSecuenciaCorte + Chr(StrtoInt(vSecuencia[x]));
      end;
   finally
      vSecuencia.Free;
   end;
end;

(*******************************************************************************
* TTarjetaNoConfig                                                             *
*******************************************************************************)
procedure TTarjetaNoConfig.Conecta;
begin
   inherited;
end;

procedure TTarjetaNoConfig.Desconecta;
begin
   inherited;
end;

procedure TTarjetaNoConfig.CargaConfiguracion(Config: IXMLNode);
begin
   //N/A
end;

procedure TTarjetaNoConfig.IniciaTransaccion;
begin
   //N/A
end;

function TTarjetaNoConfig.RealizaTransaccion(OperacionTEF: TOperacionTEF): string;
begin
   result := 'NOCONFIGLECTORTARJETA'; //Ok
end;

procedure TTarjetaNoConfig.FinalizaTransaccion(correcta: boolean);
begin
   //N/A
end;

procedure TTarjetaNoConfig.IniciaPendientes;
begin
   //N/A
end;

procedure TTarjetaNoConfig.EnviaPendientes;
begin
   //N/A
end;

procedure TTarjetaNoConfig.AbreConfiguracion;
begin
   //N/A
end;

(*******************************************************************************
* TTarjetaTEF                                                                  *
*******************************************************************************)
procedure TTarjetaTEF.CargaConfiguracion(Config: IXMLNode);
var
   NodoMetodoConexion: IXMLNode;
   NodoDLL: IXMLNode;
   Nodo: IXMLNode;
begin
   NodoMetodoConexion := Config.ChildNodes.FindNode('metodoconexion');
   if NodoMetodoConexion = nil then //Verificar que lo que llega puede ser el propio metodoconexion si se llama desde la pantalla configuracion
      if Config.NodeName = 'metodoconexion' then
         NodoMetodoConexion := Config
      else
         raise Exception.Create('No se ha encontrado la configuracion de método de conexion para el dispositivo tarjeta');

   NodoDLL := NodoMetodoConexion.ChildNodes.FindNode('TEF');
   if NodoDLL = nil then
      raise Exception.Create('No se ha encontrado la configuración DLL para el dispositivo Tarjeta');

   Nodo := NodoDLL.ChildNodes.FindNode('NombreDLL');
   if Nodo <> nil then
      FDLL := iif(Nodo.NodeValue = null, '', Nodo.NodeValue);
   FDLL := UpperCase(FDLL);

   if FDLL = '' then
      raise Exception.Create('Error de configuración de dispositivo tarjeta. No se ha especificado nombre de función');
end;

procedure TTarjetaTEF.Conecta;
var
   ProcTarjeta : procedure(); stdcall;
begin
   if not FActivo then
   begin
      try
         if FModulo <= 0 then
            CargaDLL;
         ProcTarjeta := GetProcAddress(FModulo, PChar('Conecta'));
         ProcTarjeta();
         FActivo := True;
      except on E: Exception do
         begin
            raise Exception.Create('Se ha producido un error en la conexión con el dispositivo de lectura de tarjetas' + #13#10 + E.Message);
         end;
      end;
   end;
end;

procedure TTarjetaTEF.Desconecta;
var
   ProcTarjeta : procedure(); stdcall;
begin
   if FActivo then
   begin
      ProcTarjeta := GetProcAddress(FModulo, PChar('Desconecta'));
      ProcTarjeta();

      DescargaDLL;
      FActivo := False;
   end;
end;

procedure TTarjetaTEF.CargaDLL;
var
   ErrorMode : Cardinal;

   procedure CheckError;
   var
      LastError: DWORD;
   begin
      LastError := GetLastError;

      raise Exception.CreateFmt('ERROR CARGANDO %s.'#13+' %s '#13+'Error Nº %d del Sistema',
                                 [ UpperCase(FDLL),
                                  SysErrorMessage(LastError),
                                  LastError]);
   end;
begin
   ErrorMode := SetErrorMode(SEM_NOOPENFILEERRORBOX);
   try
      FModulo := LoadLibrary(PChar('.\' + FDLL));
      if FModulo = 0 then
         CheckError;
   finally
      SetErrorMode(ErrorMode);
   end;
end;

procedure TTarjetaTEF.DescargaDLL;
begin
   FreeLibrary(FModulo);
end;

function TTarjetaTEF.RealizaTransaccion(OperacionTEF: TOperacionTEF): string;
var
   ProcTarjeta : function(OperacionTEF: TOperacionTEF): PChar; stdcall;
begin
   if FModulo <= 0 then
      CargaDLL;
   ProcTarjeta := GetProcAddress(FModulo, PChar('RealizaTransaccion'));
   result := ProcTarjeta(OperacionTEF);
end;

procedure TTarjetaTEF.IniciaTransaccion;
var
   ProcTarjeta : procedure(); stdcall;
begin
   if not FActivo then
      Conecta;

   if FModulo <= 0 then
      CargaDLL;
   ProcTarjeta := GetProcAddress(FModulo, PChar('IniciaTransaccion'));
   ProcTarjeta();
end;

procedure TTarjetaTEF.FinalizaTransaccion(correcta: boolean);
var
   ProcTarjeta : procedure(correcta: Boolean); stdcall;
begin
   if FModulo <= 0 then
      CargaDLL;
   ProcTarjeta := GetProcAddress(FModulo, PChar('FinalizaTransaccion'));
   ProcTarjeta(correcta);
end;

procedure TTarjetaTEF.IniciaPendientes;
var
   ProcTarjeta : procedure(); stdcall;
begin
   if FModulo <= 0 then
      CargaDLL;
   ProcTarjeta := GetProcAddress(FModulo, PChar('IniciaPendientes'));
   ProcTarjeta();
end;

procedure TTarjetaTEF.EnviaPendientes;
var
   ProcTarjeta : procedure(); stdcall;
begin
   if FModulo <= 0 then
      CargaDLL;
   ProcTarjeta := GetProcAddress(FModulo, PChar('EnviaPendientes'));
   ProcTarjeta();
end;

procedure TTarjetaTEF.AbreConfiguracion;
var
   ProcTarjeta : procedure(); stdcall;
begin
   if FModulo <= 0 then
      CargaDLL;
   ProcTarjeta := GetProcAddress(FModulo, PChar('AbreConfiguracion'));
   ProcTarjeta();
end;

initialization
   RegisterClasses([TDispositivo]);
   RegisterClasses([TVisorNoConfig, TVisor, TVisorOPOS, TVisorSerie]);
   RegisterClasses([TCajonNoConfig, TCajon, TCajonOPOS, TCajonImpresora]);
   RegisterClasses([TImpresoraNoConfig, TImpresora, TImpresoraOPOS, TImpresoraGenerica]);
   RegisterClasses([TTarjetaNoConfig, TTarjeta, TTarjetaTEF]);

end.
