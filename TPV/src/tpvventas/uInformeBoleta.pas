unit uInformeBoleta;

interface
uses
   Classes, Dialogs, Variants, uInforme, DataMBase, SysUtils, DataMCore,
   fs_iInterpreter, fs_ipascal;

type
   TInformeBoleta = class(TInforme)
   public
      procedure RegistraRuntime; override;

      constructor Create; override;
      procedure ComponerInforme; override;
   end;

implementation

uses
   fs_impresion, XMLIntf, XMLDoc;

(*******************************************************************************
* TInformeBoleta                                                               *
*******************************************************************************)
constructor TInformeBoleta.Create;
begin
   inherited Create;
   NombreInforme := 'boleta';
end;

procedure TInformeBoleta.ComponerInforme;
begin
   CargaScript(DMCore.DameRutaRecurso('RPT\' + NombreInforme + '.txt'));
   EjecutaScript;
end;

procedure TInformeBoleta.RegistraRuntime;
begin
   inherited;

   with Script.AddClass(TInformeBoleta, 'TInforme') do
   begin
   end;
end;



end.
