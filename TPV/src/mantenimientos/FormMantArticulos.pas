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

unit FormMantArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormMantBasico, DB, ImgList, ActnList, RzCommon, RzForms,
  ExtCtrls, RzButton, GridsEh, DBGridEh, StdCtrls, Mask, RzEdit, RzPanel, RzTabs,
  DataMMTOArticulo, uEspera, RzRadChk, uMensajeDialog, DataMBaseDatos,
  AdvTouchKeyboard, RzCmboBx, DataMImpuestos, DataMVariables,
  FormCodigoBarras, DataMMenu;

resourcestring
   STR_ArticuloNoEncontrado = 'No se ha encontrado el artículo.';
   STR_FaltaCodigo = 'Debe especificar un código de artículo';
   STR_FaltaDescripcion = 'Debe especficiar una descripción';

type
  TFrmMantArticulos = class(TFrmMantBasico)
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    PaginasEdicion: TRzPageControl;
    TabObservaciones: TRzTabSheet;
    TabCodigoBarras: TRzTabSheet;
    EditObservaciones: TRzMemo;
    RzPanel4: TRzPanel;
    RzToolButton5: TRzToolButton;
    Shape11: TShape;
    Shape12: TShape;
    GridCodigoBarras: TDBGridEh;
    S_CODIGOS_BARRAS: TDataSource;
    AcCodigosBarras: TAction;
    RzPanel2: TRzPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    EditDesglose1: TRzCheckBox;
    EditFormato: TRzEdit;
    EditDesglose2: TRzCheckBox;
    EditNumerosSerie: TRzCheckBox;
    EditGenerico: TRzCheckBox;
    EditUnidadesCaja: TRzNumericEdit;
    EditTipoImpuesto: TRzComboBox;
    EditPVP: TRzNumericEdit;
    EditActivo: TRzCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure AcBorrarExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcCodigosBarrasExecute(Sender: TObject);
    procedure TabEdicionEnter(Sender: TObject);
  private
    { Private declarations }
    Articulo: TArticulo;
  public
    { Public declarations }
    class procedure Crea(Titulo: String ; Accion : TMenuItemCargador); override;

    procedure Inicializa; override;
    procedure InicializaDataModules; override;
    procedure InicializaDataSources; override;    
    procedure RellenaFichaAlta; override;
    procedure RellenaFichaEdicion; override;
    procedure SetEstadoControlesFicha; override;
    procedure ObtenerValoresUsuario; override;
    procedure ControlAcciones; override;
  end;

var
  FrmMantArticulos: TFrmMantArticulos;

implementation
uses
   iGeneral;

{$R *.dfm}

procedure TFrmMantArticulos.AcBorrarExecute(Sender: TObject);
begin
   inherited;
   if not S_BUSQUEDA.DataSet.IsEmpty then
   begin
       if TPVMessageDlg(STR_DeseaEliminar, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          PonEspera(STR_Eliminando, False);
          try
             DMBaseDatos.IniciaTransaccion;
             Articulo.BD_Cargar(S_BUSQUEDA.DataSet.FieldByName('CODART').AsString);
             if Articulo.Codart = '' then
                raise Exception.Create(STR_ArticuloNoEncontrado);
             Articulo.BD_Eliminar;
             DMBaseDatos.CommitTransaccion;
             FinEspera;
             AcBuscar.Execute;
             Paginas.ActivePageIndex := 0;
          except
             DMBaseDatos.RollBackTransaccion;
             FinEspera;
             raise;
          end;
       end;
   end;
end;

procedure TFrmMantArticulos.AcCodigosBarrasExecute(Sender: TObject);
begin
   inherited;
   if EstadoRegistro in [erEditando, erInsertando] then
   begin
      FrmCodigoBarras := TFrmCodigoBarras.Create(Self);
      try
         FrmCodigoBarras.FLista := Articulo.ListaCodigosBarras;
         FrmCodigoBarras.LabelDesglose1.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', 'DESGLOSE 1');
         FrmCodigoBarras.LabelDesglose2.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', 'DESGLOSE 2');
         FrmCodigoBarras.GridCodigoBarras.Columns[2].Title.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', 'DESGLOSE 1');
         FrmCodigoBarras.GridCodigoBarras.Columns[3].Title.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', 'DESGLOSE 2');

         FrmCodigoBarras.S_CODIGOS_BARRAS.DataSet := Articulo.ListaCodigosBarras.GetDataSetPresentacionCodigosBarras;
         FrmCodigoBarras.ShowModal;
         Articulo.ListaCodigosBarras.RefrescaPresentacionCodigosBarras;
      finally
         FrmCodigoBarras.Free;
      end;
   end;
end;

procedure TFrmMantArticulos.AcSalvarExecute(Sender: TObject);
begin
   inherited;
   ObtenerValoresUsuario;

   try
      PonEspera(STR_Salvando, False);
      DMBaseDatos.IniciaTransaccion;
      if EstadoRegistro = erInsertando then
         Articulo.BD_Insertar
      else
         Articulo.BD_Actualizar;
      DMBaseDatos.CommitTransaccion;
      EstadoRegistro := erVisualizando;
      if not AcVer.Enabled then
         AcVer.Enabled := True;
      AcVer.Execute;
      FinEspera;

      if S_BUSQUEDA.DataSet.IsEmpty then
      begin
         if not AcVolver.Enabled then
            AcVolver.Enabled := True;
         AcVolver.Execute;
      end
      else
      begin
         if not AcVer.Enabled then
            AcVer.Enabled := True;
         AcVer.Execute;
      end;

      Paginas.ActivePageIndex := 0;
      AcBuscar.Execute;
   except
      DMBaseDatos.RollBackTransaccion;
      FinEspera;
      raise;
   end;
end;

class procedure TFrmMantArticulos.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
   if iAbreSiExiste( Copy( Self.ClassName, 2, 50 ) ) then Exit;

   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);
   PonEspera(STR_Iniciando, False);
   try
      try
         FrmMantArticulos := TFrmMantArticulos.Create( Application );

         FrmMantArticulos.Caption := Titulo;
         FrmMantArticulos.Accion := Accion;
         FrmMantArticulos.LabelTitulo.Caption := Titulo;

         FrmMantArticulos.Inicializa;

         FinEspera;
      except
         FinEspera;
         FrmMantArticulos.Close;
         Raise;
      end;
   finally
      FinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmMantArticulos.FormDestroy(Sender: TObject);
begin
   Articulo.Free;

   inherited; //Destruye el DMDatos
end;


procedure TFrmMantArticulos.Inicializa;
begin
   inherited;

   AcAlta.Visible := DMVariables.DameVariable('TPV.AUTONOMO', 'N') = 'S';
   AcEditar.Visible := AcAlta.Visible;
   AcBorrar.Visible := AcAlta.Visible;
   AcSalvar.Visible := AcAlta.Visible;
   AcCancelar.Visible := AcAlta.Visible;
end;

procedure TFrmMantArticulos.InicializaDataModules;
var
   DMImp: TDMImpuestos;
   Imp: TDataSet;
begin
   CampoCodigo := 'CODART';
   CampoDescripcion :='DESART';
   DMDatos := TDMArticulo.Create(Self);
   Articulo := TArticulo.Create(TDMArticulo(DMDatos));
   Articulo.ListaCodigosBarras.UsaDataSetPresentacion := True;

   DMImp := TDMImpuestos.Create(Self);
   try
      DMBaseDatos.ponPrefijo(DMImp);
      Imp := DMImp.GetDataSetConfigImpuestosTipo;
      DMImp.AbrirDataSetConfigImpuestosTipo;
      Imp.First;
      while not Imp.Eof do
      begin
         EditTipoImpuesto.Items.Add(Imp.FieldByName('DESIMP').AsString);
         EditTipoImpuesto.Values.Add(Imp.FieldByName('CODIMP').AsString);

         Imp.Next;
      end;
      DMImp.CerrarDataSetConfigImpuestosTipo;
   finally
      DMImp.Free;
   end;
   if EditTipoImpuesto.Items.Count > 0 then
      EditTipoImpuesto.ItemIndex := 0;

   EditDesglose1.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE1_TITULO', 'DESGLOSE 1');
   EditDesglose2.Caption := DMVariables.DameVariable('ARTICULOS.DESGLOSE2_TITULO', 'DESGLOSE 2');

   GridCodigoBarras.Columns[2].Title.Caption := EditDesglose1.Caption;
   GridCodigoBarras.Columns[3].Title.Caption := EditDesglose2.Caption;
end;

procedure TFrmMantArticulos.InicializaDataSources;
begin
   inherited; //inicializa el Datosurce Busqueda
   S_CODIGOS_BARRAS.DataSet := Articulo.ListaCodigosBarras.GetDataSetPresentacionCodigosBarras;
end;

procedure TFrmMantArticulos.RellenaFichaAlta;
var
   EstadoActual: TEstadoRegistro;
begin
   Articulo.ListaCodigosBarras.Clear;
   Articulo.ListaCodigosBarras.RefrescaPresentacionCodigosBarras;
   EstadoActual := EstadoRegistro;
   EstadoRegistro := erInterno;
   SetEstadoControlesFicha;
   try
      EditCodigo.Text := '';
      EditDescripcion.Text := '';
      EditFormato.Text := '';
      EditActivo.Checked := True;
      EditDesglose1.Checked := False;
      EditDesglose2.Checked := False;
      EditNumerosSerie.Checked := False;
      EditGenerico.Checked := False;
      EditObservaciones.Text := '';
      EditUnidadesCaja.IntValue := 0;
      EditPVP.Value := 0;
      if EditTipoImpuesto.Items.Count > 0 then
         EditTipoImpuesto.ItemIndex := 0
      else
         EditTipoImpuesto.ItemIndex := -1;
   finally
      EstadoRegistro := EstadoActual;
   end;
end;

procedure TFrmMantArticulos.RellenaFichaEdicion;
var
   EstadoActual: TEstadoRegistro;
begin
   if not S_BUSQUEDA.DataSet.IsEmpty then
   begin
      Articulo.BD_Cargar(S_BUSQUEDA.DataSet.FieldByName('CODART').AsString);
      if Articulo.Codart = '' then
         raise Exception.Create(STR_ArticuloNoEncontrado);

      Articulo.ListaCodigosBarras.BD_Cargar(Articulo.Codart);
      Articulo.ListaCodigosBarras.RefrescaPresentacionCodigosBarras;

      EstadoActual := EstadoRegistro;
      EstadoRegistro := erInterno;
      try
         EditCodigo.Text := Articulo.Codart;
         EditDescripcion.Text := Articulo.Desart;
         EditFormato.Text := Articulo.Formato;
         EditActivo.Checked := Articulo.Activo;
         EditDesglose1.Checked := Articulo.Desglose1;
         EditDesglose2.Checked := Articulo.Desglose2;
         EditNumerosSerie.Checked := Articulo.Numeros_serie;
         EditGenerico.Checked := Articulo.Generico;
         EditObservaciones.Text := Articulo.Observaciones;
         EditUnidadesCaja.IntValue := Articulo.Unidades_caja;
         EditTipoImpuesto.ItemIndex := EditTipoImpuesto.Values.IndexOf(Articulo.CodImp);
         EditPVP.Value := Articulo.Pvp;
      finally
         EstadoRegistro := EstadoActual;
      end;
   end;
end;

procedure TFrmMantArticulos.SetEstadoControlesFicha;
begin
   EditCodigo.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando, erEditando]);
   EditDescripcion.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditActivo.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditFormato.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditDesglose1.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditDesglose2.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditNumerosSerie.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditGenerico.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditUnidadesCaja.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditObservaciones.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditTipoImpuesto.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
end;

procedure TFrmMantArticulos.TabEdicionEnter(Sender: TObject);
begin
  inherited;
  PaginasEdicion.ActivePageIndex := 0;
end;

procedure TFrmMantArticulos.ObtenerValoresUsuario;
begin
   //Obtiene los valores de pantalla y los carga en la clase
   Articulo.Codart := EditCodigo.Text;
   Articulo.Desart := EditDescripcion.Text;
   Articulo.Activo := EditActivo.Checked;
   Articulo.Formato := EditFormato.Text;
   Articulo.Desglose1 := EditDesglose1.Checked;
   Articulo.Desglose2 := EditDesglose2.Checked;
   Articulo.Numeros_serie := EditNumerosSerie.Checked;
   Articulo.Generico := EditGenerico.Checked;
   Articulo.Unidades_caja := EditUnidadesCaja.IntValue;
   Articulo.Observaciones := EditObservaciones.Text;
   Articulo.CodImp := EditTipoImpuesto.Value;
   Articulo.Pvp := EditPVP.Value;

   //Hace las validaciones necesarias
   if Articulo.Codart = '' then
      raise Exception.Create(STR_FaltaCodigo);

   if Articulo.Desart = '' then
      raise Exception.Create(STR_FaltaDescripcion);
end;

procedure TFrmMantArticulos.ControlAcciones;
begin
   inherited;
   AcCodigosBarras.Enabled := (EstadoRegistro in [erEditando, erInsertando]);
end;

initialization
   RegisterClass(TFrmMantArticulos);

end.
