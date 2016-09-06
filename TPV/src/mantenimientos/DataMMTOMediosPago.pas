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

unit DataMMTOMediosPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Uni, DBAccess, MemDS, Contnrs, DataMBase;

type
  { Forward declarations }
  TDMMediosPago = class;
  TMedioPago = class;

  TListaMediosPagoTPV = class(TObjectList)
  private
    FDataModule: TDMMediosPago;
    FOwnsObjects: Boolean;
  protected
    function GetItem(Index: Integer): TMedioPago;
    procedure SetItem(Index: Integer; AObject: TMedioPago);
  public
    function Add(AObject: TMedioPago): Integer;
    function Remove(AObject: TMedioPago): Integer;
    function IndexOf(AObject: TMedioPago): Integer;
    procedure Insert(Index: Integer; AObject: TMedioPago);
    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
    property Items[Index: Integer]: TMedioPago read GetItem write SetItem; default;
    constructor Create(DataModule: TDMMediosPago);
    procedure BD_Cargar;
  end;


  TMedioPago = class(TDBDataObject)
  private
    FCodmedpag: String;
    FDesmedpag: String;
    FContado: Boolean;
    FEfectivo: Boolean;
    FTarjeta_credito: Boolean;
    FActivo: Boolean;
  public
    property Codmedpag: String read FCodmedpag write FCodmedpag;
    property Desmedpag: String read FDesmedpag write FDesmedpag;
    property Contado: Boolean read FContado write FContado;
    property Efectivo: Boolean read FEfectivo write FEfectivo;
    property Tarjeta_credito: Boolean read FTarjeta_credito write FTarjeta_credito;
    property Activo: Boolean read FActivo write FActivo;

    constructor Create(DataModule: TDMMediosPago);

    procedure BD_Cargar(codmedpag: string); overload;
    procedure BD_Cargar(DataSet : TDataSet); overload;    
  end;

  TDMMediosPago = class(TDMBase)
    Q_MEDIO_PAGO: TUniQuery;
    Q_LISTA_MEDIOS_PAGO_TPV: TUniQuery;
    Q_BUSQUEDA_M_PAGOS: TUniQuery;
    Q_CONSULTA_M_PAGOS: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetConsultaMediosPagos: TDataSet;
    procedure AbrirConsultaMediosPagos;
    procedure CerrarConsultaMediosPagos;    
    function DameDesMPagos(Codigo: string): String;
  end;


var
  DMMediosPago: TDMMediosPago;

implementation
uses iGeneral, DataMVariables;

{$R *.dfm}

(*******************************************************************************
*   Clase TDMMediosPago                                                           *
*******************************************************************************)

   function TDMMediosPago.GetConsultaMediosPagos: TDataSet;
   begin
      result := TDataSet(Q_CONSULTA_M_PAGOS);
   end;

   procedure TDMMediosPago.AbrirConsultaMediosPagos;
   begin
      Q_CONSULTA_M_PAGOS.Close;
      Q_CONSULTA_M_PAGOS.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      Q_CONSULTA_M_PAGOS.Open;
   end;

   procedure TDMMediosPago.CerrarConsultaMediosPagos;
   begin
      Q_CONSULTA_M_PAGOS.Close;
   end;

   function TDMMediosPago.DameDesMPagos(Codigo: string): String;
   begin
       with Q_BUSQUEDA_M_PAGOS do
       begin
          Close;
          ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
          ParamByName('CODMEDPAG').AsString := Codigo;
          Open;
          Codigo := FieldByName('DESMEDPAG').AsString;
          Close;
       end;
       Result := Codigo;
   end;

(*******************************************************************************
*   Clase TMedioPago                                                           *
*******************************************************************************)
   constructor TMedioPago.Create(DataModule: TDMMediosPago);
   begin
      //Si el acceso a datos no viene preestablecido crea uno
      if DataModule = nil then
      begin
         FDataModule := TDMMediosPago.Create(nil);
         FDataModuleInterno := True;
      end
      else
      begin
         FDataModule := DataModule;
         FDataModuleInterno := False;
      end;
   end;

   procedure TMedioPago.BD_Cargar(DataSet : TDataSet);
   begin
      with DataSet do
      begin
         Self.Codmedpag := FieldByName('CODMEDPAG').AsString;
         Self.Desmedpag := FieldByName('DESMEDPAG').AsString;
         Self.Contado := iif(FieldByName('CONTADO').AsString = 'S', True, False);
         Self.Efectivo := iif(FieldByName('EFECTIVO').AsString = 'S', True, False);
         Self.Tarjeta_credito := iif(FieldByName('TARJETA_CREDITO').AsString = 'S', True, False);
         Self.Activo := iif(FieldByName('ACTIVO').AsString = 'S', True, False);
      end;
   end;

   procedure TMedioPago.BD_Cargar(codmedpag: string);
   begin
      with TDMMediosPago(FDataModule).Q_MEDIO_PAGO do
      begin
         Close;
         ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         ParamByName('CODMEDPAG').AsString := codmedpag;
         Open;

         if not IsEmpty then
            BD_Cargar(TDMMediosPago(FDataModule).Q_MEDIO_PAGO);

         Close;
      end;
   end;

(*******************************************************************************
*   Clase TListaMedioPagoTPV                                                   *
*******************************************************************************)
  constructor TListaMediosPagoTPV.Create(DataModule: TDMMediosPago);
  begin
     inherited Create;
     FDataModule := DataModule;
     FOwnsObjects := True;
  end;

  function TListaMediosPagoTPV.Add(AObject: TMedioPago): Integer;
  begin
     Result := inherited Add(AObject);
  end;

  function TListaMediosPagoTPV.GetItem(Index: Integer): TMedioPago;
  begin
     Result := TMedioPago(inherited Items[Index]);
  end;

  function TListaMediosPagoTPV.IndexOf(AObject: TMedioPago): Integer;
  begin
     Result := inherited IndexOf(AObject);
  end;

  procedure TListaMediosPagoTPV.Insert(Index: Integer; AObject: TMedioPago);
  begin
     inherited Insert(Index, AObject);
  end;

  function TListaMediosPagoTPV.Remove(AObject: TMedioPago): Integer;
  begin
     Result := inherited Remove(AObject);
  end;

  procedure TListaMediosPagoTPV.SetItem(Index: Integer; AObject: TMedioPago);
  begin
     inherited Items[Index] := AObject;
  end;

  procedure TListaMediosPagoTPV.BD_Cargar;
  var
     MedioPago: TMedioPago;
  begin
     with FDataModule.Q_LISTA_MEDIOS_PAGO_TPV do
     begin
        Close;
        ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
        Open;
        Self.Clear;
        while not Eof do
        begin
           MedioPago := TMedioPago.Create(FDataModule);
           MedioPago.BD_Cargar(FDataModule.Q_LISTA_MEDIOS_PAGO_TPV); //FieldByName('CODMEDPAG').AsString);
           Add(MedioPago);
           Next;
        end;
     end;
  end;

end.
