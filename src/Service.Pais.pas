unit Service.Pais;

interface

uses
  System.SysUtils,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.JSON,
  REST.Types,
  REST.Client;

type
  TPaisInfo = record
    FNomeOficial: string;
    FCapital: string;
    FRegiao: string;
    FPopulacao: Int64;
    FMoeda: string;
  end;

  TPaisService = class
  public
    class function ConsultarPais(const pPais: string): TPaisInfo;
  end;

implementation

class function TPaisService.ConsultarPais(const pPais: string): TPaisInfo;
const
  ENDERECO_API = 'https://restcountries.com/v3.1/name/';
var
  Client: TNetHTTPClient;
  HttpResponse: IHTTPResponse;
  Response: string;
  JsonArray: TJSONArray;
  JsonObj: TJSONObject;
  JsonCurrencies: TJSONObject;
  Pair: TJSONPair;
  Url: string;
begin
  if Trim(pPais) = '' then
    raise Exception.Create('Nome do país não informado.');

  Url := ENDERECO_API + pPais;

  Client := TNetHTTPClient.Create(nil);
  try
    HttpResponse := Client.Get(Url);

    if HttpResponse.StatusCode = 404 then
      raise Exception.Create('País não encontrado.');

    if HttpResponse.StatusCode <> 200 then
      raise Exception.Create('Erro ao consultar API.');

    Response := HttpResponse.ContentAsString(TEncoding.UTF8);

    JsonArray := TJSONObject.ParseJSONValue(Response) as TJSONArray;

    if (JsonArray = nil) or (JsonArray.Count = 0) then
      raise Exception.Create('País não encontrado.');

    JsonObj := JsonArray.Items[0] as TJSONObject;
    Result.FNomeOficial := JsonObj.GetValue('name').GetValue<string>('official');
    Result.FCapital := (JsonObj.GetValue('capital') as TJSONArray).Items[0].Value;
    Result.FRegiao := JsonObj.GetValue<string>('region');
    Result.FPopulacao := JsonObj.GetValue<Int64>('population');

    JsonCurrencies := JsonObj.GetValue('currencies') as TJSONObject;
    Pair := JsonCurrencies.Pairs[0];
    Result.FMoeda := Pair.JsonValue.GetValue<string>('name');

  finally
    Client.Free;
  end;
end;

end.

