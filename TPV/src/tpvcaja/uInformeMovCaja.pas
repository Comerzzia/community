unit uInformeMovCaja;

interface
uses
   Classes, Dialogs, Variants, uInforme, DataMBase, SysUtils, DataMCore,
   fs_iInterpreter, fs_ipascal;

type
   TInformeMovimiento = class(TInforme)
//      fsScript1: TfsScript;
//      fsPascal1: TfsPascal;
   public
      procedure RegistraRuntime; override;
      constructor Create; override;
      procedure ComponerInforme; override;
   end;

implementation

uses
   iGeneral, fs_impresion;

(*******************************************************************************
* TInformeApartado                                                              *
*******************************************************************************)
constructor TInformeMovimiento.Create;
begin
   inherited Create;

   NombreInforme := 'movimientoCaja';
end;

procedure TInformeMovimiento.ComponerInforme;
begin
   CargaScript(DMCore.DameRutaRecurso('RPT\' + NombreInforme + '.txt'));
   EjecutaScript;
end;

procedure TInformeMovimiento.RegistraRuntime;
begin
   inherited;

   with Script.AddClass(TInformeMovimiento, 'TInforme') do
   begin
   end;
end;

end.
