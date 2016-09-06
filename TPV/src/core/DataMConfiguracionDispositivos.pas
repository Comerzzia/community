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

unit DataMConfiguracionDispositivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataMBase, DB, Contnrs, DBClient, Provider,
  XMLIntf, XMLDoc, DataMBaseDatos, MemDS, DBAccess, Uni, uMensajeDialog;

resourcestring
   STR_ConfiguracionIncorrecta = 'Configuración incorrecta. Revisar configuración de dispositivos';
type
  TDMConfiguracionDispositivos = class(TDMBase)
    Q_TIENDAS_CAJAS_XML: TUniQuery;
    Q_ACTUALIZA_CONFIGURACION_XML: TUniQuery;
    Q_INSERTA_CONFIGURACION_XML: TUniQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TConfiguracionDispositivo = class(TDBDataObject)
  private
     FUID_TPV: String;
     FXMLConfiguracion: IXMLDocument;

     FVisor_modelo: String;
     FVisor_metodoconexion: String;
     FVisor_tipoconexion:String;
     FVisor_Nodo_Metodoconexion: IXMLNode;

     FCajon_modelo: String;
     FCajon_metodoconexion: String;
     FCajon_tipoconexion: String;
     FCajon_Nodo_Metodoconexion: IXMLNode;
     FCajon_Nodo_Operaciones: IXMLNode;

     FImpresora_modelo: String;
     FImpresora_metodoconexion: String;
     FImpresora_tipoconexion: String;
     FImpresora_Nodo_Metodoconexion: IXMLNode;
     FImpresora_Nodo_Operaciones: IXMLNode;

     FTarjeta_modelo: String;
     FTarjeta_metodoconexion: String;
     FTarjeta_tipoconexion:String;
     FTarjeta_Nodo_Metodoconexion: IXMLNode;

     procedure BD_Cargar_xml(UID_TPV: String);
     procedure Recupera_xml;
  public
     property UID_TPV: String read FUID_TPV write FUID_TPV;
     property XMLConfiguracion : IXMLDocument read FXMLConfiguracion write FXMLConfiguracion;

     property Visor_modelo: String read FVisor_modelo write FVisor_modelo;
     property Visor_metodoconexion: String read FVisor_metodoconexion write FVisor_metodoconexion;
     property Visor_tipoconexion: String read FVisor_tipoconexion write FVisor_tipoconexion;
     property Visor_Nodo_Metodoconexion: IXMLNode read FVisor_Nodo_Metodoconexion write FVisor_Nodo_Metodoconexion;

     property Cajon_modelo: String read FCajon_modelo write FCajon_modelo;
     property Cajon_metodoconexion: String read FCajon_metodoconexion write FCajon_metodoconexion;
     property Cajon_tipoconexion: String read FCajon_tipoconexion write FCajon_tipoconexion;
     property Cajon_Nodo_Metodoconexion: IXMLNode read FCajon_Nodo_Metodoconexion write FCajon_Nodo_Metodoconexion;
     property Cajon_Nodo_Operaciones: IXMLNode read FCajon_Nodo_Operaciones write FCajon_Nodo_Operaciones;

     property Impresora_modelo: String read FImpresora_modelo write FImpresora_modelo;
     property Impresora_metodoconexion: String read FImpresora_metodoconexion write FImpresora_metodoconexion;
     property Impresora_tipoconexion: String read FImpresora_tipoconexion write FImpresora_tipoconexion;
     property Impresora_Nodo_Metodoconexion: IXMLNode read FImpresora_Nodo_Metodoconexion write FImpresora_Nodo_Metodoconexion;
     property Impresora_Nodo_Operaciones: IXMLNode read FImpresora_Nodo_Operaciones write FImpresora_Nodo_Operaciones;

     property Tarjeta_modelo: String read FTarjeta_modelo write FTarjeta_modelo;
     property Tarjeta_metodoconexion: String read FTarjeta_metodoconexion write FTarjeta_metodoconexion;
     property Tarjeta_tipoconexion: String read FTarjeta_tipoconexion write FTarjeta_tipoconexion;
     property Tarjeta_Nodo_Metodoconexion: IXMLNode read FTarjeta_Nodo_Metodoconexion write FTarjeta_Nodo_Metodoconexion;

     procedure BD_Salvar_xml;
     procedure GeneraXml;

     constructor Create(DataModule: TDMConfiguracionDispositivos; UID_TPV: String);
     destructor Destroy; override;
  end;

var
  DMConfiguracionDispositivos: TDMConfiguracionDispositivos;

implementation

{$R *.dfm}

(*******************************************************************************
*   Clase TConfiguracion                                                       *
*******************************************************************************)
   constructor TConfiguracionDispositivo.Create(DataModule: TDMConfiguracionDispositivos; UID_TPV: String);
   begin
      //Si el acceso a datos no viene preestablecido crea uno
      if DataModule = nil then
      begin
         FDataModule := TDMConfiguracionDispositivos.Create(nil);
         FDataModuleInterno := True;
      end
      else
      begin
         FDataModule := DataModule;
         FDataModuleInterno := False;
      end;
      FXMLConfiguracion := TXMLDocument.Create(nil);
      FXMLConfiguracion.Options := FXMLConfiguracion.Options + [doNodeAutoIndent];
      if UID_TPV = '' then
      begin
         raise Exception.Create('No se ha especificado identificador Único de caja');
      end;
      BD_Cargar_xml(UID_TPV);
   end;

   destructor TConfiguracionDispositivo.Destroy;
   begin
      inherited Destroy;
   end;

   procedure TConfiguracionDispositivo.BD_Cargar_xml(UID_TPV: String);
   var
     st: TMemoryStream;
   begin
      FUID_TPV := UID_TPV;
      with TDMConfiguracionDispositivos(FDataModule) do
      begin
         Q_TIENDAS_CAJAS_XML.Close;
         Q_TIENDAS_CAJAS_XML.ParamByName('UID_TPV').AsString := UID_TPV;
         Q_TIENDAS_CAJAS_XML.Open;
         if not Q_TIENDAS_CAJAS_XML.IsEmpty then
         begin
            if not Q_TIENDAS_CAJAS_XML.FieldByName('CONFIGURACION').IsNull then
            begin
               st := TMemoryStream.Create;
               try
                  TBlobField(Q_TIENDAS_CAJAS_XML.FieldByName('CONFIGURACION')).SaveToStream(st);
                  FXMLConfiguracion.LoadFromStream(st, xetUTF_8);
               finally
                  st.Free;
               end;

               Recupera_xml;
            end;
         end;
      end;
    end;

    procedure TConfiguracionDispositivo.BD_Salvar_xml;
    var
       ST: TMemoryStream;
    begin
       if not FXMLConfiguracion.Active then
          FXMLConfiguracion.Active := True;

       FXMLConfiguracion.Options := FXMLConfiguracion.Options + [doNodeAutoIndent];
       GeneraXml;

       if FXMLConfiguracion.IsEmptyDoc then
          raise Exception.Create('No se ha generado el xml configuración');

       ST := TMemoryStream.Create;
       try
          with TDMConfiguracionDispositivos(FDataModule) do
          begin
             FXMLConfiguracion.SaveToStream(ST);

             Q_ACTUALIZA_CONFIGURACION_XML.ParamByName('CONFIGURACION').LoadFromStream(ST, ftBlob);
             Q_ACTUALIZA_CONFIGURACION_XML.ParamByName('UID_TPV').AsString := FUID_TPV;
             Q_ACTUALIZA_CONFIGURACION_XML.Execute;

             if Q_ACTUALIZA_CONFIGURACION_XML.RowsAffected = 0 then
             begin
                Q_INSERTA_CONFIGURACION_XML.ParamByName('UID_TPV').AsString := FUID_TPV;
                Q_INSERTA_CONFIGURACION_XML.ParamByName('CONFIGURACION').LoadFromStream(ST, ftBlob);
                Q_INSERTA_CONFIGURACION_XML.Execute;
             end;
          end;
       finally
          ST.Free;
       end;
    end;

    procedure TConfiguracionDispositivo.Recupera_xml;
    var
       iNode: IXMLNode;
       idispositivos: IXMLNode;
       iVisor: IXMLNode;
       iCajon: IXMLNode;
       iImpresora: IXMLNode;
       iTarjeta: IXMLNode;
    begin
      //Rama Dispositivos
      try
         idispositivos := FXMLConfiguracion.ChildNodes.FindNode('Parametros');
         idispositivos := idispositivos.ChildNodes.FindNode('dispositivos');
         //Rama Dispositivos - SubRama Visor
         iVisor := idispositivos.ChildNodes.FindNode('visor');
         if iVisor <> nil then
         begin
            iNode := iVisor.ChildNodes.FindNode('modelo');
            Self.Visor_modelo := iNode.Text;
            iNode := iVisor.ChildNodes.FindNode('nombreconexion');
            Self.Visor_metodoconexion := iNode.Text;
            iNode := iVisor.ChildNodes.FindNode('tipoconexion');
            Self.Visor_tipoconexion:= iNode.Text;
            iNode := iVisor.ChildNodes.FindNode('metodoconexion');
            Self.Visor_Nodo_Metodoconexion := iNode;
         end;

         //Rama Configuracion_TPV - SubRama Cajon
         iCajon := idispositivos.ChildNodes.FindNode('cajon');
         if iCajon <> nil then
         begin
            iNode := iCajon.ChildNodes.FindNode('modelo');
            Self.Cajon_modelo := iNode.Text;
            iNode := iCajon.ChildNodes.FindNode('nombreconexion');
            Self.Cajon_metodoconexion := iNode.Text;
            iNode := iCajon.ChildNodes.FindNode('tipoconexion');
            Self.Cajon_tipoconexion := iNode.Text;
            iNode := iCajon.ChildNodes.FindNode('metodoconexion');
            Self.Cajon_Nodo_Metodoconexion := iNode;
            iNode := iCajon.ChildNodes.FindNode('operaciones');
            Self.Cajon_Nodo_Operaciones := iNode;
         end;

         //Rama Configuracion_TPV - SubRama Impresora
         iImpresora := idispositivos.ChildNodes.FindNode('impresora');
         if iImpresora <> nil then
         begin
            iNode := iImpresora.ChildNodes.FindNode('modelo');
            Self.Impresora_modelo := iNode.Text;
            iNode := iImpresora.ChildNodes.FindNode('nombreconexion');
            Self.Impresora_metodoconexion := iNode.Text;
            iNode := iImpresora.ChildNodes.FindNode('tipoconexion');
            Self.Impresora_tipoconexion := iNode.Text;
            iNode := iImpresora.ChildNodes.FindNode('metodoconexion');
            Self.Impresora_Nodo_Metodoconexion := iNode;
            iNode := iImpresora.ChildNodes.FindNode('operaciones');
            Self.Impresora_Nodo_Operaciones := iNode;
         end;

         //Rama Configuracion_TPV - SubRama Tarjeta
         iTarjeta := idispositivos.ChildNodes.FindNode('tarjeta');
         if iTarjeta <> nil then
         begin
            iNode := iTarjeta.ChildNodes.FindNode('modelo');
            Self.Tarjeta_modelo := iNode.Text;
            iNode := iTarjeta.ChildNodes.FindNode('nombreconexion');
            Self.Tarjeta_metodoconexion := iNode.Text;
            iNode := iTarjeta.ChildNodes.FindNode('tipoconexion');
            Self.Tarjeta_tipoconexion:= iNode.Text;
            iNode := iTarjeta.ChildNodes.FindNode('metodoconexion');
            Self.Tarjeta_Nodo_Metodoconexion := iNode;
         end;
      except
         TPVMessageDlg(STR_ConfiguracionIncorrecta, mtError, [mbOK], 0);
      end;
    end;

    procedure TConfiguracionDispositivo.GeneraXml;
    var
       iNode: IXMLNode;
       idispositivos: IXMLNode;
       iVisor: IXMLNode;
       iCajon: IXMLNode;
       iImpresora: IXMLNode;
       iTarjeta: IXMLNode;
       i: Integer;
    begin
      //Guarda la estructura anteriormente seleccionada en sus nodos.
       if FXMLConfiguracion.Active then
          FXMLConfiguracion.Active := False;

       FXMLConfiguracion.Active := True;

       FXMLConfiguracion.Options := FXMLConfiguracion.Options + [doNodeAutoIndent];

       //Genera la cabecera
       FXMLConfiguracion.Encoding := 'UTF-8';
       FXMLConfiguracion.Version := '1.0';

       //Genera Rama Dispositivos
       idispositivos := FXMLConfiguracion.AddChild('Parametros');
       idispositivos := idispositivos.AddChild('dispositivos');
       iVisor := idispositivos.AddChild('visor');

       //Genera Rama Visor
       iNode := iVisor.AddChild('modelo');
       iNode.Text := Self.Visor_modelo;
       iNode := iVisor.AddChild('nombreconexion');
       iNode.Text := Self.Visor_metodoconexion;
       iNode := iVisor.AddChild('tipoconexion');
       iNode.Text := Self.Visor_tipoconexion;
       if Self.Visor_Nodo_Metodoconexion <> nil then
          iVisor.ChildNodes.Add(Self.Visor_Nodo_Metodoconexion);

       //Genera Rama Cajon
       iCajon := idispositivos.AddChild('cajon');
       iNode := iCajon.AddChild('modelo');
       iNode.Text := Self.Cajon_modelo;
       iNode := iCajon.AddChild('nombreconexion');
       iNode.Text := Self.Cajon_metodoconexion;
       iNode := iCajon.AddChild('tipoconexion');
       iNode.Text := Self.Cajon_tipoconexion;
       if Self.Cajon_Nodo_Metodoconexion <> nil then
          iCajon.ChildNodes.Add(Self.Cajon_Nodo_Metodoconexion);
       if Self.Cajon_Nodo_Operaciones <> nil then
          iCajon.ChildNodes.Add(Self.Cajon_Nodo_Operaciones);

       //Genera Rama Impresora
       iImpresora := idispositivos.AddChild('impresora');
       iNode := iImpresora.AddChild('modelo');
       iNode.Text := Self.Impresora_modelo;
       iNode := iImpresora.AddChild('nombreconexion');
       iNode.Text := Self.Impresora_metodoconexion;
       iNode := iImpresora.AddChild('tipoconexion');
       iNode.Text := Self.Impresora_tipoconexion;
       if Self.Impresora_Nodo_Metodoconexion <> nil then
          iImpresora.ChildNodes.Add(Self.Impresora_Nodo_Metodoconexion);
       if Self.Impresora_Nodo_Operaciones <> nil then
          iImpresora.ChildNodes.Add(Self.Impresora_Nodo_Operaciones);

       //Genera Rama Tarjeta
       iTarjeta := idispositivos.AddChild('tarjeta');
       iNode := iTarjeta.AddChild('modelo');
       iNode.Text := Self.Tarjeta_modelo;
       iNode := iTarjeta.AddChild('nombreconexion');
       iNode.Text := Self.Tarjeta_metodoconexion;
       iNode := iTarjeta.AddChild('tipoconexion');
       iNode.Text := Self.Tarjeta_tipoconexion;
       if Self.Tarjeta_Nodo_Metodoconexion <> nil then
          iTarjeta.ChildNodes.Add(Self.Tarjeta_Nodo_Metodoconexion);
    end;
end.




