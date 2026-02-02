unit Tela.Inicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Service.Pais, Vcl.ExtCtrls;

type
  TfrmConsultaPais = class(TForm)
    edtNomePais: TEdit;
    btnConsultar: TButton;
    lblNomePais: TLabel;
    lblNomeOficial: TLabel;
    lblCapital: TLabel;
    lblRegiao: TLabel;
    lblPopulacao: TLabel;
    lblmoeda: TLabel;
    edtNomeOficial: TEdit;
    edtCapital: TEdit;
    edtRegiao: TEdit;
    edtPopulacao: TEdit;
    edtMoeda: TEdit;
    procedure btnConsultarClick(Sender: TObject);
    procedure edtNomePaisChange(Sender: TObject);
    procedure edtNomePaisKeyPress(Sender: TObject; var Key: Char);
  private
    procedure LimparCampos();
  public
  end;

var
  frmConsultaPais: TfrmConsultaPais;

implementation

{$R *.dfm}

procedure TfrmConsultaPais.edtNomePaisChange(Sender: TObject);
begin
  LimparCampos()
end;

procedure TfrmConsultaPais.edtNomePaisKeyPress(Sender: TObject; var Key: Char);
const
  TECLA_ENTER = #13;
  CHAR_NULL = #0;
begin
  if Key = TECLA_ENTER then
  begin
    btnConsultar.Click();
    Key := CHAR_NULL;
  end;
end;

procedure TfrmConsultaPais.LimparCampos;
begin
  edtNomeOficial.Clear;
  edtCapital.Clear;
  edtRegiao.Clear;
  edtPopulacao.Clear;
  edtMoeda.Clear;
end;

procedure TfrmConsultaPais.btnConsultarClick(Sender: TObject);
var
  Pais: TPaisInfo;
begin
  try
    LimparCampos();

    Pais := TPaisService.ConsultarPais(edtNomePais.Text);

    edtNomeOficial.Text := Pais.NomeOficial;
    edtCapital.Text     := Pais.Capital;
    edtRegiao.Text      := Pais.Regiao;
    edtPopulacao.Text  := Pais.Populacao.ToString;
    edtMoeda.Text      := Pais.Moeda;

  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

end.

