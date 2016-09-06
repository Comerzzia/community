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

unit DataMCore;

interface

uses
  Forms, SysUtils, Classes, Controls, JvJCLUtils, uMensajeDialog, Dialogs, DataMVariables, DataMBaseDatos,
  ClasesAplica, ClasesParametros, DataMMenu, DataMTienda, registry, windows, DataMImpuestos, DataMContadores,
  DB, Uni, DBAccess, MemDS, FormListaUsuarios, DataMConfiguracionDispositivos, uEspera, uDispositivos,
  AppEvnts, uOPOS;

resourcestring
   STR_ConfiguracionTiendaNoEncontrada = 'No se ha encontrado configuración de tienda para el TPV. Proceda a su configuración.';
   STR_CodigoTiendaNoConfigurado = 'El TPV no esta asociado a ninguna tienda. Proceda a su configuración';
   STR_CodigoCajaNoConfigurado = 'El TPV no tiene asociado ninguna caja. Proceda a su configuración';
   STR_TiendaInactiva = 'La tienda está inactiva. Debe establecer una tienda activa para poder usar el TPV';
   STR_DispositivosNoConfigurados = 'No se ha encontrado configuración de dispositivos. Proceda a su configuración.';

type
  TDMCore = class(TDataModule)
    MetaDatos: TUniMetaData;
    Q_EXISTE_VARIABLE: TUniQuery;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FAplicacion: TMpsAplicacion;
    FDispositivos: TDispositivos;

    function CheckConfiguracionTienda: Integer;
    procedure LLamarConfiguracion;
    procedure VerificaIntegridadEsquema;
  public
    { Public declarations }
    function IniciaAplicacion: Boolean;
    procedure InicializaCore;
    procedure InicioCheckConfiguracion;    
    procedure InicioSeleccionUsuario;
    procedure IniciarDispositivos;
    procedure RefrescaPanelesEstadoCargador;

    function DameRutaRecurso(Recurso: String): String;
    function DameFuncion(Dll: String; NombreFuncion: String): Pointer;
    procedure SeleccionUsuario;

    property Aplicacion: TMpsAplicacion read FAplicacion;
    property Dispositivos: TDispositivos read FDispositivos;
  end;

var
  DMCore: TDMCore;

function CoCreateGuid (pGUID : TGUID) : longint; external 'OLE32.DLL';

implementation
uses
   FormConfiguracion, DataMUsuarios;

{$R *.dfm}

procedure TDMCore.DataModuleCreate(Sender: TObject);
begin
   FAplicacion := TMpsAplicacion.Create;
   DMBaseDatos := TDMBaseDatos.Create(Self);
   DMVariables := TDMVariables.Create(Self);
   FDispositivos := TDispositivos.Create;
end;

procedure TDMCore.DataModuleDestroy(Sender: TObject);
begin
   try
      FDispositivos.Visor.Pintar('','');
      FDispositivos.Visor.Desconecta;
      FDispositivos.Impresora.Desconecta;
      FDispositivos.Tarjeta.Desconecta;
      FDispositivos.Cajon.Desconecta;
   except
   end;

   Aplicacion.Free;
   FDispositivos.Free;

   if DMBaseDatos <> nil then
      DMBaseDatos.Free;
   if DMVariables <> nil then
      DMVariables.Free;
   if DMMenu <> nil then
      DMMenu.Free;
   if DMImpuestos <> nil then
      DMImpuestos.Free;
   if DMContador <> nil then
      DMContador.Free;
   if DMUsuarios <> nil then
      DMUsuarios.Free;
end;

function TDMCore.IniciaAplicacion: Boolean;
begin
   //Iniciar la aplicacion
   DMVariables.CargaConfiguracionAplicacion;
   Result := True;
end;

function TDMCore.DameRutaRecurso(Recurso: string): String;
begin
   Result := Aplicacion.Recursos.DameRutaRecurso(recurso);
end;

function TDMCore.DameFuncion(Dll: String; NombreFuncion: String): Pointer;
begin
   result := Aplicacion.ControlDLLs.DameFuncion(Dll, NombreFuncion);
end;

procedure TDMCore.InicializaCore;
begin
   //Inicializar Core
   DMBaseDatos.ponPrefijo(DMCore);
   //Inicializar variables
   DMBaseDatos.ponPrefijo(DMVariables);

   //verificar integridad esquema
   VerificaIntegridadEsquema;

   //Inicializar menu
   DMMenu := TDMMenu.Create(Self);
   DMBaseDatos.ponPrefijo(DMMenu);

   //Inicializar y cargar los impuestos
   DMImpuestos := TDMImpuestos.Create(Self);
   DMBaseDatos.ponPrefijo(DMImpuestos);
   DMImpuestos.InicioCargarImpuestos;

   //Inicializar los contadores
   DMContador := TDMContador.Create(Self);
   DMBaseDatos.ponPrefijo(DMContador);

   //Inicializar los usuarios
   DMUsuarios := TDMUsuarios.Create(Self);
   DMBaseDatos.ponPrefijo(DMUsuarios);
end;

procedure TDMCore.InicioSeleccionUsuario;
begin
   FrmListaUsuarios := TFrmListaUsuarios.Create(Self);
   try
      FrmListaUsuarios.CargaListaUsuarios;
      FrmListaUsuarios.ShowModal;
      if FrmListaUsuarios.ModalResult <> mrOk then
      begin
         Application.Terminate;
         Abort;
      end
      else
      begin
         DMVariables.CodigoUsuario := FrmListaUsuarios.Usuario;
         DMVariables.ClaveUsuario := FrmListaUsuarios.Clave;
         DMVariables.NombreUsuario := FrmListaUsuarios.Nombre;
         DMVariables.UsuarioIDU := DMUsuarios.DameIDU(DMVariables.CodigoUsuario);
      end;
   finally
      FrmListaUsuarios.Free;
   end;
end;

procedure TDMCore.InicioCheckConfiguracion;
var
   r: Integer;
begin
   while True do
   begin
      r := CheckConfiguracionTienda;
      case r of
         0: Break;
         1: begin
            TPVMessageDlg(STR_ConfiguracionTiendaNoEncontrada, mtInformation, [mbOk], 0);
         end;
         2: begin
            TPVMessageDlg(STR_CodigoTiendaNoConfigurado, mtInformation, [mbOk], 0);
         end;
         3: begin
            TPVMessageDlg(STR_CodigoCajaNoConfigurado, mtInformation, [mbOk], 0);
         end;
         4: begin
            TPVMessageDlg(STR_TiendaInactiva, mtInformation, [mbOk], 0);
         end;
         5: begin
            TPVMessageDlg(STR_DispositivosNoConfigurados, mtInformation, [mbOk], 0);
         end;
      end;
      LlamarConfiguracion;
   end;
   RefrescaPanelesEstadoCargador;
end;

procedure TDMCore.RefrescaPanelesEstadoCargador;
var
   ModH: HMODULE;
   ProcRefrescaPaneles : procedure(); stdcall;
begin
   ModH := GetModuleHandle(PChar(ExtractFileName(Application.ExeName)));

   if ModH = 0 then
      Raise Exception.Create('No se ha encontrado el cargador de TPV');

   ProcRefrescaPaneles := GetProcAddress(ModH, 'RefrescaPanelesEstado');
   ProcRefrescaPaneles();
end;


//Comprueba el estado de la configuracion de la tienda
//0 Todo Ok
//1 No se ha encontrado configuracion del TPV/Tienda/Caja
//2 No se ha encontrado configuracion del TPV/Tienda
//3 No se ha encontrado configuracion del TPV/Caja
//4 Tienda inactiva
//5 Dispositivos no configurados
function TDMCore.CheckConfiguracionTienda: Integer;
var
   InfoTienda: TInfoTienda;
   Config: TConfiguracionDispositivo;
   sGUID: String;
begin
   sGUID := DMVariables.UIDTPV;

   InfoTienda := TInfoTienda.Create(nil, sGUID);
   try
      if InfoTienda.UID_TPV = '' then
         result := 1
      else if InfoTienda.Codalm = '' then
         result := 2
      else if InfoTienda.CodCaja = '' then
         result := 3
      else if not InfoTienda.Activo then
         result := 4
      else
      begin
         try
            try
               Config := TConfiguracionDispositivo.Create(nil, sGUID);
               if Config.XMLConfiguracion.IsEmptyDoc then
                  result := 6
               else
               begin
                  //Si todo esta bien establecer las variables de tienda/almacen y caja
                  DMVariables.CodigoTienda := InfoTienda.Codalm;
                  DMVariables.CodigoAlmacen := InfoTienda.Codalm;
                  DMVariables.CodigoCaja := InfoTienda.CodCaja;
                  result := 0;
               end;
            except
               result := 6;
            end;
         finally
            Config.Free;
         end;
      end
   finally
      InfoTienda.Free;
   end;
end;

procedure TDMCore.LLamarConfiguracion;
begin
   //Aqui no se llama al metodo de clase Crea, necesitamos control
   //del modalresult
   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);
   PonEspera(STR_Iniciando, False);
   try
      FrmConfiguracion := TFrmConfiguracion.Create( Application );
      try
         FrmConfiguracion.Caption := 'Configuración';
//         FrmConfiguracion.Accion := TFrmConfiguracion.ClassName;
         FrmConfiguracion.Inicializa;
         FinEspera;
         FrmConfiguracion.ShowModal;
         if FrmConfiguracion.ModalResult = mrCancel then
         begin
            Application.Terminate;
            Abort;
         end;
      finally
         FrmConfiguracion.Free;
      end;
   finally
      FinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TDMCore.IniciarDispositivos;
var
   Config: TConfiguracionDispositivo;
begin
   Config := TConfiguracionDispositivo.Create(nil, DMVariables.UIDTPV);
   try
      FDispositivos.CargarConfiguracion(Config.XMLConfiguracion);
      FDispositivos.Visor.Conecta;
      FDispositivos.Impresora.Conecta;
      FDispositivos.Cajon.Conecta;
      FDispositivos.Tarjeta.Conecta;
   finally
      Config.Free;
   end;
end;

procedure TDMCore.SeleccionUsuario;
begin
   FrmListaUsuarios := TFrmListaUsuarios.Create(Self);
   try
      FrmListaUsuarios.CargaListaUsuarios;
      FrmListaUsuarios.ShowModal;
      if FrmListaUsuarios.ModalResult = mrOk then
      begin
         DMVariables.CodigoUsuario := FrmListaUsuarios.Usuario;
         DMVariables.ClaveUsuario := FrmListaUsuarios.Clave;
         DMVariables.NombreUsuario := FrmListaUsuarios.Nombre;
         DMVariables.UsuarioIDU := DMUsuarios.DameIDU(DMVariables.CodigoUsuario);
      end;
   finally
      FrmListaUsuarios.Free;
   end;
end;

procedure TDMCore.VerificaIntegridadEsquema;
begin
   // PASO 1, VERIFICAR EXISTENCIA DE CONFIG_VARIABLES_DEF_TBL
   try
      MetaDatos.MetaDataKind := 'Tables';
      MetaDatos.Restrictions.Values['TABLE_NAME'] := 'config_variables_def_tbl';
      MetaDatos.Open;

      if MetaDatos.RecordCount = 0 then
         Raise Exception.Create('El esquema de base de datos de la aplicación esta vacio. Consulte con el administrador');
   finally
      MetaDatos.Close;
   end;

   // PASO 2, VERIFICAR EXISTENCIA DE LA VARIABLE TPV.VERSION
   Q_EXISTE_VARIABLE.Open;
   try
      if Q_EXISTE_VARIABLE.FieldByName('ID_VARIABLE').AsString = '' then
         Raise Exception.Create('El esquema de base de datos de la aplicación no ha sido configurado o no se ha creado correctamente. Consulte con el administrador');
   finally
      Q_EXISTE_VARIABLE.Close;
   end;
end;

end.
