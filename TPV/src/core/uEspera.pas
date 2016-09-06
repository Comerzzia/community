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

unit uEspera;

interface
uses
   Forms, FormEspera;

procedure PonEspera(Mensaje: String; PuedeAbortar: Boolean);
function ActualizaEspera(Mensaje: String; PuedeAbortar: Boolean; TotalCompletado, Total: Integer): Boolean; overload;
function ActualizaEspera: Boolean; overload;
function EsperaActiva: Boolean;
procedure FinEspera;


implementation

procedure PonEspera(Mensaje: String; PuedeAbortar: Boolean);
begin
   if FrmEspera = nil then
      FrmEspera := TFrmEspera.Create(Application);

   FrmEspera.Abortado := False;

   ActualizaEspera(Mensaje, PuedeAbortar, 0, 0);

   try
      if not FrmEspera.Focused then
         FrmEspera.SetFocus;
   except
   end;
end;

function ActualizaEspera: Boolean;
begin
   if FrmEspera <> nil then
      FrmEspera.Refresh;
   result := true;
end;


function ActualizaEspera(Mensaje: String; PuedeAbortar: Boolean; TotalCompletado, Total: Integer): Boolean;
begin
   if FrmEspera = nil then
      FrmEspera := TFrmEspera.Create(Application);

   if not FrmEspera.Visible then
      FrmEspera.Show;

   result := FrmEspera.Actualiza(Mensaje, PuedeAbortar, TotalCompletado, Total);
end;

function EsperaActiva: Boolean;
begin
   if (FrmEspera <> nil) then
      Result := FrmEspera.Visible
   else
      Result := False;
end;

procedure FinEspera;
begin
   if FrmEspera <> nil then
   begin
      FrmEspera.CerrarEspera;
   end;
end;

end.
