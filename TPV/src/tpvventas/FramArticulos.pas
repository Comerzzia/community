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

unit FramArticulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataMArticulo, DB, RzButton, ImgList;

type
  TCategoriaBitBtn = class(TRzBitBtn)
  public
    Lvl: Integer;
    Codcat: String;
    Nombre: String;
  end;

  TArticuloBitBtn = class(TRzBitBtn)
  public
    Codart: String;
    Desart: String;
  end;

  TFrameArticulos = class(TFrame)
    ImagenesBotones: TImageList;
  private
    Scroll: TScrollBox;

    BotonArticuloClick: TNotifyEvent;
  public
    { Public declarations }
    DMArticulo: TDMArticulo;
    Categorias: TDataSet;
    Articulos: TDataSet;

    procedure Inicializa(EventoBotonArticulo: TNotifyEvent);
    procedure CargaBotones(Codcat: String; Nivel: Integer);
    procedure BotonCategoriaClick(Sender: TObject); virtual;
  end;

implementation

{$R *.dfm}

procedure TFrameArticulos.Inicializa(EventoBotonArticulo: TNotifyEvent);
begin
   DMArticulo := TDMArticulo.Create(Self);
   Categorias := DMArticulo.GetDataSetCategorias;
   Articulos := DMArticulo.GetDataSetArticulosCategoria;
   BotonArticuloClick := EventoBotonArticulo;
   CargaBotones('', 1);
end;

procedure TFrameArticulos.CargaBotones(Codcat: String; Nivel: Integer);
var
   BotonC: TCategoriaBitBtn;
   BotonA: TArticuloBitBtn;
   iBotones: Integer;
   iBotonesXFila: Integer;
   iOffSet: Integer;
   iPosX: Integer;
   iPosY: Integer;
   iAnchoBoton: Integer;
   iAltoBoton: Integer;

   procedure CreaBotonCategoria;
   begin
      BotonC := TCategoriaBitBtn.Create(Scroll);
      BotonC.Parent := Scroll;
      BotonC.Images := ImagenesBotones;
      BotonC.ImageIndex := 0;
      BotonC.Width := iAnchoBoton;
      BotonC.Height := iAltoBoton;
      BotonC.Color := clWhite;
      BotonC.Font.Charset := DEFAULT_CHARSET;
      BotonC.Font.Color := $00C15800;
      BotonC.FrameColor := $009E6B43;
      BotonC.Font.Height := -11;
      BotonC.Font.Name := 'Arial';
      BotonC.Font.Style := [];
      BotonC.HotTrack := True;
      BotonC.ParentFont := False;
      BotonC.ParentShowHint := False;
      BotonC.ShowHint := False;
      BotonC.TabOrder := 0;
      BotonC.Top := iPosY;
      BotonC.Left := iPosX;
      BotonC.Lvl := Nivel - 1;
      BotonC.OnClick := BotonCategoriaClick;
      BotonC.Visible := True;

      iPosX := iPosX + iAnchoBoton + iOffSet;
      Inc(iBotones);

      if iBotones >= iBotonesXFila then
      begin
         iPosY := iPosY + iAltoBoton + iOffSet;
         iPosX := iOffSet;
         iBotones := 0;
      end;
   end;

   procedure CreaBotonArticulo;
   begin
      BotonA := TArticuloBitBtn.Create(Scroll);
      BotonA.Parent := Scroll;
      BotonA.Images := ImagenesBotones;
      BotonA.ImageIndex := 2;
      BotonA.Width := iAnchoBoton;
      BotonA.Height := iAltoBoton;
      BotonA.Color := clWhite;
      BotonA.Font.Charset := DEFAULT_CHARSET;
      BotonA.Font.Color := $00C15800;
      BotonA.FrameColor := $009E6B43;
      BotonA.Font.Height := -11;
      BotonA.Font.Name := 'Arial';
      BotonA.Font.Style := [];
      BotonA.HotTrack := True;
      BotonA.ParentFont := False;
      BotonA.ParentShowHint := False;
      BotonA.ShowHint := False;
      BotonA.TabOrder := 0;
      BotonA.Top := iPosY;
      BotonA.Left := iPosX;
      BotonA.OnClick := BotonArticuloClick;
      BotonA.Visible := True;

      iPosX := iPosX + iAnchoBoton + iOffSet;
      Inc(iBotones);

      if iBotones >= iBotonesXFila then
      begin
         iPosY := iPosY + iAltoBoton + iOffSet;
         iPosX := iOffSet;
         iBotones := 0;
      end;
   end;
begin
   //Inicializa variables
   iBotones := 0;
   iBotonesXFila := 3;
   iOffSet := 3;
   iPosX := iOffSet;
   iPosY := iOffSet;
   iAnchoBoton := 160;
   iAltoBoton := 64;

   //Reinicia el scrollbox
   if Scroll <> nil then
      Scroll.Free;
   Scroll := TScrollBox.Create(Self);
   Scroll.Parent := Self;
   Scroll.Align := alClient;
   Scroll.Visible := False;

   if Nivel > 1 then
   begin
      CreaBotonCategoria;
      BotonC.Caption := 'Volver';
      BotonC.ImageIndex := 1;
      BotonC.Lvl := Nivel - 1;
      BotonC.Codcat := Copy(CodCat, 1 ,(BotonC.Lvl * 2) - 2);
      BotonC.Nombre := 'Volver';
      BotonC.OnClick := BotonCategoriaClick;
      BotonC.Visible := True;
   end;

   //Cargar las categorias en el dataset
   DMArticulo.AbrirDataSetCategorias(Codcat, Nivel);
   Categorias.First;
   while not Categorias.Eof do
   begin
      //Crear los botones de categorias
      CreaBotonCategoria;
      BotonC.Caption := Categorias.FieldByName('DESCAT').AsString;
      BotonC.Lvl := Nivel + 1;
      BotonC.Codcat := Categorias.FieldByName('CODCAT').AsString;
      BotonC.Nombre := Categorias.FieldByName('DESCAT').AsString;

      Categorias.Next;
   end;

   //Cargar los articulos
   DMArticulo.AbrirDataSetArticulosCategoria(Codcat);
   Articulos.First;
   while not Articulos.Eof do
   begin
      CreaBotonArticulo;
      BotonA.Codart := Articulos.FieldByName('CODART').AsString;
      BotonA.Desart := Articulos.FieldByName('DESART').AsString;
      BotonA.Caption := BotonA.Desart;
      Articulos.Next;
   end;
   Scroll.Visible := True;   
end;

procedure TFrameArticulos.BotonCategoriaClick(Sender: TObject);
begin
   CargaBotones(TCategoriaBitBtn(Sender).Codcat, TCategoriaBitBtn(Sender).Lvl);
end;

end.
