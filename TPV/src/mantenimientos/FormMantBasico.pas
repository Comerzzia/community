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

unit FormMantBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormBase, ActnList, RzCommon, RzForms, DB, ImgList, StdCtrls,
  AdvTouchKeyboard, GridsEh, DBGridEh, RzButton, Mask, RzEdit, ExtCtrls,
  RzPanel, RzTabs, uEspera, DataMBase;

resourcestring
   STR_Consultando = 'Consultando...';
   STR_Iniciando = 'Iniciando...';
   STR_DeseaEliminar = '¿Esta seguro de querer eliminar el registro seleccionado?';
   STR_Eliminando = 'Eliminando registro...';
   STR_Cargando = 'Cargando información...';
   STR_Salvando = 'Guardando información...';

type
  TEstadoRegistro = (erBuscando,     // Localizando registro
                     erInsertando,   // Creando nuevo registro
                     erEditando,     // Editando registro existente
                     erVisualizando,  // Visualizando registro existente
                     erInterno       //Se usa para control interno (readonlys, etc)
                    );

  TFrmMantBasico = class(TFrmBase)
    Paginas: TRzPageControl;
    TabBusqueda: TRzTabSheet;
    LabelTitulo: TLabel;
    RzPanel15: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    EditBuscarCodigo: TRzEdit;
    EditBuscarDescripcion: TRzEdit;
    RzPanel3: TRzPanel;
    BtnBuscaArticulo: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    GridBusqueda: TDBGridEh;
    TabEdicion: TRzTabSheet;
    Label4: TLabel;
    RzPanel1: TRzPanel;
    RzGroupBox3: TRzGroupBox;
    Imagenes: TImageList;
    AcBuscar: TAction;
    S_BUSQUEDA: TDataSource;
    PanelTeclado: TRzPanel;
    RzGroupBox4: TRzGroupBox;
    AcFirst: TAction;
    AcPrior: TAction;
    AcNext: TAction;
    AcLast: TAction;
    AcAlta: TAction;
    AcEditar: TAction;
    AcVer: TAction;
    AcSalvar: TAction;
    AcCancelar: TAction;
    AcBorrar: TAction;
    AcVolver: TAction;
    PanelCabeceraEdicion: TRzPanel;
    Label5: TLabel;
    Label6: TLabel;
    EditCodigo: TRzEdit;
    EditDescripcion: TRzEdit;
    TBAcciones: TRzToolbar;
    TB1: TRzToolButton;
    TB2: TRzToolButton;
    TB3: TRzToolButton;
    TB4: TRzToolButton;
    btnVer: TRzToolButton;
    TB6: TRzToolButton;
    RzSpacer1: TRzSpacer;
    TB7: TRzToolButton;
    TB8: TRzToolButton;
    TB9: TRzToolButton;
    TB10: TRzToolButton;
    RzSpacer2: TRzSpacer;
    procedure AcBuscarExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AcFirstExecute(Sender: TObject);
    procedure AcPriorExecute(Sender: TObject);
    procedure AcNextExecute(Sender: TObject);
    procedure AcLastExecute(Sender: TObject);
    procedure AcAltaExecute(Sender: TObject);
    procedure AcEditarExecute(Sender: TObject);
    procedure AcVerExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure S_BUSQUEDADataChange(Sender: TObject; Field: TField);
    procedure AcVolverExecute(Sender: TObject);
    procedure AcCancelarExecute(Sender: TObject);
    procedure GridBusquedaDblClick(Sender: TObject);

  private
    { Private declarations }
    procedure MueveRegistro(Sender: TObject);
  public
    { Public declarations }
    DMDatos: TDMBase;
    EstadoRegistro: TEstadoRegistro;
    CampoCodigo, CampoDescripcion: String;

    function ComponerConsulta: String; virtual;
    procedure Inicializa; override;
    procedure InicializaDataModules; virtual; abstract;
    procedure InicializaDataSources; virtual;
    procedure ControlAcciones; virtual;

    procedure RellenaFichaAlta; virtual; abstract;
    procedure RellenaFichaEdicion; virtual; abstract;
    procedure SetEstadoControlesFicha; virtual; abstract;
    procedure ObtenerValoresUsuario; virtual; abstract;
  end;

var
  FrmMantBasico: TFrmMantBasico;

implementation

{$R *.dfm}

procedure TFrmMantBasico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

procedure TFrmMantBasico.FormDestroy(Sender: TObject);
begin
   inherited;
   DMDatos.Free;
end;

procedure TFrmMantBasico.GridBusquedaDblClick(Sender: TObject);
begin
   inherited;
   AcVer.Execute;
end;

procedure TFrmMantBasico.Inicializa;
begin
   //Inicializar la interfaz por defecto
   TabBusqueda.TabVisible := False;
   TabEdicion.TabVisible := False;
   Paginas.ActivePage := TabBusqueda;
   if EditBuscarCodigo.CanFocus then
      EditBuscarCodigo.SetFocus;

   //Establecer las acciones configurables si procede
   SetAcciones;

   //Inicializar los accesos a datos
   InicializaDataModules;

   //Asignar los accesos a datos básicos
   InicializaDataSources;

   //Abrir la consulta principal para que se pinte la pantalla de busqueda
   DMDatos.AbrirConsulta(' 1=2 ');

   //Poner la pantalla en modo busqueda
   EstadoRegistro := erBuscando;
   ControlAcciones;
end;

procedure TFrmMantBasico.InicializaDataSources;
begin
   S_BUSQUEDA.DataSet := DMDatos.GetConsulta;
end;

procedure TFrmMantBasico.S_BUSQUEDADataChange(Sender: TObject; Field: TField);
begin
   inherited;
   if Field = nil then
      ControlAcciones;
end;

procedure TFrmMantBasico.AcAltaExecute(Sender: TObject);
begin
   inherited;
   try
      try
         EstadoRegistro := erInsertando;

         RellenaFichaAlta;
         SetEstadoControlesFicha;

         Paginas.ActivePage := TabEdicion;
      except
         EstadoRegistro := erBuscando;
         Paginas.ActivePage := TabBusqueda;
         raise;
      end;
   finally
      ControlAcciones;
   end;
end;

procedure TFrmMantBasico.AcBuscarExecute(Sender: TObject);
var
   sCondicion: String;
begin
   inherited;
   try
      try
         PonEspera(STR_Consultando, False);
         sCondicion := ComponerConsulta;

         DMDatos.CerrarConsulta;
         DMDatos.AbrirConsulta(sCondicion);
         FinEspera;
      except
         FinEspera;
         raise;
      end;
   finally
      ControlAcciones;
   end;
end;

procedure TFrmMantBasico.AcCancelarExecute(Sender: TObject);
begin
   inherited;
   try
      try
         EstadoRegistro := erVisualizando;

         RellenaFichaEdicion;
         SetEstadoControlesFicha;
      except
         raise;
      end;
   finally
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

      ControlAcciones;
   end;
end;

procedure TFrmMantBasico.AcEditarExecute(Sender: TObject);
begin
   inherited;
   if not S_BUSQUEDA.DataSet.IsEmpty then
   begin
      try
         try
            EstadoRegistro := erEditando;

            RellenaFichaEdicion;
            SetEstadoControlesFicha;

            Paginas.ActivePage := TabEdicion;
         except
            EstadoRegistro := erBuscando;
            Paginas.ActivePage := TabBusqueda;
            raise;
         end;
      finally
         ControlAcciones;
      end;
   end;
end;

procedure TFrmMantBasico.AcFirstExecute(Sender: TObject);
begin
   inherited;
   MueveRegistro(Sender);
end;

procedure TFrmMantBasico.AcLastExecute(Sender: TObject);
begin
   inherited;
   MueveRegistro(Sender);
end;

procedure TFrmMantBasico.AcNextExecute(Sender: TObject);
begin
   inherited;
   MueveRegistro(Sender);
end;

procedure TFrmMantBasico.AcPriorExecute(Sender: TObject);
begin
   inherited;
   MueveRegistro(Sender);
end;

procedure TFrmMantBasico.MueveRegistro(Sender: TObject);
begin
   if EstadoRegistro in [erBuscando, erVisualizando] then
   begin
      if S_BUSQUEDA.DataSet.Active then
         if Sender =  AcFirst then         
            S_BUSQUEDA.DataSet.First
         else if Sender = AcPrior then
            S_BUSQUEDA.DataSet.Prior
         else if Sender = AcNext then
            S_BUSQUEDA.Dataset.Next
         else if Sender = AcLast then
         begin
            try
               PonEspera(STR_Cargando, False);
               S_BUSQUEDA.DataSet.Last;
            finally
               FinEspera;
            end;
         end;

      if (EstadoRegistro in [erVisualizando]) then
         AcVer.Execute;
   end;
end;

procedure TFrmMantBasico.AcVerExecute(Sender: TObject);
begin
   inherited;
   if not S_BUSQUEDA.DataSet.IsEmpty then
   begin
      try
         PonEspera(STR_Cargando, False);
         try
            EstadoRegistro := erVisualizando;

            RellenaFichaEdicion;
            SetEstadoControlesFicha;

            Paginas.ActivePage := TabEdicion;
         except
            EstadoRegistro := erBuscando;
            Paginas.ActivePage := TabBusqueda;
            raise;
         end;
      finally
         ControlAcciones;
         FinEspera;
      end;
   end;
end;

procedure TFrmMantBasico.AcVolverExecute(Sender: TObject);
begin
   EstadoRegistro := erBuscando;
   Paginas.ActivePage := TabBusqueda;
   ControlAcciones;
end;

function TFrmMantBasico.ComponerConsulta: String;
var
   sCondicion: String;
begin
   sCondicion := '';
   if EditBuscarCodigo.Text <> '' then
      sCondicion := ' AND ' + sCondicion + ' ' + CampoCodigo + ' LIKE ' + QuotedStr(EditBuscarCodigo.Text + '%');

   if EditBuscarDescripcion.Text <> '' then
      sCondicion := sCondicion + ' AND ' + CampoDescripcion + ' LIKE ' + QuotedStr(EditBuscarDescripcion.Text + '%');

   result := Copy(sCondicion , 5, Length(sCondicion));
end;

procedure TFrmMantBasico.ControlAcciones;
begin
   AcFirst.Enabled := (not S_BUSQUEDA.DataSet.Bof) and (EstadoRegistro in [erBuscando, erVisualizando]);
   AcPrior.Enabled := (not S_BUSQUEDA.DataSet.Bof) and (EstadoRegistro in [erBuscando, erVisualizando]);
   AcNext.Enabled := (not S_BUSQUEDA.DataSet.Eof) and (EstadoRegistro in [erBuscando, erVisualizando]);
   AcLast.Enabled := (not S_BUSQUEDA.DataSet.Eof) and (EstadoRegistro in [erBuscando, erVisualizando]);
   AcAlta.Enabled := (AcAlta.Visible) and (EstadoRegistro in [erBuscando, erVisualizando]);
   AcEditar.Enabled := (AcEditar.Visible) and (EstadoRegistro in [erBuscando, erVisualizando]) and (not S_BUSQUEDA.DataSet.IsEmpty);
   AcBorrar.Enabled := (AcBorrar.Visible) and (EstadoRegistro in [erBuscando, erVisualizando]) and (not S_BUSQUEDA.DataSet.IsEmpty);
   AcSalvar.Enabled := (AcSalvar.Visible) and (EstadoRegistro in [erEditando, erInsertando]);
   AcCancelar.Enabled := (AcCancelar.Visible) and AcSalvar.Enabled;
   if EstadoRegistro in [erEditando, erInsertando, erVisualizando] then
      BtnVer.Action := AcVolver
   else
      BtnVer.Action := AcVer;
   AcVer.Enabled := (not S_BUSQUEDA.DataSet.IsEmpty) and (EstadoRegistro in [erBuscando, erVisualizando]);
   AcVolver.Enabled := (not S_BUSQUEDA.DataSet.IsEmpty) and (EstadoRegistro in [erBuscando, erVisualizando]);
end;

end.
