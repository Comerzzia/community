unit Configuracion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, AdvPageControl, ComCtrls, IniFiles, RzPanel,
  RzButton, Mask, RzEdit;

type
  TFrmConfig = class(TForm)
    EditCodigoCentro: TRzEdit;
    Label4: TLabel;
    EditCodigoTienda: TRzEdit;
    Label5: TLabel;
    EditPos: TRzEdit;
    Label6: TLabel;
    RzPanel15: TRzPanel;
    RzPanel1: TRzPanel;
    btnAceptar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    LabelTitulo: TLabel;
    RzPanel2: TRzPanel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
  private
    { Private declarations }

  public
    procedure leer_ini;
    procedure escribir_ini;
    { Public declarations }
  end;

var
  FrmConfig: TFrmConfig;

implementation

{$R *.dfm}

procedure TFrmConfig.btnAceptarClick(Sender: TObject);
begin
   escribir_ini;
   leer_ini;

   Application.MessageBox('Configuración guardada','',MB_OK);
end;

procedure TFrmConfig.btnCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmConfig.FormCreate(Sender: TObject);
begin
   leer_ini;
end;

procedure TFrmConfig.leer_ini;
Var
   fichero : TIniFile;
begin
   fichero := TiniFile.Create (ExtractFileDir (ParamStr(0))+ '\wincortef.ini');
   EditCodigoCentro.Text := fichero.ReadString ('Conf','CodigoCentro','');
   EditCodigoTienda.Text := fichero.ReadString ('Conf','CodigoTienda','');
   EditPos.Text := fichero.ReadString ('Conf','Pos','');
   fichero.Free;
end;

procedure TFrmConfig.escribir_ini;
Var
   fichero : TIniFile;
begin
   fichero := TiniFile.Create (ExtractFileDir (ParamStr(0)) + '\wincortef.ini');
   fichero.WriteString ('Conf','CodigoCentro',EditCodigoCentro.Text);
   fichero.WriteString ('Conf','CodigoTienda',EditCodigoTienda.Text );
   fichero.WriteString ('Conf','Pos',EditPos.Text);
   fichero.Free;
end;

end.
