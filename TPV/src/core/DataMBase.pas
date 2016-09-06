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

unit DataMBase;

interface

uses
  SysUtils, Classes, DB,JvJCLUtils, DataMBaseDatos, Uni, MemDS, DBAccess;

type
  { Forward declarations }
  TDMBase = class;

  TDBDataObject = class(TObject)
  private
    procedure SetDataModule(Value: TDMBase);
  public
    FDataModuleInterno: Boolean;
    FDataModule: TDMBase;

    destructor Destroy; override;
  protected
    property DataModule: TDMBase read FDataModule write SetDataModule;
  end;

  TDMBase = class(TDataModule)
    CONSULTA: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetConsulta: TDataSet; virtual;
    procedure AbrirConsulta(condicion: String);
    procedure CerrarConsulta; virtual;

    constructor Create(AOwner: TComponent); override;
  end;

var
  DMBase: TDMBase;

implementation

{$R *.dfm}
uses iGeneral, DataMVariables;

(*******************************************************************************
*   Clase TDataMBase                                                           *
*******************************************************************************)
constructor TDMBase.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);

   DMBaseDatos.ponPrefijo(Self);
end;

procedure TDMBase.DataModuleCreate(Sender: TObject);
begin
   DMBaseDatos.ponPrefijo(Self);
end;

function TDMBase.GetConsulta: TDataSet;
begin
   result := TDataSet(CONSULTA);
end;

procedure TDMBase.AbrirConsulta(condicion: String);
begin
   CerrarConsulta;

   if CONSULTA.ParamByName('CODTIENDA') <> nil then
   begin
      CONSULTA.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      if condicion <> '' then
         condicion := ' AND ' + condicion;
   end;

   if condicion <> '' then
      CONSULTA.MacroByName('CONDICION').Value := condicion
   else
      CONSULTA.MacroByName('CONDICION').Value := '';

   CONSULTA.Open;
end;

procedure TDMBase.CerrarConsulta;
begin
   CONSULTA.Close;
end;

(*******************************************************************************
*   Clase TDBDataObject                                                        *
*******************************************************************************)

destructor TDBDataObject.Destroy;
begin
   if FDataModuleInterno then
      FDataModule.Free;
end;

procedure TDBDataObject.SetDataModule(Value: TDMBase);
begin
   if Value <> FDataModule then
      FDataModule := Value;
   if FDataModule = nil then
      raise Exception.Create('Error interno, no se ha especificado módulo de datos');
end;


end.
