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

unit FormEspera;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls,
  RzLabel, RzPrgres, ImgList, SyncObjs;

type
   TEsperaThread = class(TThread)
   private
      FCS: TCriticalSection;
      FCIL: TCustomImageList;
      FParentColor: TColor;
      FPaintBox: TPaintBox;
      FIndex: Integer;
      FXPos, FYPos: Integer;
      procedure PintaGrafico;
   public
      procedure Execute; override;
      constructor Create(Destino: TPaintBox; Imagenes: TImageList);
      destructor Destroy; override;
   end;

   TFrmEspera = class(TForm)
      BtnCancelar: TBitBtn;
      LabelMensaje: TRzLabel;
      Progreso: TRzProgressBar;
      Imagenes: TImageList;
      PaintBox1: TPaintBox;
      procedure BtnCancelarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      { Private declarations }
      ListaVentanas: Pointer;
      Hilo: TEsperaThread;
   public
      Abortado: Boolean;
      { Public declarations }
      function Actualiza(Mensaje: String; PuedeAbortar: Boolean; TotalCompletado, Total: Integer): Boolean;
      procedure CerrarEspera;
   end;

var
   FrmEspera: TFrmEspera;

implementation

{$R *.DFM}

function TFrmEspera.Actualiza(Mensaje: String; PuedeAbortar: Boolean; TotalCompletado, Total: Integer): Boolean;
begin
   if Mensaje <> '' then
   begin
      LabelMensaje.Caption := Mensaje;
      LabelMensaje.Update;
   end;

   BtnCancelar.Visible := (PuedeAbortar = True);

   Progreso.TotalParts := Total;
   Progreso.Visible := Total > 0;
   Progreso.PartsComplete := TotalCompletado;

   result := not Abortado;

   if Hilo.Suspended then
      Hilo.Suspended := False;
end;

procedure TFrmEspera.BtnCancelarClick(Sender: TObject);
begin
   Abortado := True;
end;

procedure TFrmEspera.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmEspera.FormCreate(Sender: TObject);
begin
   Self.OnShow := FormShow;
end;

procedure TFrmEspera.CerrarEspera;
begin
   try
      Hilo.Suspended := True;
      Hilo.Terminate;
      FreeAndNil(Hilo);
   except
   end;
   try
      EnableTaskWindows(ListaVentanas);
   except
   end;
   FrmEspera.Close;
   FreeAndNil(FrmEspera);
end;

procedure TFrmEspera.FormShow(Sender: TObject);
begin
   Self.OnShow := nil;
   Hilo := TEsperaThread.Create(PaintBox1, Imagenes);
   ListaVentanas := DisableTaskWindows(Self.Handle);
end;

procedure TEsperaThread.Execute;
begin
   repeat
      PintaGrafico;
      SleepEx(150, true);
   until Terminated or Suspended;
end;

constructor TEsperaThread.Create(Destino: TPaintBox; Imagenes: TImageList);
begin
   FCS := TCriticalSection.Create;
   FPaintBox := Destino;
   FCIL := Imagenes;
   FIndex := 0;
   FXPos := 1;
   FYPos := 1;
   FreeOnTerminate := False;

   inherited Create(True);
end;

destructor TEsperaThread.Destroy;
begin
   FCS.Free;
   inherited Destroy;
end;

procedure TEsperaThread.PintaGrafico;
begin
   try
      if GetCurrentThreadID = MainThreadID then
         Exit;
      try
         FCS.Acquire;
         FPaintBox.Canvas.Brush.Color := FParentColor;
         FPaintBox.Canvas.Brush.Style := bsSolid;
         FPaintBox.Canvas.FillRect(Rect(FXPos, FYPos, FCIL.Width + FXPos, FCIL.Height + FYPos));
         FCIL.Draw(FPaintBox.Canvas, FXPos, FYPos, FIndex, True);
      finally
         FCS.Release;
      end;
      Inc(FIndex);
      if FIndex > 3 then
         FIndex := 0;
   except
   end;
end;

end.
