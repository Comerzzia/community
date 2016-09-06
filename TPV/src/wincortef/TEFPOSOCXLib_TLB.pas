unit TEFPOSOCXLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130  $
// File generated on 22/01/2010 8:59:04 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\WINDOWS\system32\tefposocx.ocx (1)
// LIBID: {F8A92E88-67C8-43DA-A221-CB9B0571E178}
// LCID: 0
// Helpfile: C:\WINDOWS\system32\tefposocx.hlp
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\system32\stdvcl40.dll)
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, OleCtrls, OleServer, StdVCL, Variants, 
Windows;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  TEFPOSOCXLibMajorVersion = 1;
  TEFPOSOCXLibMinorVersion = 0;

  LIBID_TEFPOSOCXLib: TGUID = '{F8A92E88-67C8-43DA-A221-CB9B0571E178}';

  DIID__DTefposocx: TGUID = '{476161CA-6277-40C7-A073-7015D97F5A97}';
  DIID__DTefposocxEvents: TGUID = '{574FEA2C-D338-4A91-A67C-9D3E7BD216F4}';
  CLASS_Tefposocx: TGUID = '{48E9C4C3-5540-49E4-96EE-E3816A2099D3}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DTefposocx = dispinterface;
  _DTefposocxEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Tefposocx = _DTefposocx;


// *********************************************************************//
// DispIntf:  _DTefposocx
// Flags:     (4112) Hidden Dispatchable
// GUID:      {476161CA-6277-40C7-A073-7015D97F5A97}
// *********************************************************************//
  _DTefposocx = dispinterface
    ['{476161CA-6277-40C7-A073-7015D97F5A97}']
    property Enabled: WordBool dispid 1;
    property TipoTransaccion: WideString dispid 2;
    property CodigoCentro: Integer dispid 3;
    property CodigoTienda: Integer dispid 4;
    property CodigoCajera: Integer dispid 5;
    property Pos: Smallint dispid 6;
    property ConexionTEF: WideString dispid 7;
    property Ticket: WideString dispid 8;
    property Importe: Integer dispid 9;
    property Pista1: WideString dispid 10;
    property Pista2: WideString dispid 11;
    property Pin: WideString dispid 12;
    property Fecha: WideString dispid 13;
    property Hora: WideString dispid 14;
    property ModalidadPago: WideString dispid 15;
    property FechaOperacionOriginal: WideString dispid 16;
    property Sesion: Smallint dispid 17;
    property Secuencia: Integer dispid 18;
    property NumAutorizacion: WideString dispid 19;
    property Comercio: WideString dispid 20;
    property Terminal: WideString dispid 21;
    property NombreEntidad: WideString dispid 22;
    property CausaError: WideString dispid 23;
    property TextoPublicitario: WideString dispid 24;
    property CodigoTarjeta: WideString dispid 25;
    property PanTarjeta: WideString dispid 26;
    property FechaExpiracion: WideString dispid 27;
    property ConceptoArqueo: WideString dispid 28;
    property TipoMoneda: WideString dispid 29;
    property NombreCliente: WideString dispid 30;
    property NombreTarjeta: WideString dispid 31;
    property TicketAnular: WideString dispid 32;
    property CajaAnular: WideString dispid 33;
    property TipoAutorizador: Integer dispid 34;
    property Cvv2: WideString dispid 35;
    property Telefono: WideString dispid 36;
    property Operador: Smallint dispid 37;
    property Solicitante: WideString dispid 38;
    property SolicitanteId: WideString dispid 39;
    property ReferenciaLocal: WideString dispid 40;
    property Comprobante: WideString dispid 41;
    property TextoResultado: WideString dispid 42;
    property TextoEstado: WideString dispid 43;
    property ReferenciaLocalEntidad: WideString dispid 44;
    property ResultadoEntidad: WideString dispid 45;
    property TextoResultadoEntidad: WideString dispid 46;
    property IdentificadorDivisa: WideString dispid 47;
    property ImporteFX: WideString dispid 48;
    property ItemNumber: Smallint dispid 49;
    property SimboloDivisa: WideString dispid 50;
    property TasaConversion: WideString dispid 51;
    property TipoDivisa: WideString dispid 52;
    property ECXRRN: WideString dispid 53;
    property DescripcionMoneda: WideString dispid 54;
    property CodigoRespuestaEntidad: WideString dispid 55;
    property VerificacionTitular: WideString dispid 56;
    property P23: WideString dispid 57;
    property P48: WideString dispid 58;
    property P55: WideString dispid 59;
    property P53: WideString dispid 60;
    property P25: WideString dispid 61;
    property Bin: WideString dispid 62;
    property P55Respuesta: WideString dispid 63;
    property EnListaNegra: WideString dispid 64;
    property TipoLectura: WideString dispid 65;
    property TerminalId: WideString dispid 66;
    property RequestCode: WideString dispid 67;
    property Aid: WideString dispid 68;
    property ApplicationLabel: WideString dispid 69;
    property DataIntro: Integer dispid 70;
    property AuthMode: Integer dispid 71;
    property Producto: WideString dispid 72;
    property Unidades: WideString dispid 73;
    property DatosCliente: WideString dispid 74;
    property ReferenciaCapcom: WideString dispid 75;
    property ReferenciaOperador: WideString dispid 76;
    property ErrorCapcom: WideString dispid 77;
    property MensajeCapcom: WideString dispid 78;
    property ErrorCod: Integer dispid 79;
    function  ComprobarConexion: Smallint; dispid 80;
    function  TraerMaestrosTarjetas: Smallint; dispid 81;
    function  TraerListaNegra: Smallint; dispid 82;
    function  EnviarTelerecarga: Integer; dispid 83;
    function  EnviarCapcom: WideString; dispid 84;
    function  EnviarTransaccion: Integer; dispid 85;
    function  EnviarConfirmacion: Integer; dispid 86;
    function  EnviarAnulacionError: Integer; dispid 87;
    function  EnviarPendientes(const Env: WideString): Smallint; dispid 88;
    function  EnviarOffPendientes(const Env: WideString): Integer; dispid 89;
    function  ListarOffPendientes: WideString; dispid 90;
    function  EnviarCancelacionTasa: Integer; dispid 91;
    function  LeerTarjeta: Smallint; dispid 92;
    function  GetSignature: Smallint; dispid 93;
  end;

// *********************************************************************//
// DispIntf:  _DTefposocxEvents
// Flags:     (4096) Dispatchable
// GUID:      {574FEA2C-D338-4A91-A67C-9D3E7BD216F4}
// *********************************************************************//
  _DTefposocxEvents = dispinterface
    ['{574FEA2C-D338-4A91-A67C-9D3E7BD216F4}']
    procedure TareaRealizada(const IdTransaccion: WideString; ExitoTarea: Integer); dispid 1;
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TTefposocx
// Help String      : Tefposocx Control
// Default Interface: _DTefposocx
// Def. Intf. DISP? : Yes
// Event   Interface: _DTefposocxEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TTefposocxTareaRealizada = procedure(Sender: TObject; const IdTransaccion: WideString; 
                                                        ExitoTarea: Integer) of object;

  TTefposocx = class(TOleControl)
  private
    FOnTareaRealizada: TTefposocxTareaRealizada;
    FIntf: _DTefposocx;
    function  GetControlInterface: _DTefposocx;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function  ComprobarConexion: Smallint;
    function  TraerMaestrosTarjetas: Smallint;
    function  TraerListaNegra: Smallint;
    function  EnviarTelerecarga: Integer;
    function  EnviarCapcom: WideString;
    function  EnviarTransaccion: Integer;
    function  EnviarConfirmacion: Integer;
    function  EnviarAnulacionError: Integer;
    function  EnviarPendientes(const Env: WideString): Smallint;
    function  EnviarOffPendientes(const Env: WideString): Integer;
    function  ListarOffPendientes: WideString;
    function  EnviarCancelacionTasa: Integer;
    function  LeerTarjeta: Smallint;
    function  GetSignature: Smallint;
    property  ControlInterface: _DTefposocx read GetControlInterface;
    property  DefaultInterface: _DTefposocx read GetControlInterface;
  published
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property Enabled: WordBool index 1 read GetWordBoolProp write SetWordBoolProp stored False;
    property TipoTransaccion: WideString index 2 read GetWideStringProp write SetWideStringProp stored False;
    property CodigoCentro: Integer index 3 read GetIntegerProp write SetIntegerProp stored False;
    property CodigoTienda: Integer index 4 read GetIntegerProp write SetIntegerProp stored False;
    property CodigoCajera: Integer index 5 read GetIntegerProp write SetIntegerProp stored False;
    property Pos: Smallint index 6 read GetSmallintProp write SetSmallintProp stored False;
    property ConexionTEF: WideString index 7 read GetWideStringProp write SetWideStringProp stored False;
    property Ticket: WideString index 8 read GetWideStringProp write SetWideStringProp stored False;
    property Importe: Integer index 9 read GetIntegerProp write SetIntegerProp stored False;
    property Pista1: WideString index 10 read GetWideStringProp write SetWideStringProp stored False;
    property Pista2: WideString index 11 read GetWideStringProp write SetWideStringProp stored False;
    property Pin: WideString index 12 read GetWideStringProp write SetWideStringProp stored False;
    property Fecha: WideString index 13 read GetWideStringProp write SetWideStringProp stored False;
    property Hora: WideString index 14 read GetWideStringProp write SetWideStringProp stored False;
    property ModalidadPago: WideString index 15 read GetWideStringProp write SetWideStringProp stored False;
    property FechaOperacionOriginal: WideString index 16 read GetWideStringProp write SetWideStringProp stored False;
    property Sesion: Smallint index 17 read GetSmallintProp write SetSmallintProp stored False;
    property Secuencia: Integer index 18 read GetIntegerProp write SetIntegerProp stored False;
    property NumAutorizacion: WideString index 19 read GetWideStringProp write SetWideStringProp stored False;
    property Comercio: WideString index 20 read GetWideStringProp write SetWideStringProp stored False;
    property Terminal: WideString index 21 read GetWideStringProp write SetWideStringProp stored False;
    property NombreEntidad: WideString index 22 read GetWideStringProp write SetWideStringProp stored False;
    property CausaError: WideString index 23 read GetWideStringProp write SetWideStringProp stored False;
    property TextoPublicitario: WideString index 24 read GetWideStringProp write SetWideStringProp stored False;
    property CodigoTarjeta: WideString index 25 read GetWideStringProp write SetWideStringProp stored False;
    property PanTarjeta: WideString index 26 read GetWideStringProp write SetWideStringProp stored False;
    property FechaExpiracion: WideString index 27 read GetWideStringProp write SetWideStringProp stored False;
    property ConceptoArqueo: WideString index 28 read GetWideStringProp write SetWideStringProp stored False;
    property TipoMoneda: WideString index 29 read GetWideStringProp write SetWideStringProp stored False;
    property NombreCliente: WideString index 30 read GetWideStringProp write SetWideStringProp stored False;
    property NombreTarjeta: WideString index 31 read GetWideStringProp write SetWideStringProp stored False;
    property TicketAnular: WideString index 32 read GetWideStringProp write SetWideStringProp stored False;
    property CajaAnular: WideString index 33 read GetWideStringProp write SetWideStringProp stored False;
    property TipoAutorizador: Integer index 34 read GetIntegerProp write SetIntegerProp stored False;
    property Cvv2: WideString index 35 read GetWideStringProp write SetWideStringProp stored False;
    property Telefono: WideString index 36 read GetWideStringProp write SetWideStringProp stored False;
    property Operador: Smallint index 37 read GetSmallintProp write SetSmallintProp stored False;
    property Solicitante: WideString index 38 read GetWideStringProp write SetWideStringProp stored False;
    property SolicitanteId: WideString index 39 read GetWideStringProp write SetWideStringProp stored False;
    property ReferenciaLocal: WideString index 40 read GetWideStringProp write SetWideStringProp stored False;
    property Comprobante: WideString index 41 read GetWideStringProp write SetWideStringProp stored False;
    property TextoResultado: WideString index 42 read GetWideStringProp write SetWideStringProp stored False;
    property TextoEstado: WideString index 43 read GetWideStringProp write SetWideStringProp stored False;
    property ReferenciaLocalEntidad: WideString index 44 read GetWideStringProp write SetWideStringProp stored False;
    property ResultadoEntidad: WideString index 45 read GetWideStringProp write SetWideStringProp stored False;
    property TextoResultadoEntidad: WideString index 46 read GetWideStringProp write SetWideStringProp stored False;
    property IdentificadorDivisa: WideString index 47 read GetWideStringProp write SetWideStringProp stored False;
    property ImporteFX: WideString index 48 read GetWideStringProp write SetWideStringProp stored False;
    property ItemNumber: Smallint index 49 read GetSmallintProp write SetSmallintProp stored False;
    property SimboloDivisa: WideString index 50 read GetWideStringProp write SetWideStringProp stored False;
    property TasaConversion: WideString index 51 read GetWideStringProp write SetWideStringProp stored False;
    property TipoDivisa: WideString index 52 read GetWideStringProp write SetWideStringProp stored False;
    property ECXRRN: WideString index 53 read GetWideStringProp write SetWideStringProp stored False;
    property DescripcionMoneda: WideString index 54 read GetWideStringProp write SetWideStringProp stored False;
    property CodigoRespuestaEntidad: WideString index 55 read GetWideStringProp write SetWideStringProp stored False;
    property VerificacionTitular: WideString index 56 read GetWideStringProp write SetWideStringProp stored False;
    property P23: WideString index 57 read GetWideStringProp write SetWideStringProp stored False;
    property P48: WideString index 58 read GetWideStringProp write SetWideStringProp stored False;
    property P55: WideString index 59 read GetWideStringProp write SetWideStringProp stored False;
    property P53: WideString index 60 read GetWideStringProp write SetWideStringProp stored False;
    property P25: WideString index 61 read GetWideStringProp write SetWideStringProp stored False;
    property Bin: WideString index 62 read GetWideStringProp write SetWideStringProp stored False;
    property P55Respuesta: WideString index 63 read GetWideStringProp write SetWideStringProp stored False;
    property EnListaNegra: WideString index 64 read GetWideStringProp write SetWideStringProp stored False;
    property TipoLectura: WideString index 65 read GetWideStringProp write SetWideStringProp stored False;
    property TerminalId: WideString index 66 read GetWideStringProp write SetWideStringProp stored False;
    property RequestCode: WideString index 67 read GetWideStringProp write SetWideStringProp stored False;
    property Aid: WideString index 68 read GetWideStringProp write SetWideStringProp stored False;
    property ApplicationLabel: WideString index 69 read GetWideStringProp write SetWideStringProp stored False;
    property DataIntro: Integer index 70 read GetIntegerProp write SetIntegerProp stored False;
    property AuthMode: Integer index 71 read GetIntegerProp write SetIntegerProp stored False;
    property Producto: WideString index 72 read GetWideStringProp write SetWideStringProp stored False;
    property Unidades: WideString index 73 read GetWideStringProp write SetWideStringProp stored False;
    property DatosCliente: WideString index 74 read GetWideStringProp write SetWideStringProp stored False;
    property ReferenciaCapcom: WideString index 75 read GetWideStringProp write SetWideStringProp stored False;
    property ReferenciaOperador: WideString index 76 read GetWideStringProp write SetWideStringProp stored False;
    property ErrorCapcom: WideString index 77 read GetWideStringProp write SetWideStringProp stored False;
    property MensajeCapcom: WideString index 78 read GetWideStringProp write SetWideStringProp stored False;
    property ErrorCod: Integer index 79 read GetIntegerProp write SetIntegerProp stored False;
    property OnTareaRealizada: TTefposocxTareaRealizada read FOnTareaRealizada write FOnTareaRealizada;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

implementation

uses ComObj;

procedure TTefposocx.InitControlData;
const
  CEventDispIDs: array [0..0] of DWORD = (
    $00000001);
  CControlData: TControlData2 = (
    ClassID: '{48E9C4C3-5540-49E4-96EE-E3816A2099D3}';
    EventIID: '{574FEA2C-D338-4A91-A67C-9D3E7BD216F4}';
    EventCount: 1;
    EventDispIDs: @CEventDispIDs;
    LicenseKey: nil (*HR:$80004005*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
  TControlData2(CControlData).FirstEventOfs := Cardinal(@@FOnTareaRealizada) - Cardinal(Self);
end;

procedure TTefposocx.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DTefposocx;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TTefposocx.GetControlInterface: _DTefposocx;
begin
  CreateControl;
  Result := FIntf;
end;

function  TTefposocx.ComprobarConexion: Smallint;
begin
  ComprobarConexion := DefaultInterface.ComprobarConexion;
end;

function  TTefposocx.TraerMaestrosTarjetas: Smallint;
begin
  TraerMaestrosTarjetas := DefaultInterface.TraerMaestrosTarjetas;
end;

function  TTefposocx.TraerListaNegra: Smallint;
begin
  TraerListaNegra := DefaultInterface.TraerListaNegra;
end;

function  TTefposocx.EnviarTelerecarga: Integer;
begin
  EnviarTelerecarga := DefaultInterface.EnviarTelerecarga;
end;

function  TTefposocx.EnviarCapcom: WideString;
begin
  EnviarCapcom := DefaultInterface.EnviarCapcom;
end;

function  TTefposocx.EnviarTransaccion: Integer;
begin
  EnviarTransaccion := DefaultInterface.EnviarTransaccion;
end;

function  TTefposocx.EnviarConfirmacion: Integer;
begin
  EnviarConfirmacion := DefaultInterface.EnviarConfirmacion;
end;

function  TTefposocx.EnviarAnulacionError: Integer;
begin
  EnviarAnulacionError := DefaultInterface.EnviarAnulacionError;
end;

function  TTefposocx.EnviarPendientes(const Env: WideString): Smallint;
begin
  EnviarPendientes := DefaultInterface.EnviarPendientes(Env);
end;

function  TTefposocx.EnviarOffPendientes(const Env: WideString): Integer;
begin
  EnviarOffPendientes := DefaultInterface.EnviarOffPendientes(Env);
end;

function  TTefposocx.ListarOffPendientes: WideString;
begin
  ListarOffPendientes := DefaultInterface.ListarOffPendientes;
end;

function  TTefposocx.EnviarCancelacionTasa: Integer;
begin
  EnviarCancelacionTasa := DefaultInterface.EnviarCancelacionTasa;
end;

function  TTefposocx.LeerTarjeta: Smallint;
begin
  LeerTarjeta := DefaultInterface.LeerTarjeta;
end;

function  TTefposocx.GetSignature: Smallint;
begin
  GetSignature := DefaultInterface.GetSignature;
end;

procedure Register;
begin
  RegisterComponents('ActiveX',[TTefposocx]);
end;

end.
