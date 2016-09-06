program TPV;

uses
  Forms,
  windows,
  MidasLib,
  mainmenu in 'mainmenu.pas' {MainForm},
  splash in 'splash.pas' {FrmSplash},
  AcercaDe in 'AcercaDe.pas' {FrmAcercaDe};

{$R *.RES}
//{$R RECURSOS.RES}
begin
  Application.Initialize;

  Application.Title := 'ComerZZia TPV';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
