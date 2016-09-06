unit funciones;

interface
uses
   uOperacionTEF, TEFPOSOCXLib_TLB, inifiles, Windows,
   Messages, SysUtils, Variants, Classes, Forms, Controls, Dialogs, StdCtrls, OleCtrls;

//lectura del fichero de configuracion
procedure leer_ini; stdcall;
//carga los datos desde OperacionTEF a Tefposocx1
procedure cargaDatosTEF(OperacionTEF: TOperacionTEF); stdcall;
//guarda los datos desde Tefposocx1 a OperacionTEF
procedure guardaDatosTEF(OperacionTEF: TOperacionTEF); stdcall;
//crea el objeto tefpos que vamos a usar durante el proceso de pago
procedure IniciaTransaccion; stdcall;
//se encarga de ralizar el proceso de pago por tarjeta
function RealizaTransaccion(OperacionTEF: TOperacionTEF): PChar; stdcall;
//realiza la confirmacion o anulacion de la operacion y destruye el objeto tefpos
procedure FinalizaTransaccion(correcta: boolean); stdcall;
//inicializa los ficheros de transacciones pendientes
procedure IniciaPendientes; stdcall;
//envia las transacciones pendientes
procedure EnviaPendientes; stdcall;
//Abre formulario configuración
Procedure AbreConfiguracion; stdcall;
//Crea el objeto Tef
Procedure Conecta; stdcall;
//Destruye el objeto Tef
Procedure Desconecta; stdcall;

var
  Tefposocx1: TTefposocx;
  codigo_Tienda : Integer;
  codigo_Centro : Integer;
  Pos           : SmallInt;


implementation
uses
   Configuracion;

//lectura del fichero de configuracion
procedure leer_ini;
Var
   fichero : TIniFile;
   cadena_error : string;
begin
   fichero := TiniFile.Create (ExtractFileDir (ParamStr(0))+ '\wincortef.ini');

   codigo_Centro := fichero.ReadInteger ('Conf','CodigoCentro',-1);
   codigo_Tienda := fichero.ReadInteger ('Conf','CodigoTienda',-1);
   Pos           := fichero.ReadInteger ('Conf','Pos',-1);

   cadena_error := 'Error en configuración, revise valores:' + #13 + #10 +
                   '   Código centro: ' +fichero.ReadString ('Conf','CodigoCentro','') + ' (max: ' + IntToStr(High(Integer)) + ')' + #13 + #10 +
                   '   Código Tienda: ' + fichero.ReadString ('Conf','CodigoTienda','') + ' (max: ' + IntToStr(High(Integer)) + ')' + #13 + #10 +
                   '   Pos: ' + fichero.ReadString ('Conf','Pos','') + ' (max: ' + IntToStr(High(SmallInt)) + ')';

   fichero.Free;

   if (codigo_Centro < 0) or (codigo_Tienda < 0) or (Pos < 0) then
   begin
      raise exception.Create(cadena_error);
   end;
end;

//carga los datos desde OperacionTEF a Tefposocx1
procedure cargaDatosTEF(OperacionTEF: TOperacionTEF);
begin
   Tefposocx1.Pos             := Pos;
   Tefposocx1.CodigoCentro    := codigo_Centro;
   Tefposocx1.CodigoTienda    := codigo_Tienda;
   Tefposocx1.CodigoCajera    := OperacionTEF.CodigoCajera;
   Tefposocx1.TipoTransaccion := OperacionTEF.TipoTransaccion;
   Tefposocx1.Ticket          := OperacionTEF.Ticket;
   Tefposocx1.TipoMoneda      := OperacionTEF.TipoMoneda;
   Tefposocx1.Importe         := StrToInt(FloatToStr(OperacionTEF.Importe * 100));
   if OperacionTEF.Importe < 0 then
      Tefposocx1.Importe := Tefposocx1.Importe * -1;
end;

//guarda los datos desde Tefposocx1 a OperacionTEF
procedure guardaDatosTEF(OperacionTEF: TOperacionTEF);
var
   cad_fecha: string;
begin
   cad_fecha := copy(Tefposocx1.Fecha,5,2) + '/' + copy(Tefposocx1.Fecha,3,2) + '/' + copy(Tefposocx1.Fecha,1,2) + ' ' +
                copy(Tefposocx1.Hora,1,2) + ':' + copy(Tefposocx1.Hora,3,2) + ':' + copy(Tefposocx1.Hora,5,2);

   OperacionTEF.Pos                 := Tefposocx1.Pos;
   OperacionTEF.CodigoCentro        := Tefposocx1.CodigoCentro;
   OperacionTEF.CodigoTienda        := Tefposocx1.CodigoTienda;
   //OperacionTEF.CodigoCajera      := Tefposocx1.CodigoCajera;
   //OperacionTEF.TipoTransaccion   := Tefposocx1.TipoTransaccion;
   //OperacionTEF.Importe           := Tefposocx1.Importe;
   //OperacionTEF.Ticket            := Tefposocx1.Ticket;
   //OperacionTEF.TipoMoneda        := Tefposocx1.TipoMoneda;
   OperacionTEF.FUC                 := Trim(Tefposocx1.Comercio); // Codigo F.U.C.
   OperacionTEF.Terminal            := Trim(Tefposocx1.Terminal); //Identificacion terminal
   OperacionTEF.NombreEntidad       := Trim(Tefposocx1.NombreEntidad); //HCP
   OperacionTEF.NombreCliente       := Trim(Tefposocx1.NombreCliente); //Nombre Titular solo EMV
   OperacionTEF.Aid                 := Trim(Tefposocx1.Aid);  //AID solo EMV
   OperacionTEF.PAN                 :=  '************' + copy(Tefposocx1.PanTarjeta,13,4); //Num tarjeta truncado
   OperacionTEF.P23                 := Trim(Tefposocx1.P23); //num secuencial de la tarjeta
   OperacionTEF.ApplicationLabel    := Trim(Tefposocx1.ApplicationLabel); //Etiqueta del terminal solo EMV
   OperacionTEF.FechaTransaccion    := StrTodateTime(cad_fecha); //fecha operacion
   OperacionTEF.NumAutorizacion     := Trim(Tefposocx1.NumAutorizacion); //numero de autorizacion
   //OperacionTEF.Establecimiento;
   //OperacionTEF.DireccionEstablecimiento;
   OperacionTEF.RequestCode         := Trim(Tefposocx1.RequestCode); //Autorizacion ARC, solo venta
   OperacionTEF.TerminalId          := Trim(Tefposocx1.TerminalId);  //numero del pinpad
   OperacionTEF.VerificacionTitular := Trim(Tefposocx1.VerificacionTitular); //modo de verificacion del usuario, solo venta
   OperacionTEF.AuthMode            := Tefposocx1.AuthMode;  //Modo autorizacion ON-OFF
//   OperacionTEF.TipoLectura         :=Tefposocx1.TipoLectura; //tipo de lectura 0.-Banda 2.-Chip
end;

//encarga de crear el objeto Tef
procedure Conecta;
begin
   Tefposocx1 := TTefposocx.Create(nil);

   //iniciamos los datos pendientes
   IniciaPendientes;
end;

//encarga de crear el objeto Tef
procedure Desconecta;
begin
   //enviamos los datos pendientes
   EnviaPendientes;

   Tefposocx1.Free;
end;

//crea el objeto tefpos que vamos a usar durante el proceso de pago
procedure IniciaTransaccion;
begin
   //cargamos las variables de configuracion necesarias para la realizacion de la transaccion
   //si los valores no son correctos generamos una excepcion indicandolo
   leer_ini;

   //Tefposocx1 := TTefposocx.Create(nil);
end;

//se encarga de ralizar el proceso de pago por tarjeta
function RealizaTransaccion(OperacionTEF: TOperacionTEF): PChar;
const
   error_lectura: array[1..14] of string = ('Terminal de pago no preparado' + #13#10 + 'PINPAD ERROR_TERMINAL_NOT_READY -1',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_SEQUENCE_TRANSACTION -2',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_TYPE_TRANSACTION -3',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_DATE_TRANSACTION -4',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_TIME_TRANSACTION -5',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_AMOUNT_TRANSACTION -6',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_PINPAD_TRANSACTION -7',
                                            'Error en la transacción del terminal de pago' + #13#10 + 'PINPAD ERROR_VALUE_PARAMETERS_TRANSACTION -8',
                                            'Lectura de tarjeta errónea' + #13#10 + 'PINPAD ERROR_READ_CARD -9',
                                            'Operación denegada' + #13#10 + 'PINPAD TRANSACTION_DENIED -10',
                                            'ERROR_FILE_TAGS -11',
                                            'Operación cancelada por el usuario' + #13#10 + 'PINPAD TRANSACTION_CANCEL_BYUSER -12',
                                            'ERROR_VALUE_P55_TRANSACTION -13',
                                            'Tarjeta no válida -14');
   error_no_controlado: string = 'Error no controlado al leer tarjeta ';
var
   envio : Integer;
   resultado: String;
begin
   result := pChar('');
   // Se comprueba conectividad con SitefWeb  0.- ok  -1.-ko
   if ( Tefposocx1.ComprobarConexion < 0 ) then
   begin
      result := PChar('Conexión NO correcta con SitefWeb');
      Exit;
   end;

   // Se establecen valores propiedades iniciales y se invoca lectura hacia el PINPAD
   //cargaDatos(OperacionTEF);
   cargaDatosTEF(OperacionTEF);

   //lectura de la tarjeta desde el pinpad
   OperacionTEF.TipoLectura := Tefposocx1.LeerTarjeta();
   if (OperacionTEF.TipoLectura < 0) then
   begin
      try
         result := PChar(error_lectura[OperacionTEF.TipoLectura*(-1)]);
         Exit;
      except on E: Exception do
         begin
            result := PChar(error_no_controlado + IntToStr(OperacionTEF.TipoLectura) + #13#10 + E.Message);
            Exit;
         end;
      end;
   end;

   // Se envia la transaccion hacia SitefWeb
   envio := Tefposocx1.EnviarTransaccion();
   if (envio < 0) then
   begin
      resultado := 'Envio erroneo: ' + IntToStr(envio) + #13 + #10 + Tefposocx1.CausaError;
      result := PChar(resultado);
      Exit;
   end;

   guardaDatosTEF(OperacionTEF);
end;

//realiza la confirmacion o anulacion de la operacion
procedure FinalizaTransaccion(correcta: boolean);
begin
   if correcta then
      Tefposocx1.EnviarConfirmacion
   else
      Tefposocx1.EnviarAnulacionError;

   Tefposocx1.EnviarPendientes('ENVIA');

   //Tefposocx1.Free;
end;

//inicializa los ficheros de transacciones pendientes
procedure IniciaPendientes;
begin
   Tefposocx1.EnviarPendientes('INICIALIZA');
end;

//envia las transacciones pendientes
procedure EnviaPendientes;
begin
   Tefposocx1.EnviarPendientes('ENVIA');
end;

//Abre formularioe configuración
Procedure AbreConfiguracion;
begin
   FrmConfig := TFrmConfig.Create(Application);
   try
      FrmConfig.ShowModal;
   finally
      FrmConfig.Free;
   end;
end;

end.
