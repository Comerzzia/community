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

unit ClasesControlDll;

interface

uses Classes, Windows, ClasesRecursos, Variants;

resourcestring
   NODLL    = 'ERROR [MACRO002]' + #13 + 'No se puede cargar (%s)';
   NOFUNDLL = 'ERROR [MACRO003]' + #13 + 'Función (%s) no encontrada en (%s)';

type
   TMpsControlDLL = class( TObject )
   private
      ListaFunciones : TStringList;
      ListaPunteros : TList;
   public
      Manejador : THandle;
      DLL : String;

      function DameFuncion( NombreFuncion : String ) : FARPROC;

      constructor Create( DLL, Archivo : String );
      destructor Destroy; override;
   end;

   TMpsControlDLLs = class( TObject )
   private
      ListaDLLs : TStringList;
      ListaHDLLs : TList;
      FAplicacion : TCustomMpsAplicacion;
   public
      RutaLocalCache : String;

      function DameFuncion( DLL, NombreFuncion : String ) : FARPROC;

      function CargaDLL( DLL : String ) : TMpsControlDll;

      constructor Create( Aplicacion : TCustomMpsAplicacion);
      destructor Destroy; override;
   end;

implementation

uses SysUtils;

function CargaDll(NombreDLL : String) : THandle;
var
   ErrorMode : Cardinal;

   procedure CheckError;
   var
      LastError: DWORD;
   begin
      LastError := GetLastError;

      raise Exception.CreateFmt('ERROR CARGANDO %s.'#13+' %s '#13+'Error Nº %d del Sistema',
                                 [ UpperCase(NombreDll),
                                  SysErrorMessage(LastError),
                                  LastError]);
   end;

begin
   Result    := 0;

   // CAMBIAR LA RUTA Y HACER PETICIONES
   NombreDLL := UpperCase(NombreDLL);

   ErrorMode := SetErrorMode(SEM_NOOPENFILEERRORBOX);
   try
      if Pos('.bpl', LowerCase(nombreDLL)) > 0 then
         Result := LoadPackage(PChar(nombreDLL))
      else
         Result := LoadLibrary(PChar(nombreDLL));

      if Result = 0 then
         CheckError;
   finally
      SetErrorMode(ErrorMode);
   end;
end;

constructor TMpsControlDLL.Create( DLL, Archivo : String );
begin
   ListaFunciones := TStringList.Create;
   ListaPunteros := TList.Create;

   Self.DLL := DLL;

   Manejador := CargaDll( Archivo );
end;

destructor TMpsControlDLL.Destroy;
begin
   ListaFunciones.Free;
   ListaPunteros.Free;

   inherited destroy;
end;

function TMpsControlDLL.DameFuncion( NombreFuncion : String ) : FARPROC;
var
   Posicion : Integer;
   Puntero : FARPROC;
begin
   if not ListaFunciones.Find( UpperCase(NombreFuncion), Posicion) then
   begin
      Puntero := GetProcAddress(Manejador, PChar(NombreFuncion) );

      if not Assigned(Puntero) then
//      if nPuntero = nil then
         raise Exception.CreateFmt(NOFUNDLL, [nombreFuncion, DLL]);

      ListaFunciones.Add( UpperCase(NombreFuncion) );
      ListaPunteros.Add( Puntero );
   end
   else Puntero := ListaPunteros[Posicion];

   Result := Puntero;
end;

constructor TMpsControlDLLs.Create( Aplicacion : TCustomMpsAplicacion);
begin
   ListaDLLs := TStringList.Create;
   ListaHDLLs := TList.Create;

   FAplicacion := Aplicacion;
end;

destructor TMpsControlDLLs.Destroy;
begin
   ListaDLLs.Free;
   ListaHDLLs.Free;

   inherited destroy;
end;

function TMpsControlDLLs.DameFuncion( DLL, NombreFuncion : String ) : FARPROC;
var
   Posicion : Integer;
   Control : TMpsControlDLL;
begin
   DLL := UpperCase(DLL);

   if not ListaDLLs.Find( DLL, Posicion) then
   begin
      Control := CargaDll( DLL );
   end
   else
      Control := TMpsControlDLL( ListaDLLs.Objects[Posicion] );

   Result := Control.DameFuncion(NombreFuncion);
end;

function TMpsControlDLLs.CargaDLL( DLL : String ) : TMpsControlDll;
var
   Control : TMpsControlDLL;
   Carpeta, NombreDLL, RutaAcceso, DLLDestino : String;
begin
   Carpeta := ExtractFilePath(DLL);
   NombreDll := ExtractFileName(DLL);

   RutaAcceso := FAplicacion.Recursos.AccesoArchivo( Carpeta, NombreDLL );

   if RutaAcceso = '' then Raise Exception.CreateFmt('La Dll %s no ha sido encontrada', [Carpeta + NombreDLL]);

   // CONTROL DE CACHE DE DLLS
//Se desactiva la cache de dlls   
//   if RutaLocalCache <> '' then
//   begin
//      ForceDirectories(RutaLocalCache);
//
//      DLLDestino := RutaLocalCache + NombreDLL;
//      Copiar := True;
//
//      // MIRAR LA VERSION DEL ARCHIVO SI EXISTE
//      if FindFirst(DLLDestino, faArchive, ArchivoDestino) = 0 then
//      begin
//         if FindFirst(RutaAcceso, faArchive, ArchivoOrigen) <> 0 then
//            Raise Exception.CreateFmt('No se encontro el archivo %s', [RutaAcceso]);
//
//         Copiar := ((ArchivoOrigen.Time <> ArchivoDestino.Time) or
//                    (ArchivoOrigen.Size <> ArchivoDestino.Size) );
//
//         FindClose(ArchivoOrigen);
//         FindClose(ArchivoDestino);
//      end;
//
//      if Copiar then
//      begin
//         iLog(LC_Advertencia, Format('Copiando %s'#13+'a local (%s)', [RutaAcceso, DLLDestino]));
//         FAplicacion.GestorTxRx.GestionaRecurso(RutaAcceso, DLLDestino);
//
//         if not FAplicacion.GestorTxRx.Ejecuta then
//            Raise Exception.Create('No se ha podido crear la imagen local de la DLL');
//      end;
//   end
//   else DLLDestino := RutaAcceso;

   DLLDestino := RutaAcceso;

   Control := TMpsControlDLL.Create( RutaAcceso, DLLDestino );

   ListaDLLs.AddObject( DLL, Control );

   Result := Control;
end;

end.
