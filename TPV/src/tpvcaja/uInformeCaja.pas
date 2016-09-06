unit uInformeCaja;

interface
uses
   Classes, Dialogs, Variants, uInforme, DataMBase, SysUtils, DataMCore,
   fs_iInterpreter, fs_ipascal;

type
   TInformeCaja = class(TInforme)
      fsScript1: TfsScript;
      fsPascal1: TfsPascal;
   public
      procedure RegistraRuntime; override;
      constructor Create; override;
      procedure ComponerInforme; override;
   end;

implementation

uses
   iGeneral, fs_impresion;

(*******************************************************************************
* TInformeCaja                                                                *
*******************************************************************************)
constructor TInformeCaja.Create;
begin
   inherited Create;
   NombreInforme := 'cierrecaja';
end;

procedure TInformeCaja.ComponerInforme;
begin
   CargaScript(DMCore.DameRutaRecurso('RPT\' + NombreInforme + '.txt'));
   EjecutaScript;
end;

procedure TInformeCaja.RegistraRuntime;
begin
   inherited;

   with Script.AddClass(TInformeCaja, 'TInforme') do
   begin
   end;
end;

end.
