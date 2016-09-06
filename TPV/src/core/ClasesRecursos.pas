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

unit ClasesRecursos;

interface

uses
  SysUtils, Classes, XMLDoc, XMLIntf, ClasesParametros;

type
  TMpsRecursos = class;

  TCustomMpsAplicacion = class(TObject)
  public
    Recursos : TMpsRecursos;
    Parametros : TMpsParametros;
  end;

  TMpsRecursos = class(TObject)
  private
    ListaCarpetas : TStringList;

    FAplicacion : TCustomMpsAplicacion;

    procedure LimpiaCarpetas;
  public
    RutaTmp : String;

    RutaRaiz : String;

    RutaLocalRecursos : String;
    RutaRemotaRecursos : String;

    RutaLocalRecursosAlt : String;
    RutaRemotaRecursosAlt : String;

    procedure CargaCarpetas;
    
    function DameRutaRecurso( Recurso : String ) : String;

    function AccesoArchivo( Ruta, Archivo : String ) : String;
    procedure AccesoArchivos( Ruta : String ; Archivos : variant );

    procedure DameListaArchivos( Ruta, Mascara : String ; Lista : TStrings );

    function RutaCompleta( Directorio : String ) : String;
    procedure AseguraDirectorio( Directorio : String);

    constructor Create(Aplicacion : TCustomMpsAplicacion ; RaizDespliegue : String );
    destructor Destroy; override;
  end;

  TMpsCarpeta = class(TObject)
  private
     FRuta : String;

     FRecursos : TMpsRecursos;
     ListaRecursos : TStringList;

     FListasCargadas : Boolean;

     procedure CargaDirectorios;
     procedure LimpiaRecursos;
  public
     function DameRutaRecurso( Recurso : String ) : String;
     procedure ActualizaRecursos( Archivos : variant );

     procedure DameListaArchivos( Mascara : String ; Lista : TStrings );

     constructor Create( Recursos : TMpsRecursos ; Ruta : String );
     destructor Destroy; override;
  end;


  TMpsRecurso = class(TObject)
  public
     RutaLocal : String;
     Nombre : String;
//     Tamano : Integer;
//     Fecha : TDateTime;

     Actualizado : Boolean;

     RutaRemota : String;

     constructor Create;
     destructor Destroy; override;
  end;

implementation

uses Variants, JvJCLUtils, StrUtils, Windows, Dialogs, Masks, Forms, iGeneral;

constructor TMpsRecurso.Create;
begin
end;

destructor TMpsRecurso.Destroy;
begin
   inherited Destroy;
end;

constructor TMpsCarpeta.Create( Recursos : TMpsRecursos ; Ruta : String );
begin
   FRuta := Ruta;
   FRecursos := Recursos;

   ListaRecursos := TStringList.Create;
   ListaRecursos.Sorted := True;
   ListaRecursos.Duplicates := dupIgnore;
end;

destructor TMpsCarpeta.Destroy;
begin
   LimpiaRecursos;

   ListaRecursos.Free;
   
   inherited Destroy;
end;

procedure TMpsCarpeta.CargaDirectorios;
   procedure RegistraRecurso( Nombre : String ; RutaLocal, RutaRemota : String ; Actualizado : Boolean );
   var
      Indice : Integer;
      Recurso : TMpsRecurso;
   begin
      Indice := ListaRecursos.IndexOf(UpperCase(Nombre));

      if Indice = -1 then
      begin
         ListaRecursos.Add(UpperCase(Nombre));
         Indice := ListaRecursos.IndexOf(UpperCase(Nombre));

         Recurso := TMpsRecurso.Create;
         Recurso.Nombre := Nombre;
         Recurso.RutaLocal := RutaLocal + Nombre;

         if RutaRemota <> '' then Recurso.RutaRemota := RutaRemota + FRuta + Nombre;

         Recurso.Actualizado := Actualizado;

         ListaRecursos.Objects[Indice] := Recurso;
      end;
   end;

   procedure CargaDirectorio( CarpetaLocal, CarpetaRemota : String );
   var
      Archivo : TSearchRec;
   begin
      if CarpetaRemota = '' then
      begin
         // CARGAR LISTA DE DIRECTORIO, SIN PASAR POR EL XML
         if FindFirst(CarpetaLocal + '*.*', faAnyFile, Archivo) = 0 then
         begin
            repeat
               if not (Archivo.Attr = FaDirectory) and not (Archivo.Attr = faVolumeID) then
                  RegistraRecurso(Archivo.Name, CarpetaLocal, CarpetaRemota, True);
            until FindNext(Archivo) <> 0;

            SysUtils.FindClose(Archivo);
         end;
      end;
   end;
begin
   if FListasCargadas then Exit;

   LimpiaRecursos;
   
   // DIRECTORIO DE RECURSOSALT
   if FRecursos.RutaLocalRecursosAlt <> '' then
      CargaDirectorio( FRecursos.RutaCompleta(FRecursos.RutaLocalRecursosAlt) + FRuta,
                       FRecursos.RutaRemotaRecursosAlt );

   // DIRECTORIO DE RECURSOS
   CargaDirectorio(FRecursos.RutaCompleta(FRecursos.RutaLocalRecursos) + FRuta,
                   FRecursos.RutaRemotaRecursos );


   // SI NO SE ACTUALIZA (NO HAY RUTAS REMOTAS), NO DAR NUNCA POR CARGADA LA RUTA
   if (FRecursos.RutaRemotaRecursos = '') and (FRecursos.RutaRemotaRecursosAlt = '') then
      FListasCargadas := False
   else
      FListasCargadas := True;
end;


procedure TMpsCarpeta.LimpiaRecursos;
var
   x : Integer;
begin
   for x := 0 to ListaRecursos.Count -1 do
      TMpsRecurso(ListaRecursos.Objects[x]).Free;

   ListaRecursos.Clear;
   FListasCargadas := False;
end;

function TMpsCarpeta.DameRutaRecurso( Recurso : String ) : String;
var
   Indice : Integer;
begin
   CargaDirectorios;

   Indice := ListaRecursos.IndexOf(UpperCase(Recurso));

   if Indice = -1 then
      Result := ''
   else Result := TMpsRecurso(ListaRecursos.Objects[Indice]).RutaLocal;
end;

procedure TMpsCarpeta.ActualizaRecursos( Archivos : variant );
var
   x, Indice : Integer;
begin
   CargaDirectorios;

   for x := VarArrayLowBound(Archivos, 1) to VarArrayHighBound(Archivos, 1) do
   begin
      Indice := ListaRecursos.IndexOf(UpperCase(Archivos[x]));

      if Indice = -1 then Raise Exception.CreateFmt('El archivo %s no existe en la ruta %s', [Archivos[x], FRuta]);
   end;
end;

procedure TMpsCarpeta.DameListaArchivos( Mascara : String ; Lista : TStrings );
var
   x: Integer;
begin
   CargaDirectorios;

   Lista.Clear;

   for x := 0 to ListaRecursos.Count -1 do
      if MatchesMask( ListaRecursos[x], Mascara ) then
         Lista.Add(TMpsRecurso(ListaRecursos.Objects[x]).Nombre );
end;

//*************************************************************************


constructor TMpsRecursos.Create( Aplicacion : TCustomMpsAplicacion ; RaizDespliegue : String );
begin
   ListaCarpetas := TStringList.Create;
   ListaCarpetas.Sorted := True;
   ListaCarpetas.Duplicates := dupIgnore;

   RutaTmp := DirectorioTemporalWindows;

   FAplicacion := Aplicacion;

   // CREAR RUTAS BASICAS
   RutaLocalRecursos     := FAplicacion.Parametros.DameValorParametroPersis('DESPLIEGUE.RECURSOS.RUTALOCAL');
   if RutaLocalRecursos = '' then
      RutaLocalRecursos := '..\RES\';

   if Copy(RutaLocalRecursos, 1, 3) = '..\' then
      RutaLocalRecursos := AnsiReplaceStr(UpperCase(ExtractFilePath(Application.ExeName)), 'BIN\', '') + Copy(RutaLocalRecursos, 4, 255);

   RutaRemotaRecursos    := FAplicacion.Parametros.DameValorParametroPersis('DESPLIEGUE.RECURSOS.RUTAREMOTA');

   RutaLocalRecursosAlt  := FAplicacion.Parametros.DameValorParametroPersis('DESPLIEGUE.RECURSOSALT.RUTALOCAL');

   if Copy(RutaLocalRecursosAlt, 1, 3) = '..\' then
      RutaLocalRecursosAlt :=AnsiReplaceStr(UpperCase(ExtractFilePath(Application.ExeName)), 'BIN\', '') + Copy(RutaLocalRecursosAlt, 4, 255);

   RutaRemotaRecursosAlt := FAplicacion.Parametros.DameValorParametroPersis('DESPLIEGUE.RECURSOSALT.RUTAREMOTA');

   if RutaLocalRecursos = '' then Raise Exception.Create('No se ha especificado ruta local de recursos');

   // RUTAS LOCALES
   if (Pos(':', RutaLocalRecursos) = 0) then
      RutaRaiz := RutaCompleta(RaizDespliegue)
   else RutaRaiz := RutaCompleta(RutaLocalRecursos);

   AseguraDirectorio(RutaRaiz);

//   if RutaLocalRecursosAlt = '^' then RutaLocalRecursosAlt := '';

   if RutaLocalRecursosAlt <> '' then AseguraDirectorio( RutaLocalRecursos );

   // RUTAS REMOTAS
//   if RutaRemotaRecursos = '^' then RutaRemotaRecursos := '';
//   if RutaRemotaRecursosAlt = '^' then RutaRemotaRecursosAlt := '';
end;

destructor TMpsRecursos.Destroy;
begin
   ListaCarpetas.Free;

   inherited Destroy;
end;

procedure TMpsRecursos.LimpiaCarpetas;
var
   x : Integer;
begin
   for x := 0 to ListaCarpetas.Count -1 do
      TMpsCarpeta(ListaCarpetas.Objects[x]).Free;

   ListaCarpetas.Clear;
end;

procedure TMpsRecursos.CargaCarpetas;
var
   y : Integer;
   Carpeta : TMpsCarpeta;

   procedure CargaEstructuraDirectorio( CarpetaRaiz, CarpetaOrigen : String );
   var
      Archivo : TSearchRec;
      NombreCarpeta : String;
   begin
      if CarpetaOrigen = CarpetaRaiz then NombreCarpeta := '\'
      else NombreCarpeta := Copy( CarpetaOrigen, Length(CarpetaRaiz)+1, 255);

      ListaCarpetas.Add(NombreCarpeta);

      if FindFirst(CarpetaOrigen + '*.*', faDirectory, Archivo) = 0 then
      begin
         repeat
            if (Archivo.Attr = faDirectory) and
               (Archivo.Name <> '.') and
               (Archivo.Name <> '..') then
            begin
               // COPIA RECURSIVA DE DIRECTORIOS
               CargaEstructuraDirectorio( CarpetaRaiz, CarpetaOrigen + Archivo.Name + '\' );
            end;
         until FindNext(Archivo) <> 0;

         SysUtils.FindClose(Archivo);
      end;
   end;
begin
   LimpiaCarpetas;

   // Se encargan de bajar los ResDir.xml, crear los directorios
   // borrar carpetas sobrantes y borrar el dir.xml de los directorios
   // donde han cambiado ficheros
   CargaEstructuraDirectorio(RutaCompleta(RutaLocalRecursos), RutaLocalRecursos);
   CargaEstructuraDirectorio(RutaCompleta(RutaLocalRecursosAlt), RutaLocalRecursosAlt);   

   for y := 0 to ListaCarpetas.Count -1 do
   begin
      Carpeta := TMpsCarpeta.Create(Self, ListaCarpetas[y]);

      ListaCarpetas.Objects[y] := Carpeta;
   end;
end;

function TMpsRecursos.RutaCompleta( Directorio : String) : String;
begin
   if (Pos(':', Directorio) = 0) and (RutaRaiz <> '') then
      Directorio := RutaRaiz + Directorio;

   if Copy(Directorio, Length(Directorio), 1) <> '\' then
      Directorio := Directorio + '\';

   Result := Directorio;
end;

procedure TMpsRecursos.AseguraDirectorio( Directorio : String);
begin
   Directorio := RutaCompleta( Directorio );

   if not DirectoryExists(Directorio) then
      if SysUtils.ForceDirectories(Directorio) then
        Raise Exception.CreateFmt('El directorio %s no se pudo crear', [Directorio]);
end;


// DEVUELVE LA RUTA AL RECURSO
function TMpsRecursos.AccesoArchivo( Ruta, Archivo : String ) : String;
begin
   Result := DameRutaRecurso(Ruta + Archivo);

   if Result <> '' then
      AccesoArchivos( Ruta, VarArrayOf([Archivo]));
end;

procedure TMpsRecursos.AccesoArchivos( Ruta : String ; Archivos : variant );
var
   Indice : Integer;
   Carpeta : TMpsCarpeta;
begin
   // BUSCAR RUTA
   Indice := ListaCarpetas.IndexOf(UpperCase(Ruta));

   if Indice = -1 then
      Raise Exception.CreateFmt('La ruta "%s" no esta registrada como recurso.', [Ruta]);

   Carpeta := TMpsCarpeta(ListaCarpetas.Objects[Indice]);

   Carpeta.ActualizaRecursos(Archivos);
end;

function TMpsRecursos.DameRutaRecurso( Recurso : String ) : String;
var
   Indice : Integer;
   Carpeta : TMpsCarpeta;
   Ruta : String;
begin
   Ruta := UpperCase(ExtractFilePath(Recurso));

   // BUSCAR RUTA
   Indice := ListaCarpetas.IndexOf(Ruta);

   if Indice = -1 then
      Raise Exception.CreateFmt('La ruta "%s" no esta registrada como recurso', [Ruta]);

   Carpeta := TMpsCarpeta(ListaCarpetas.Objects[Indice]);

   Result := Carpeta.DameRutaRecurso(ExtractFileName(Recurso));
end;

procedure TMpsRecursos.DameListaArchivos( Ruta, Mascara : String ; Lista : TStrings );
var
   Indice : Integer;
   Carpeta : TMpsCarpeta;

begin
   Ruta := UpperCase(Ruta);

   // BUSCAR RUTA
   Indice := ListaCarpetas.IndexOf(Ruta);

   if Indice >= 0 then
   begin
      Carpeta := TMpsCarpeta(ListaCarpetas.Objects[Indice]);

      Carpeta.DameListaArchivos(Mascara, Lista);
   end;
end;

end.
