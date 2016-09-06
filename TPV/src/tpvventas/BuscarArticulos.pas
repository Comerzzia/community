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

unit BuscarArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTouchKeyboard, RzButton, Grids, DBGrids, RzDBGrid, StdCtrls, Mask,
  RzEdit, RzPanel, ExtCtrls, ImgList, DB, FormBase, RzCommon,
  RzForms, DataMArticulo, uMensajeDialog, uEspera, DataMCore, GridsEh, DBGridEh,
  ActnList;

resourcestring
   STR_SeleccionarArticulo = 'Debe seleccionar un artículo para poder continuar';
   STR_Consultando = 'Consultando';

type
  TFrmBuscarArticulo = class(TFrmBase)
    RzGroupBox3: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzPanel18: TRzPanel;
    Label5: TLabel;
    Label6: TLabel;
    EditBuscarArticulo: TRzEdit;
    EditBuscarArticuloDescripcion: TRzEdit;
    RzPanel19: TRzPanel;
    BtnBuscaArticulo: TRzBitBtn;
    RzGroupBox5: TRzGroupBox;
    RzPanel23: TRzPanel;
    GridBuscarArticulo: TDBGridEh;
    RzPanel24: TRzPanel;
    BtnBuscarArticuloPrimero: TRzToolButton;
    BtnBuscarArticuloAnterior: TRzToolButton;
    BtnBuscarArticuloSiguiente: TRzToolButton;
    BtnBuscarArticuloUltimo: TRzToolButton;
    ImagenesBuscarArticulo: TImageList;
    S_BUSCARARTICULO: TDataSource;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    BtnCancelarBuscarArticulo: TRzBitBtn;
    BtnAceptarBuscarArticulo: TRzBitBtn;
    Label1: TLabel;
    EditBuscarCodigoBarras: TRzEdit;
    procedure BtnBuscaArticuloClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridBuscarArticuloDblClick(Sender: TObject);
    procedure BtnBuscarArticuloPrimeroClick(Sender: TObject);
    procedure BtnBuscarArticuloAnteriorClick(Sender: TObject);
    procedure BtnBuscarArticuloSiguienteClick(Sender: TObject);
    procedure BtnBuscarArticuloUltimoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAceptarBuscarArticulosClick(Sender: TObject);
    procedure EditBuscarArticuloEnter(Sender: TObject);
    procedure EditBuscarArticuloClick(Sender: TObject);
    procedure S_BUSCARARTICULODataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    DMA: TDMArticulo;
    procedure ControlBotones;
  public
    { Public declarations }
  end;

var
  FrmBuscarArticulo: TFrmBuscarArticulo;

implementation

{$R *.dfm}

procedure TFrmBuscarArticulo.BtnAceptarBuscarArticulosClick(Sender: TObject);
begin
   if not (S_BUSCARARTICULO.DataSet.Bof and S_BUSCARARTICULO.DataSet.Eof)  then
      ModalResult := mrOk
   else
      TPVMessageDlg(STR_SeleccionarArticulo,mtInformation,[mbOK],0);
end;

procedure TFrmBuscarArticulo.BtnBuscaArticuloClick(Sender: TObject);
var
   condicion: String;
begin
   inherited;
   PonEspera(STR_Consultando, False);
   try
      condicion := '';
      if EditBuscarArticulo.Text <> '' then
         condicion := condicion + ' AND ART.CODART LIKE ' + QuotedStr(UpperCase(EditBuscarArticulo.Text) + '%');

      if EditBuscarCodigoBarras.Text <> '' then
         condicion := condicion + ' AND BAR.CODIGO_BARRAS LIKE ' + QuotedStr(UpperCase(EditBuscarCodigoBarras.Text) + '%');

      if EditBuscarArticuloDescripcion.Text <> '' then
         condicion := condicion + ' AND UPPER(ART.DESART) LIKE ' + QuotedStr(UpperCase(EditBuscarArticuloDescripcion.Text) + '%');

      condicion := Copy(condicion, 5, length(condicion));
      DMA.AbrirConsultaTPV(condicion);
      if not S_BUSCARARTICULO.DataSet.IsEmpty then
      begin
         if GridBuscarArticulo.CanFocus then
            GridBuscarArticulo.SetFocus;
      end;
      FinEspera;
   except
      FinEspera;
      raise;
   end;
   ControlBotones;
end;

procedure TFrmBuscarArticulo.BtnBuscarArticuloAnteriorClick(Sender: TObject);
begin
   if S_BUSCARARTICULO.DataSet.Active then
      S_BUSCARARTICULO.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmBuscarArticulo.BtnBuscarArticuloPrimeroClick(Sender: TObject);
begin
   if S_BUSCARARTICULO.DataSet.Active then
      S_BUSCARARTICULO.DataSet.First;
   ControlBotones;
end;

procedure TFrmBuscarArticulo.BtnBuscarArticuloSiguienteClick(Sender: TObject);
begin
   if S_BUSCARARTICULO.DataSet.Active then
      S_BUSCARARTICULO.DataSet.Next;
   ControlBotones;
end;

procedure TFrmBuscarArticulo.BtnBuscarArticuloUltimoClick(Sender: TObject);
begin
   try
      PonEspera(STR_Consultando, False);
      if S_BUSCARARTICULO.DataSet.Active then
         S_BUSCARARTICULO.DataSet.Last;
      ControlBotones;
   finally
       FinEspera;
   end;
end;

procedure TFrmBuscarArticulo.FormCreate(Sender: TObject);
begin
   DMA := TDMArticulo.Create(Self);
   S_BUSCARARTICULO.DataSet := DMA.GetConsultaTPV;
end;

procedure TFrmBuscarArticulo.FormDestroy(Sender: TObject);
begin
   DMA.Free;
end;

procedure TFrmBuscarArticulo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      ModalResult := mrCancel
   else
   if Key = VK_RETURN then
      BtnBuscaArticulo.Click
   else
      if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_HOME, VK_END] then
      begin
         if not GridBuscarArticulo.Focused then
         begin
            OnKeyDown := nil;
            try
               SendMessage(GridBuscarArticulo.Handle, WM_KEYDOWN, key,0);
               SendMessage(GridBuscarArticulo.Handle, WM_CHAR, key,0);
               SendMessage(GridBuscarArticulo.Handle, WM_KEYUP, key,0);
            finally
                OnKeyDown := FormKeyDown;
            end;
         end;
      end;
end;

procedure TFrmBuscarArticulo.FormShow(Sender: TObject);
begin
  inherited;
  EditBuscarArticulo.SetFocus;
  ControlBotones;
end;

procedure TFrmBuscarArticulo.GridBuscarArticuloDblClick(Sender: TObject);
begin
   BtnAceptarBuscarArticulo.Click;
end;

procedure TFrmBuscarArticulo.S_BUSCARARTICULODataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if Field = nil then
      ControlBotones;
end;

procedure TFrmBuscarArticulo.ControlBotones;
begin
   BtnBuscarArticuloPrimero.Enabled := not (S_BUSCARARTICULO.DataSet.Bof);
   BtnBuscarArticuloAnterior.Enabled := not (S_BUSCARARTICULO.DataSet.Bof);
   BtnBuscarArticuloSiguiente.Enabled := not (S_BUSCARARTICULO.DataSet.Eof);
   BtnBuscarArticuloUltimo.Enabled := not (S_BUSCARARTICULO.DataSet.Eof);
end;


procedure TFrmBuscarArticulo.EditBuscarArticuloClick(Sender: TObject);
begin
   inherited;
   TRzEdit(Sender).SelectAll;
end;

procedure TFrmBuscarArticulo.EditBuscarArticuloEnter(Sender: TObject);
begin
  inherited;
   TRzEdit(Sender).SelectAll;
end;

end.
