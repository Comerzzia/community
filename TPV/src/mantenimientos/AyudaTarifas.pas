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

unit AyudaTarifas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, RzButton, ComCtrls, ImgList, ExtCtrls,
  Grids, DBGrids, RzDBGrid, RzPanel, StdCtrls, DataMMTOTarifas, DB, ActnList,
  DataMMenu;

type
  TFrmAyudaTarifas = class(TFrmBase)
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
    S_TARIFAS: TDataSource;
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
    DMT: TDMTarifas;
    procedure ControlBotones;
  public
    { Public declarations }
    class procedure Crea(Titulo: String ; Accion : TMenuItemCargador); override;
    procedure Inicializa; override;
  end;

var
  FrmAyudaTarifas: TFrmAyudaTarifas;

implementation

{$R *.dfm}

class procedure TFrmAyudaTarifas.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
 //
end;

procedure TFrmAyudaTarifas.Inicializa;
begin
 //
end;

procedure TFrmAyudaTarifas.BtnBuscarAnteriorClick(Sender: TObject);
begin
   inherited;
   if S_TARIFAS.DataSet.Active then
      S_TARIFAS.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmAyudaTarifas.BtnBuscarPrimeroClick(Sender: TObject);
begin
   inherited;
   if S_TARIFAS.DataSet.Active then
      S_TARIFAS.DataSet.First;
   ControlBotones;
end;

procedure TFrmAyudaTarifas.BtnBuscarSiguienteClick(Sender: TObject);
begin
   inherited;
   if S_TARIFAS.DataSet.Active then
      S_TARIFAS.DataSet.Next;
   ControlBotones;
end;

procedure TFrmAyudaTarifas.BtnBuscarUltimoClick(Sender: TObject);
begin
   inherited;
   if S_TARIFAS.DataSet.Active then
      S_TARIFAS.DataSet.Last;
   ControlBotones;
end;

procedure TFrmAyudaTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

procedure TFrmAyudaTarifas.FormCreate(Sender: TObject);
begin
   inherited;
   //Iniciar clases de datos
   DMT := TDMTarifas.Create(Self);

   //Inicia DataSet
   S_TARIFAS.DataSet := DMT.GetConsultaTarifas;

   //Abre la Consulta
   DMT.AbrirConsultaTarifas;

   //Iniciar controles visuales
   ControlBotones;
end;

procedure TFrmAyudaTarifas.GridImpuestoDblClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaTarifas.BtnAceptarClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmAyudaTarifas.ControlBotones;
begin
   BtnBuscarPrimero.Enabled := not (S_TARIFAS.DataSet.Bof);
   BtnBuscarAnterior.Enabled := not (S_TARIFAS.DataSet.Bof);
   BtnBuscarSiguiente.Enabled := not (S_TARIFAS.DataSet.Eof);
   BtnBuscarUltimo.Enabled := not (S_TARIFAS.DataSet.Eof);

   BtnAceptar.Visible := not (S_TARIFAS.DataSet.Bof and S_TARIFAS.DataSet.Eof);
end;

end.
