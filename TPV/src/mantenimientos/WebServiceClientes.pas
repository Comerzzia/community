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

unit WebServiceClientes;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_UNQL = $0008;
  IS_ATTR = $0010;
  IS_TEXT = $0020;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"

  WSClienteBean        = class;                 { "http://clientes.general.ws.comerzzia.com"[GblCplx] }



  // ************************************************************************ //
  // XML       : WSClienteBean, global, <complexType>
  // Namespace : http://clientes.general.ws.comerzzia.com
  // ************************************************************************ //
  WSClienteBean = class(TRemotable)
  private
    Factivo: WideString;
    Fbanco: WideString;
    Fccc: WideString;
    Fcif: WideString;
    FcodAlmacenTienda: WideString;
    FcodCli: WideString;
    FcodMedioPago: WideString;
    FcodPais: WideString;
    FcodSec: WideString;
    FcodTar: WideString;
    FcodTratImp: WideString;
    Fcp: WideString;
    FdesAlmacenTienda: WideString;
    FdesCli: WideString;
    FdesMedPagVen: WideString;
    FdesMedioPagoVencimiento: WideString;
    FdesPais: WideString;
    FdesSec: WideString;
    FdesTar: WideString;
    FdesTratImp: WideString;
    Fdomicilio: WideString;
    FdomicilioBanco: WideString;
    Femail: WideString;
    Ffax: WideString;
    FfechaAlta: TXSDateTime;
    FfechaBaja: TXSDateTime;
    FidMedioPagoVencimiento: WideString;
    FidTratImp: WideString;
    FnombreComercial: WideString;
    Fobservaciones: WideString;
    FpersonaContacto: WideString;
    Fpoblacion: WideString;
    FpoblacionBanco: WideString;
    Fprovincia: WideString;
    FriesgoConcedido: Double;
    Ftelefono1: WideString;
    Ftelefono2: WideString;
  public
    destructor Destroy; override;
  published
    property activo:                  WideString   Index (IS_NLBL) read Factivo write Factivo;
    property banco:                   WideString   Index (IS_NLBL) read Fbanco write Fbanco;
    property ccc:                     WideString   Index (IS_NLBL) read Fccc write Fccc;
    property cif:                     WideString   Index (IS_NLBL) read Fcif write Fcif;
    property codAlmacenTienda:        WideString   Index (IS_NLBL) read FcodAlmacenTienda write FcodAlmacenTienda;
    property codCli:                  WideString   Index (IS_NLBL) read FcodCli write FcodCli;
    property codMedioPago:            WideString   Index (IS_NLBL) read FcodMedioPago write FcodMedioPago;
    property codPais:                 WideString   Index (IS_NLBL) read FcodPais write FcodPais;
    property codSec:                  WideString   Index (IS_NLBL) read FcodSec write FcodSec;
    property codTar:                  WideString   Index (IS_NLBL) read FcodTar write FcodTar;
    property codTratImp:              WideString   Index (IS_NLBL) read FcodTratImp write FcodTratImp;
    property cp:                      WideString   Index (IS_NLBL) read Fcp write Fcp;
    property desAlmacenTienda:        WideString   Index (IS_NLBL) read FdesAlmacenTienda write FdesAlmacenTienda;
    property desCli:                  WideString   Index (IS_NLBL) read FdesCli write FdesCli;
    property desMedPagVen:            WideString   Index (IS_NLBL) read FdesMedPagVen write FdesMedPagVen;
    property desMedioPagoVencimiento: WideString   Index (IS_NLBL) read FdesMedioPagoVencimiento write FdesMedioPagoVencimiento;
    property desPais:                 WideString   Index (IS_NLBL) read FdesPais write FdesPais;
    property desSec:                  WideString   Index (IS_NLBL) read FdesSec write FdesSec;
    property desTar:                  WideString   Index (IS_NLBL) read FdesTar write FdesTar;
    property desTratImp:              WideString   Index (IS_NLBL) read FdesTratImp write FdesTratImp;
    property domicilio:               WideString   Index (IS_NLBL) read Fdomicilio write Fdomicilio;
    property domicilioBanco:          WideString   Index (IS_NLBL) read FdomicilioBanco write FdomicilioBanco;
    property email:                   WideString   Index (IS_NLBL) read Femail write Femail;
    property fax:                     WideString   Index (IS_NLBL) read Ffax write Ffax;
    property fechaAlta:               TXSDateTime  Index (IS_NLBL) read FfechaAlta write FfechaAlta;
    property fechaBaja:               TXSDateTime  Index (IS_NLBL) read FfechaBaja write FfechaBaja;
    property idMedioPagoVencimiento:  WideString   Index (IS_NLBL) read FidMedioPagoVencimiento write FidMedioPagoVencimiento;
    property idTratImp:               WideString   Index (IS_NLBL) read FidTratImp write FidTratImp;
    property nombreComercial:         WideString   Index (IS_NLBL) read FnombreComercial write FnombreComercial;
    property observaciones:           WideString   Index (IS_NLBL) read Fobservaciones write Fobservaciones;
    property personaContacto:         WideString   Index (IS_NLBL) read FpersonaContacto write FpersonaContacto;
    property poblacion:               WideString   Index (IS_NLBL) read Fpoblacion write Fpoblacion;
    property poblacionBanco:          WideString   Index (IS_NLBL) read FpoblacionBanco write FpoblacionBanco;
    property provincia:               WideString   Index (IS_NLBL) read Fprovincia write Fprovincia;
    property riesgoConcedido:         Double       Index (IS_NLBL) read FriesgoConcedido write FriesgoConcedido;
    property telefono1:               WideString   Index (IS_NLBL) read Ftelefono1 write Ftelefono1;
    property telefono2:               WideString   Index (IS_NLBL) read Ftelefono2 write Ftelefono2;
  end;


  // ************************************************************************ //
  // Namespace : http://clientes.general.ws.comerzzia.com
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : WSClientesSoapBinding
  // service   : WSClientesService
  // port      : WSClientes
  // URL       : http://vm-desarrollo2.mpcorporacion.com/comerzzia/ws/services/WSClientes
  // ************************************************************************ //
  WSClientes = interface(IInvokable)
  ['{32D986D8-3500-D20A-7D4A-19AAAB9EC16F}']
    function  obtenerCliente(const cif: WideString; const usuario: WideString; const clave: WideString): WSClienteBean; stdcall;
  end;

function GetWSClientes(UrlWS: String; HTTPRIO: THTTPRIO = nil): WSClientes;


implementation
  uses SysUtils;

function GetWSClientes(UrlWS: String; HTTPRIO: THTTPRIO): WSClientes;
const
  defSvc  = 'WSClientesService';
  defPrt  = 'WSClientes';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as WSClientes);
    RIO.URL := UrlWS;
    RIO.Service := defSvc;
    RIO.Port := defPrt;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


destructor WSClienteBean.Destroy;
begin
  FreeAndNil(FfechaAlta);
  FreeAndNil(FfechaBaja);
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(WSClientes), 'http://clientes.general.ws.comerzzia.com', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(WSClientes), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(WSClientes), ioDocument);
  RemClassRegistry.RegisterXSClass(WSClienteBean, 'http://clientes.general.ws.comerzzia.com', 'WSClienteBean');

end.