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

unit FormMantClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormMantBasico, DB, ImgList, ActnList, RzCommon, RzForms,
  ExtCtrls, RzButton, GridsEh, DBGridEh, StdCtrls, Mask, RzEdit, RzPanel, RzTabs,
  DataMMTOCliente, uEspera, RzRadChk, uMensajeDialog, DataMBaseDatos,
  AdvTouchKeyboard, RzCmboBx, DataMImpuestos, DataMVariables,
  FormCodigoBarras, DataMMTOMediosPago, DataMMenu;

resourcestring
   STR_ClienteNoEncontrado = 'No se ha encontrado el cliente.';
   STR_FaltaCif = 'Debe especificar un CIF para el cliente';
   STR_FaltaDescripcion = 'Debe especficiar una descripción';
   STR_FaltaTratImpuestos = 'Debe especificar el tratamiento de impuestos';
   STR_FaltaMedioPago = 'Debe especificar un medio de pago';

type
  TFrmMantClientes = class(TFrmMantBasico)
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    PaginasEdicion: TRzPageControl;
    TabOtros: TRzTabSheet;
    TabGeneral: TRzTabSheet;
    EditObservaciones: TRzMemo;
    Label7: TLabel;
    EditNombreComercial: TRzEdit;
    Label9: TLabel;
    EditDomicilio: TRzEdit;
    Label11: TLabel;
    EditPoblacion: TRzEdit;
    Label12: TLabel;
    EditProvincia: TRzEdit;
    Label13: TLabel;
    EditCodigoPostal: TRzEdit;
    Label14: TLabel;
    EditFax: TRzEdit;
    Label15: TLabel;
    EditTelefono1: TRzEdit;
    Label16: TLabel;
    EditTelefono2: TRzEdit;
    Label2: TLabel;
    EditPersonaContacto: TRzEdit;
    Label8: TLabel;
    EditEMail: TRzEdit;
    Label18: TLabel;
    RzToolButton5: TRzToolButton;
    AcCheckCliente: TAction;
    RzPanel2: TRzPanel;
    Label10: TLabel;
    Label17: TLabel;
    EditTratImpuesto: TRzComboBox;
    EditMedioPago: TRzComboBox;
    EditVentaACredito: TRzCheckBox;
    EditActivo: TRzCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure AcBorrarExecute(Sender: TObject);
    procedure AcSalvarExecute(Sender: TObject);
    procedure AcCheckClienteExecute(Sender: TObject);
    procedure AcVerExecute(Sender: TObject);
    procedure PaginasChange(Sender: TObject);
  private
    { Private declarations }
    Cliente: TCliente;
  public
    { Public declarations }
    class procedure Crea(Titulo: String ; Accion : TMenuItemCargador); override;

    procedure InicializaDataModules; override;
    procedure RellenaFichaAlta; override;
    procedure RellenaFichaEdicion; override;
    procedure SetEstadoControlesFicha; override;
    procedure ObtenerValoresUsuario; override;
    procedure ControlAcciones; override;
  end;

var
  FrmMantClientes: TFrmMantClientes;

implementation
uses
   iGeneral, WebServiceClientes;

{$R *.dfm}

procedure TFrmMantClientes.AcBorrarExecute(Sender: TObject);
begin
   inherited;
   if not S_BUSQUEDA.DataSet.IsEmpty then
   begin
       if TPVMessageDlg(STR_DeseaEliminar, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       begin
          PonEspera(STR_Eliminando, False);
          try
             DMBaseDatos.IniciaTransaccion;
             Cliente.BD_Cargar(S_BUSQUEDA.DataSet.FieldByName('CIF').AsString);
             if Cliente.Cif = '' then
                raise Exception.Create(STR_ClienteNoEncontrado);
             Cliente.BD_Eliminar;
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

procedure TFrmMantClientes.AcCheckClienteExecute(Sender: TObject);
var
   WSCliente: WSClientes;
   ClienteBean: WSClienteBean;
   Url: String;
begin
   inherited;
   if EstadoRegistro in [erEditando, erBuscando] then
   begin
      try
         Url := DMVariables.DameVariable('WEBSERVICES.WSCLIENTES', '');
         WSCliente := GetWSClientes(url, nil);

         PonEspera(STR_Consultando, False);
         ClienteBean := WSCliente.obtenerCliente(EditCodigo.Text, DMVariables.CodigoUsuario, DMVariables.ClaveUsuario);
         if ClienteBean.cif = EditCodigo.Text then
         begin
            EditActivo.Checked := (ClienteBean.activo = 'S');
            EditDescripcion.Text := ClienteBean.desCli;
            EditNombreComercial.Text := ClienteBean.nombreComercial;
            EditDomicilio.Text := ClienteBean.domicilio;
            EditPoblacion.Text := ClienteBean.poblacion;
            EditProvincia.Text := ClienteBean.provincia;
            EditCodigoPostal.Text := ClienteBean.cp;
            EditFax.Text := ClienteBean.fax;
            EditTelefono1.Text := ClienteBean.telefono1;
            EditTelefono2.Text := ClienteBean.telefono2;
            EditPersonaContacto.Text := ClienteBean.personaContacto;
            EditEMail.Text := ClienteBean.email;
            EditTratImpuesto.Value := ClienteBean.idTratImp;
            EditMedioPago.Value := ClienteBean.codMedioPago;
            EditVentaACredito.Checked := (ClienteBean.riesgoConcedido > 0);
         end;
         FinEspera;
      except
         FinEspera;
         raise;
      end;
   end;
end;

procedure TFrmMantClientes.AcSalvarExecute(Sender: TObject);
begin
   inherited;
   ObtenerValoresUsuario;

   try
      PonEspera(STR_Salvando, False);
      DMBaseDatos.IniciaTransaccion;
      if EstadoRegistro = erInsertando then
         Cliente.BD_Insertar
      else
         Cliente.BD_Actualizar;
      DMBaseDatos.CommitTransaccion;
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

      AcBuscar.Execute;
      Paginas.ActivePageIndex := 0;
   except
      DMBaseDatos.RollBackTransaccion;
      FinEspera;
      raise;
   end;
end;

procedure TFrmMantClientes.AcVerExecute(Sender: TObject);
begin
  inherited;
  PaginasEdicion.ActivePageIndex := 0;
end;

class procedure TFrmMantClientes.Crea(Titulo: String ; Accion : TMenuItemCargador);
begin
   if iAbreSiExiste( Copy( Self.ClassName, 2, 50 ) ) then Exit;

   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);
   PonEspera(STR_Iniciando, False);
   try
      try
         FrmMantClientes := TFrmMantClientes.Create( Application );

         FrmMantClientes.Caption := Titulo;
         FrmMantClientes.Accion := Accion;
         FrmMantClientes.LabelTitulo.Caption := Titulo;

         FrmMantClientes.Inicializa;

         FinEspera;
      except
         FinEspera;
         FrmMantClientes.Close;
         Raise;
      end;
   finally
      FinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmMantClientes.FormDestroy(Sender: TObject);
begin
   Cliente.Free;

   inherited; //Destruye el DMDatos
end;

procedure TFrmMantClientes.InicializaDataModules;
var
   DMImp: TDMImpuestos;
   DMMPago: TDMMediosPago;
   Imp, Pag: TDataSet;
begin
   CampoCodigo := 'CIF';
   CampoDescripcion :='DESCLI';
   DMDatos := TDMCliente.Create(Self);
   Cliente := TCliente.Create(TDMCliente(DMDatos));

   DMImp := TDMImpuestos.Create(Self);
   try
      DMBaseDatos.ponPrefijo(DMImp);
      Imp := DMImp.GetDataSetConfigImpuestosTratamiento;
      DMIMP.AbrirDataSetConfigImpuestosTratamiento;
      Imp.First;
      while not Imp.Eof do
      begin
         EditTratImpuesto.Items.Add(Imp.FieldByName('DESTRATIMP').AsString);
         EditTratImpuesto.Values.Add(Imp.FieldByName('ID_TRAT_IMPUESTOS').AsString);

         Imp.Next;
      end;
      DMIMP.CerrarDataSetConfigImpuestosTratamiento;
   finally
      DMImp.Free;
   end;

   if EditTratImpuesto.Items.Count > 0 then
      EditTratImpuesto.ItemIndex := 0;

   DMMPago := TDMMediosPago.Create(Self);
   try
      DMBaseDatos.ponPrefijo(DMMPago);
      Pag := DMMPago.GetConsultaMediosPagos;
      DMMPago.AbrirConsultaMediosPagos;
      Pag.First;
      while not Pag.Eof do
      begin
         EditMedioPago.Items.Add(Pag.FieldByName('DESMEDPAG').AsString);
         EditMedioPago.Values.Add(Pag.FieldByName('CODMEDPAG').AsString);

         Pag.Next;
      end;
      DMMPago.CerrarConsultaMediosPagos;
   finally
      DMMPago.Free;
   end;

   if EditMedioPago.Items.Count > 0 then
      EditMedioPago.ItemIndex := 0;

   AcCheckCliente.Visible := (DMVariables.DameVariable('WEBSERVICES.WSCLIENTES', '') <> '');
end;

procedure TFrmMantClientes.RellenaFichaAlta;
var
   EstadoActual: TEstadoRegistro;
begin
   EstadoActual := EstadoRegistro;
   EstadoRegistro := erInterno;
   SetEstadoControlesFicha;
   try
      EditCodigo.Text := '';
      EditDescripcion.Text := '';
      EditActivo.Checked := True;      
      EditNombreComercial.Text := '';
      EditDomicilio.Text := '';
      EditPoblacion.Text := '';
      EditProvincia.Text := '';
      EditCodigoPostal.Text := '';
      EditTelefono1.Text := '';
      EditTelefono2.Text := '';
      EditFax.Text := '';
      EditPersonaContacto.Text := '';
      EditEMail.Text := '';
      EditObservaciones.Text := '';
      EditVentaACredito.Checked := False;

      if EditTratImpuesto.Items.Count > 0 then
         EditTratImpuesto.ItemIndex := 0
      else
         EditTratImpuesto.ItemIndex := -1;

      if EditMedioPago.Items.Count > 0 then
         EditMedioPago.ItemIndex := 0
      else
         EditMedioPago.ItemIndex := -1;
   finally
      EstadoRegistro := EstadoActual;
   end;
end;

procedure TFrmMantClientes.RellenaFichaEdicion;
var
   EstadoActual: TEstadoRegistro;
begin
   if not S_BUSQUEDA.DataSet.IsEmpty then
   begin
      Cliente.BD_Cargar(S_BUSQUEDA.DataSet.FieldByName('CIF').AsString);
      if Cliente.Cif = '' then
         raise Exception.Create(STR_ClienteNoEncontrado);

      EstadoActual := EstadoRegistro;
      EstadoRegistro := erInterno;
      try
         EditCodigo.Text := Cliente.Cif;
         EditDescripcion.Text := Cliente.Descli;
         EditActivo.Checked := Cliente.Activo;
         EditNombreComercial.Text := Cliente.Nombre_comercial;
         EditDomicilio.Text := Cliente.Domicilio;
         EditPoblacion.Text := Cliente.Poblacion;
         EditProvincia.Text := Cliente.Provincia;
         EditCodigoPostal.Text := Cliente.Cp;
         EditTelefono1.Text := Cliente.Telefono1;
         EditTelefono2.Text := Cliente.Telefono2;
         EditFax.Text := Cliente.Fax;
         EditPersonaContacto.Text := Cliente.Persona_contacto;
         EditEMail.Text := Cliente.Email;
         EditTratImpuesto.ItemIndex := EditTratImpuesto.Values.IndexOf(IntToStr(Cliente.Id_trat_impuestos));
         EditMedioPago.ItemIndex := EditMedioPago.Values.IndexOf(Cliente.Codmedpag);
         EditObservaciones.Text := Cliente.Observaciones;
         EditVentaACredito.Checked := Cliente.VentaACredito;
      finally
         EstadoRegistro := EstadoActual;
      end;
   end;
end;

procedure TFrmMantClientes.SetEstadoControlesFicha;
begin
   EditCodigo.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando, erEditando]);
   EditDescripcion.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);

   EditActivo.ReadOnly          := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditNombreComercial.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditDomicilio.ReadOnly       := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditPoblacion.ReadOnly       := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditProvincia.ReadOnly       := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditCodigoPostal.ReadOnly    := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditTelefono1.ReadOnly       := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditTelefono2.ReadOnly       := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditFax.ReadOnly             := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditPersonaContacto.ReadOnly := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditEMail.ReadOnly           := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditTratImpuesto.ReadOnly    := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditMedioPago.ReadOnly       := (EstadoRegistro in [erBuscando, erVisualizando]);
   EditVentaACredito.ReadOnly   := (EstadoRegistro in [erBuscando, erVisualizando]);
end;

procedure TFrmMantClientes.ObtenerValoresUsuario;
begin
   //Obtiene los valores de pantalla y los carga en la clase
   Cliente.Cif :=  EditCodigo.Text;
   Cliente.Descli :=  EditDescripcion.Text;
   Cliente.Activo := EditActivo.Checked;
   Cliente.Nombre_comercial := EditNombreComercial.Text;
   Cliente.Domicilio := EditDomicilio.Text;
   Cliente.Poblacion := EditPoblacion.Text;
   Cliente.Provincia := EditProvincia.Text;
   Cliente.Cp := EditCodigoPostal.Text;
   Cliente.Telefono1:= EditTelefono1.Text;
   Cliente.Telefono2 := EditTelefono2.Text;
   Cliente.Fax := EditFax.Text;
   Cliente.Persona_contacto := EditPersonaContacto.Text;
   Cliente.Email := EditEMail.Text;
   Cliente.Id_trat_impuestos := StrToInt(EditTratImpuesto.Value);
   Cliente.Codmedpag := EditMedioPago.Value;
   Cliente.Observaciones := EditObservaciones.Text;
   Cliente.VentaACredito := EditVentaACredito.Checked;

   //Hace las validaciones necesarias
   if Cliente.Cif = '' then
      raise Exception.Create(STR_FaltaCif);

   if Cliente.Descli = '' then
      raise Exception.Create(STR_FaltaDescripcion);

   if Cliente.Id_trat_impuestos < 0 then
      raise Exception.Create(STR_FaltaTratImpuestos);

   if Cliente.Codmedpag = '' then
      raise Exception.Create(STR_FaltaMedioPago);
end;

procedure TFrmMantClientes.PaginasChange(Sender: TObject);
begin
  inherited;
  if Paginas.ActivePageIndex = 1 then
     PaginasEdicion.ActivePageIndex := 0;
end;

procedure TFrmMantClientes.ControlAcciones;
begin
   inherited;
   AcCheckCliente.Enabled := EstadoRegistro in [erEditando, erInsertando];
end;

initialization
   RegisterClass(TFrmMantClientes);

end.
