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

unit FormConfiguracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvTouchKeyboard, RzButton, Grids, DBGrids, RzDBGrid, StdCtrls, Mask,
  RzEdit, RzPanel, ExtCtrls, ImgList, DB, FormBase, RzCommon, RzForms, RzLabel,
  DataMTienda, RzCmboBx, RzTabs, DataMConfiguracionDispositivos, XMLIntf, XMLDoc, uMensajeDialog,
  uEspera, DataMCore, DataMVariables, DataMBaseDatos, ActnList, uDispositivos, DataMMenu;

resourcestring
   STR_Iniciando = 'Iniciando';
   STR_InfoCambioConf = 'Para que los cambios realizados sean efectivos deberá reiniciar la aplicación.';
   STR_NoSeHaCargadoConfig = 'No se ha podido cargar la información de configuración';
   STR_TiendaNoExiste = 'No existe el ninguna tienda con el código especificado.';
   STR_CambiarCaja = 'Se va a modificar el código de tienda y/o caja activa. ¿Desea continuar?';
   STR_CajaYaConfigurada = '¡¡¡ATENCION!!!' + #13#10 + 'Esta seleccionando una caja ya configurada para otro TPV. ¿Desea continuar?';
   STR_NoConfig = 'El dispositivo no acepta configuración';

type
  TBotonCaja = class(TRzToolButton)
  public
     CodCaja: String;
     Asignada: Boolean;
     GUID: String;
  end;
  TFrmConfiguracion = class(TFrmBase)
    Paginas: TRzPageControl;
    TabGeneral: TRzTabSheet;
    RzGroupBox1: TRzGroupBox;
    TabVisor: TRzTabSheet;
    TabCajon: TRzTabSheet;
    TabImpresora: TRzTabSheet;
    RzGroupBox2: TRzGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    EditVisorTipo: TRzMRUComboBox;
    EditVisorTipoConexion: TRzMRUComboBox;
    ImagenesConfiguracion: TImageList;
    EditCP: TRzNumericEdit;
    AdvTouchKeyboard1: TAdvTouchKeyboard;
    BtnAceptar: TRzBitBtn;
    BtnCancelar: TRzBitBtn;
    RzGroupBox5: TRzGroupBox;
    Label31: TLabel;
    BtnGenerales: TRzToolButton;
    BtnVisor: TRzToolButton;
    BtnCajon: TRzToolButton;
    BtnImpresora: TRzToolButton;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    TabTarjeta: TRzTabSheet;
    RzGroupBox3: TRzGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    EditCajonTipo: TRzMRUComboBox;
    EditCajonTipoConexion: TRzMRUComboBox;
    RzGroupBox4: TRzGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    EditImpresoraTipo: TRzMRUComboBox;
    EditImpresoraTipoConexion: TRzMRUComboBox;
    RzGroupBox6: TRzGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    EditTarjetaTipo: TRzMRUComboBox;
    EditTarjetaTipoConexion: TRzMRUComboBox;
    BtnTarjeta: TRzToolButton;
    MemoVisorDetalle: TMemo;
    MemoCajonDetalle: TMemo;
    MemoImpresoraDetalle: TMemo;
    MemoTarjetaDetalle: TMemo;
    RzPanel1: TRzPanel;
    PanelCaja: TRzPanel;
    Label28: TLabel;
    EditListaTiendas: TRzComboBox;
    Label1: TLabel;
    RzPanel2: TRzPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    BtnEditarConfigTarjeta: TRzBitBtn;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGeneralesClick(Sender: TObject);
    procedure EditVisorTipoSelect(Sender: TObject);
    procedure EditVisorTipoConexionSelect(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditDescripcionClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditListaTiendasSelect(Sender: TObject);
    procedure BtnEditarConfigTarjetaClick(Sender: TObject);
  private
    { Private declarations }
    DMCD: TDMConfiguracionDispositivos;
    DMT: TDMTienda;
    Configuracion: TConfiguracionDispositivo;
    InfoTienda: TInfoTienda;

    //Variables que almacenan temporalmente los datos necesarios antes de Aceptar.
    vVisorModelo: String;
    vVisorMetodoconexion: String;
    vVisorTipoconexion: String;
    iVisorNodoaSalvarMetodoconexion: IXMLNode;

    vCajonModelo: String;
    vCajonMetodoconexion: String;
    vCajonTipoconexion: String;
    iCajonNodoaSalvarMetodoconexion: IXMLNode;
    iCajonNodoaSalvarOperaciones: IXMLNode;

    vImpresoraModelo: String;
    vImpresoraMetodoconexion: String;
    vImpresoraTipoconexion: String;
    iImpresoraNodoaSalvarMetodoconexion: IXMLNode;
    iImpresoraNodoaSalvarOperaciones: IXMLNode;

    vTarjetaModelo: String;
    vTarjetaMetodoconexion: String;
    vTarjetaTipoconexion: String;
    iTarjetaNodoaSalvarMetodoconexion: IXMLNode;

    FXML: IXMLDocument;

    procedure CargaTipoDispositivos;
    procedure CargaMetodoDispositivos(NodoPadre: String; NodoHijo: String;
                                      EditTipo: TRzMRUComboBox; EditMetodo: TRzMRUComboBox);
    procedure PintaLista(NodoPadre: String; NodoHijo: String;
                         EditTipo: TRzMRUComboBox; EditMetodo: TRzMRUComboBox);
    procedure CargaListaTiendas;
    procedure CargaPanelCajas(CodigoTienda: String);
    procedure SetColorBotonesCajas;
    procedure BotonCajaClick(Sender: TObject);
    function DameCajaSeleccionada: String;    
  public
    { Public declarations }
    class procedure Crea(Titulo : String ; Accion : TMenuItemCargador); override;
    procedure Inicializa; override;
  end;

var
  FrmConfiguracion: TFrmConfiguracion;

implementation
uses
   iGeneral;

{$R *.dfm}

procedure TFrmConfiguracion.BtnGeneralesClick(Sender: TObject);
begin
  inherited;
   if Sender = BtnGenerales then
      Paginas.ActivePage := TabGeneral
   else if Sender = BtnVisor then
      Paginas.ActivePage := TabVisor
   else if Sender = BtnCajon then
      Paginas.ActivePage := TabCajon
   else if Sender = BtnImpresora then
      Paginas.ActivePage := TabImpresora
   else if Sender = BtnTarjeta then
      Paginas.ActivePage := TabTarjeta;
end;

class procedure TFrmConfiguracion.Crea(Titulo : String ; Accion : TMenuItemCargador);
begin
   if iAbreSiExiste( Copy( Self.ClassName, 2, 50 ) ) then Exit;

   Screen.Cursor := crHourGlass;
   LockWindowUpdate(Application.MainForm.Handle);
   PonEspera(STR_Iniciando, False);
   try
      FrmConfiguracion := Self.Create( Application );
      try
         FrmConfiguracion.Caption := Titulo;
         FrmConfiguracion.Accion := Accion;
         FrmConfiguracion.Inicializa;
         FinEspera;
         FrmConfiguracion.ShowModal;
         DMCore.InicioCheckConfiguracion;
      finally
         FrmConfiguracion.Free;
      end;
   finally
      FinEspera;
      LockWindowUpdate(0);
      Screen.Cursor := crDefault;
   end;
end;

procedure TFrmConfiguracion.EditDescripcionClick(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).SelectAll;
end;

procedure TFrmConfiguracion.EditListaTiendasSelect(Sender: TObject);
begin
   inherited;

   CargaPanelCajas(EditListaTiendas.Value);
   SetColorBotonesCajas;
end;

procedure TFrmConfiguracion.EditVisorTipoConexionSelect(Sender: TObject);
begin
  inherited;
  if Sender = EditVisorTipoConexion then
     PintaLista('visores','visor', EditVisorTipo, TRzMRUComboBox(sender))
  else if Sender = EditCajonTipoConexion then
     PintaLista('cajones','cajon', EditCajonTipo, TRzMRUComboBox(sender))
  else if Sender = EditImpresoraTipoConexion then
     PintaLista('impresoras','impresora', EditImpresoraTipo, TRzMRUComboBox(sender))
  else if Sender = EditTarjetaTipoConexion then
     PintaLista('tarjetas','tarjeta', EditTarjetaTipo, TRzMRUComboBox(sender));
end;

procedure TFrmConfiguracion.EditVisorTipoSelect(Sender: TObject);
begin
  inherited;
  if Sender = EditVisorTipo then
     CargaMetodoDispositivos('visores','visor',TRzMRUComboBox(sender),EditVisorTipoConexion)
  else if Sender = EditCajonTipo then
     CargaMetodoDispositivos('cajones','cajon',TRzMRUComboBox(sender),EditCajonTipoConexion)
  else if Sender = EditImpresoraTipo then
     CargaMetodoDispositivos('impresoras','impresora',TRzMRUComboBox(sender),EditImpresoraTipoConexion)
  else if Sender = EditTarjetaTipo then
     CargaMetodoDispositivos('tarjetas','tarjeta',TRzMRUComboBox(sender),EditTarjetaTipoConexion);
end;

procedure TFrmConfiguracion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   inherited;
   Action := caFree;
end;

procedure TFrmConfiguracion.FormCreate(Sender: TObject);
begin
  inherited;
   //Inicidar clases de datos.
  DMCD := TDMConfiguracionDispositivos.Create(Self);
  Configuracion := TConfiguracionDispositivo.Create(DMCD, DMVariables.UIDTPV);
  InfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
  DMT := TDMTienda.Create(Self);

  FXML := TXMLDocument.Create(Self);
end;

procedure TFrmConfiguracion.FormDestroy(Sender: TObject);
begin
   inherited;
   DMCD.Free;
   Configuracion.Free;
   InfoTienda.Free;
   DMT.Free;
end;

procedure TFrmConfiguracion.Inicializa;
begin
   iCerrarOtrasVentanas(Self);
   //Carga XML de Configuración de Dispositivos
   CargaTipoDispositivos;

   //Cargar datos XML - ORABLOB. - Pestañas Visor/Cajón/Impresora
   if Configuracion.XMLConfiguracion.IsEmptyDoc then
      TPVMessageDlg(STR_NoSeHaCargadoConfig, mtWarning, [mbOK], 0);

   //Iniciar controles visuales.
   TabGeneral.TabVisible := False;
   TabVisor.TabVisible := False;
   TabCajon.TabVisible := False;
   TabImpresora.TabVisible := False;
   TabTarjeta.TabVisible := False;
   Paginas.ActivePage := TabGeneral;
   BtnGenerales.Down := True;

   //Pintar información XML en pantalla.
//   EditVisorTipo.ItemIndex := DameItemsCombox(EditVisorTipo, Configuracion.Visor_modelo);
   EditVisorTipo.ItemIndex := iif(EditVisorTipo.IndexOf(Configuracion.Visor_modelo) < 0, 0, EditVisorTipo.IndexOf(Configuracion.Visor_modelo));
   CargaMetodoDispositivos('visores', 'visor', EditVisorTipo, EditVisorTipoConexion);
   EditVisorTipoConexion.ItemIndex := EditVisorTipoConexion.IndexOf(Configuracion.Visor_metodoconexion);
   PintaLista('visores', 'visor', EditVisorTipo, EditVisorTipoConexion);

   EditCajonTipo.ItemIndex := iif(EditCajonTipo.IndexOf(Configuracion.Cajon_modelo) < 0, 0, EditCajonTipo.IndexOf(Configuracion.Cajon_modelo));
   CargaMetodoDispositivos('cajones', 'cajon', EditCajonTipo, EditCajonTipoConexion);
   EditCajonTipoConexion.ItemIndex := iif(EditCajonTipoConexion.IndexOf(Configuracion.Cajon_metodoconexion) < 0, 0, EditCajonTipoConexion.IndexOf(Configuracion.Cajon_metodoconexion));
   PintaLista('cajones', 'cajon', EditCajonTipo, EditCajonTipoConexion);

   EditImpresoraTipo.ItemIndex := iif(EditImpresoraTipo.IndexOf(Configuracion.Impresora_modelo) < 0, 0, EditImpresoraTipo.IndexOf(Configuracion.Impresora_modelo));
   CargaMetodoDispositivos('impresoras', 'impresora', EditImpresoraTipo, EditImpresoraTipoConexion);
   EditImpresoraTipoConexion.ItemIndex := iif(EditImpresoraTipoConexion.IndexOf(Configuracion.Impresora_metodoconexion) < 0, 0, EditImpresoraTipoConexion.IndexOf(Configuracion.Impresora_metodoconexion));
   PintaLista('cajones', 'cajon', EditCajonTipo, EditCajonTipoConexion);

   EditTarjetaTipo.ItemIndex := iif(EditTarjetaTipo.IndexOf(Configuracion.Tarjeta_modelo) < 0, 0, EditTarjetaTipo.IndexOf(Configuracion.Tarjeta_modelo));
   CargaMetodoDispositivos('tarjetas', 'tarjeta', EditTarjetaTipo, EditTarjetaTipoConexion);
   EditTarjetaTipoConexion.ItemIndex := EditTarjetaTipoConexion.IndexOf(Configuracion.Tarjeta_metodoconexion);
   PintaLista('tarjetas', 'tarjeta', EditTarjetaTipo, EditTarjetaTipoConexion);

   CargaListaTiendas;
   CargaPanelCajas(EditListaTiendas.Value);
   SetColorBotonesCajas;
end;


procedure TFrmConfiguracion.BtnAceptarClick(Sender: TObject);
var
   lCambiarCaja: Boolean;
   NuevaInfoTienda: TInfoTienda;
   CajaAGrabar: String;
begin
   lCambiarCaja := False;
   //Salvar datos en la Clase TConfiguracion - Pestañas Visor/Cajon/Impresora
   if (EditVisorTipo.Text = '') or (EditVisorTipo.Text = 'NO USA VISOR') then
   begin
      Configuracion.Visor_modelo := 'NO USA VISOR';
      Configuracion.Visor_metodoconexion := '';
      Configuracion.Visor_tipoconexion := '';
      Configuracion.Visor_Nodo_Metodoconexion := nil;
   end
   else
   begin
      Configuracion.Visor_modelo := vVisorModelo;
      Configuracion.Visor_metodoconexion := vVisorMetodoconexion;
      Configuracion.Visor_tipoconexion := vVisorTipoconexion;
      Configuracion.Visor_Nodo_Metodoconexion := iVisorNodoaSalvarMetodoconexion;
   end;

   if (EditCajonTipo.Text = '') or (EditCajonTipo.Text = 'NO USA CAJON') then
   begin
      Configuracion.Cajon_modelo := 'NO USA CAJON';
      Configuracion.Cajon_metodoconexion := '';
      Configuracion.Cajon_tipoconexion := '';
      Configuracion.Cajon_Nodo_Metodoconexion := nil
   end
   else
   begin
      Configuracion.Cajon_modelo := vCajonModelo;
      Configuracion.Cajon_metodoconexion := vCajonMetodoconexion;
      Configuracion.Cajon_tipoconexion := vCajonTipoconexion;
      Configuracion.Cajon_Nodo_Metodoconexion := iCajonNodoaSalvarMetodoconexion;
      Configuracion.Cajon_Nodo_Operaciones := iCajonNodoaSalvarOperaciones;
   end;

   if (EditImpresoraTipo.Text = '') or (EditImpresoraTipo.Text = 'NO USA IMPRESORA') then
   begin
      Configuracion.Impresora_modelo := 'NO USA IMPRESORA';
      Configuracion.Impresora_metodoconexion := '';
      Configuracion.Impresora_tipoconexion := '';
      Configuracion.Impresora_Nodo_Metodoconexion := nil;
   end
   else
   begin
      Configuracion.Impresora_modelo := vImpresoraModelo;
      Configuracion.Impresora_metodoconexion := vImpresoraMetodoconexion;
      Configuracion.Impresora_tipoconexion := vImpresoraTipoconexion;
      Configuracion.Impresora_Nodo_Metodoconexion := iImpresoraNodoaSalvarMetodoconexion;
      Configuracion.Impresora_Nodo_Operaciones := iImpresoraNodoaSalvarOperaciones;
   end;

   if (EditTarjetaTipo.Text = '') or (EditTarjetaTipo.Text = 'NO USA LECTOR TARJETAS') then
   begin
      Configuracion.Tarjeta_modelo := 'NO USA LECTOR TARJETAS';
      Configuracion.Tarjeta_metodoconexion := '';
      Configuracion.Tarjeta_tipoconexion := '';
      Configuracion.Tarjeta_Nodo_Metodoconexion := nil;
   end
   else
   begin
      Configuracion.Tarjeta_modelo := vTarjetaModelo;
      Configuracion.Tarjeta_metodoconexion := vTarjetaMetodoconexion;
      Configuracion.Tarjeta_tipoconexion := vTarjetaTipoconexion;
      Configuracion.Tarjeta_Nodo_Metodoconexion := iTarjetaNodoaSalvarMetodoconexion;
   end;

   //Validaciones
   try
      //Si no se ha seleccionado ninguna caja grabar la caja actual
      CajaAGrabar := DameCajaSeleccionada;
      if CajaAGrabar = '' then
         CajaAGrabar := DMVariables.CodigoCaja;

      if (EditListaTiendas.Value <> InfoTienda.Codalm) or
         (CajaAGrabar <> InfoTienda.CodCaja) then
      begin
          if TPVMessageDlg(STR_CambiarCaja, mtWarning, [mbYes, mbNo], 0) = mrYes then
             lCambiarCaja := True
          else
             Exit;
      end;

      //Guardar la configuración
      DMBaseDatos.IniciaTransaccion;

      Configuracion.BD_Salvar_xml;

      if lCambiarCaja then
      begin
         NuevaInfoTienda := TInfoTienda.Create(nil, DMVariables.UIDTPV);
         try
            NuevaInfoTienda.Codalm := EditListaTiendas.Value;
            NuevaInfoTienda.CodCaja := CajaAGrabar;
            if not NuevaInfoTienda.BD_ExisteTienda then
               raise Exception.Create(STR_TiendaNoExiste);

            NuevaInfoTienda.BD_CambiarConfiguracionTienda(NuevaInfoTienda.Codalm, NuevaInfoTienda.CodCaja);

            //Establecer los valores en variables
            DMVariables.CodigoTienda := NuevaInfoTienda.Codalm;
            DMVariables.CodigoAlmacen := NuevaInfoTienda.Codalm;
            DMVariables.CodigoCaja := NuevaInfoTienda.CodCaja;
         finally
            NuevaInfoTienda.Free;
         end;
      end;

      DMBaseDatos.CommitTransaccion;

      TPVMessageDlg(STR_InfoCambioConf, mtInformation, [mbOK], 0);
   except
      DMBaseDatos.RollbackTransaccion;
      raise;
   end;
   ModalResult := mrOk;
end;

procedure TFrmConfiguracion.CargaTipoDispositivos;
var
    i : Integer;
    idispositivos : IXMLNode;
    ivisores: IXMLNode;
    ivisor: IXMLNode;
    icajones: IXMLNode;
    icajon: IXMLNode;
    iimpresoras: IXMLNode;
    iimpresora: IXMLNode;
    itarjetas: IXMLNode;
    itarjeta: IXMLNode;
    ficheroDispositivos: String;
begin
   ficheroDispositivos := DMCore.DameRutaRecurso('conf\Dispositivos\dispositivosTPV.xml');

   try
      FXML.FileName := ficheroDispositivos;

      if not FXML.Active then
         FXML.Active := True;

      idispositivos := FXML.ChildNodes.FindNode('dispositivos');

      //Carga Rama Visores - Modelo
      ivisores := idispositivos.ChildNodes.FindNode('visores');
      if ivisores <> nil then
      begin
         for i := 0 to ivisores.ChildNodes.Count - 1 do
         begin
            ivisor := ivisores.ChildNodes.Nodes[i];
            if ivisor <> nil then            
               EditVisorTipo.AddObject(ivisor.Attributes['modelo'], TXMLNode(iVisor));
         end;
      end;

      //Carga Rama Cajones - Modelo
      icajones := idispositivos.ChildNodes.FindNode('cajones');
      if icajones <> nil then
      begin
         for i := 0 to icajones.ChildNodes.Count -1 do
         begin
            icajon := icajones.ChildNodes.Nodes[i];
            if icajon <> nil then            
               EditCajonTipo.Add(icajon.Attributes['modelo']);
         end;
      end;


      //Carga Rama Impresoras - Modelo
      iimpresoras := idispositivos.ChildNodes.FindNode('impresoras');
      if iimpresoras <> nil then
      begin
         for i := 0 to iimpresoras.ChildNodes.Count - 1 do
         begin
            iimpresora := iimpresoras.ChildNodes.Nodes[i];
            if iimpresora <> nil then
               EditImpresoraTipo.Add(iimpresora.Attributes['modelo']);
         end;
      end;

      //Carga Rama Tarjetas - Modelo
      itarjetas := idispositivos.ChildNodes.FindNode('tarjetas');
      if itarjetas <> nil then
      begin
         for i := 0 to itarjetas.ChildNodes.Count - 1 do
         begin
            itarjeta := itarjetas.ChildNodes.Nodes[i];
            if itarjeta <> nil then            
               EditTarjetaTipo.Add(itarjeta.Attributes['modelo']);
         end;
      end;
   except
      raise;
//      raise Exception.Create('Se ha detectado un error de estructura en el XML de configuración. Compruebe estructura y datos.');
   end;
end;

procedure TFrmConfiguracion.CargaMetodoDispositivos(NodoPadre: string; NodoHijo: string;
                                                       EditTipo: TRzMRUComboBox; EditMetodo: TRzMRUComboBox);
var
   i : Integer;
   x : Integer;
   idispositivos : IXMLNode;
   iNodoPadre: IXMLNode;
   iNodoHijo: IXMLNode;
   imetodosconexion: IXMLNode;
   imetodoconexion: IXMLNode;
begin
   //Reinicia valores visuales de las lista.
   if NodoPadre = 'visores' then
      MemoVisorDetalle.Clear
   else if NodoPadre = 'cajones' then
      MemoCajonDetalle.Clear
   else if NodoPadre = 'impresoras' then
      MemoImpresoraDetalle.clear
   else if NodoPadre = 'tarjetas' then
      MemoTarjetaDetalle.Clear;

   EditMetodo.Clear;

   try
      //Carga Rama - Dispositivos
      idispositivos := FXML.ChildNodes.FindNode('dispositivos');

      //Carga Rama - Modelo
      iNodoPadre := idispositivos.ChildNodes.FindNode(NodoPadre);
      for i := 0 to iNodoPadre.ChildNodes.Count - 1 do
      begin
         iNodoHijo := iNodoPadre.ChildNodes.Nodes[i];
         if EditTipo.Text = iNodoHijo.Attributes['modelo'] then
         begin
            imetodosconexion := iNodoHijo.ChildNodes.FindNode('metodosconexion');

            //Añade el nombre de conexion a la lista.
            for x := 0 to imetodosconexion.ChildNodes.Count - 1 do
            begin
               imetodoconexion := imetodosconexion.ChildNodes.Nodes[x];
               EditMetodo.Add(imetodoconexion.Attributes['nombreconexion']);
            end;
            EditMetodo.ItemIndex := 0;
            PintaLista(NodoPadre,NodoHijo,EditTipo,EditMetodo);
         end;
      end;
   except
      EditMetodo.ItemIndex := -1;
      TPVMessageDlg('Se ha detectado un error de estructura al cargar el Tipo de Conexión. Compruebe la rama ' + NodoPadre, mtError, [mbOk], 0);
   end;
end;

procedure TFrmConfiguracion.PintaLista(NodoPadre: string; NodoHijo: string;
                                          EditTipo: TRzMRUComboBox; EditMetodo: TRzMRUComboBox);
var
   i : Integer;
   x : Integer;
   idispositivos : IXMLNode;
   iNodoPadre: IXMLNode;
   iNodoHijo: IXMLNode;
   imetodosconexion: IXMLNode;
   imetodoconexion: IXMLNode;
   iNode: IXMLNode;
   iNode1: IXMLNode;
   iNode2: IXMLNode;
begin
   try
      idispositivos := FXML.ChildNodes.FindNode('dispositivos');

      //Carga Rama - Modelo
      iNodoPadre := idispositivos.ChildNodes.FindNode(NodoPadre);
      for i := 0 to iNodoPadre.ChildNodes.Count - 1 do
      begin
         iNodoHijo := iNodoPadre.ChildNodes.Nodes[i];
         if EditTipo.Text = iNodoHijo.Attributes['modelo'] then
         begin
            imetodosconexion := iNodoHijo.ChildNodes.FindNode('metodosconexion');
            //Añade el nombre de conexion a la lista.
            for x := 0 to imetodosconexion.ChildNodes.Count - 1 do
            begin
               imetodoconexion := imetodosconexion.ChildNodes.Nodes[x];
               if EditMetodo.Text = imetodoconexion.Attributes['nombreconexion'] then
               begin
                  //Guarda los modelo, metodo y tipo y el resto de nodos de su rama.
                  iNode1 := imetodoconexion;
                  iNode1.AddChild('metodoconexion');
                  iNode2 := iNode1.ChildNodes.FindNode('metodoconexion');
                  if imetodoconexion.ChildNodes.FindNode(imetodoconexion.Attributes['tipoconexion']) <> nil then
                     iNode2.ChildNodes.Add(imetodoconexion.ChildNodes.FindNode(imetodoconexion.Attributes['tipoconexion']));

                  if NodoPadre = 'visores' then
                  begin
                     vVisorModelo := iNodoHijo.Attributes['modelo'];
                     vVisorMetodoconexion := imetodoconexion.Attributes['nombreconexion'];
                     vVisorTipoconexion := imetodoconexion.Attributes['tipoconexion'];

                     iVisorNodoaSalvarMetodoconexion := iNode2;

                     MemoVisorDetalle.Lines.Clear;
                     MemoVisorDetalle.Lines.Add(iVisorNodoaSalvarMetodoconexion.XML);
                  end;

                  if NodoPadre = 'cajones' then
                  begin
                     vCajonModelo := iNodoHijo.Attributes['modelo'];
                     vCajonMetodoconexion := imetodoconexion.Attributes['nombreconexion'];
                     vCajonTipoconexion := imetodoconexion.Attributes['tipoconexion'];

                     iCajonNodoaSalvarMetodoconexion := iNode2;

                     MemoCajonDetalle.Lines.Clear;
                     MemoCajonDetalle.Lines.Add(iCajonNodoaSalvarMetodoconexion.XML);

                     //Anexa el nodo OPERACIONES si existe.
                     iNode := iNodoHijo.ChildNodes.FindNode('operaciones');
                     if iNode <> nil then
                     begin
                        iCajonNodoaSalvarOperaciones := iNode;
                        MemoCajonDetalle.Lines.Add(iCajonNodoaSalvarOperaciones.XML);
                     end;
                  end;

                  if NodoPadre = 'impresoras' then
                  begin
                     vImpresoraModelo := iNodoHijo.Attributes['modelo'];
                     vImpresoraMetodoconexion := imetodoconexion.Attributes['nombreconexion'];
                     vImpresoraTipoconexion := imetodoconexion.Attributes['tipoconexion'];

                     iImpresoraNodoaSalvarMetodoconexion := iNode2;

                     MemoImpresoraDetalle.Lines.Clear;
                     MemoImpresoraDetalle.Lines.Add(iImpresoraNodoaSalvarMetodoconexion.XML);

                     //Anexa el nodo OPERACIONES si existe.
                     iNode := iNodoHijo.ChildNodes.FindNode('operaciones');
                     if iNode <> nil then
                     begin
                        iImpresoraNodoaSalvarOperaciones := iNode;
                        MemoImpresoraDetalle.Lines.Add(iImpresoraNodoaSalvarOperaciones.XML);
                     end;
                  end;

                  if NodoPadre = 'tarjetas' then
                  begin
                     vTarjetaModelo := iNodoHijo.Attributes['modelo'];
                     vTarjetaMetodoconexion := imetodoconexion.Attributes['nombreconexion'];
                     vTarjetaTipoconexion := imetodoconexion.Attributes['tipoconexion'];

                     iTarjetaNodoaSalvarMetodoconexion := iNode2;

                     MemoTarjetaDetalle.Lines.Clear;
                     MemoTarjetaDetalle.Lines.Add(iTarjetaNodoaSalvarMetodoconexion.XML);
                  end;
               end;
            end;
         end;
      end;
   except
      EditMetodo.ItemIndex := -1;
      TPVMessageDlg('Se ha detectado un error de estructura al cargar el Método de Conexión. Compruebe la rama ' + NodoPadre, mtError, [mbOk], 0);
   end;
end;

procedure TFrmConfiguracion.BtnEditarConfigTarjetaClick(Sender: TObject);
var
   tarjeta: TTarjeta;
   sClase: String;
begin
   inherited;

   if EditTarjetaTipo.Text <> 'NO USA LECTOR TARJETAS' then
   begin
      sClase := DMCore.Dispositivos.GetTarjetaClassName(vTarjetaTipoconexion);
      tarjeta := TTarjetaClass(GetClass(sClase)).Create;
      try
         tarjeta.CargaConfiguracion(iTarjetaNodoaSalvarMetodoconexion);
         tarjeta.Conecta;
         tarjeta.AbreConfiguracion;
      finally
         tarjeta.Desconecta;
         tarjeta.Free;
      end;
   end;
end;

procedure TFrmConfiguracion.CargaListaTiendas;
var
   Lista: TDataSet;
   indice: Integer;
begin
   Lista := DMT.GetDataSetListaTiendas;
   while not Lista.Eof do
   begin
      EditListaTiendas.Items.Add(Lista.FieldByName('DESALM').AsString);
      EditListaTiendas.Values.Add(Lista.FieldByName('CODALM').AsString);
      Lista.Next;
   end;
   indice := EditListaTiendas.Values.IndexOf(InfoTienda.Codalm);
   if indice < 0 then
      if EditListatiendas.Count > 0 then
         indice := 0;
   EditListaTiendas.ItemIndex := indice;
end;

procedure TFrmConfiguracion.CargaPanelCajas(CodigoTienda: String);
var
   Boton: TBotonCaja;
   xPos, yPos, xOffSet, yOffSet: Integer;
   i: Integer;
begin
   xOffSet := 10;
   yOffSet := 10;
   xPos := xOffSet;
   yPos := yOffSet;

   while PanelCaja.ComponentCount > 0 do
      PanelCaja.Components[0].Free;

   for I := 0 to 9 do
   begin
      Boton := TBotonCaja.Create(PanelCaja);
      Boton.Parent := PanelCaja;
      Boton.Height := 60;
      Boton.Width := 115;
      Boton.Left := xPos + xOffSet;
      Boton.Top := yPos + yOffSet;
      Boton.Images := ImagenesConfiguracion;
      Boton.ImageIndex := 9;
      Boton.CodCaja := iZero(IntToStr(10 * i), 2);
      Boton.ShowCaption := True;
      Boton.Font.Color := clBlack;
      Boton.Font.Name := 'Tahoma';
      Boton.Font.Size := 12;
      Boton.Caption := Boton.CodCaja;
      Boton.GUID := DMT.DameUID_TPV(CodigoTienda, Boton.CodCaja);
      Boton.Asignada := (Boton.GUID = DMVariables.UIDTPV);
      Boton.GroupIndex := 1;

      Boton.OnClick := BotonCajaClick;

      xPos := xPos + Boton.Width;
      if i = 4 then
      begin
         yPos := yPos + Boton.Height;
         xPos := xOffSet;
      end;
   end;
end;

procedure TFrmConfiguracion.SetColorBotonesCajas;
var
   i: Integer;
begin
   for i := 0 to PanelCaja.ComponentCount - 1 do
   begin
      if (PanelCaja.Components[i] is TBotonCaja) then
      begin
         with TBotonCaja(PanelCaja.Components[i]) do
         begin
            Font.Style := [];
            Font.Color := clBlack;
            if Asignada then
            begin
               Font.Color := clGreen;
               Font.Style := [fsBold];
            end
            else if GUID <> '' then
            begin
               Font.Style := [fsStrikeOut];
               Font.Color := clRed;
            end
            else if Down then
            begin
               Font.Color := clBlue;
               Font.Style := [fsBold];
            end
            else
               Font.Color := clBlack;
         end;
      end;
   end;
end;

procedure TFrmConfiguracion.BotonCajaClick(Sender: TObject);
begin
   if TBotonCaja(Sender).GUID <> '' then
   begin
      if not TBotonCaja(Sender).Asignada then
         if TPVMessageDlg(STR_CajaYaConfigurada, mtWarning, [mbYes, mbNo], 0) = mrYes then
            TBotonCaja(Sender).Down := True;
   end
   else
      TBotonCaja(Sender).Down := True;
   SetColorBotonesCajas;
end;

function TFrmConfiguracion.DameCajaSeleccionada: String;
var
   i: Integer;
begin
   result := '';
   for i := 0 to PanelCaja.ComponentCount - 1 do
   begin
      if (PanelCaja.Components[i] is TBotonCaja) then
      begin
         if TBotonCaja(PanelCaja.Components[i]).Down then
         begin
            result := TBotonCaja(PanelCaja.Components[i]).CodCaja;
            Exit;
         end;
      end;
   end;
end;

Initialization
   RegisterClass(TFrmConfiguracion);

end.

