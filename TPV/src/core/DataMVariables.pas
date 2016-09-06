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

unit DataMVariables;

interface

uses
  Forms, SysUtils, Classes, xmldom, XMLIntf, msxmldom,
  XMLDoc, JvJCLUtils, uMensajeDialog, Dialogs, DB, Uni, DBAccess, MemDS,
  Registry, windows;

const
   RaizClaveRegistro = '\SOFTWARE\Comerzzia\';

resourcestring
   STR_SeHaPedidoVariable = 'Se ha pedido la variable %s antes de conectar.';


type
  TDMVariables = class(TDataModule)
    XMLAplicacion: TXMLDocument;
    Q_VALOR_VARIABLE: TUniQuery;
    Q_DEFINICION_VARIABLE: TUniQuery;
  private
    { Private declarations }
    FAplicacion: String;
    FCodigoTienda: String;
    FCodigoAlmacen: String;
    FCodigoCaja: String;
    FUsuarioIDU: Integer;
    FCodigoUsuario: String;
    FClaveUsuario: String;
    FNombreUsuario: String;

    function GetUID_TPV: String;
    function GetClaveRegistro: String;
  public
    { Public declarations }
    procedure CargaConfiguracionAplicacion;
    function DameVariable(Variable: String): String; overload;
    function DameVariable(Variable: String; ValorPorDefecto: String): String; overload;

    property Aplicacion: String read FAplicacion write FAplicacion;
    property ClaveRegistro: String read GetClaveRegistro;
    property CodigoTienda: String read FCodigoTienda write FCodigoTienda;
    property CodigoAlmacen: String read FCodigoAlmacen write FCodigoAlmacen;
    property CodigoCaja: String read FCodigoCaja write FCodigoCaja;
    property UsuarioIDU: Integer read FUsuarioIDU write FUsuarioIDU;
    property CodigoUsuario: String read FCodigoUsuario write FCodigoUsuario;
    property ClaveUsuario: String read FClaveUsuario write FClaveUsuario;
    property NombreUsuario: String read FNombreUsuario write FNombreUsuario;
    property UIDTPV: String read GetUID_TPV;
  end;

var
  DMVariables: TDMVariables;

implementation

uses DataMBaseDatos, DataMCore, StrUtils;

{$R *.dfm}

function TDMVariables.DameVariable(Variable: String): String;
var
   Busqueda, Valor: String;
   ErrorSiNoExiste : Boolean;
begin
   ErrorSiNoExiste := True;

   if Copy(Variable, 1, 1) = '_' then
   begin
      Variable := Copy(Variable, 2, 255);
      ErrorSiNoExiste := False;
      Busqueda := Variable;
      Valor := DMCore.Aplicacion.Parametros.DameValorParametro(Busqueda);
   end
   else
      Valor := DMCore.Aplicacion.Parametros.DameValorParametro(Variable);

   // LA VARIABLE NO ESTA REGISTRADA, INTENTAR CARGARLA DE B.D.
   if (Valor = '^') then
      Valor := ''
   else if (Valor = '') and (ErrorSiNoExiste) then
   begin
      if DMBaseDatos = nil then
      begin
         TPVMessageDlg(Format(STR_SeHaPedidoVariable, [variable]),
                    mtWarning, [mbOK], 0);
         Exit;
      end;

      with DMBaseDatos do
      begin
         Q_VALOR_VARIABLE.ParamByName('ID_VARIABLE').AsString := Variable;
         Q_VALOR_VARIABLE.Open;

         if not (Q_VALOR_VARIABLE.IsEmpty) then
            Valor := Q_VALOR_VARIABLE.FieldByName('VALOR').AsString
         else
         begin
            Q_DEFINICION_VARIABLE.ParamByName('ID_VARIABLE').AsString := Variable;
            Q_DEFINICION_VARIABLE.Open;
            if not Q_DEFINICION_VARIABLE.IsEmpty then
               Valor := Q_DEFINICION_VARIABLE.FieldByName('VALOR_DEFECTO').AsString
            else
               Valor := '';
            Q_DEFINICION_VARIABLE.Close;
         end;
         Q_VALOR_VARIABLE.Close;

         if Valor = ''  then
            DMCore.Aplicacion.Parametros.NuevoParametro(Variable, '^', False)
         else DMCore.Aplicacion.Parametros.NuevoParametro(Variable, Valor, False);
      end;
   end;
{
   if Valor = '' then
   begin
      // TEMPORAL, HAY QUE CONTROLAR LA CARGA DE VARIABLES
      if ErrorSiNoExiste then
      begin
         TPVMessageDlg('La variable ' + Variable + ' no se ha definido o no tiene valor por defecto', mtError, [mbOK], 0);
         Application.ShowMainForm := False;
         Application.Terminate;
      end
      else Valor := '';
   end;
}

   Result := Valor;
end;

procedure TDMVariables.CargaConfiguracionAplicacion;
var
   Conf: String;
begin
   Conf := '';

   // Carga el fichero de configuracion de la aplicacion
   if Pos('.XML', UpperCase(ParamStr(1))) > 0 then
      Conf := ParamStr(1);

   if Conf = '' then
      Conf := ExtractFilePath(Application.ExeName) + AnsiReplaceStr(ExtractFileName(Application.ExeName), '.exe', '.xml');

   // Ver si exise <PARAMETRO>.XML
   if (Conf = '') and (ParamStr(1) <> '') then
   begin
      if FileExists(ExtractFilePath(Application.ExeName) + ParamStr(1) + '.XML') then
         Conf := ParamStr(1) + '.XML';
   end;

   if Conf = '' then
   begin
      TPVMessageDlg('No se ha especificado aplicación', mtError, [mbOK], 0);
      Abort;
   end;

   if not FileExists(Conf) then
   begin
      TPVMessageDlg(Format('No existe el fichero de configuración: %s', [Conf]), mtError, [mbOK], 0);
      Abort;
   end;

   XMLAplicacion.Active := False;

   try
      XMLAplicacion.LoadFromFile( Conf );

      XMLAplicacion.Active := True;
   except
      on e: Exception do
         Raise Exception.CreateFmt('Error cargando fichero de configuración %s. Mensaje: %s', [Conf, E.Message]);
   end;

   if not XMLAplicacion.Active then Abort;

   DMCore.Aplicacion.Parametros.CargaParametrosXML( XMLAplicacion, nil, True );

   XMLAplicacion.Active := False;

   if DMCore.Aplicacion.Parametros.DameValorParametro('USUARIO.APLICACION') = '' then
   begin
      if Pos('.XML', UpperCase(ParamStr(1))) = 0 then
         DMCore.Aplicacion.Parametros.NuevoParametro('USUARIO.APLICACION', ParamStr(1), True);
   end;

   FAplicacion := DMCore.Aplicacion.Parametros.DameValorParametro('USUARIO.APLICACION');

   // RUTA BASE DE LA APLICACION
   DMCore.Aplicacion.RutaBase := ExtractFilePath(Application.ExeName) + 'Aplica\';
end;

function TDMVariables.DameVariable(Variable: String; ValorPorDefecto: String): String;
begin
   result := DameVariable(Variable);
   if result = '' then
      result := ValorPorDefecto;
end;

function TDMVariables.GetClaveRegistro;
begin
   result := RaizClaveRegistro;
end;

function TDMVariables.GetUID_TPV: String;
var
   GUID: TGUID;
   sGUID: String;

   function leeGUIDRegistro : String;
   begin
      result := '';
      with TRegistry.Create do
      try
         RootKey := HKEY_CURRENT_USER;
         if OpenKey(DMVariables.ClaveRegistro + 'ID_TPV', False) then
            result := ReadString('ID');
         CloseKey;
      finally
         free;
      end;
   end;

   procedure grabaGUIDRegistro(ID: String);
   begin
      with TRegistry.Create do
      try
         RootKey   := HKEY_CURRENT_USER;
         if OpenKey(DMVariables.ClaveRegistro + 'ID_TPV', True) then
            WriteString('ID', ID);
         CloseKey;
      finally
         free;
      end;
   end;
begin
   //Control del GUID//
   sGUID := leeGUIDRegistro;
   if sGUID = '' then
   begin
      CreateGUID(GUID);
      sGUID := GuidToString(GUID);
      grabaGUIDRegistro(sGUID);
   end;
   result := sGUID;
end;


end.
