//
// Copyright 2009-2011 RED.ES - Desarrollado por Tier1
// 
// Licencia con arreglo a la EUPL, versi�n 1.1 o -en cuanto 
// sean aprobadas por la comisi�n Europea- versiones 
// posteriores de la EUPL (la "Licencia").
// Solo podr� usarse esta obra si se respeta la Licencia.
// 
// http://ec.europa.eu/idabc/eupl.html
// 
// Salvo cuando lo exija la legislaci�n aplicable o se acuerde
// por escrito, el programa distribuido con arreglo a la
// Licencia se distribuye "TAL CUAL",
// SIN GARANT�AS NI CONDICIONES DE NING�N TIPO, 
// ni expresas ni impl�citas.
// V�ase la Licencia en el idioma concreto que rige
// los permisos y limitaciones que establece la Licencia.
//

unit uOperacionTEF;

interface

type
   TOperacionTEF = class(TObject)
   private
      //datos que se rellenan antes de realizar la transaccion
      FPos: SmallInt;
      FCodigoCentro: Integer;
      FCodigoTienda: Integer;
      FCodigoCajera: Integer; //Cajero
      FTipoTransaccion: WideString; //Tipo de Operaci�n.
      FImporte: Currency; //Importe de la operaci�n.
      FTicket: WideString; // N� operacin del terminal   widestring
      FTipoMoneda: WideString; // tipo moneda  widestring

      //datos que se rellenan despu�s de realizar la transaccion para la impresi�n del ticket
      FFUC: WideString; //C�digo F.U.C. asignado al establecimiento.
      FTerminal: WideString; //Identificaci�n del terminal.
      FNombreEntidad: WideString; //identificador HCP (sistema4b,servired,...)
      FNombreCliente: WideString; //Nombre del titular.
      FAid: widestring; //AID solo EMV    widestring
      FPAN: WideString; //PAN, n�mero de tarjeta.
      FP23: widestring; //num secuencial de la tarjeta  widestring
      FApplicationLabel: widestring; //Etiqueta del terminal solo EMV  widestring
      FFechaTransaccion: TDateTime; //Fecha y hora local de la transacci�n. Formato DDMMAA hhmm.
      FNumAutorizacion: widestring; //N�mero de autorizaci�n.
      FEstablecimiento: String; //Nombre del establecimiento.
      FDireccionEstablecimiento: String; //Direcci�n completa del establecimiento.
      FRequestCode: widestring; //Autorizacion ARC  widestring
      FTerminalId: widestring;  //numero del pinpad
      FVerificacionTitular: widestring; //modo de verificacion del usuario (PIN,Firma,...)
      FAuthMode: Integer; //Identificaci�n del centro autorizador.
      FTipoLectura: SmallInt; //0 Banda, 2 Chip EMV. resultado de la funci�n leerTarjeta
   public
      procedure Clear;
      property Pos: SmallInt read FPos write FPos;
      property CodigoCentro: Integer read FCodigoCentro write FCodigoCentro;
      property CodigoTienda: Integer read FCodigoTienda write FCodigoTienda;
      property CodigoCajera: Integer read FCodigoCajera write FCodigoCajera;
      property TipoTransaccion: widestring read FTipoTransaccion write FTipoTransaccion;
      property Importe: Currency read FImporte write FImporte;
      property Ticket: widestring read FTicket write FTicket;
      property TipoMoneda: widestring read FTipoMoneda write FTipoMoneda;
      property FUC: widestring read FFUC write FFUC;
      property Terminal: widestring read FTerminal write FTerminal;
      property NombreEntidad: widestring read FNombreEntidad write FNombreEntidad;
      property NombreCliente: widestring read FNombreCliente write FNombreCliente;
      property Aid: WideString read FAid write FAid;
      property PAN: WideString read FPAN write FPAN;
      property P23: WideString read FP23 write FP23;
      property ApplicationLabel: WideString read FApplicationLabel write FApplicationLabel;
      property FechaTransaccion: TDateTime read FFechaTransaccion write FFechaTransaccion;
      property NumAutorizacion: widestring read FNumAutorizacion write FNumAutorizacion;
      property Establecimiento: String read FEstablecimiento write FEstablecimiento;
      property DireccionEstablecimiento: String read FDireccionEstablecimiento write FDireccionEstablecimiento;
      property RequestCode: widestring read FRequestCode write FRequestCode;
      property TerminalId: widestring read FTerminalId write FTerminalId;
      property VerificacionTitular: widestring read FVerificacionTitular write FVerificacionTitular;
      property AuthMode: Integer read FAuthMode write FAuthMode;
      property TipoLectura: SmallInt read FTipoLectura write FTipoLectura;
   end;


implementation

procedure TOperacionTEF.Clear;
begin
   Pos := 0;
   CodigoCentro := -1;
   CodigoTienda := -1;
   CodigoCajera := -1;
   TipoTransaccion := '';
   Importe := 0;
   Ticket := '';
   TipoMoneda := '';
   FUC := '';
   Terminal := '';
   NombreEntidad := '';
   NombreCliente := '';
   Aid := '';
   PAN := '';
   P23 := '';
   ApplicationLabel := '';
   FechaTransaccion := 0;
   NumAutorizacion := '';
   Establecimiento := '';
   DireccionEstablecimiento := '';
   RequestCode := '';
   TerminalId := '';
   VerificacionTitular := '';
   AuthMode := -1;
   TipoLectura := 0;
end;

end.
