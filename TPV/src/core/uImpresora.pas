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

unit uImpresora;

interface

uses
   Windows, WinSpool, Printers, SysUtils, Classes, Variants, JvJCLUtils, dialogs;

const
   MapaCaracteres = #27 + #116 + #2;
   CaracterAvance = #13#10;
   CaracterEuro = #27 + #116 + #19 + #213;


procedure ImprimeRAW(Texto: String);
procedure SendControlCode(S: string);

implementation

procedure SendControlCode(S: string);
var
   Handle, hDeviceMode: THandle;
   N: DWORD;
   DocInfo1: TDocInfo1;
   Device, Driver, Port: array[0..255] of char;
   PrinterName: string;
   buf:array[0..255] of char;
   lbuf:integer;
begin
   Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
   PrinterName := Format('%s', [Device]);
   if not OpenPrinter(PChar(PrinterName), Handle, nil) then
      RaiseLastWin32Error;
   try
      with DocInfo1 do
      begin
         pDocName := 'Control';
         pOutputFile := nil;
         pDataType := 'RAW';
      end;
      StartDocPrinter(Handle, 1, @DocInfo1);
      try
         lbuf:=length(s);
         copymemory(@buf,Pchar(s),lbuf);
         if not WritePrinter(Handle, @buf, lbuf, N) then
            RaiseLastWin32Error;
      finally
         EndDocPrinter(Handle);
      end;
   finally
      ClosePrinter(Handle);
   end;
end;


procedure ImprimeRAW(Texto: String);
var
  hImpresora: THandle;
  BytesImpresos: DWORD;
  Documento:  DOC_INFO_1;
  Impresora, Driver, Puerto : array[0..255] of char;
  x: Integer;
  vTEXTO: PAnsichar;
begin

//   SendControlCode(#27+#82+#11);

   // HAY QUE AGREGAR LA UNIDAD WINSPOOL
   Printer.PrinterIndex := -1; //Impresora por defecto
   Printer.GetPrinter(Impresora, Driver, Puerto, hImpresora);
   if not WinSpool.OpenPrinter(@Impresora, hImpresora, nil) then
      RaiseLastOSError;

   with Documento do
   begin
     pDocName := PChar('Impresión directa a impresora...');
     pOutputFile := nil;
     pDataType := 'RAW';
   end;

   for x := 0 to 10 do
      Texto := Texto + CaracterAvance;

   vTEXTO := StrNew(PAnsiChar(AnsiString(Texto)));

   try
      CharToOem(Pchar(texto), vTEXTO); // Convierte la cadena de texto de ANSI a ASCII

      if StartDocPrinter(hImpresora, 1, @Documento) <= 0 then    //Inicia impresión.. solicitud de job
         RaiseLastOSError;

      if not StartPagePrinter(hImpresora) then                   //Prepara la página.. se va a comenzar a imprimir
         RaiseLastOSError;

      if not WritePrinter(hImpresora, vTexto , Length(vTexto), BytesImpresos) then //Pinta la cadena en la impresora
         RaiseLastOSError;

      if not EndPagePrinter(hImpresora) then // final de la página -> Salto de página.
         RaiseLastOSError;

      if not EndDocPrinter(hImpresora) then // Finaliza el trabajo de la impresora.
         RaiseLastOSError;

      if not ClosePrinter(hImpresora) then // finaliza el manejador de la impresora.
         RaiseLastOSError;
   finally
      StrDispose(vTEXTO);
   end;
end;


end.
