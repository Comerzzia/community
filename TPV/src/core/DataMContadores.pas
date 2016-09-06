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

unit DataMContadores;

interface

uses
  Forms, SysUtils, Classes, DB, Uni, DBAccess, MemDS, DataMVariables;

resourcestring
   STR_DefinicionNoEncontrada = 'No se ha encontrado la defición del contador %s';
   STR_ValorContadorNoEncontrado = 'No se ha encontrado el valor del contador %s';


type
  TDMContador = class(TDataModule)
    Q_CONTADOR: TUniQuery;
    Q_DEFINICION_CONTADOR: TUniQuery;
    INSERTA_CONTADOR: TUniQuery;
    ACTUALIZA_CONTADOR: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function DameContador(IdContador, Codemp: String; Periodo: Integer; Codserie: String): Integer;
    function DameContadorTicket: Integer;
    function DameGUID: String;
  end;

var
   DMContador: TDMContador;

implementation
uses
   iGeneral;

{$R *.dfm}

function TDMContador.DameContador(IdContador: string; Codemp: string; Periodo: Integer; Codserie: string): Integer;
var
   lUsaCodEmp, lUsaCodSerie, lUsaPeriodo: Boolean;
begin
   Q_DEFINICION_CONTADOR.Close;
   Q_DEFINICION_CONTADOR.ParamByName('ID_CONTADOR').AsString := IdContador;
   Q_DEFINICION_CONTADOR.Open;
   if Q_DEFINICION_CONTADOR.IsEmpty then
      raise Exception.CreateFmt(STR_DefinicionNoEncontrada, [IdContador]);

   lUsaCodEmp := Q_DEFINICION_CONTADOR.FieldByName('USA_CODEMP').AsString = 'S';
   lUsaCodSerie := Q_DEFINICION_CONTADOR.FieldByName('USA_CODSERIE').AsString = 'S';
   lUsaPeriodo := Q_DEFINICION_CONTADOR.FieldByName('USA_PERIODO').AsString = 'S';
   Q_DEFINICION_CONTADOR.Close;

   if not lUsaCodEmp then
      CodEmp := '****';
   if not lUsaPeriodo then
      Periodo := 0;
   if not lUsaCodSerie then
      CodSerie := '****';

   ACTUALIZA_CONTADOR.ParamByName('ID_CONTADOR').AsString := IdContador;
   ACTUALIZA_CONTADOR.ParamByName('CODEMP').AsString := CodEmp;
   ACTUALIZA_CONTADOR.ParamByName('CODSERIE').AsString := CodSerie;
   ACTUALIZA_CONTADOR.ParamByName('PERIODO').AsInteger := Periodo;
   ACTUALIZA_CONTADOR.Execute;

   if ACTUALIZA_CONTADOR.RowsAffected = 0 then
   begin
      try
         INSERTA_CONTADOR.ParamByName('ID_CONTADOR').AsString := IdContador;
         INSERTA_CONTADOR.ParamByName('CODEMP').AsString := CodEmp;
         INSERTA_CONTADOR.ParamByName('CODSERIE').AsString := CodSerie;
         INSERTA_CONTADOR.ParamByName('PERIODO').AsInteger := Periodo;
         INSERTA_CONTADOR.ParamByName('VALOR').AsInteger := 1;
         INSERTA_CONTADOR.Execute;
      except
         ACTUALIZA_CONTADOR.ParamByName('ID_CONTADOR').AsString := IdContador;
         ACTUALIZA_CONTADOR.ParamByName('CODEMP').AsString := CodEmp;
         ACTUALIZA_CONTADOR.ParamByName('CODSERIE').AsString := CodSerie;
         ACTUALIZA_CONTADOR.ParamByName('PERIODO').AsInteger := Periodo;
         ACTUALIZA_CONTADOR.Execute;

         if ACTUALIZA_CONTADOR.RowsAffected = 0 then
            raise;
      end;
   end;

   Q_CONTADOR.Close;
   Q_CONTADOR.ParamByName('ID_CONTADOR').AsString := IdContador;
   Q_CONTADOR.ParamByName('CODEMP').AsString := CodEmp;
   Q_CONTADOR.ParamByName('CODSERIE').AsString := CodSerie;
   Q_CONTADOR.ParamByName('PERIODO').AsInteger := Periodo;
   Q_CONTADOR.Open;
   if not Q_CONTADOR.IsEmpty then
   begin
      result := Q_CONTADOR.FieldByName('VALOR').AsInteger;
      Q_CONTADOR.Close;
   end
   else
      raise Exception.CreateFmt(STR_ValorContadorNoEncontrado, [idContador]);
end;

function TDMContador.DameContadorTicket;
begin
   result := DameContador('ID_TICKET', '', 0, DMVariables.CodigoTienda);
end;

function TDMContador.DameGUID: String;
var
   GUID: TGUID;
   sGUID: String;
begin
   CreateGUID(GUID);
   sGUID := GuidToString(GUID);
   result := sGUID;
end;

end.
