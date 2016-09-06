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

unit DataMMTOArticulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Uni, DBAccess, MemDS, JvJCLUtils, DataMBase, DataMCore,
  DataMBaseDatos, DataMMTOCodigoBarras;

type
  { Forward declarations }
  TDMArticulo = class;

  TArticulo = class(TDBDataObject)
  private
     FDataModuleListaCodigosBarras: TDMCodigoBarras;

     FCodart: String;
     FDesart: String;
     FFormato: String;
     FCodImp: String;
     FObservaciones: String;
     FActivo: Boolean;
     FNumeros_serie: Boolean;
     FDesglose1: Boolean;
     FDesglose2: Boolean;
     FGenerico: Boolean;
     FVersion: Integer;
     FUnidades_Caja: Integer;
     FPvp: Currency; //PrecioTarifaGeneral
     FPrecioCosto: Currency;
     FListaCodigosBarras: TListaCodigosBarras;

     function GetPvP : Currency;
  public
     property Codart: String read FCodart write FCodart;
     property Desart: String read FDesart write FDesart;
     property Formato: String read FFormato write FFormato;
     property CodImp: String read FCodImp write FCodImp;
     property Observaciones: String read FObservaciones write FObservaciones;
     property Activo: Boolean read FActivo write FActivo;
     property Numeros_serie: Boolean read FNumeros_serie write FNumeros_serie;
     property Desglose1: Boolean read FDesglose1 write FDesglose1;
     property Desglose2: Boolean read FDesglose2 write FDesglose2;
     property Generico: Boolean read FGenerico write FGenerico;
     property Version: Integer read FVersion write FVersion;
     property Unidades_caja: Integer read FUnidades_caja write FUnidades_caja;
     property ListaCodigosBarras: TListaCodigosBarras read FListaCodigosBarras write FListaCodigosBarras;
     property PrecioCosto: Currency read FPrecioCosto write FPrecioCosto;
     property Pvp: Currency read GetPvp write FPvp;

     constructor Create(DataModule: TDMArticulo);
     destructor Destroy; override;

     procedure BD_Cargar(codart: string);
     procedure BD_Actualizar;
     procedure BD_Insertar;
     procedure BD_Eliminar;
  end;

  TDMArticulo = class(TDMBase)
    Q_ARTICULO: TUniQuery;
    CONSULTA_TPV: TUniQuery;
    MODIFICA_ARTICULO: TUniQuery;
    INSERTA_ARTICULO: TUniQuery;
    ELIMINA_ARTICULO: TUniQuery;
    Q_ARTICULOS_DEMO: TUniQuery;
    Q_CATEGORIAS: TUniQuery;
    Q_ARTICULOS_CATEGORIA: TUniQuery;
  private
    { Private declarations }
    FCONSULTA_TPV_SQL_MACRO: String;
  public
    { Public declarations }
    function GetConsultaTPV: TDataSet;
    procedure AbrirConsultaTPV(condicion: String);
    procedure CerrarConsultaTPV;
    function GetArticulosDemo: TDataset;

    function GetDataSetCategorias: TDataSet;
    procedure AbrirDataSetCategorias(CodcatPadre: String; nivel: Integer);
    procedure CerrarDataSetCategorias;

    function GetDataSetArticulosCategoria: TDataSet;
    procedure AbrirDataSetArticulosCategoria(Codcat: String);
    procedure CerrarDataSetArticulosCategoria;

    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses iGeneral, DataMMTOTarifas, DataMVariables, StrUtils;

(*******************************************************************************
*   Clase TDMArticulo                                                       *
*******************************************************************************)
   constructor TDMArticulo.Create(AOwner: TComponent);
   begin
      inherited Create(AOwner);

      FCONSULTA_TPV_SQL_MACRO := CONSULTA_TPV.SQL.Text;
   end;
   
   function TDMArticulo.GetConsultaTPV: TDataSet;
   begin
      result := TDataSet(CONSULTA_TPV);
   end;

   procedure TDMArticulo.AbrirConsultaTPV(condicion: String);
   begin
      CerrarConsultaTPV;
      //Esto porque ADO no soporta macros
      CONSULTA_TPV.SQL.Text := FCONSULTA_TPV_SQL_MACRO;
      if condicion <> '' then
         CONSULTA_TPV.SQL.Text := AnsiReplaceStr(CONSULTA_TPV.SQL.Text, '%CONDICION%', condicion)
      else
         CONSULTA_TPV.SQL.Text := AnsiReplaceStr(CONSULTA_TPV.SQL.Text, '%CONDICION%', ' 1=1');
      CONSULTA_TPV.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      CONSULTA_TPV.Open;
   end;

   procedure TDMArticulo.CerrarConsultaTPV;
   begin
      CONSULTA_TPV.Close;
   end;

   function TDMArticulo.GetArticulosDemo: TDataset;
   begin
      Q_ARTICULOS_DEMO.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      result := TDataSet(Q_ARTICULOS_DEMO);
   end;

   function TDMArticulo.GetDataSetCategorias: TDataSet;
   begin
      result := TDataSet(Q_CATEGORIAS);
   end;

   procedure TDMArticulo.AbrirDataSetCategorias(CodcatPadre: String; nivel: Integer);
   begin
      Q_CATEGORIAS.Close;
      Q_CATEGORIAS.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      Q_CATEGORIAS.ParamByName('CODCAT').AsString := CodcatPadre + '%';
      Q_CATEGORIAS.ParamByName('NIVEL').AsInteger := nivel * 2;
      Q_CATEGORIAS.Open;
   end;

   procedure TDMArticulo.CerrarDataSetCategorias;
   begin
      Q_CATEGORIAS.Close;
   end;


   function TDMArticulo.GetDataSetArticulosCategoria: TDataSet;
   begin
      result := TDataSet(Q_ARTICULOS_CATEGORIA);
   end;

   procedure TDMArticulo.AbrirDataSetArticulosCategoria(Codcat: String);
   begin
      Q_ARTICULOS_CATEGORIA.Close;
      Q_ARTICULOS_CATEGORIA.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      Q_ARTICULOS_CATEGORIA.ParamByName('CODCAT').AsString := Codcat;
      Q_ARTICULOS_CATEGORIA.Open;
   end;

   procedure TDMArticulo.CerrarDataSetArticulosCategoria;
   begin
      Q_ARTICULOS_CATEGORIA.Close;
   end;



(*******************************************************************************
*   Clase TArticulo                                                            *
*******************************************************************************)
   constructor TArticulo.Create(DataModule: TDMArticulo);
   begin
      //Si el acceso a datos no viene preestablecido crea uno
      if DataModule = nil then
      begin
         FDataModule := TDMArticulo.Create(nil);
         FDataModuleInterno := True;
      end
      else
      begin
         FDataModule := DataModule;
         FDataModuleInterno := False;
      end;
      FDataModuleListaCodigosBarras := TDMCodigoBarras.Create(nil);
      FListaCodigosBarras := TListaCodigosBarras.Create(Self, FDataModuleListaCodigosBarras);
   end;

   destructor TArticulo.Destroy;
   begin
      FListaCodigosBarras.Free;
      FDataModuleListaCodigosBarras.Free;
      inherited Destroy;
   end;

   procedure TArticulo.BD_Cargar(codart: string);
   begin
      with TDMArticulo(FDataModule).Q_ARTICULO do
      begin
         Close;
         ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         ParamByName('CODART').AsString := codart;
         Open;
         if not IsEmpty then
         begin
            Self.Codart := FieldByName('CODART').AsString;
            Self.Desart := FieldByName('DESART').AsString;
            Self.Formato := FieldByName('FORMATO').AsString;
            Self.CodImp := FieldByName('CODIMP').AsString;
            Self.Observaciones := FieldByName('OBSERVACIONES').AsString;
            Self.Activo := iif(FieldByName('ACTIVO').AsString = 'S', True, False);
            Self.Numeros_serie := iif(FieldByName('NUMEROS_SERIE').AsString = 'S', True, False);
            Self.Desglose1 := iif(FieldByName('DESGLOSE1').AsString = 'S', True, False);
            Self.Desglose2 := iif(FieldByName('DESGLOSE2').AsString = 'S', True, False);
            Self.Generico := iif(FieldByName('GENERICO').AsString = 'S', True, False);
            Self.Version := FieldByName('VERSION').AsInteger;
            Self.Unidades_caja := FieldByName('UNIDADES_CAJA').AsInteger;
         end;
         Close;
      end;
   end;

   function TArticulo.GetPvp : Currency;
   var
      DMT: TDMTarifas;
   begin
      DMT := TDMTarifas.Create(nil);
      DMBaseDatos.ponPrefijo(DMT);
      try
         FPvp := DMT.damePrecioArticulo(Self);
         Result := FPvp;
      finally
          DMT.Free;
      end;
   end;

   procedure TArticulo.BD_Actualizar;
   var
      DMT: TDMTarifas;
   begin
      //Graba el articulo
      with TDMArticulo(FDataModule) do
      begin
         MODIFICA_ARTICULO.ParamByName('DESART').AsString := FDesart;
         MODIFICA_ARTICULO.ParamByName('FORMATO').AsString := FFormato;
         MODIFICA_ARTICULO.ParamByName('CODIMP').AsString := FCodImp;
         MODIFICA_ARTICULO.ParamByName('ACTIVO').AsString := iif(FActivo, 'S', 'N');
         MODIFICA_ARTICULO.ParamByName('NUMEROS_SERIE').AsString := iif(FNumeros_serie, 'S', 'N');
         MODIFICA_ARTICULO.ParamByName('DESGLOSE1').AsString := iif(FDesglose1, 'S', 'N');
         MODIFICA_ARTICULO.ParamByName('DESGLOSE2').AsString := iif(FDesglose2, 'S', 'N');
         MODIFICA_ARTICULO.ParamByName('GENERICO').AsString := iif(FGenerico, 'S', 'N');
         MODIFICA_ARTICULO.ParamByName('OBSERVACIONES').AsString := FObservaciones;
         MODIFICA_ARTICULO.ParamByName('CODART').AsString := Fcodart;
         MODIFICA_ARTICULO.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      end;

      //Graba el precio
      DMT := TDMTarifas.Create(nil);
      try
         DMBaseDatos.ponPrefijo(DMT);
         DMT.BD_PonPrecioTarifaGeneral(Self, FPvp);
      finally
         DMT.Free;
      end;

      //Graba los codigos de barras
      ListaCodigosBarras.BD_Salvar;

      Self.BD_Cargar(Self.Codart);
   end;

   procedure TArticulo.BD_Insertar;
   var
      DMT: TDMTarifas;
   begin
      //Graba el articulo
      with TDMArticulo(FDataModule) do
      begin
         INSERTA_ARTICULO.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         INSERTA_ARTICULO.ParamByName('CODART').AsString := FCodart;
         INSERTA_ARTICULO.ParamByName('DESART').AsString := FDesart;
         INSERTA_ARTICULO.ParamByName('FORMATO').AsString := FFormato;
         INSERTA_ARTICULO.ParamByName('CODIMP').AsString := FCodImp;
         INSERTA_ARTICULO.ParamByName('ACTIVO').AsString := iif(FActivo, 'S', 'N');
         INSERTA_ARTICULO.ParamByName('NUMEROS_SERIE').AsString := iif(FNumeros_serie, 'S', 'N');
         INSERTA_ARTICULO.ParamByName('DESGLOSE1').AsString := iif(FDesglose1, 'S', 'N');
         INSERTA_ARTICULO.ParamByName('DESGLOSE2').AsString := iif(FDesglose2, 'S', 'N');
         INSERTA_ARTICULO.ParamByName('GENERICO').AsString := iif(FGenerico, 'S', 'N');
         INSERTA_ARTICULO.ParamByName('OBSERVACIONES').AsString := FObservaciones;
         INSERTA_ARTICULO.Execute;
      end;

      //Graba el precio
      DMT := TDMTarifas.Create(nil);
      try
         DMBaseDatos.ponPrefijo(DMT);
         DMT.BD_PonPrecioTarifaGeneral(Self, FPvp);
      finally
         DMT.Free;
      end;

      //Graba los codigos de barras
      ListaCodigosBarras.BD_Salvar;

      Self.BD_Cargar(Self.FCodart);
   end;


   procedure TArticulo.BD_Eliminar;
   begin
      with TDMArticulo(FDataModule).ELIMINA_ARTICULO do
      begin
         ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         ParamByName('CODART').AsString := codart;
         Execute;
      end;
      Self.BD_Cargar(Self.Codart);
   end;
end.
