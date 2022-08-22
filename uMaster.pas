unit uMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, System.UITypes,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  System.Threading, ClassDonwload, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdSSLOpenSSL;

type
  TfMaster = class(TForm)
    pnlMaster: TPanel;
    gbxLink: TGroupBox;
    edtUrl: TEdit;
    gbxOptions: TGroupBox;
    btnStart: TBitBtn;
    btnDisplayMessage: TBitBtn;
    btnStop: TBitBtn;
    btnClose: TBitBtn;
    btnDisplayHistory: TBitBtn;
    pnlProgressBar: TPanel;
    ProgressBar: TProgressBar;
    lblPercentage: TLabel;
    IdHTTP: TIdHTTP;
    IdAntiFreeze: TIdAntiFreeze;

    procedure btnStartClick(Sender: TObject);
    procedure btnDisplayMessageClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnDisplayHistoryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtUrlChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
    procedure IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
    procedure IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    function ReturnPercentage(MaximumValue, CurrentValue: Real): string;

    procedure SetDefaultStatus;
    procedure SetHttpComponent;
    procedure ProgressOnOff(OnOff: Boolean; Pause: Boolean=False);
    procedure OnOffOptions;
    procedure UpdataDatabase(Url: String);

  public
    { Public declarations }
    Downloads : TDownloads;
  end;

var
  fMaster: TfMaster;

  bDownloadFinished :Boolean;
  bLinkInformation: Boolean;
  bInProgress: Boolean;
  bMessage: Boolean;
  dDateIni: TDate;

implementation

uses uDM, uFunctions, uHistory, Winapi.UrlMon;

{$R *.dfm}

procedure TfMaster.FormShow(Sender: TObject);
begin
  SetDefaultStatus;
end;

procedure TfMaster.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then btnCloseClick(Sender);
end;

procedure TfMaster.btnStartClick(Sender: TObject);
var
  FileDownload : TFileStream;
  FileUrl: String;
  Url: String;

begin
  SetHttpComponent;

  Url := Trim(edtUrl.Text);
  FileUrl := GetFileFromUrl(Url);

  FileDownload := TFileStream.Create(FileUrl, fmCreate);

  try
    try
      dDateIni := Trunc(Now);

      ProgressOnOff(True);
      IdHTTP.Get(Url, FileDownload);
      ProgressOnOff(False, True);

    except
      on e: Exception do begin
        ProgressOnOff(False);

        Raise exception.Create('Atenção, ocorreu um erro: ' +#13+ e.Message);
      end;
    end;
  finally
    FreeAndNil(FileDownload);

  end;
end;

procedure TfMaster.btnDisplayMessageClick(Sender: TObject);
begin
  bMessage := bMessage = False;

  OnOffOptions;
end;

procedure TfMaster.btnStopClick(Sender: TObject);
begin
  IdHTTP.Disconnect;

  ProgressOnOff(False);
end;

procedure TfMaster.btnDisplayHistoryClick(Sender: TObject);
var
  frmHistory: TForm;

begin
  try
    frmHistory := TfHistory.Create(nil);
    frmHistory.ShowModal;
  finally
    FreeAndNil(frmHistory);
  end;
end;

procedure TfMaster.btnCloseClick(Sender: TObject);
begin
  if bInProgress then
    begin
      If MessageDlg('Existe um download em andamento, deseja interrompe-lo',
        mtConfirmation,[mbYes, mbNo], 0) = mrYes then
        begin
          IdHTTP.Disconnect;
          Application.Terminate;
        end;
    end
  else
   Application.Terminate;
end;

procedure TfMaster.edtUrlChange(Sender: TObject);
begin
  bLinkInformation := edtUrl.Text <> EmptyStr;

  OnOffOptions;
end;

procedure TfMaster.SetHttpComponent;
var
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;

begin
  IdHTTP.HTTPOptions := IdHTTP.HTTPOptions + [hoForceEncodeParams];
  IdHTTP.HandleRedirects := True;

  IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
  IdSSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];

  IdHTTP.IOHandler := IdSSL;
end;

procedure TfMaster.ProgressOnOff(OnOff: Boolean; Pause: Boolean=False);
begin
  bInProgress := OnOff;

  if (not bInProgress) then
    begin
      if bMessage and Pause then
        Sleep(2000);

      if bDownloadFinished then
        UpdataDatabase(Trim(edtUrl.Text));

      SetDefaultStatus
    end
  else
    OnOffOptions;
end;

procedure TfMaster.SetDefaultStatus;
begin
  edtUrl.Clear;

  bDownloadFinished := False;
  bLinkInformation := False;
  bInProgress := False;
  bMessage := False;

  edtUrl.SetFocus;

  OnOffOptions;
end;

procedure TfMaster.OnOffOptions;
begin
  gbxLink.Enabled           := not bInProgress;

  btnStart.Enabled          := bLinkInformation and (not bInProgress);
  btnDisplayMessage.Enabled := bInProgress;
  btnStop.Enabled           := bInProgress;

  lblPercentage.Visible     := bInProgress and bMessage;
end;

function TfMaster.ReturnPercentage(MaximumValue, CurrentValue: Real): string;
var
  Return: Real;

begin
  Return := ((CurrentValue * 100) / MaximumValue);
  Result := FormatFloat('0%', Return);
end;

procedure TfMaster.IdHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
begin
  ProgressBar.Position := AWorkCount;
  lblPercentage.Caption := 'Download em ... ' + ReturnPercentage(ProgressBar.Max, AWorkCount);

  if ProgressBar.Max = AWorkCount then
    bDownloadFinished := True;
end;

procedure TfMaster.IdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  ProgressBar.Max := AWorkCountMax;
end;

procedure TfMaster.IdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar.Position  := 0;
  lblPercentage.Caption := 'Download Finalizado ...';
end;

procedure TfMaster.UpdataDatabase(Url: String);
var
  Downloads : TDownloads;
  Erro : String;

begin
  Downloads := TDownloads.Create(Dm.FDConnection);

  try
    try
      Downloads.Conexao    := Dm.FDConnection;
      Downloads.Codigo     := NextID(Dm.FDConnection, 'logsdownload', 'Codigo');
      Downloads.Url        := Url;
      Downloads.DataInicio := dDateIni;
      Downloads.DataFim    := Trunc(Date);

      Downloads.Insert(Erro);

      if Erro <> EmptyStr then
        Raise Exception.Create('Atenção, ocorreu um erro ao inserir o registro: ' +#13+ Erro);

    except
      on e: Exception do begin
        Raise exception.Create('Atenção, ocorreu um erro: ' +#13+ e.Message);
      end;
    end;

  finally
    Downloads.Destroy

  end;
end;

end.
