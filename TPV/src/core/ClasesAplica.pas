//
// Copyright 2009-2011 RED.ES - Desarrollado por Tier1
// 
// Licencia con arreglo a la EUPL, versi�n 1.1 o -en cuanto 
// sean aprobadas por la comisi�n Europea- versiones 
// posteriores de la EUPL (la "Licencia").
// Solo podr� usarse esta obra si se respeta la Licencia.
// 
// http://ec.europa.eu/idabc/eupl.html
// 
// Salvo cuando lo exija la legislaci�n aplicable o se acuerde
// por escrito, el programa distribuido con arreglo a la
// Licencia se distribuye "TAL CUAL",
// SIN GARANT�AS NI CONDICIONES DE NING�N TIPO, 
// ni expresas ni impl�citas.
// V�ase la Licencia en el idioma concreto que rige
// los permisos y limitaciones que establece la Licencia.
//

unit ClasesAplica;

interface

uses
  SysUtils, Classes, XMLDoc, XMLIntf, ClasesParametros, ClasesRecursos, ClasesControlDll;

type
  TMpsAplicacion = class(TCustomMpsAplicacion)
  private
    FRutaBase : String;

    procedure SetRutaBase( Ruta : String );
  public
    ControlDLLs : TMpsControlDLLs;
    property RutaBase : String read FRutaBase write SetRutaBase;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses Forms;

constructor TMpsAplicacion.Create;
begin
   Parametros := TMpsParametros.Create;
   ControlDLLs := TMpsControlDLLs.Create(Self);
end;

destructor TMpsAplicacion.Destroy;
begin
   Parametros.Free;

   inherited Destroy;
end;

procedure TMpsAplicacion.SetRutaBase( Ruta : String );
begin
   if FRutaBase <> '' then Raise Exception.Create('Ya se especifico la ruta base para la aplicaci�n');

   FRutaBase := Ruta;
   Recursos := TMpsRecursos.Create(Self, Ruta);
   Recursos.CargaCarpetas;
end;

end.
