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

unit DataMBaseDatos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Variants, DBTables, IniFiles, Db, FileCtrl, Dialogs,
  AppEvnts, AdvAlertWindow, AdvMenus, RzButton, Uni, DBAccess, MemDS, JvJCLUtils, Registry,
  RzStatus, AdvOfficeStatusBar, ButtonGroup, XMLDoc, XMLIntf, uMensajeDialog,
  MySQLUniProvider, OracleUniProvider, DASQLMonitor, UniSQLMonitor;

resourcestring
   STR_ConectandoBaseDatos = 'Conectando con la base de datos...';
   STR_VerificandoEstadoBaseDatos = 'Verificando estado de la base de datos...';
   STR_BaseDatosContieneErrores = 'La base de datos contiene errores. Contacte con el administrador';
   STR_ErrorAlConectarBaseDatos = 'Error al conectar a la base de datos.' + #13#13 + 'Mensaje original:' + #13#13;
   STR_SeHaPedidoVariable = 'Se ha pedido la variable %s antes de conectar.';
   STR_ErrorOracle = 'Se ha producido el siguiente error: %d %s' + #13 + 'Mensaje Original:' + #13 +' %s';
   STR_NoPudoCambiarConfigSesionOracle = 'No se pudo cambiar la configuraci�n de sesi�n en ORACLE' + #13#13 +
                                         'Mensaje original:' + #13#13;
   STR_AutentificandoUsuario = 'Validando usuario';
   STR_UsuarioClaveNoValido = 'Usuario/clave no v�lido';
   STR_IDUsuarioNoEncontrado = 'No se ha encontrado el identificador de usuario especificado en configuraci�n';
   STR_ErrorPuertoLDAP = 'Error en configuracion del puerto LDAP';
   STR_NoExisteEmpresaDeAlta = 'No existen empresas dadas de alta. Contacte con su administrador';

   STR_CodigoTiendaNoConfigurado = 'No se ha configurado c�digo de tienda. Revise el fichero de configuraci�n';
   STR_CodigoTiendaNoValido = 'El c�digo de tienda seleccionado [%s] no es un c�digo de tienda v�lido';
   STR_TiendaInactiva = 'La tienda %s est� inactiva.';
   STR_NoConfigGUID = 'No se ha encontrado configuraci�n para este TPV. ' +
      #13#10 + 'El identificador de TPV es %s' + #13#10 +
      'El C�digo de tienda: %s';

type
  TDMBaseDatos = class(TDataModule)
    database: TUniConnection;
    SQLMonitor: TUniSQLMonitor;
    procedure DMBaseDatosDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetConected: Boolean;
    procedure sustituyeNombresTablas(prefijo: string; Q: TUniQuery);
  public
    { Public declarations }
    procedure IniciaTransaccion;
    procedure CommitTransaccion;
    procedure RollBackTransaccion;

    procedure ConectarBD;
    procedure DesconectarBD;
    procedure ponPrefijo(DM: TComponent);

    property IsConectada: Boolean read GetConected;
  end;

var
  DMBaseDatos: TDMBaseDatos;

function CoCreateGuid (pGUID : TGUID) : longint; external 'OLE32.DLL';

implementation

uses DataMVariables, iGeneral;

{$R *.DFM}

procedure TDMBaseDatos.IniciaTransaccion;
begin
   if not Database.InTransaction then
      Database.StartTransaction;
end;

procedure TDMBaseDatos.CommitTransaccion;
begin
   if Database.InTransaction then
      Database.Commit;
end;

procedure TDMBaseDatos.RollBackTransaccion;
begin
   if Database.InTransaction then
      Database.Rollback;
end;

function TDMBaseDatos.GetConected: Boolean;
begin
   result := Database.Connected;
end;

procedure TDMBaseDatos.DesconectarBD;
begin
   Database.Close;
end;

procedure TDMBaseDatos.ConectarBD;
var
   proveedor, usuario, clave, servidor, puerto, esquema, opciones, Mensaje: String;
begin
   with DMBaseDatos do
   begin
      try
         proveedor := DMVariables.DameVariable('_BASEDATOS.PROVEEDOR');
         servidor:= DMVariables.DameVariable('_BASEDATOS.SERVIDOR');
         usuario := DMVariables.DameVariable('_BASEDATOS.USUARIO');
         clave := DMVariables.DameVariable('_BASEDATOS.CLAVE');
         puerto := DMVariables.DameVariable('_BASEDATOS.PUERTO');
         esquema := DMVariables.DameVariable('_BASEDATOS.ESQUEMA');
         opciones := DMVariables.DameVariable('_BASEDATOS.OPCIONES');

         Database.ProviderName := proveedor;
         database.Server := servidor;
         database.Username := usuario;
         database.Password := clave;
         if puerto = '' then
            puerto := '0';
         database.Port := StrToInt(puerto);
         database.Database := esquema;
         if opciones <> '' then         
            database.SpecificOptions.Text := opciones;

         Database.Connect;

         SQLMonitor.Active := (DMVariables.DameVariable('_DESARROLLO.MONITORSQL', '') = 'S');         

         ponPrefijo(Self);
      except
         on E: Exception do
         begin

            Mensaje := E.Message;

            TPVMessageDlg(STR_ErrorAlConectarBaseDatos+#13+#10+Mensaje, mtError, [mbOK], 0);
            Abort;
         end;
      end;
   end;
end;

function dameSesion: TUniConnection;
begin
   result := DMBaseDatos.Database;
end;

procedure TDMBaseDatos.DMBaseDatosDestroy(Sender: TObject);
begin
   Database.Connected := False;
   Database.Close;

   Session.Active := False;
end;

procedure TDMBaseDatos.ponPrefijo(DM: TComponent);
var
  prefijo: string;
  i: integer;
begin
   prefijo := DMVariables.DameVariable('_BASEDATOS.ESQUEMA');
   with DM do
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if (Components[i] is TUniQuery) then
         begin
            TUniQuery(Components[i]).Connection := Database;
            sustituyeNombresTablas(prefijo, TUniQuery(Components[i]))
         end
         else
         if (Components[i] is TUniMetaData) then
            TUniMetaData(Components[i]).Connection := Database;
      end;
   end;
end;

procedure TDMBaseDatos.sustituyeNombresTablas(prefijo: string; Q: TUniQuery);
begin
   Q.Sql.Text := iAtRepl('?', Q.Sql.Text, prefijo);
end;

end.
