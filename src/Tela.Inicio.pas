unit Tela.Inicio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, System.Net.HttpClient, System.Net.HttpClientComponent,
  System.JSON, System.Generics.Collections;

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
    procedure LimparCampos;
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
  lClient : TNetHTTPClient;
  lResponse : string;
  lJsonArray : TJSONArray;
  lJsonObj : TJSONObject;
  lJsonCurrencies : TJSONObject;
  lPair : TJSONPair;
  lUrl : string;
  lPais : string;

begin
  LimparCampos();

  lPais := Trim(edtNomePais.Text);

  if lPais = '' then
  begin
    ShowMessage('Informe o nome do país.');
    Exit;
  end;

  lUrl := 'https://restcountries.com/v3.1/name/' + lPais;

  lClient := TNetHTTPClient.Create(nil);
  try
    try
      lResponse := lClient.Get(lUrl).ContentAsString;

      lJsonArray := TJSONObject.ParseJSONValue(lResponse) as TJSONArray;

      if (lJsonArray = nil) or (lJsonArray.Count = 0) then
      begin
        ShowMessage('País não encontrado.');
        Exit;
      end;



      lJsonObj := lJsonArray.Items[0] as TJSONObject;
      edtNomeOficial.Text :=
        lJsonObj.GetValue('name').GetValue<string>('official');

      edtCapital.Text :=
        (lJsonObj.GetValue('capital') as TJSONArray).Items[0].Value;

      edtRegiao.Text :=
        lJsonObj.GetValue<string>('region');

      edtPopulacao.Text :=
        lJsonObj.GetValue<Int64>('population').ToString;

      lJsonCurrencies := lJsonObj.GetValue('currencies') as TJSONObject;
      lPair := lJsonCurrencies.Pairs[0];
      edtMoeda.Text :=
        lPair.JsonValue.GetValue<string>('name');

    except
      on E: Exception do
        ShowMessage('Erro ao consultar API: ' + E.Message);
    end;
  finally
    lClient.Free;
  end;
end;

end.

