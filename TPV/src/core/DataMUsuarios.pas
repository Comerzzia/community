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

unit DataMUsuarios;

interface

uses
  SysUtils, Classes, DB, Uni, DBAccess, MemDS, DataMBase;

type
  TDMUsuarios = class(TDMBase)
    Q_IDU: TUniQuery;
    Q_USUARIO: TUniQuery;
    Q_LISTA_USUARIOS: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetDataSetListaUsuarios: TDataSet;
    function DameIDU(CodigoUsuario: String): Integer;
  end;

var
  DMUsuarios: TDMUsuarios;

implementation

{$R *.dfm}

function TDMUsuarios.DameIDU(CodigoUsuario: string): Integer;
begin
   Q_IDU.Close;
   Q_IDU.ParamByName('USUARIO').AsString := CodigoUsuario;
   Q_IDU.Open;
   if Q_IDU.IsEmpty then
      raise Exception.Create('No se ha encontrado el usuario: ' + CodigoUsuario)
   else
      result := Q_IDU.FieldByName('ID_USUARIO').AsInteger;
end;

function TDMUsuarios.GetDataSetListaUsuarios: TDataSet;
begin
   Q_LISTA_USUARIOS.Close;
   Q_LISTA_USUARIOS.Open;
   result := Q_LISTA_USUARIOS;
end;

end.
