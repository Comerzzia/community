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

unit DataMImpuestos;

interface

uses
  Forms, SysUtils, Classes, DB, Uni, DBAccess, MemDS, variants,
  DBClient, DataMBaseDatos;

resourcestring
   STR_NoExistePeriodoImpuestos = 'No existe o no se ha definido periodo de impuesto para %s';
   STR_TipoImpuestoNoEncontrado = 'Tipo de impuesto no encontrado';

type
  TTipoImpuesto = class(TObject)
  private
     FIDGrupoImpuestos: Integer;
     FIDTratImpuestos: Integer;
     FCodTratImp: String;
     FCodImp: String;
     FPorcentaje: Extended;
     FPorcentajeRecargo: Extended;
     FAplicaRecargo: Boolean;
     FVigenciaDesde: TDateTime;
  public
     property IDGrupoImpuestos: Integer read FIDGrupoImpuestos;
     property IDTratImpuestos: Integer read FIDTratImpuestos;
     property CodTratImp: String read FCodTratImp;
     property CodImp: String read FCodImp;
     property Porcentaje: Extended read FPorcentaje;
     property PorcentajeRecargo: Extended read FPorcentajeRecargo;
     property AplicaRecargo: Boolean read FAplicaRecargo;
     property VigenciaDesde: TDateTime read FVigenciaDesde;

     function DameImporteImpuestos(ValorBase: Currency): Currency;
     function DameBaseDeImporte(ValorConImpuestos: Currency): Currency;

     constructor Create(GrupoImpuesto: Integer; IdTratImp: Integer; CodImp: String);
  end;

  TDMImpuestos = class(TDataModule)
    Q_IMPUESTOS: TUniQuery;
    IMPUESTOS: TClientDataSet;
    IMPUESTOSGRUPO_IMPUESTOS: TIntegerField;
    IMPUESTOSID_TRAT_IMPUESTOS: TIntegerField;
    IMPUESTOSCODIMP: TIntegerField;
    IMPUESTOSCODTRATIMP: TStringField;
    IMPUESTOSPORCENTAJE: TFloatField;
    IMPUESTOSPORCENTAJE_RECARGO: TFloatField;
    IMPUESTOSAPLICA_RECARGO: TStringField;
    IMPUESTOSVIGENCIA_DESDE: TDateTimeField;
    Q_CONFIG_IMP_TIPOS: TUniQuery;
    Q_CONFIG_IMP_TRATAMIENTO: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GrupoActivo(Fecha: TDateTime): Integer;
    procedure InicioCargarImpuestos;

    function GetDataSetConfigImpuestosTipo: TDataSet;
    procedure AbrirDataSetConfigImpuestosTipo;
    procedure CerrarDatasetconfigImpuestosTipo;

    function GetDataSetConfigImpuestosTratamiento: TDataSet;
    procedure AbrirDataSetConfigImpuestosTratamiento;
    procedure CerrarDataSetConfigImpuestosTratamiento;
  end;

var
   DMImpuestos: TDMImpuestos;

implementation
uses iGeneral;

{$R *.dfm}

function TDMImpuestos.GrupoActivo(Fecha: TDateTime): Integer;
var
   Grupo : SmallInt;
   FechaMasAlta : TDateTime;
begin
   Grupo := -1;

   IMPUESTOS.First;

   FechaMasAlta := StrToDate('01/01/1950');

   while not IMPUESTOS.Eof do
   begin
      if (Fecha >= IMPUESTOS.FieldByName('VIGENCIA_DESDE').AsDateTime) then
      begin
         if FechaMasAlta < IMPUESTOS.FieldByName('VIGENCIA_DESDE').AsDateTime then
         begin
            FechaMasAlta := IMPUESTOS.FieldByName('VIGENCIA_DESDE').AsDateTime;
            Grupo := IMPUESTOS.FieldByName('ID_GRUPO_IMPUESTOS').AsInteger;
         end;
      end;

      IMPUESTOS.Next;
   end;

   Result := Grupo;

   if Grupo = -1 then
      Raise Exception.CreateFmt(STR_NoExistePeriodoImpuestos, [DateToStr( Fecha )]);
end;

procedure TDMImpuestos.InicioCargarImpuestos;
begin
   Q_IMPUESTOS.Close;
   Q_IMPUESTOS.Open;
   if not IMPUESTOS.Active then
   begin
      IMPUESTOS.Close;
      IMPUESTOS.CreateDataSet;
      IMPUESTOS.Open;
   end;
   while not Q_IMPUESTOS.Eof do
   begin
      IMPUESTOS.Append;
      iReemplazaTodosSV(Q_IMPUESTOS, IMPUESTOS);
      IMPUESTOS.Post;
      Q_IMPUESTOS.Next;
   end;
   Q_IMPUESTOS.Close;
end;

function TDMImpuestos.GetDataSetConfigImpuestosTipo: TDataSet;
begin
   result := TDataSet(Q_CONFIG_IMP_TIPOS);
end;

procedure TDMImpuestos.AbrirDataSetConfigImpuestosTipo;
begin
   Q_CONFIG_IMP_TIPOS.Close;
   Q_CONFIG_IMP_TIPOS.Open;
end;

procedure TDMImpuestos.CerrarDataSetConfigImpuestosTipo;
begin
   Q_CONFIG_IMP_TIPOS.Close;
end;


function TDMImpuestos.GetDataSetConfigImpuestosTratamiento: TDataSet;
begin
   result := TDataSet(Q_CONFIG_IMP_TRATAMIENTO);
end;

procedure TDMImpuestos.AbrirDataSetConfigImpuestosTratamiento;
begin
   Q_CONFIG_IMP_TRATAMIENTO.Close;
   Q_CONFIG_IMP_TRATAMIENTO.Open;
end;

procedure TDMImpuestos.CerrarDataSetConfigImpuestosTratamiento;
begin
   Q_CONFIG_IMP_TRATAMIENTO.Close;
end;

(*******************************************************************************
* TTipoImpuesto                                                                *
*******************************************************************************)
constructor TTipoImpuesto.Create(GrupoImpuesto: Integer; IdTratImp: Integer; CodImp: String);
begin
   //El DMImpuestos forma parte del core y esta siempre creado
   with DMImpuestos do
   begin
      if IMPUESTOS.Locate('ID_GRUPO_IMPUESTOS;ID_TRAT_IMPUESTOS;CODIMP', VarArrayOf([GrupoImpuesto, IdTratImp, CodImp]), []) then
      begin
         FIDGrupoImpuestos := IMPUESTOS.FieldByName('ID_GRUPO_IMPUESTOS').AsInteger;
         FIDTratImpuestos := IMPUESTOS.FieldByName('ID_TRAT_IMPUESTOS').AsInteger;
         FCodTratImp := IMPUESTOS.FieldByName('CODTRATIMP').AsString;
         FCodImp := IMPUESTOS.FieldByName('CODIMP').AsString;
         FPorcentaje := IMPUESTOS.FieldByName('PORCENTAJE').AsFloat;
         FPorcentajeRecargo := IMPUESTOS.FieldByName('PORCENTAJE_RECARGO').AsFloat;
         FAplicaRecargo := iif(IMPUESTOS.FieldByName('APLICA_RECARGO').AsString = 'S', True, False);
         FVigenciaDesde := IMPUESTOS.FieldByName('VIGENCIA_DESDE').AsDateTime;
      end
      else
         raise Exception.Create(STR_TipoImpuestoNoEncontrado);
   end;
end;

function TTipoImpuesto.DameImporteImpuestos(ValorBase: Currency): Currency;
begin
   result := ValorBase * (FPorcentaje + FPorcentajeRecargo) / 100;
end;

function TTipoImpuesto.DameBaseDeImporte(ValorConImpuestos: Currency): Currency;
begin
   result := ValorConImpuestos / (1 + ((FPorcentaje + FPorcentajeRecargo) / 100));
end;


end.
