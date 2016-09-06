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

unit DataMMTOCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Uni, DBAccess, MemDS, Contnrs, DataMBase, DBClient, VirtualTable;

type
  { Forward declarations }
   TDMCodigoBarras = class;

   TCodigoBarras = class(TDBDataObject)
   private
      FCodart: String;
      FDesglose1: String;
      FDesglose2: String;
      FCodigoBarras: String;
      FDun14: Boolean;
      FFechaAlta: TDateTime;
      FFactorConversion: Extended;
      FEspecial: Boolean;
      FEspecial_precio: Currency;
      FEspecial_cantidad: Extended;
      FEspecial_fidelizacion: boolean;
   public
      property Codart: String read FCodart write FCodart;
      property Desglose1: String read FDesglose1 write FDesglose1;
      property Desglose2: String read FDesglose2 write FDesglose2;
      property CodigoBarras: String read FCodigoBarras write FCodigoBarras;
      property Dun14: Boolean read FDun14 write FDun14;
      property FechaAlta: TDateTime read FFechaAlta write FFechaAlta;
      property FactorConversion: Extended read FFactorConversion write FFactorConversion;
      property Especial: Boolean read FEspecial write FEspecial;
      property Especial_precio: Currency read FEspecial_precio write FEspecial_precio;
      property Especial_cantidad: Extended read FEspecial_cantidad write FEspecial_cantidad;
      property Especial_fidelizacion: Boolean read FEspecial_fidelizacion write FEspecial_fidelizacion;

      constructor Create(DataModule: TDMCodigoBarras);
      procedure BD_Cargar(codigoBarras: String);
      procedure BD_Salvar;
   end;

   TListaCodigosBarras = class(TObjectList)
   private
     FOwner: TDBDataObject; //No puede ser un TArticulo al estar en units separados (se crearia una referencia circular)
     FDataModule: TDMCodigoBarras;
     FOwnsObjects: Boolean;
     FUsaDataSetPresentacion: Boolean;
   protected
     function GetItem(Index: Integer): TCodigoBarras;
     procedure SetItem(Index: Integer; AObject: TCodigoBarras);
   public
     function Add(AObject: TCodigoBarras): Integer;
     function Remove(AObject: TCodigoBarras): Integer;
     function IndexOf(AObject: TCodigoBarras): Integer;
     function Existe(CodigoBarras: String): Boolean;
     procedure Insert(Index: Integer; AObject: TCodigoBarras);
     property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
     property Items[Index: Integer]: TCodigoBarras read GetItem write SetItem; default;

     property UsaDataSetPresentacion: Boolean read FUsaDataSetPresentacion write FUsaDataSetPresentacion;

     constructor Create(Articulo: TDBDataObject; DataModule: TDMCodigoBarras);
     procedure BD_Cargar(codart: String);
     procedure BD_Salvar;
     function GetDataSetPresentacionCodigosBarras: TDataSet;
     procedure RefrescaPresentacionCodigosBarras;
     procedure PresentacionCodigosBarrasAdd(DataSet: TDataSet; CodigoBarras: TCodigoBarras; Indice: Integer);
   end;

  TDMCodigoBarras = class(TDMBase)
    Q_EXISTE_CODBAR: TUniQuery;
    Q_CODIGO_BARRAS: TUniQuery;
    Q_LISTA_CODBAR: TUniQuery;
    BORRAR_CODBAR_ARTICULO: TUniQuery;
    INSERTA_CODIGO_BARRAS: TUniQuery;
    CODIGOS_BARRAS: TClientDataSet;
    CODIGOS_BARRASIDX: TIntegerField;
    CODIGOS_BARRASCODIGO_BARRAS: TStringField;
    CODIGOS_BARRASDESGLOSE1: TStringField;
    CODIGOS_BARRASDESGLOSE2: TStringField;
    CODIGOS_BARRASDUN14: TStringField;
    CODIGOS_BARRASFECHA_ALTA: TDateTimeField;
    CODIGOS_BARRASFACTOR_CONVERSION: TFloatField;
    Q_CODIGOS_BARRA_ESP: TUniQuery;
    INSERTA_CODIGOS_BARRA_ESP: TUniQuery;
    TMP_CODIGOS_BARRA_ESP: TVirtualTable;
    TMP_CODIGOS_BARRA_ESPORDEN: TIntegerField;
    TMP_CODIGOS_BARRA_ESPDESCRIPCION: TStringField;
    TMP_CODIGOS_BARRA_ESPPREFIJO: TStringField;
    TMP_CODIGOS_BARRA_ESPCODART: TStringField;
    TMP_CODIGOS_BARRA_ESPPRECIO: TStringField;
    TMP_CODIGOS_BARRA_ESPCANTIDAD: TStringField;
    TMP_CODIGOS_BARRA_ESPFIDELIZACION: TStringField;
    BORRAR_CODIGOS_BARRA_ESP: TUniQuery;
    Q_CONSULTA_CODIGOS_BARRA_ESP: TUniQuery;
    procedure TMP_CODIGOS_BARRA_ESPNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SalvaCodigoBarrasEsp;
    function ExisteCodigoBarras(codigoBarras: String): Boolean;
    function GetCodigoBarras(codigoBarras: String): TCodigoBarras;
  end;

implementation
uses
   iGeneral, DataMMTOArticulo, DataMVariables, JvJCLUtils;

{$R *.dfm}

(*******************************************************************************
*   Clase TDMCodigoBarras                                                   *
*******************************************************************************)
  function TDMCodigoBarras.ExisteCodigoBarras(codigoBarras: String): Boolean;
  begin
     with Q_EXISTE_CODBAR do
     begin
        Close;
        ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
        ParamByName('CODIGO_BARRAS').AsString := codigoBarras;
        Open;
        result := (FieldByName('CONTADOR').AsInteger > 0);
        Close;
     end;
  end;

  function TDMCodigoBarras.GetCodigoBarras(codigoBarras: string): TCodigoBarras;
  var
     CB: TCodigoBarras;
  begin
     CB := TCodigoBarras.Create(Self);
     CB.BD_Cargar(codigoBarras);
     result := CB;
  end;

  procedure TDMCodigoBarras.SalvaCodigoBarrasEsp;
  var
     i : Integer;
  begin
    with TMP_CODIGOS_BARRA_ESP do
    begin
      BORRAR_CODIGOS_BARRA_ESP.Execute;
      if not IsEmpty then
      begin
         i := 0;
         TMP_CODIGOS_BARRA_ESP.First;
         while not Eof do
         begin
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('ORDEN').AsInteger := i;
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('DESCRIPCION').AsString := UpperCase(FieldByName('DESCRIPCION').AsString);
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('PREFIJO').AsString := FieldByName('PREFIJO').AsString;
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('CODART').AsString := FieldByName('CODART').AsString;
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('PRECIO').AsString := FieldByName('PRECIO').AsString;
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('CANTIDAD').AsString := FieldByName('CANTIDAD').AsString;
            INSERTA_CODIGOS_BARRA_ESP.ParamByName('FIDELIZACION').AsString := UpperCase(FieldByName('FIDELIZACION').AsString);
            INSERTA_CODIGOS_BARRA_ESP.Execute;
            Inc(i);
            Next;
         end;
      end;
      Close;
    end;
  end;

procedure TDMCodigoBarras.TMP_CODIGOS_BARRA_ESPNewRecord(DataSet: TDataSet);
begin
  inherited;
  TMP_CODIGOS_BARRA_ESP.FieldByName('ORDEN').AsInteger := TMP_CODIGOS_BARRA_ESP.RecordCount;
end;

(*******************************************************************************
*   Clase TCodigoBarras                                                        *
*******************************************************************************)

  constructor TCodigoBarras.Create(DataModule: TDMCodigoBarras);
  begin
     if DataModule = nil then
     begin
        FDataModuleInterno := True;
        FDataModule := TDMCodigoBarras.Create(nil);
     end
     else
     begin
        FDataModuleInterno := False;
        FDataModule := DataModule;
     end;
  end;

  procedure TCodigoBarras.BD_Cargar(codigoBarras: string);
  begin
     //Ver si el codigo de barras es especial
     FEspecial := False;
     with TDMCodigoBarras(FDataModule).Q_CODIGOS_BARRA_ESP do
     begin
        Close;
        ParamByName('CODIGO_BARRAS').AsString := codigobarras;
        Open;
        if not (Bof and Eof) then
        begin
           try
              FEspecial := True;

              FCodart := Copy(codigobarras,
                 StrToInt(ExtractWord(1, FieldByName('CODART').AsString, ['|'])),
                 StrToInt(ExtractWord(2, FieldByName('CODART').AsString, ['|'])));

              FEspecial_precio := StrToCurr(Copy(codigobarras,
                 StrToInt(ExtractWord(1, FieldByName('PRECIO').AsString, ['|'])),
                 StrToInt(ExtractWord(2, FieldByName('PRECIO').AsString, ['|']))) +
                 ',' +
                 Copy(codigobarras,
                 StrToInt(ExtractWord(1, FieldByName('PRECIO').AsString, ['|'])) +
                 StrToInt(ExtractWord(2, FieldByName('PRECIO').AsString, ['|'])),
                 StrToInt(ExtractWord(3, FieldByName('PRECIO').AsString, ['|']))));

              if FEspecial_precio = 0 then
                 raise Exception.Create('No se pudo interpretar el código de barras especial');

              try
                 FEspecial_cantidad := StrToFloat(Copy(codigobarras,
                    StrToInt(ExtractWord(1, FieldByName('CANTIDAD').AsString, ['|'])),
                    StrToInt(ExtractWord(2, FieldByName('CANTIDAD').AsString, ['|']))) +
                    ',' +
                    Copy(codigobarras,
                    StrToInt(ExtractWord(1, FieldByName('CANTIDAD').AsString, ['|'])) +
                    StrToInt(ExtractWord(2, FieldByName('CANTIDAD').AsString, ['|'])),
                    StrToInt(ExtractWord(3, FieldByName('CANTIDAD').AsString, ['|']))));
              except
                 FEspecial_cantidad := 1;
              end;

              FEspecial_fidelizacion := (FieldByName('FIDELIZACION').AsString = 'S');
              FDesglose1 := '*';
              FDesglose2 := '*';
              FDun14 := False;
              FFactorconversion := 0;
              FFechaAlta := 0;
              FCodigoBarras := codigobarras;
           except
              raise Exception.Create('No se pudo interpretar el código de barras especial');
           end;
        end
     end;


     if not FEspecial then
     begin
        //Carga de un codigo de barras estandar
        with TDMCodigoBarras(FDataModule).Q_CODIGO_BARRAS do
        begin
           Close;
           ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
           ParamByName('CODIGO_BARRAS').AsString := codigoBarras;
           Open;
           if not IsEmpty then
           begin
              FCodart := FieldByName('CODART').AsString;
              FDesglose1 := FieldByName('DESGLOSE1').AsString;
              FDesglose2 := FieldByName('DESGLOSE2').AsString;
              FCodigoBarras := FieldByName('CODIGO_BARRAS').AsString;
              FDun14 := iif(FieldByName('DUN14').AsString = 'S', True, False);
              FFechaAlta := FieldByName('FECHA_ALTA').AsDateTime;
              FFactorConversion := FieldByName('FACTOR_CONVERSION').AsFloat;
           end;
           Close;
        end;
     end;
  end;

  procedure TCodigoBarras.BD_Salvar;
  begin
     with TDMCodigoBarras(FDataModule) do
     begin
        INSERTA_CODIGO_BARRAS.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
        INSERTA_CODIGO_BARRAS.ParamByName('CODART').AsString := Self.Codart;
        INSERTA_CODIGO_BARRAS.ParamByName('DESGLOSE1').AsString := Self.Desglose1;
        INSERTA_CODIGO_BARRAS.ParamByName('DESGLOSE2').AsString := Self.Desglose2;
        INSERTA_CODIGO_BARRAS.ParamByName('CODIGO_BARRAS').AsString := Self.CodigoBarras;
        INSERTA_CODIGO_BARRAS.ParamByName('DUN14').AsString := iif(Self.Dun14,'S', 'N');
        INSERTA_CODIGO_BARRAS.ParamByName('FECHA_ALTA').AsDateTime := Self.FechaAlta;
        INSERTA_CODIGO_BARRAS.ParamByName('FACTOR_CONVERSION').AsFloat := Self.FactorConversion;
        INSERTA_CODIGO_BARRAS.Execute;
     end;
  end;


(*******************************************************************************
*   Clase TListaCodigosBarras                                                  *
*******************************************************************************)
  constructor TListaCodigosBarras.Create(Articulo: TDBDataObject; DataModule: TDMCodigoBarras);
  begin
     inherited Create;
     FDataModule := DataModule;
     FOwnsObjects := True;
     FOwner := Articulo;
     FUsaDataSetPresentacion := False;
  end;

  function TListaCodigosBarras.Add(AObject: TCodigoBarras): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaCodigosBarras.GetItem(Index: Integer): TCodigoBarras;
  begin
     Result := TCodigoBarras(inherited Items[Index]);
  end;

  function TListaCodigosBarras.IndexOf(AObject: TCodigoBarras): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaCodigosBarras.Insert(Index: Integer; AObject: TCodigoBarras);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaCodigosBarras.Remove(AObject: TCodigoBarras): Integer;
  begin
     Result := inherited Remove(AObject);
  end;

  procedure TListaCodigosBarras.SetItem(Index: Integer; AObject: TCodigoBarras);
  begin
     inherited Items[Index] := AObject;
  end;

  procedure TListaCodigosBarras.BD_Cargar(codart: string);
  var
     CB: TCodigoBarras;
  begin
     with FDataModule.Q_LISTA_CODBAR do
     begin
        Close;
        ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
        ParamByName('CODART').AsString := codart;
        Open;
        Self.Clear;
        while not Eof do
        begin
           CB := TCodigoBarras.Create(FDataModule);
           CB.BD_Cargar(FieldByName('CODIGO_BARRAS').AsString);
           Add(CB);
           Next;
        end;
     end;
     if FUsaDataSetPresentacion then
        RefrescaPresentacionCodigosBarras;
  end;

  procedure TListaCodigosBarras.BD_Salvar;
  var
     i: Integer;
  begin
     if FOwner <> nil then
     begin
        with FDataModule do
        begin
           BORRAR_CODBAR_ARTICULO.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
           BORRAR_CODBAR_ARTICULO.ParamByName('CODART').AsString := TArticulo(FOwner).Codart;
           BORRAR_CODBAR_ARTICULO.Execute;
        end;
     end
     else
        raise Exception.Create('No se ha especificado Articulo para los códigos de barra');

     for i := 0 to Count - 1 do
     begin
        //Si tiene asignado un TArticulo actualizar las pks antes de salvar
        if FOwner <> nil then
           Items[i].Codart := TArticulo(FOwner).Codart;
        Items[i].BD_Salvar;
     end;
  end;

  function TListaCodigosBarras.GetDataSetPresentacionCodigosBarras: TDataSet;
  begin
     result := TDataSet(TDMCodigoBarras(FDataModule).CODIGOS_BARRAS);
  end;

  procedure TListaCodigosBarras.RefrescaPresentacionCodigosBarras;
  var
     i: Integer;
  begin
     if FUsaDataSetPresentacion then
     begin
        with TDMCodigoBarras(FDataModule) do
        begin
           CODIGOS_BARRAS.Close;
           CODIGOS_BARRAS.CreateDataSet;
           CODIGOS_BARRAS.Open;
           for i := 0 to Count - 1 do
              PresentacionCodigosBarrasAdd(CODIGOS_BARRAS, Items[i], i);

           CODIGOS_BARRAS.First;
        end;
     end;
  end;

  procedure TListaCodigosBarras.PresentacionCodigosBarrasAdd(DataSet: TDataSet; CodigoBarras: TCodigoBarras; Indice: Integer);
  begin
     DataSet.Append;
     DataSet.FieldByName('IDX').AsInteger := Indice;
     DataSet.FieldByName('DESGLOSE1').AsString := CodigoBarras.Desglose1;
     DataSet.FieldByName('DESGLOSE2').AsString := CodigoBarras.Desglose2;
     DataSet.FieldByName('CODIGO_BARRAS').AsString := CodigoBarras.CodigoBarras;
     DataSet.FieldByName('DUN14').AsString := iif(CodigoBarras.Dun14, 'S', 'N');
     DataSet.FieldByName('FACTOR_CONVERSION').AsFloat := CodigoBarras.FactorConversion;
     DataSet.FieldByName('FECHA_ALTA').AsDateTime := CodigoBarras.FechaAlta;
     DataSet.Post;
  end;

  function TListaCodigosBarras.Existe(CodigoBarras: String): Boolean;
  var
     i: Integer;
  begin
     result := False;
     for i := 0 to Count - 1 do
     begin
        if Items[i].CodigoBarras =  CodigoBarras then
        begin
           result := True;
           Break;
        end;
     end;
  end;

  end.
