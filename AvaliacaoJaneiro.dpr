program AvaliacaoJaneiro;

uses
  Vcl.Forms,
  Tela.Inicio in 'src\Tela.Inicio.pas' {frmConsultaPais};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConsultaPais, frmConsultaPais);
  Application.Run;
end.
