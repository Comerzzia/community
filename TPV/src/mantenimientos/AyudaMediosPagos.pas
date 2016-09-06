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

unit AyudaMediosPagos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, RzButton, ComCtrls, ImgList, ExtCtrls,
  Grids, DBGrids, RzDBGrid, RzPanel, StdCtrls, DataMMTOMediosPago, DB, ActnList,
  DataMMenu;

type
  TFrmAyudaMediosPagos = class(TFrmBase)
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
    S_MEDIO_PAGO: TDataSource;
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
    DMP: TDMMediosPago;
    procedure ControlBotones;
  public
    { Public declarations }
    class procedure Crea(Titulo: String ; Accion : TMenuItemCargador); override;
    procedure Inicializa; override;
  end;

var
  FrmAyudaMediosPagos: TFrmAyudaMediosPagos;

implementation

{$R *.dfm}

class procedure TFrmAyudaMediosPagos.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
 //
end;

procedure TFrmAyudaMediosPagos.Inicializa;
begin
 //
end;

procedure TFrmAyudaMediosPagos.BtnBuscarAnteriorClick(Sender: TObject);
begin
   inherited;
   if S_MEDIO_PAGO.DataSet.Active then
      S_MEDIO_PAGO.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmAyudaMediosPagos.BtnBuscarPrimeroClick(Sender: TObject);
begin
   inherited;
   if S_MEDIO_PAGO.DataSet.Active then
      S_MEDIO_PAGO.DataSet.First;
   ControlBotones;
end;

procedure TFrmAyudaMediosPagos.BtnBuscarSiguienteClick(Sender: TObject);
begin
   inherited;
   if S_MEDIO_PAGO.DataSet.Active then
      S_MEDIO_PAGO.DataSet.Next;
   ControlBotones;
end;

procedure TFrmAyudaMediosPagos.BtnBuscarUltimoClick(Sender: TObject);
begin
   inherited;
   if S_MEDIO_PAGO.DataSet.Active then
      S_MEDIO_PAGO.DataSet.Last;
   ControlBotones;
end;

procedure TFrmAyudaMediosPagos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

procedure TFrmAyudaMediosPagos.FormCreate(Sender: TObject);
begin
   inherited;
   //Iniciar clases de datos
   DMP := TDMMediosPago.Create(Self);

   //Inicia DataSet
   S_MEDIO_PAGO.DataSet := DMP.GetConsultaMediosPagos;

   //Abre la Consulta
   DMP.AbrirConsultaMediosPagos;

   //Iniciar controles visuales
   ControlBotones;
end;

procedure TFrmAyudaMediosPagos.GridImpuestoDblClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaMediosPagos.BtnAceptarClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaMediosPagos.ControlBotones;
begin
   BtnBuscarPrimero.Enabled := not (S_MEDIO_PAGO.DataSet.Bof);
   BtnBuscarAnterior.Enabled := not (S_MEDIO_PAGO.DataSet.Bof);
   BtnBuscarSiguiente.Enabled := not (S_MEDIO_PAGO.DataSet.Eof);
   BtnBuscarUltimo.Enabled := not (S_MEDIO_PAGO.DataSet.Eof);

   BtnAceptar.Visible := not (S_MEDIO_PAGO.DataSet.Bof and S_MEDIO_PAGO.DataSet.Eof);
end;

end.
