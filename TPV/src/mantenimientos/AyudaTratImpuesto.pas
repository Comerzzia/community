//
// Copyright 2009-2011 RED.ES - Desarrollado por MP Sistemas
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

unit AyudaTratImpuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, RzButton, ComCtrls, ImgList, ExtCtrls,
  Grids, DBGrids, RzDBGrid, RzPanel, StdCtrls, DataMImpuestos, DB, ActnList;

type
  TFrmAyudaTratImpuesto = class(TFrmBase)
    Panel1: TPanel;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    Label1: TLabel;
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    GridImpuesto: TRzDBGrid;
    RzPanel2: TRzPanel;
    BtnBuscarPrimero: TRzToolButton;
    BtnBuscarAnterior: TRzToolButton;
    BtnBuscarSiguiente: TRzToolButton;
    BtnBuscarUltimo: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    ImagenesImpuestos: TImageList;
    S_TRAT_IMPUESTOS: TDataSource;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnBuscarPrimeroClick(Sender: TObject);
    procedure BtnBuscarSiguienteClick(Sender: TObject);
    procedure BtnBuscarUltimoClick(Sender: TObject);
    procedure BtnBuscarAnteriorClick(Sender: TObject);
    procedure GridImpuestoDblClick(Sender: TObject);
  private
    { Private declarations }
    DMI: TDMImpuestos;
    procedure ControlBotones;
  public
    { Public declarations }
    class procedure Crea(Titulo, Accion: String); override;
    procedure Inicializa; override;
  end;

var
  FrmAyudaTratImpuesto: TFrmAyudaTratImpuesto;

implementation

{$R *.dfm}

class procedure TFrmAyudaTratImpuesto.Crea(Titulo, Accion: String);
begin
 //
end;

procedure TFrmAyudaTratImpuesto.Inicializa;
begin
 //
end;


procedure TFrmAyudaTratImpuesto.BtnBuscarAnteriorClick(Sender: TObject);
begin
   inherited;
   if S_TRAT_IMPUESTOS.DataSet.Active then
      S_TRAT_IMPUESTOS.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmAyudaTratImpuesto.BtnBuscarPrimeroClick(Sender: TObject);
begin
   inherited;
   if S_TRAT_IMPUESTOS.DataSet.Active then
      S_TRAT_IMPUESTOS.DataSet.First;
   ControlBotones;
end;

procedure TFrmAyudaTratImpuesto.BtnBuscarSiguienteClick(Sender: TObject);
begin
   inherited;
   if S_TRAT_IMPUESTOS.DataSet.Active then
      S_TRAT_IMPUESTOS.DataSet.Next;
   ControlBotones;
end;

procedure TFrmAyudaTratImpuesto.BtnBuscarUltimoClick(Sender: TObject);
begin
   inherited;
   if S_TRAT_IMPUESTOS.DataSet.Active then
      S_TRAT_IMPUESTOS.DataSet.Last;
   ControlBotones;
end;

procedure TFrmAyudaTratImpuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

procedure TFrmAyudaTratImpuesto.FormCreate(Sender: TObject);
begin
   inherited;
   //Iniciar clases de datos
   DMI := TDMImpuestos.Create(Self);

   //Inicia DataSet
   S_TRAT_IMPUESTOS.DataSet := DMI.GetConsultaTratImpuestos;

   //Abre la Consulta
   DMI.AbrirConsultaTratImpuestos;

   //Iniciar controles visuales
   ControlBotones;
end;

procedure TFrmAyudaTratImpuesto.GridImpuestoDblClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaTratImpuesto.BtnAceptarClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaTratImpuesto.ControlBotones;
begin
   BtnBuscarPrimero.Enabled := not (S_TRAT_IMPUESTOS.DataSet.Bof);
   BtnBuscarAnterior.Enabled := not (S_TRAT_IMPUESTOS.DataSet.Bof);
   BtnBuscarSiguiente.Enabled := not (S_TRAT_IMPUESTOS.DataSet.Eof);
   BtnBuscarUltimo.Enabled := not (S_TRAT_IMPUESTOS.DataSet.Eof);

   BtnAceptar.Visible := not (S_TRAT_IMPUESTOS.DataSet.Bof and S_TRAT_IMPUESTOS.DataSet.Eof);
end;

end.
