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

unit DataMMTOTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Uni, DBAccess, MemDS, DataMBase, DataMMTOCliente, ADODB, DataMImpuestos, DataMMTOArticulo;

{ Forward declarations }
type
  TPrecioTarifa = class;

  TDMTarifas = class(TDMBase)
    Q_PRECIO_TARIFA: TUniQuery;
    Q_PRECIO_PROMOCION: TUniQuery;
    Q_CONSULTA_TARIFAS: TUniQuery;
    Q_BUSQUEDA_TARIFAS: TUniQuery;
    MODIFICA_PRECIO_TARIFA: TUniQuery;
    INSERTA_PRECIO_TARIFA: TUniQuery;
    Q_CACHE: TUniQuery;
  private
    { Private declarations }
    procedure CheckCache;
    function GetPrecioTarifa(codart: string; codtar: string; UsaFidelizacion: Boolean; var refDatosPrecio: TPrecioTarifa): Boolean;
  public
    { Public declarations }
    procedure LimpiaCache;

    function damePrecioArticulo(articulo: TArticulo; cliente: TCliente; UsaFidelizacion: Boolean; var refDatosPrecio: TPrecioTarifa): Boolean; overload;
    function damePrecioArticulo(articulo: TArticulo): Currency; overload;
    function DameDesTarifas(Codigo: string): String;
    function GetConsultaTarifas: TDataSet;
    procedure AbrirConsultaTarifas;
    procedure BD_PonPrecioTarifaGeneral(articulo: TArticulo; PVP: Currency);
  end;

  TPrecioTarifa = class(TObject)
  private
     FPVP: Currency;
     FPrecio: Currency;
     FPVPTarifa: Currency;
     FPrecioTarifa: Currency;
     FIsPromocion: Boolean;
     FIDPromocion: Integer;
     FPuntos: Integer;
     FTextoPromocion: String;
     FAhorro: Currency;
  public
     property PVP: Currency read FPVP write FPVP;
     property Precio: Currency read FPrecio write FPrecio;
     property PVPTarifa: Currency read FPVPTarifa write FPVPTarifa;
     property PrecioTarifa: Currency read FPrecioTarifa write FPrecioTarifa;
     property IsPromocion: Boolean read FIsPromocion write FIsPromocion;
     property IDPromocion: Integer read FIDPromocion write FIDPromocion;
     property Puntos: Integer read FPuntos write FPuntos;
     property TextoPromocion: String read FTextoPromocion write FTextoPromocion;
     property Ahorro: Currency read FAhorro write FAhorro;
  end;

var
  DMTarifas: TDMTarifas;

const
   sTarifaGeneral = 'GENERAL';

implementation
uses
   iGeneral, DataMTienda, DataMVariables;

{$R *.dfm}

function TDMTarifas.damePrecioArticulo(articulo: TArticulo): Currency;
var
   DatosPrecio: TPrecioTarifa;
   Cliente: TCliente;
   InfoTienda: TInfoTienda;
begin
   InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
   Cliente := TCliente.Create(nil);
   DatosPrecio := TPrecioTarifa.Create;
   try
      Cliente.BD_Cargar(InfoTienda.ClientePorDefecto);
      if damePrecioArticulo(articulo, Cliente, False, DatosPrecio) then
         result := DatosPrecio.PVP
      else
         result := 0;
   finally
      InfoTienda.Free;
      Cliente.Free;
      DatosPrecio.Free;
   end;
end;

function TDMTarifas.damePrecioArticulo(articulo: TArticulo; cliente: TCliente; UsaFidelizacion: Boolean; var refDatosPrecio: TPrecioTarifa): Boolean;
var
   TipoImpuesto: TTipoImpuesto;
begin
   CheckCache;

   // cache para no consultar si solo hay una tarifa
   if (Q_CACHE.FieldByName('TARIFAS').AsInteger = 1) and
      ((cliente.Codtar = '') or (cliente.codtar = Q_CACHE.FieldByName('CODTAR').AsString)) then
   begin
      result := GetPrecioTarifa(articulo.codart, Q_CACHE.FieldByName('CODTAR').AsString, UsaFidelizacion, refDatosPrecio);
   end
   else
   begin
      //Obtener el precio de tarifa cuya tarifa sea el codigo de cliente
      result := GetPrecioTarifa(articulo.codart, cliente.Cif, UsaFidelizacion, refDatosPrecio);
      if not result then
      begin
         //Obtener el precio de tarifa de la tarifa asociada al cliente
         if cliente.codtar <> '' then
            result := GetPrecioTarifa(articulo.codart, cliente.Codtar, UsaFidelizacion, refDatosPrecio);

         if not result then
            //Obtener el precio de la tarifa General
            result := GetPrecioTarifa(articulo.codart, sTarifaGeneral, UsaFidelizacion, refDatosPrecio);
      end;
   end;

   TipoImpuesto := TTipoImpuesto.Create(DMImpuestos.GrupoActivo(Date), cliente.Id_trat_impuestos, articulo.CodImp);
   try
      refDatosPrecio.PVPTarifa := iRedondeo(refDatosPrecio.PrecioTarifa + TipoImpuesto.DameImporteImpuestos(refDatosPrecio.PrecioTarifa), 2);
      refDatosPrecio.PVP := iRedondeo(refDatosPrecio.Precio + TipoImpuesto.DameImporteImpuestos(refDatosPrecio.Precio), 2);
   finally
      TipoImpuesto.Free;
   end;
end;

function TDMTarifas.GetPrecioTarifa(codart: string; codtar: string; UsaFidelizacion: Boolean; var refDatosPrecio: TPrecioTarifa): Boolean;
begin
   CheckCache;

   // control de cache, si no hay promociones, no volver a buscar
   if Q_CACHE.FieldByName('PROMOCIONES').AsInteger > 0 then
   begin
      with Q_PRECIO_PROMOCION do
      begin
         Close;
         ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
         ParamByName('CODTAR').AsString := codtar;
         ParamByName('CODART').AsString := codart;
         ParamByName('USA_FIDELIZACION').AsString := iif(UsaFidelizacion, 'S', 'N');
         ParamByName('USA_FIDELIZACION1').AsString := iif(UsaFidelizacion, 'S', 'N');
         ParamByName('FECHA').AsDateTime := Date;
         Open;
         if not IsEmpty then
         begin
            refDatosPrecio.FPrecio := FieldByName('PRECIO_VENTA').AsCurrency;
            refDatosPrecio.FPrecioTarifa := FieldByName('PRECIO_TARIFA').AsCurrency;
            refDatosPrecio.FIsPromocion := True;
            refDatosPrecio.FIDPromocion := FieldByName('ID_PROMOCION').AsInteger;
            refDatosPrecio.FPuntos := FieldByName('PUNTOS').AsInteger;
            refDatosPrecio.FTextoPromocion := FieldByName('TEXTO_PROMOCION').AsString;
            result := True;
            Exit;
         end;
      end;
   end;

   with Q_PRECIO_TARIFA do
   begin
      Close;
      ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      ParamByName('CODTAR').AsString := codtar;
      ParamByName('CODART').AsString := codart;
      Open;
      if not IsEmpty then
      begin
         refDatosPrecio.FPrecio := FieldByName('PRECIO_VENTA').AsCurrency;
         refDatosPrecio.FPrecioTarifa := FieldByName('PRECIO_VENTA').AsCurrency;
         refDatosPrecio.FIsPromocion := False;
         refDatosPrecio.FIDPromocion := -1;
         refDatosPrecio.FPuntos := 0;
         refDatosPrecio.FTextoPromocion := '';
         refDatosPrecio.FAhorro := 0;
         result := True;
      end
      else
         result := False;
   end;
end;

function TDMTarifas.GetConsultaTarifas: TDataSet;
begin
   result := TDataSet(Q_CONSULTA_TARIFAS);
end;

procedure TDMTarifas.AbrirConsultaTarifas;
begin
   Q_CONSULTA_TARIFAS.Close;
   Q_CONSULTA_TARIFAS.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
   Q_CONSULTA_TARIFAS.Open;
end;

function TDMTarifas.DameDesTarifas(Codigo: string): String;
begin
    with Q_BUSQUEDA_TARIFAS do
    begin
       Close;
       ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
       ParamByName('CODTAR').AsString := Codigo;
       Open;
       Codigo := FieldByName('DESTAR').AsString;
       Close;
    end;
    Result := Codigo;
end;

procedure TDMTarifas.BD_PonPrecioTarifaGeneral(articulo: TArticulo; PVP: Currency);
var
   Cliente: TCliente;
   InfoTienda: TInfoTienda;
   TipoImpuesto: TTipoImpuesto;
   Precio: Currency;
begin
   InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
   Cliente := TCliente.Create(nil);
   try
      Cliente.BD_Cargar(InfoTienda.ClientePorDefecto);

      TipoImpuesto := TTipoImpuesto.Create(DMImpuestos.GrupoActivo(Date), cliente.Id_trat_impuestos, articulo.CodImp);
      try
         Precio := iRedondeo(TipoImpuesto.DameBaseDeImporte(PVP), 4);
      finally
         TipoImpuesto.Free;
      end;
   finally
      InfoTienda.Free;
      Cliente.Free;
   end;

   MODIFICA_PRECIO_TARIFA.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
   MODIFICA_PRECIO_TARIFA.ParamByName('CODTAR').AsString := sTarifaGeneral;
   MODIFICA_PRECIO_TARIFA.ParamByName('CODART').AsString := articulo.Codart;
   MODIFICA_PRECIO_TARIFA.ParamByName('PRECIO_VENTA').AsCurrency := Precio;
   MODIFICA_PRECIO_TARIFA.ParamByName('PRECIO_TOTAL').AsCurrency := PVP;
   MODIFICA_PRECIO_TARIFA.Execute;

   if MODIFICA_PRECIO_TARIFA.RowsAffected = 0 then
   begin
      INSERTA_PRECIO_TARIFA.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      INSERTA_PRECIO_TARIFA.ParamByName('CODTAR').AsString := sTarifaGeneral;
      INSERTA_PRECIO_TARIFA.ParamByName('CODART').AsString := articulo.Codart;
      INSERTA_PRECIO_TARIFA.ParamByName('PRECIO_VENTA').AsCurrency := Precio;
      INSERTA_PRECIO_TARIFA.ParamByName('PRECIO_TOTAL').AsCurrency := PVP;
      INSERTA_PRECIO_TARIFA.Execute;
   end;
end;

procedure TDMTarifas.CheckCache;
begin
   if not Q_CACHE.Active then
   begin
      Q_CACHE.ParamByName('CODTIENDA').AsString := DMVariables.CodigoTienda;
      Q_CACHE.Open;
   end;
end;

procedure TDMTarifas.LimpiaCache;
begin
   Q_CACHE.Close;
end;

end.
