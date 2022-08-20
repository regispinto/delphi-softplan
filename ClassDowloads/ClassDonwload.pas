unit ClassDonwload;

interface

uses
  System.SysUtils, Vcl.Forms, FireDAC.Comp.Client;

  type
    TDownloads = Class
      private
        FConexao : TFDConnection;
        FCodigo : Integer;
        FUrl : WideString;
        FDataInicio : TDate;
        FDataFim :TDate;
      public
        property Conexao : TFDConnection read FConexao write FConexao;
        property Codigo : Integer read FCodigo write FCodigo;
        property Url : WideString read FUrl write FUrl;
        property DataInicio : TDate read FDataInicio write FDataInicio;
        property DataFim : TDate read FDataFim write FDataFim;

        constructor Create( Conexao: TFDConnection );
        destructor Destroy; Override;

        function Insert(Erro: String): Boolean;
    end;

implementation

{ TDownloads }
constructor TDownloads.Create(Conexao: TFDConnection);
begin
  FConexao := Conexao;
end;

destructor TDownloads.Destroy;
begin
  inherited;
end;

function TDownloads.Insert(Erro: String): Boolean;
var
  QryDownloads: TFDQuery;

begin
  try
    try
      QryDownloads := TFDQuery.Create(nil);
      QryDownloads.Connection := FConexao;

      QryDownloads.SQL.Clear;
      QryDownloads.SQL.Add('insert into logsdownload ');
      QryDownloads.SQL.Add('(Codigo, Url, DataInicio, DataFim) ');
      QryDownloads.SQL.Add('values ');
      QryDownloads.SQL.Add('(:pCodigo, :pUrl, :pDataInicio, :pDataFim)');
      //
      QryDownloads.ParamByName('pCodigo').AsInteger  := FCodigo;
      QryDownloads.ParamByName('pUrl').AsString      := FUrl;
      QryDownloads.ParamByName('pDataInicio').AsDate := FDataInicio;
      QryDownloads.ParamByName('pDataFim').AsDate    := FDataFim;
      QryDownloads.ExecSQL;

      Result := True;
    Except
      on e: Exception do begin
        Erro := E.Message;
        Result := False;
      end;
    end;
  finally
    QryDownloads.Destroy;

  end;
end;

end.
