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

unit FormConfCodigoBarras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, RzCommon, RzForms, RzButton, ComCtrls, ImgList, ExtCtrls,
  Grids, DBGrids, RzDBGrid, RzPanel, StdCtrls, DB, uMensajeDialog,
  DataMBaseDatos, ActnList, GridsEh, DBGridEh, MemDS, uEspera, DataMMTOCodigoBarras,
  VirtualTable, DataMMenu;

resourcestring
   STR_Iniciando = 'Iniciando...';
   STR_Salvando = 'Guardando información...';
   STR_Confirmacion = '¿Esta seguro de salvar los cambios?';
   STR_DeseaEliminar = '¿Esta seguro de querer eliminar el registro seleccionado?';
   STR_Eliminando = 'Eliminando registro...';
   
type
  TFrmConfCodigoBarras = class(TFrmBase)
    Panel1: TPanel;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    LabelTitulo: TLabel;
    RzPanel1: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    S_CODIGOS_BARRAS: TDataSource;
    GridDatos: TDBGridEh;
    RzPanel2: TRzPanel;
    BtnBuscarPrimero: TRzToolButton;
    BtnBuscarAnterior: TRzToolButton;
    BtnBuscarSiguiente: TRzToolButton;
    BtnBuscarUltimo: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    BtnSubeOrden: TRzToolButton;
    BtnBajaOrden: TRzToolButton;
    Imagenes: TImageList;
    BtnEliminar: TRzToolButton;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    RzToolButton1: TRzToolButton;
    Shape8: TShape;
    RzGroupBox2: TRzGroupBox;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnBuscarPrimeroClick(Sender: TObject);
    procedure BtnBuscarSiguienteClick(Sender: TObject);
    procedure BtnBuscarUltimoClick(Sender: TObject);
    procedure BtnBuscarAnteriorClick(Sender: TObject);
    procedure GridImpuestoDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAceptarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSubeOrdenClick(Sender: TObject);
    procedure BtnBajaOrdenClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure RzToolButton1Click(Sender: TObject);
    procedure S_CODIGOS_BARRASDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    procedure ControlBotones;
    procedure CargaCodigoBarrasEsp;
  public
    { Public declarations }
    class procedure Crea(Titulo: String ; Accion : TMenuItemCargador); override;
    procedure Inicializa; override;
  end;

var
  FrmConfCodigoBarras: TFrmConfCodigoBarras;
  DMCB: TDMCodigoBarras;

implementation

uses
   iGeneral;

{$R *.dfm}

class procedure TFrmConfCodigoBarras.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
   if iAbreSiExiste( Copy( Self.ClassName, 2, 50 ) ) then Exit;

   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);
   PonEspera(STR_Iniciando, False);
   try
      try
         FrmConfCodigoBarras := TFrmConfCodigoBarras.Create( Application );

         FrmConfCodigoBarras.Caption := Titulo;
         FrmConfCodigoBarras.Accion := Accion;
         FrmConfCodigoBarras.LabelTitulo.Caption := Titulo;
         FrmConfCodigoBarras.Inicializa;

         FinEspera;
      except
         FinEspera;
         FrmConfCodigoBarras.Close;
         Raise;
      end;
   finally
      FinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmConfCodigoBarras.Inicializa;
begin
   //Crea el DataModule
   DMCB := TDMCodigoBarras.Create(Self);
   S_CODIGOS_BARRAS.DataSet := DMCB.TMP_CODIGOS_BARRA_ESP;

   //Carga de base de datos al grid
   CargaCodigoBarrasEsp;

   //Iniciar controles visuales
   ControlBotones;
end;

procedure TFrmConfCodigoBarras.RzToolButton1Click(Sender: TObject);
begin
  inherited;
  S_CODIGOS_BARRAS.DataSet.Edit;
  S_CODIGOS_BARRAS.DataSet.Append;
  GridDatos.SetFocus;
  ControlBotones;
end;

procedure TFrmConfCodigoBarras.S_CODIGOS_BARRASDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if Field = nil then
     ControlBotones;
end;

procedure TFrmConfCodigoBarras.BtnAceptarClick(Sender: TObject);
begin
   inherited;
   if TPVMessageDlg(STR_Confirmacion, mtConfirmation, mbYesNo, 0) = mrYes then
   begin
      try
         PonEspera(STR_Salvando, False);
         DMBaseDatos.IniciaTransaccion;
         DMCB.SalvaCodigoBarrasEsp;
         DMBaseDatos.CommitTransaccion;
         FinEspera;
      except
         DMBaseDatos.RollbackTransaccion;
         FinEspera;
         raise;
      end;

      Close;
   end;
end;

procedure TFrmConfCodigoBarras.BtnBajaOrdenClick(Sender: TObject);
var
   vOrden : Integer;
begin
  inherited;
  vOrden := S_CODIGOS_BARRAS.DataSet.FieldByName('ORDEN').AsInteger;
  if vOrden < S_CODIGOS_BARRAS.DataSet.RecordCount then
  begin
     with S_CODIGOS_BARRAS do
     begin
        DataSet.Edit;
        DataSet.FieldByName('ORDEN').AsInteger := vOrden + 1;
        DataSet.Post;

        DataSet.Next;

        DataSet.Edit;
        DataSet.FieldByName('ORDEN').AsInteger := vOrden;
        DataSet.Post;

        DataSet.Next;
        ControlBotones;
     end;
  end;
end;

procedure TFrmConfCodigoBarras.BtnBuscarAnteriorClick(Sender: TObject);
begin
   inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.Prior;
   ControlBotones;
end;

procedure TFrmConfCodigoBarras.BtnBuscarPrimeroClick(Sender: TObject);
begin
   inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.First;
   ControlBotones;
end;

procedure TFrmConfCodigoBarras.BtnBuscarSiguienteClick(Sender: TObject);
begin
   inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.Next;
   ControlBotones;
end;

procedure TFrmConfCodigoBarras.BtnBuscarUltimoClick(Sender: TObject);
begin
   inherited;
   if S_CODIGOS_BARRAS.DataSet.Active then
      S_CODIGOS_BARRAS.DataSet.Last;
   ControlBotones;
end;

procedure TFrmConfCodigoBarras.BtnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmConfCodigoBarras.BtnEliminarClick(Sender: TObject);
begin
   inherited;
   if not S_CODIGOS_BARRAS.DataSet.IsEmpty then
   begin
       if TPVMessageDlg(STR_DeseaEliminar, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          PonEspera(STR_Eliminando, False);
          S_CODIGOS_BARRAS.DataSet.Delete;
          FinEspera;
          ControlBotones;
       end;
   end;
end;

procedure TFrmConfCodigoBarras.BtnSubeOrdenClick(Sender: TObject);
var
   vOrden : Integer;
begin
  inherited;
  vOrden := S_CODIGOS_BARRAS.DataSet.FieldByName('ORDEN').AsInteger;
  if vOrden >= 0 then
  begin
     with S_CODIGOS_BARRAS do
     begin
        DataSet.Edit;
        DataSet.FieldByName('ORDEN').AsInteger := vOrden - 1;
        DataSet.Post;

        DataSet.Prior;

        DataSet.Edit;
        DataSet.FieldByName('ORDEN').AsInteger := vOrden;
        DataSet.Post;

        DataSet.Prior;
        ControlBotones;
     end;
  end;
end;

procedure TFrmConfCodigoBarras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
end;

procedure TFrmConfCodigoBarras.FormDestroy(Sender: TObject);
begin
  inherited;
  DMCB.Free;
end;

procedure TFrmConfCodigoBarras.GridImpuestoDblClick(Sender: TObject);
begin
   inherited;
   ModalResult := mrOk;
end;

procedure TFrmConfCodigoBarras.ControlBotones;
begin
   BtnBuscarPrimero.Enabled := not (S_CODIGOS_BARRAS.DataSet.Bof);
   BtnBuscarAnterior.Enabled := not (S_CODIGOS_BARRAS.DataSet.Bof);
   BtnBuscarSiguiente.Enabled := not (S_CODIGOS_BARRAS.DataSet.Eof);
   BtnBuscarUltimo.Enabled := not (S_CODIGOS_BARRAS.DataSet.Eof);

   BtnBajaOrden.Enabled := not (S_CODIGOS_BARRAS.DataSet.Eof) and not ((S_CODIGOS_BARRAS.DataSet.State = dsEdit) or (S_CODIGOS_BARRAS.DataSet.State = dsInsert));
   BtnSubeOrden.Enabled := not (S_CODIGOS_BARRAS.DataSet.Bof) and not ((S_CODIGOS_BARRAS.DataSet.State = dsEdit) or (S_CODIGOS_BARRAS.DataSet.State = dsInsert));
end;

procedure TFrmConfCodigoBarras.CargaCodigoBarrasEsp;
begin
  with DMCB.Q_CONSULTA_CODIGOS_BARRA_ESP do
  begin
    Close;
    Open;
    if not IsEmpty then
    begin
       S_CODIGOS_BARRAS.DataSet.Open;
       DMCB.TMP_CODIGOS_BARRA_ESP.Clear;
       while not Eof do
       begin
          S_CODIGOS_BARRAS.DataSet.Append;
          S_CODIGOS_BARRAS.DataSet.FieldByName('ORDEN').AsInteger := FieldByName('ORDEN').AsInteger;
          S_CODIGOS_BARRAS.DataSet.FieldByName('DESCRIPCION').AsString := FieldByName('DESCRIPCION').AsString;
          S_CODIGOS_BARRAS.DataSet.FieldByName('PREFIJO').AsString := FieldByName('PREFIJO').AsString;
          S_CODIGOS_BARRAS.DataSet.FieldByName('CODART').AsString := FieldByName('CODART').AsString;
          S_CODIGOS_BARRAS.DataSet.FieldByName('PRECIO').AsString := FieldByName('PRECIO').AsString;
          S_CODIGOS_BARRAS.DataSet.FieldByName('CANTIDAD').AsString := FieldByName('CANTIDAD').AsString;
          S_CODIGOS_BARRAS.DataSet.FieldByName('FIDELIZACION').AsString := FieldByName('FIDELIZACION').AsString;
          S_CODIGOS_BARRAS.DataSet.Post;
          Next;
       end;
    end;
    Close;
  end;

  S_CODIGOS_BARRAS.DataSet.First;
  
end;

initialization
   RegisterClass(TFrmConfCodigoBarras);

end.
