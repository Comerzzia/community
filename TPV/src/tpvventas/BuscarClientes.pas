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

unit BuscarClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTouchKeyboard, RzButton, Grids, DBGrids, RzDBGrid, StdCtrls, Mask,
  RzEdit, RzPanel, ExtCtrls, ImgList, DataMCliente, DB, FormBase, RzCommon,
  RzForms, uMensajeDialog, uEspera, GridsEh, DBGridEh, ActnList;

resourcestring
   STR_SeleccionarCliente = 'Debe seleccionar un Cliente para poder continuar';
   STR_Consultando = 'Consultando...';
   
type
  TFrmBuscarClientes = class(TFrmBase)
    RzGroupBox3: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzPanel18: TRzPanel;
    Label6: TLabel;
    EditBuscarClienteCif: TRzEdit;
    RzPanel19: TRzPanel;
    BtnBuscaClientes: TRzBitBtn;
    RzGroupBox5: TRzGroupBox;
    RzPanel23: TRzPanel;
    GridBuscarClientes: TDBGridEh;
    RzPanel24: TRzPanel;
    BtnBuscarClientesPrimero: TRzToolButton;
    BtnBuscarClientesAnterior: TRzToolButton;
    BtnBuscarClientesSiguiente: TRzToolButton;
    BtnBuscarClientesUltimo: TRzToolButton;
    ImagenesBuscarCliente: TImageList;
    S_BUSCARCLIENTES: TDataSource;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    BtnAceptarBuscarCliente: TRzBitBtn;
    BtnCancelarBuscarCliente: TRzBitBtn;
    Label1: TLabel;
    EditBuscarClienteDescripcion: TRzEdit;
    procedure BtnBuscaClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridBuscarClientesDblClick(Sender: TObject);
    procedure BtnAceptarBuscarClienteClick(Sender: TObject);
    procedure BtnBuscarClientesPrimeroClick(Sender: TObject);
    procedure BtnBuscarClientesAnteriorClick(Sender: TObject);
    procedure BtnBuscarClientesSiguienteClick(Sender: TObject);
    procedure BtnBuscarClientesUltimoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditBuscarClienteCifEnter(Sender: TObject);
    procedure EditBuscarClienteCifClick(Sender: TObject);
    procedure S_BUSCARCLIENTESDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    DMA: TDMCliente;
    procedure ControlBotones;
  public
    { Public declarations }
  end;

var
  FrmBuscarClientes: TFrmBuscarClientes;

implementation

{$R *.dfm}

procedure TFrmBuscarClientes.BtnAceptarBuscarClienteClick(Sender: TObject);
begin
   if not (S_BUSCARCLIENTES.DataSet.Bof and S_BUSCARCLIENTES.DataSet.Eof)  then
      ModalResult := mrOk
   else
      TPVMessageDlg(STR_SeleccionarCliente, mtInformation, [mbOK], 0);
end;

procedure TFrmBuscarClientes.BtnBuscaClientesClick(Sender: TObject);
var
   condicion: String;
begin
   inherited;
   try
      PonEspera(STR_Consultando, False);

      condicion := '';

      if EditBuscarClienteCif.Text  <> '' then
         condicion := condicion + ' AND CLI.CIF LIKE ' + QuotedStr(UpperCase(EditBuscarClienteCif.Text) + '%');

      if EditBuscarClienteDescripcion.Text  <> '' then
         condicion := condicion + ' AND CLI.DESCLI LIKE ' + QuotedStr(UpperCase(EditBuscarClienteDescripcion.Text) + '%');

      condicion := Copy(condicion, 5, length(condicion));
      DMA.AbrirConsultaTPV(condicion);
      if not S_BUSCARCLIENTES.DataSet.IsEmpty then
      begin
         if GridBuscarClientes.CanFocus then
            GridBuscarClientes.SetFocus;
      end;
      FinEspera;      
   except
      FinEspera;
      raise;
   end;
   ControlBotones;
end;

procedure TFrmBuscarClientes.BtnBuscarClientesAnteriorClick(Sender: TObject);
begin
   if S_BUSCARCLIENTES.DataSet.Active then
      S_BUSCARCLIENTES.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmBuscarClientes.BtnBuscarClientesPrimeroClick(Sender: TObject);
begin
   if S_BUSCARCLIENTES.DataSet.Active then
      S_BUSCARCLIENTES.DataSet.First;
   ControlBotones;
end;

procedure TFrmBuscarClientes.BtnBuscarClientesSiguienteClick(Sender: TObject);
begin
   if S_BUSCARCLIENTES.DataSet.Active then
      S_BUSCARCLIENTES.DataSet.Next;
   ControlBotones;
end;

procedure TFrmBuscarClientes.BtnBuscarClientesUltimoClick(Sender: TObject);
begin
   try
      PonEspera(STR_Consultando, False);
      if S_BUSCARCLIENTES.DataSet.Active then
         S_BUSCARCLIENTES.DataSet.Last;
      ControlBotones;
   finally
      FinEspera;
   end;
end;

procedure TFrmBuscarClientes.FormCreate(Sender: TObject);
begin
   DMA := TDMCliente.Create(Self);
   S_BUSCARCLIENTES.DataSet := DMA.GetConsultaTPV;
end;

procedure TFrmBuscarClientes.FormDestroy(Sender: TObject);
begin
   DMA.Free;
end;

procedure TFrmBuscarClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_ESCAPE then
      ModalResult := mrCancel
   else
   if Key = VK_RETURN then
      BtnBuscaClientes.Click
   else
      if Key in [VK_PRIOR, VK_NEXT, VK_UP, VK_DOWN, VK_HOME, VK_END] then
      begin
         if not BtnBuscaClientes.Focused then
         begin
            OnKeyDown := nil;
            try
               SendMessage(BtnBuscaClientes.Handle, WM_KEYDOWN, key,0);
               SendMessage(BtnBuscaClientes.Handle, WM_CHAR, key,0);
               SendMessage(BtnBuscaClientes.Handle, WM_KEYUP, key,0);
            finally
                OnKeyDown := FormKeyDown;
            end;
         end;
      end;
end;

procedure TFrmBuscarClientes.FormShow(Sender: TObject);
begin
  inherited;
  EditBuscarClienteCif.SetFocus;
  ControlBotones;
end;

procedure TFrmBuscarClientes.GridBuscarClientesDblClick(Sender: TObject);
begin
   BtnAceptarBuscarCliente.Click;
end;

procedure TFrmBuscarClientes.S_BUSCARCLIENTESDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if Field = nil then
      ControlBotones;
end;

procedure TFrmBuscarClientes.ControlBotones;
begin
   BtnBuscarClientesPrimero.Enabled := not (S_BUSCARCLIENTES.DataSet.Bof);
   BtnBuscarClientesAnterior.Enabled := not (S_BUSCARCLIENTES.DataSet.Bof);
   BtnBuscarClientesSiguiente.Enabled := not (S_BUSCARCLIENTES.DataSet.Eof);
   BtnBuscarClientesUltimo.Enabled := not (S_BUSCARCLIENTES.DataSet.Eof);
end;

procedure TFrmBuscarClientes.EditBuscarClienteCifClick(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).SelectAll;
end;

procedure TFrmBuscarClientes.EditBuscarClienteCifEnter(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).SelectAll; 
end;

end.
