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

unit splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg, RzStatus, RzLabel, ImgList,
  RzPanel, AdvPicture, JvExControls, JvAnimatedImage, JvGIFCtrl;


type
  TFrmSplash = class(TForm)
    RzVersionInfo1: TRzVersionInfo;
    MPSPanel1: TRzPanel;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    Estado: TRzLabel;
    Panel1: TPanel;
    RxGIFAnimator1: TJvGIFAnimator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure cargaImagenes;
  public
    { Public declarations }
  end;

var
  FrmSplash: TFrmSplash;

implementation
{$R *.DFM}

procedure TFrmSplash.FormCreate(Sender: TObject);
begin
   RzVersionInfo1.FilePath := Application.ExeName;
   cargaImagenes;
end;

procedure TFrmSplash.cargaImagenes;
//var
//   j: TJPEGImage;
//   b: TBitmap;
//   ruta: String;
begin
//   j := TJPEGImage.Create;
//   b := TBitmap.Create;
//   try
//      ruta := ExtractFilePath(Application.ExeName) + '..\res\img\splash\';
//      begin
//         j.LoadFromFile(ruta + 'splash.jpg');
//         b.Assign(j);
//      end;
//   finally
//      j.Free;
//      b.Free;
//   end;
   RxGIFAnimator1.Image.LoadFromFile(ExtractFilePath(Application.ExeName) + '..\res\img\splash\splash.gif');
   Self.Refresh;
end;

procedure TFrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

end.
