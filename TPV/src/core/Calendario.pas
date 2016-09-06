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

unit Calendario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, RzButton, ComCtrls, ImgList, ExtCtrls,
  ActnList, RzPanel, RzPopups;

type
  TFrmCalendario = class(TFrmBase)
    ImagenesFechaCierre: TImageList;
    Panel1: TPanel;
    BtnAceptarFecha: TRzBitBtn;
    BtnCancelarBuscarArticulo: TRzBitBtn;
    Calendario: TRzCalendar;
    procedure BtnAceptarFechaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCalendario: TFrmCalendario;

implementation

{$R *.dfm}

procedure TFrmCalendario.FormCreate(Sender: TObject);
begin
  inherited;

   Calendario.Date := Date;
end;

procedure TFrmCalendario.BtnAceptarFechaClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

end.
