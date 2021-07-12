program PularEditsComEnter;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  uMultCast_Eventos in 'uMultCast_Eventos.pas',
  Classe.PularCampoComEnter in 'Classe.PularCampoComEnter.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
