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

unit DataMTienda;

interface

uses
  SysUtils, Classes, DB, Uni, DBAccess, MemDS, DataMVariables, DataMBaseDatos, DataMBase;

type
  TDMTienda = class(TDMBase)
    Q_DATOS_TIENDA: TUniQuery;
    Q_INSERTA_TIENDA: TUniQuery;
    Q_MODIFICA_TIENDA: TUniQuery;
    Q_EXISTE_TIENDA: TUniQuery;
    Q_TIENDAS_CAJA: TUniQuery;
    CAMBIAR_TIENDA_CAJA_ACTIVA: TUniQuery;
    Q_UID_TPV: TUniQuery;
    Q_LISTA_TIENDAS: TUniQuery;
    QUITAR_TIENDA_CAJA: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function DameUID_TPV(CodigoTienda: String; CodigoCaja: String): String;
    function GetDataSetListaTiendas: TDataSet;
  end;

type
  TInfoTienda = class(TDBDataObject)
  private
    FUID_TPV: String;
    FCodalm: String;
    FCodcaja: String;
    FDesalm: String;
    FNombre_comercial: String;
    FDomicilio: String;
    FPoblacion: String;
    FProvincia: String;
    FCp: String;
    FTelefono1: String;
    FTelefono2: String;
    FFax: String;
    FCif: String;
    FPersona_contacto: String;
    FActivo: Boolean;
    FClientePorDefecto: String;

  published
    property UID_TPV: String read FUID_TPV;
    property CodCaja: String read FCodcaja write FCodcaja;
    property Codalm: String read FCodalm write FCodalm;
    property Desalm: String read FDesalm write FDesalm;
    property Nombre_comercial: String read FNombre_comercial write FNombre_comercial;
    property Domicilio: String read FDomicilio write FDomicilio;
    property Poblacion: String read FPoblacion write FPoblacion;
    property Provincia: String read FProvincia write FProvincia;
    property Cp: String read FCp write FCp;
    property Telefono1: String read FTelefono1 write FTelefono1;
    property Telefono2: String read FTelefono2 write FTelefono2;
    property Fax: String read FFax write FFax;
    property Cif: String read FCif write FCif;
    property Persona_contacto: String read FPersona_contacto write FPersona_contacto;
    property Activo: Boolean read FActivo write FActivo;
    property ClientePorDefecto: String read FClientePorDefecto write FClientePorDefecto;
  public
    procedure BD_Cargar(UID_TPV: String);
    procedure BD_Salvar;
    function BD_ExisteTienda: Boolean;
    procedure BD_CambiarConfiguracionTienda(NuevaTienda: string; NuevaCaja: string);

    constructor Create(DataModule: TDMTienda; UID_TPV: String);
    destructor Destroy; override;
  end;

//var
//  DMTienda: TDMTienda;

implementation
uses
   iGeneral;

{$R *.dfm}

(******************************************************************************)
(* TInfoTienda                                                               *)
(******************************************************************************)

  constructor TInfoTienda.Create(DataModule: TDMTienda; UID_TPV: String);
  begin
     //Si el acceso a datos no viene preestablecido crea uno
     if DataModule = nil then
     begin
        FDataModule := TDMTienda.Create(nil);
        FDataModuleInterno := True;
     end
     else
     begin
        FDataModule := DataModule;
        FDataModuleInterno := False;
     end;
     if UID_TPV = '' then
     begin
        raise Exception.Create('No se ha especificado identificador único de caja');
     end;
     BD_Cargar(UID_TPV);
  end;

  destructor TInfoTienda.Destroy;
  begin
     inherited Destroy;
  end;

  procedure TInfoTienda.BD_Cargar(UID_TPV: string);
  begin
     with TDMTienda(FDataModule) do
     begin
        Q_TIENDAS_CAJA.Close;
        Q_TIENDAS_CAJA.ParamByName('UID_TPV').AsString := UID_TPV;
        Q_TIENDAS_CAJA.Open;

        if not Q_TIENDAS_CAJA.IsEmpty then
        begin
           FUID_TPV := Q_TIENDAS_CAJA.FieldByName('UID_TPV').AsString;
           FCodalm := Q_TIENDAS_CAJA.FieldByName('CODALM').AsString;
           FCodcaja := Q_TIENDAS_CAJA.FieldByName('CODCAJA').AsString;

           Q_DATOS_TIENDA.Close;
           Q_DATOS_TIENDA.ParamByName('CODTIENDA').AsString := Self.FCodalm;
           Q_DATOS_TIENDA.Open;

           if not (Q_DATOS_TIENDA.Bof and Q_DATOS_TIENDA.Eof) then
           begin
              FDesalm := Q_DATOS_TIENDA.FieldByName('DESALM').AsString;
              FNombre_comercial := Q_DATOS_TIENDA.FieldByName('NOMBRE_COMERCIAL').AsString;
              FDomicilio := Q_DATOS_TIENDA.FieldByName('DOMICILIO').AsString;
              FPoblacion := Q_DATOS_TIENDA.FieldByName('POBLACION').AsString;
              FProvincia := Q_DATOS_TIENDA.FieldByName('PROVINCIA').AsString;
              FCp := Q_DATOS_TIENDA.FieldByName('CP').AsString;
              FTelefono1 := Q_DATOS_TIENDA.FieldByName('TELEFONO1').AsString;
              FTelefono2 := Q_DATOS_TIENDA.FieldByName('TELEFONO2').AsString;
              FFax := Q_DATOS_TIENDA.FieldByName('FAX').AsString;
              FCif := Q_DATOS_TIENDA.FieldByName('CIF').AsString;
              FPersona_contacto := Q_DATOS_TIENDA.FieldByName('PERSONA_CONTACTO').AsString;
              FActivo := iif(Q_DATOS_TIENDA.FieldByName('ACTIVO').AsString = 'S', True, False);
              FClientePorDefecto := Q_DATOS_TIENDA.FieldByName('CLIENTE_POR_DEFECTO').AsString;
           end;
        end
        else
        begin
           FUID_TPV := '';
           FCodalm := '';
           FCodcaja := '';
           FClientePorDefecto := '';
        end;
     end;
  end;

  procedure TInfoTienda.BD_Salvar;
  begin
     with TDMTienda(FDataModule) do
     begin
        Q_MODIFICA_TIENDA.ParamByName('CODALM').AsString := FCodalm;
        Q_MODIFICA_TIENDA.ParamByName('DESALM').AsString := FDesalm;
        Q_MODIFICA_TIENDA.ParamByName('NOMBRE_COMERCIAL').AsString := FNombre_comercial;
        Q_MODIFICA_TIENDA.ParamByName('DOMICILIO').AsString := FDomicilio;
        Q_MODIFICA_TIENDA.ParamByName('POBLACION').AsString := FPoblacion;
        Q_MODIFICA_TIENDA.ParamByName('PROVINCIA').AsString := FProvincia;
        Q_MODIFICA_TIENDA.ParamByName('CP').AsString := FCp;
        Q_MODIFICA_TIENDA.ParamByName('TELEFONO1').AsString := FTelefono1;
        Q_MODIFICA_TIENDA.ParamByName('TELEFONO2').AsString := FTelefono2;
        Q_MODIFICA_TIENDA.ParamByName('FAX').AsString := FFax;
        Q_MODIFICA_TIENDA.ParamByName('CIF').AsString := FCif;
        Q_MODIFICA_TIENDA.ParamByName('PERSONA_CONTACTO').AsString := FPersona_contacto;
        Q_MODIFICA_TIENDA.ParamByName('ACTIVO').AsString := iif(FActivo, 'S', 'N');
        Q_MODIFICA_TIENDA.Execute;
        if Q_MODIFICA_TIENDA.RowsAffected = 0 then
        begin
           raise Exception.Create('No se encontro la tienda ' + FDesalm);
//           Q_INSERTA_TIENDA.ParamByName('CODALM').Value := FCodalm;
//           Q_INSERTA_TIENDA.ParamByName('DESALM').Value := FDesalm;
//           Q_INSERTA_TIENDA.ParamByName('NOMBRE_COMERCIAL').Value := FNombre_comercial;
//           Q_INSERTA_TIENDA.ParamByName('DOMICILIO').Value := FDomicilio;
//           Q_INSERTA_TIENDA.ParamByName('POBLACION').Value := FPoblacion;
//           Q_INSERTA_TIENDA.ParamByName('PROVINCIA').Value := FProvincia;
//           Q_INSERTA_TIENDA.ParamByName('CP').Value := FCp;
//           Q_INSERTA_TIENDA.ParamByName('TELEFONO1').Value := FTelefono1;
//           Q_INSERTA_TIENDA.ParamByName('TELEFONO2').Value := FTelefono2;
//           Q_INSERTA_TIENDA.ParamByName('FAX').Value := FFax;
//           Q_INSERTA_TIENDA.ParamByName('CIF').Value := FCif;
//           Q_INSERTA_TIENDA.ParamByName('PERSONA_CONTACTO').Value := FPersona_contacto;
//           Q_INSERTA_TIENDA.ParamByName('ACTIVO').Value := iif(FActivo, 'S', 'N');
//           Q_INSERTA_TIENDA.ExecSQL;
        end;
     end;
  end;

  function TInfoTienda.BD_ExisteTienda: Boolean;
  begin
     with TDMTienda(FDataModule) do
     begin
        Q_EXISTE_TIENDA.Close;
        Q_EXISTE_TIENDA.ParamByName('CODALM').AsString := FCodalm;
        Q_EXISTE_TIENDA.Open;
        result := (Q_EXISTE_TIENDA.FieldByName('CONTADOR').AsInteger > 0);
     end;
  end;

  procedure TInfoTienda.BD_CambiarConfiguracionTienda(NuevaTienda: string; NuevaCaja: string);
  begin
     with TDMTienda(FDataModule) do
     begin
        //Actualizar a vacio los guid que tengan la misma configuracion de tienda / caja
        QUITAR_TIENDA_CAJA.ParamByName('CODALM').AsString := NuevaTienda;
        QUITAR_TIENDA_CAJA.ParamByName('CODCAJA').AsString := NuevaCaja;
        QUITAR_TIENDA_CAJA.Execute;

        //Establecer el codigo de caja y tienda al guid
        CAMBIAR_TIENDA_CAJA_ACTIVA.ParamByName('CODALM').AsString := NuevaTienda;
        CAMBIAR_TIENDA_CAJA_ACTIVA.ParamByName('CODCAJA').AsString := NuevaCaja;
        CAMBIAR_TIENDA_CAJA_ACTIVA.ParamByName('UID_TPV').AsString := FUID_TPV;
        CAMBIAR_TIENDA_CAJA_ACTIVA.Execute;
     end;
  end;


(******************************************************************************)
(* TDataMTienda                                                               *)
(******************************************************************************)
  function TDMTienda.DameUID_TPV(CodigoTienda: String; CodigoCaja: String): String;
  begin
     Q_UID_TPV.Close;
     Q_UID_TPV.ParamByName('CODALM').AsString := CodigoTienda;
     Q_UID_TPV.ParamByName('CODCAJA').AsString := CodigoCaja;
     Q_UID_TPV.Open;

     if not Q_UID_TPV.IsEmpty then
        result := Q_UID_TPV.FieldByName('UID_TPV').AsString
     else
        result := '';
  end;

  function TDMTienda.GetDataSetListaTiendas: TDataSet;
  begin
     Q_LISTA_TIENDAS.Close;
     Q_LISTA_TIENDAS.Open;
     result := Q_LISTA_TIENDAS;
  end;

end.


