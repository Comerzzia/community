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

unit AyudaImpuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, RzButton, ComCtrls, ImgList, ExtCtrls,
  Grids, DBGrids, RzDBGrid, RzPanel, StdCtrls, DataMImpuestos, DB;

type
  TFrmAyudaImpuesto = class(TFrmBase)
    Panel1: TPanel;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    Label1: TLabel;
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    GridImpuesto: TRzDBGrid;
    RzPanel2: TRzPanel;
    BtnBuscarImpuestoPrimero: TRzToolButton;
    BtnBuscarImpuestoAnterior: TRzToolButton;
    BtnBuscarImpuestoSiguiente: TRzToolButton;
    BtnBuscarImpuestoUltimo: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    ImagenesImpuestos: TImageList;
    S_IMPUESTO: TDataSource;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnBuscarImpuestoPrimeroClick(Sender: TObject);
    procedure BtnBuscarImpuestoSiguienteClick(Sender: TObject);
    procedure BtnBuscarImpuestoUltimoClick(Sender: TObject);
    procedure BtnBuscarImpuestoAnteriorClick(Sender: TObject);
    procedure GridImpuestoDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlBotones;
  public
    { Public declarations }
    class procedure Crea(Titulo, Accion: String); override;
    procedure Inicializa; override;
  end;

var
  FrmAyudaImpuesto: TFrmAyudaImpuesto;

implementation

{$R *.dfm}

class procedure TFrmAyudaImpuesto.Crea(Titulo, Accion: String);
begin
 //
end;

procedure TFrmAyudaImpuesto.Inicializa;
begin
 //
end;

procedure TFrmAyudaImpuesto.BtnBuscarImpuestoAnteriorClick(Sender: TObject);
begin
   inherited;
   if S_IMPUESTO.DataSet.Active then
      S_IMPUESTO.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmAyudaImpuesto.BtnBuscarImpuestoPrimeroClick(Sender: TObject);
begin
   inherited;
   if S_IMPUESTO.DataSet.Active then
      S_IMPUESTO.DataSet.First;
   ControlBotones;
end;

procedure TFrmAyudaImpuesto.BtnBuscarImpuestoSiguienteClick(Sender: TObject);
begin
   inherited;
   if S_IMPUESTO.DataSet.Active then
      S_IMPUESTO.DataSet.Next;
   ControlBotones;
end;

procedure TFrmAyudaImpuesto.BtnBuscarImpuestoUltimoClick(Sender: TObject);
begin
   inherited;
   if S_IMPUESTO.DataSet.Active then
      S_IMPUESTO.DataSet.Last;
   ControlBotones;
end;

procedure TFrmAyudaImpuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

procedure TFrmAyudaImpuesto.FormCreate(Sender: TObject);
begin
   inherited;

   //Inicia DataSet
   S_IMPUESTO.DataSet := DMImpuestos.GetConsultaImpuesto;

   //Abre la Consulta
   DMImpuestos.AbrirConsultaImpuesto;

   //Iniciar controles visuales
   ControlBotones;
end;

procedure TFrmAyudaImpuesto.GridImpuestoDblClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaImpuesto.BtnAceptarClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaImpuesto.ControlBotones;
begin
   BtnBuscarImpuestoPrimero.Enabled := not (S_IMPUESTO.DataSet.Bof);
   BtnBuscarImpuestoAnterior.Enabled := not (S_IMPUESTO.DataSet.Bof);
   BtnBuscarImpuestoSiguiente.Enabled := not (S_IMPUESTO.DataSet.Eof);
   BtnBuscarImpuestoUltimo.Enabled := not (S_IMPUESTO.DataSet.Eof);

   BtnAceptar.Visible := not (S_IMPUESTO.DataSet.Bof and S_IMPUESTO.DataSet.Eof);   
end;

end.
