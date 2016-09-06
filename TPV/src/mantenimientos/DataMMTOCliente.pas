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

unit DataMMTOCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataMBase, DB, Uni, DBAccess, MemDS, DataMMTOCodigoBarras, JvJCLUtils;

type
  { Forward declarations }
  TDMCliente = class;

  TCliente = class(TDBDataObject)
  private
     FDescli: String;
     FNombre_comercial: String;
     FDomicilio: String;
     FPoblacion: String;
     FProvincia: String;
     FCp: String;
     FTelefono1: String;
     FTelefono2: String;
     FFax: String;
     FPersona_contacto: String;
     FEmail: String;
     FCif: String;
     FId_trat_impuestos: Integer;
     FCodmedpag: String;
     FCodtar: String;
     FObservaciones: String;
     FActivo: Boolean;
     FFecha_alta: TDateTime;
     FFecha_baja: TDateTime;
     FVentaACredito: Boolean;
  public
     property Descli: String read FDescli write FDescli;
     property Nombre_comercial: String read FNombre_comercial write FNombre_comercial;
     property Domicilio: String read FDomicilio write FDomicilio;
     property Poblacion: String read FPoblacion write FPoblacion;
     property Provincia: String read FProvincia write FProvincia;
     property Cp: String read FCp write FCp;
     property Telefono1: String read FTelefono1 write FTelefono1;
     property Telefono2: String read FTelefono2 write FTelefono2;
     property Fax: String read FFax write FFax;
     property Persona_contacto: String read FPersona_contacto write FPersona_contacto;
     property Email: String read FEmail write FEmail;
     property Cif: String read FCif write FCif;
     property Id_trat_impuestos: Integer read FId_trat_impuestos write FId_trat_impuestos;
     property Codmedpag: String read FCodmedpag write FCodmedpag;
     property Codtar: String read FCodtar write FCodtar;
     property Observaciones: String read FObservaciones write FObservaciones;
     property Activo: Boolean read FActivo write FActivo;
     property Fecha_alta: TDateTime read FFecha_alta write FFecha_alta;
     property Fecha_baja: TDateTime read FFecha_baja write FFecha_baja;
     property VentaACredito: Boolean read FVentaACredito write FVentaACredito;

     constructor Create(DataModule: TDMCliente);
     destructor Destroy; override;

     procedure BD_Cargar(cif: string);
     procedure Assign(cliente: TCliente);
     procedure BD_Actualizar;
     procedure BD_Insertar;
     procedure BD_Eliminar;
  end;

  TDMCliente = class(TDMBase)
    Q_CLIENTE: TUniQuery;
    CONSULTA_TPV: TUniQuery;
    Q_INSERTA_CLIENTE: TUniQuery;
    Q_ELIMINA_CLIENTE: TUniQuery;
    Q_MODIFICA_CLIENTE: TUniQuery;
    CONSULTACIF: TStringField;
    CONSULTADESCLI: TStringField;
    CONSULTANOMBRE_COMERCIAL: TStringField;
    CONSULTAPROVINCIA: TStringField;
    CONSULTACP: TStringField;
    CONSULTATELEFONO1: TStringField;
    CONSULTAPERSONA_CONTACTO: TStringField;
  private
    { Private declarations }
    FCONSULTA_TPV_SQL_MACRO: String;
  public
    { Public declarations }
    function GetConsultaTPV: TDataSet;
    procedure AbrirConsultaTPV(condicion: String);
    procedure CerrarConsultaTPV;

    constructor Create(AOwner: TComponent); override;
  end;

var
  DMCliente: TDMCliente;

implementation

{$R *.dfm}

uses iGeneral, DataMVariables, StrUtils;

(*******************************************************************************
*   Clase TDMCliente                                                       *
*******************************************************************************)
   constructor TDMCliente.Create(AOwner: TComponent);
   begin
      inherited Create(AOwner);

      FCONSULTA_TPV_SQL_MACRO := CONSULTA_TPV.SQL.Text;
   end;

   function TDMCliente.GetConsultaTPV: TDataSet;
   begin
      result := TDataSet(CONSULTA_TPV);
   end;

   procedure TDMCliente.AbrirConsultaTPV(condicion: String);
   begin
      CerrarConsultaTPV;
      CONSULTA_TPV.SQL.Text := FCONSULTA_TPV_SQL_MACRO;
      if condicion <> '' then
         CONSULTA_TPV.SQL.Text := AnsiReplaceStr(CONSULTA_TPV.SQL.Text, '%CONDICION%', condicion)
      else
         CONSULTA_TPV.SQL.Text := AnsiReplaceStr(CONSULTA_TPV.SQL.Text, '%CONDICION%', ' 1=1');
      CONSULTA_TPV.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;         
      CONSULTA_TPV.Open;
   end;

   procedure TDMCliente.CerrarConsultaTPV;
   begin
      CONSULTA.Close;
   end;

(*******************************************************************************
*   Clase TCliente                                                            *
*******************************************************************************)
   constructor TCliente.Create(DataModule: TDMCliente);
   begin
      //Si el acceso a datos no viene preestablecido crea uno
      if DataModule = nil then
      begin
         FDataModule := TDMCliente.Create(nil);
         FDataModuleInterno := True;
      end
      else
      begin
         FDataModule := DataModule;
         FDataModuleInterno := False;
      end;
   end;

   destructor TCliente.Destroy;
   begin
      inherited Destroy;
   end;

   procedure TCliente.BD_Cargar(cif: string);
   begin
      with TDMCliente(FDataModule).Q_Cliente do
      begin
         Close;
         ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         ParamByName('CIF').AsString := cif;
         Open;
         if not IsEmpty then
         begin
            Self.Descli := FieldByName('DESCLI').AsString;
            Self.Nombre_comercial := FieldByName('NOMBRE_COMERCIAL').AsString;
            Self.Domicilio := FieldByName('DOMICILIO').AsString;
            Self.Poblacion := FieldByName('POBLACION').AsString;
            Self.Provincia := FieldByName('PROVINCIA').AsString;
            Self.Cp := FieldByName('CP').AsString;
            Self.Telefono1 := FieldByName('TELEFONO1').AsString;
            Self.Telefono2 := FieldByName('TELEFONO2').AsString;
            Self.Fax := FieldByName('FAX').AsString;
            Self.Persona_contacto := FieldByName('PERSONA_CONTACTO').AsString;
            Self.Email := FieldByName('EMAIL').AsString;
            Self.Cif := FieldByName('CIF').AsString;
            Self.Id_Trat_impuestos := FieldByName('ID_TRAT_IMPUESTOS').AsInteger;
            Self.Codmedpag := FieldByName('CODMEDPAG').AsString;
            Self.Codtar := FieldByName('CODTAR').AsString;
            Self.Observaciones := FieldByName('OBSERVACIONES').AsString;
            Self.Activo := iif(FieldByName('ACTIVO').AsString = 'S', True, False);
            Self.Fecha_alta := FieldByName('FECHA_ALTA').AsDateTime;
            Self.Fecha_baja := FieldByName('FECHA_BAJA').AsDateTime;
            Self.VentaACredito := iif(FieldByName('VENTA_A_CREDITO').AsString = 'S', True, False);
         end;
         Close;
      end;
   end;

   procedure TCliente.Assign(cliente: TCliente);
   begin
      Self.Descli := cliente.Descli;
      Self.Nombre_comercial := cliente.Nombre_comercial;
      Self.Domicilio := cliente.Domicilio;
      Self.Poblacion := cliente.Poblacion;
      Self.Provincia := cliente.Provincia;
      Self.Cp := cliente.Cp;
      Self.Telefono1 := cliente.Telefono1;
      Self.Telefono2 := cliente.Telefono2;
      Self.Fax := cliente.Fax;
      Self.Persona_contacto := cliente.Persona_contacto;
      Self.Email := cliente.Email;
      Self.Cif := cliente.Cif;
      Self.Id_Trat_impuestos := cliente.Id_trat_impuestos;
      Self.Codmedpag := cliente.Codmedpag;
      Self.Codtar := cliente.Codtar;
      Self.Observaciones := cliente.Observaciones;
      Self.Activo := cliente.Activo;
      Self.Fecha_alta := cliente.Fecha_alta;
      Self.Fecha_baja := cliente.Fecha_baja;
      Self.VentaACredito := cliente.VentaACredito;
   end;

   procedure TCliente.BD_Actualizar;
   begin
      with TDMCliente(FDataModule) do
      begin
         Q_MODIFICA_CLIENTE.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         Q_MODIFICA_CLIENTE.ParamByName('DESCLI').AsString := FDescli;
         Q_MODIFICA_CLIENTE.ParamByName('NOMBRE_COMERCIAL').AsString := FNombre_comercial;
         Q_MODIFICA_CLIENTE.ParamByName('DOMICILIO').AsString := FDomicilio;
         Q_MODIFICA_CLIENTE.ParamByName('POBLACION').AsString := FPoblacion;
         Q_MODIFICA_CLIENTE.ParamByName('PROVINCIA').AsString := FProvincia;
         Q_MODIFICA_CLIENTE.ParamByName('CP').AsString := FCp;
         Q_MODIFICA_CLIENTE.ParamByName('TELEFONO1').AsString := FTelefono1;
         Q_MODIFICA_CLIENTE.ParamByName('TELEFONO2').AsString := FTelefono2;
         Q_MODIFICA_CLIENTE.ParamByName('FAX').AsString := FFax;
         Q_MODIFICA_CLIENTE.ParamByName('PERSONA_CONTACTO').AsString := FPersona_contacto;
         Q_MODIFICA_CLIENTE.ParamByName('EMAIL').AsString := FEmail;
         Q_MODIFICA_CLIENTE.ParamByName('ID_TRAT_IMPUESTOS').AsInteger := FId_trat_impuestos;
         Q_MODIFICA_CLIENTE.ParamByName('CODMEDPAG').AsString := FCodmedpag;
         Q_MODIFICA_CLIENTE.ParamByName('CODTAR').AsString := FCodtar;
         Q_MODIFICA_CLIENTE.ParamByName('OBSERVACIONES').AsString := FObservaciones;
         Q_MODIFICA_CLIENTE.ParamByName('ACTIVO').AsString := iif(FActivo, 'S', 'N');
         if Fecha_baja <> 0 then
            Q_MODIFICA_CLIENTE.ParamByName('FECHA_BAJA').AsDateTime := FFecha_baja
         else
            Q_MODIFICA_CLIENTE.ParamByName('FECHA_BAJA').Clear;
         Q_MODIFICA_CLIENTE.ParamByName('CIF').AsString := FCif;
         Q_MODIFICA_CLIENTE.ParamByName('VENTA_A_CREDITO').AsString := iif(FVentaACredito, 'S', 'N');
         Q_MODIFICA_CLIENTE.Execute;
      end;
      Self.BD_Cargar(Self.FCif);
   end;

   procedure TCliente.BD_Insertar;
   begin
      with TDMCliente(FDataModule) do
      begin
         Q_INSERTA_CLIENTE.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         Q_INSERTA_CLIENTE.ParamByName('CIF').AsString := FCif;
         Q_INSERTA_CLIENTE.ParamByName('DESCLI').AsString := FDescli;
         Q_INSERTA_CLIENTE.ParamByName('NOMBRE_COMERCIAL').AsString := FNombre_comercial;
         Q_INSERTA_CLIENTE.ParamByName('DOMICILIO').AsString := FDomicilio;
         Q_INSERTA_CLIENTE.ParamByName('POBLACION').AsString := FPoblacion;
         Q_INSERTA_CLIENTE.ParamByName('PROVINCIA').AsString := FProvincia;
         Q_INSERTA_CLIENTE.ParamByName('CP').AsString := FCp;
         Q_INSERTA_CLIENTE.ParamByName('TELEFONO1').AsString := FTelefono1;
         Q_INSERTA_CLIENTE.ParamByName('TELEFONO2').AsString := FTelefono2;
         Q_INSERTA_CLIENTE.ParamByName('FAX').AsString := FFax;
         Q_INSERTA_CLIENTE.ParamByName('PERSONA_CONTACTO').AsString := FPersona_contacto;
         Q_INSERTA_CLIENTE.ParamByName('EMAIL').AsString := FEmail;
         Q_INSERTA_CLIENTE.ParamByName('ID_TRAT_IMPUESTOS').AsInteger := FId_trat_impuestos;
         Q_INSERTA_CLIENTE.ParamByName('CODMEDPAG').AsString := FCodmedpag;
         Q_INSERTA_CLIENTE.ParamByName('CODTAR').AsString := FCodtar;
         Q_INSERTA_CLIENTE.ParamByName('OBSERVACIONES').AsString := FObservaciones;
         Q_INSERTA_CLIENTE.ParamByName('ACTIVO').AsString := iif(FActivo, 'S', 'N');;
         Q_INSERTA_CLIENTE.ParamByName('FECHA_ALTA').AsDateTime := FFecha_alta;
         if FFecha_baja <> 0 then
            Q_INSERTA_CLIENTE.ParamByName('FECHA_BAJA').AsDateTime := FFecha_baja
         else
            Q_INSERTA_CLIENTE.ParamByName('FECHA_BAJA').Clear;
         Q_INSERTA_CLIENTE.ParamByName('VENTA_A_CREDITO').AsString := iif(FVentaACredito, 'S', 'N');
         Q_INSERTA_CLIENTE.Execute;
      end;
      Self.BD_Cargar(Self.FCif);      
   end;

   procedure TCliente.BD_Eliminar;
   begin
      with TDMCliente(FDataModule).Q_ELIMINA_CLIENTE do
      begin
         ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         ParamByName('CIF').AsSTring := Cif;
         Execute;
      end;
      Self.BD_Cargar(Self.Cif);
   end;

end.
