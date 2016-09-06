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

unit FormCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzEdit, RzRadChk, StdCtrls, Mask, GridsEh, DBGridEh,
  RzButton, ExtCtrls, RzPanel, ActnList, ImgList, RzCommon, RzForms, DB,
  DataMMTOCodigoBarras, uMensajeDialog;

resourcestring
   STR_DebeEspecificarCodigoBarras = 'Debe especificar un código de barras';
   STR_CodigoYaExiste = 'Ya existe un código de barras con la misma numeración';

type
  TFrmCodigoBarras = class(TFrmBase)
    RzGroupBox4: TRzGroupBox;
    RzGroupBox1: TRzGroupBox;
    Imagenes: TImageList;
    AcInicio: TAction;
    AcFin: TAction;
    AcPrior: TAction;
    AcAlta: TAction;
    AcBorrar: TAction;
    RzGroupBox2: TRzGroupBox;
    RzPanel2: TRzPanel;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    RzToolButton4: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    RzBitBtn1: TRzBitBtn;
    RzPanel1: TRzPanel;
    RzPanel3: TRzPanel;
    GridCodigoBarras: TDBGridEh;
    Label5: TLabel;
    EditCodigo: TRzEdit;
    LabelDesglose1: TLabel;
    EditDesglose1: TRzEdit;
    LabelDesglose2: TLabel;
    EditDesglose2: TRzEdit;
    EditDun14: TRzCheckBox;
    Label8: TLabel;
    EditFactor: TRzNumericEdit;
    RzBitBtn2: TRzBitBtn;
    RzToolButton5: TRzToolButton;
    Shape5: TShape;
    AcAceptar: TAction;
    AcNext: TAction;
    S_CODIGOS_BARRAS: TDataSource;
    procedure AcInicioExecute(Sender: TObject);
    procedure AcFinExecute(Sender: TObject);
    procedure AcPriorExecute(Sender: TObject);
    procedure AcNextExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcAltaExecute(Sender: TObject);
    procedure EditDun14Click(Sender: TObject);
    procedure AcAceptarExecute(Sender: TObject);
    procedure S_CODIGOS_BARRASDataChange(Sender: TObject; Field: TField);
    procedure AcBorrarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure LimpiaPantalla;
  public
    { Public declarations }
    FLista: TListaCodigosBarras;
    procedure ControlAcciones;
  end;

var
  FrmCodigoBarras: TFrmCodigoBarras;

implementation
uses
   iGeneral;

{$R *.dfm}

procedure TFrmCodigoBarras.AcAceptarExecute(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmCodigoBarras.AcAltaExecute(Sender: TObject);
var
   CB: TCodigoBarras;
begin
   inherited;
   if EditCodigo.Text = '' then
      raise Exception.Create(STR_DebeEspecificarCodigoBarras);

   if FLista.Existe(EditCodigo.Text) then
      raise Exception.Create(STR_CodigoYaExiste);

   CB := TCodigoBarras.Create(nil);
   CB.FechaAlta := now;
   CB.CodigoBarras := EditCodigo.Text;
   CB.Desglose1 := iif(EditDesglose1.Text = '', '*', EditDesglose1.Text);
   CB.Desglose2 := iif(EditDesglose2.Text = '', '*', EditDesglose2.Text);
   CB.Dun14 := EditDun14.Checked;
   CB.FactorConversion := EditFactor.Value;

   FLista.Add(CB);
   FLista.RefrescaPresentacionCodigosBarras;
   LimpiaPantalla;
end;

procedure TFrmCodigoBarras.AcBorrarExecute(Sender: TObject);
begin
   inherited;
   if not S_CODIGOS_BARRAS.DataSet.IsEmpty then
      FLista.Delete(S_CODIGOS_BARRAS.DataSet.FieldByName('IDX').AsInteger);

   FLista.RefrescaPresentacionCodigosBarras;
end;

procedure TFrmCodigoBarras.AcFinExecute(Sender: TObject);
begin
  inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.Last;
end;

procedure TFrmCodigoBarras.AcInicioExecute(Sender: TObject);
begin
   inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.First;
end;

procedure TFrmCodigoBarras.AcNextExecute(Sender: TObject);
begin
  inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.Next;
end;

procedure TFrmCodigoBarras.AcPriorExecute(Sender: TObject);
begin
  inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.Prior;
end;

procedure TFrmCodigoBarras.ControlAcciones;
begin
 //
end;

procedure TFrmCodigoBarras.EditDun14Click(Sender: TObject);
begin
  inherited;
   if EditDun14.Checked then
   begin
      EditFactor.ReadOnly := False;
   end
   else
   begin
      EditFactor.Value := 0;
      EditFactor.ReadOnly := True;
   end;
end;

procedure TFrmCodigoBarras.FormCreate(Sender: TObject);
begin
   inherited;
   LimpiaPantalla;
   SetAcciones; 
end;

procedure TFrmCodigoBarras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   inherited;
   if Key = VK_ESCAPE then
      Close;
end;

procedure TFrmCodigoBarras.S_CODIGOS_BARRASDataChange(Sender: TObject;
  Field: TField);
begin
   inherited;
   if Field = nil then
      ControlAcciones;
end;

procedure TFrmCodigoBarras.LimpiaPantalla;
begin
   EditCodigo.Text := '';
   EditDesglose1.Text := '';
   EditDesglose2.Text := '';
   EditDun14.Checked := False;
   EditFactor.Value := 0;
end;

end.

