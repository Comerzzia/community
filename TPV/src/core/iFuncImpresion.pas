unit iFuncImpresion;

interface
uses
   SysUtils;

function FormateaFecha(Cadena: String): String;
function FormateaFechaHoraTef(Cadena: String): String;

implementation
uses
   DataMTienda;

//Formate la fecha pasada como cadena para la impresión de un ticket
function FormateaFecha(Cadena: String): String;
var
   Fecha: TDateTime;
   a, m, d: Word;
begin
   //la fecha viene en este formato
   //'yyyy-mm-dd''T''hh:nn:ss'
   a := StrToInt(Copy(Cadena, 1, 4));
   m := StrToInt(Copy(Cadena, 6, 2));
   d := StrToInt(Copy(Cadena, 9, 2));

   Fecha := EncodeDate(a, m, d);
   FormatDateTime('dd/mm/yyyy', Fecha);
end;

//Formatea la fecha hora para el recibo tef
function FormateaFechaHoraTef(Cadena: String): String;
var
   Fecha, Hora: TDateTime;
   a, m, d, h, n: Word;
begin
   //la fecha viene en este formato
   //'yyyy-mm-dd''T''hh:nn:ss'

   a := StrToInt(Copy(Cadena, 1, 4));
   m := StrToInt(Copy(Cadena, 6, 2));
   d := StrToInt(Copy(Cadena, 9, 2));
   h := StrToInt(Copy(Cadena, 12, 2));
   n := StrToInt(Copy(Cadena, 15, 2));
   Fecha := EncodeDate(a, m, d);
   Hora := EncodeTime(h, n, 0, 0);
   result := FormatDateTime('dd/mm/yyyy', Fecha) + ' ' + FormatDateTime('hh:nn', Hora);
end;

end.
