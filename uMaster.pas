unit uMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  System.Threading, ClassDonwload, IdAntiFreezeBase, IdAntiFreeze,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfMaster = class(TForm)
    pnlMaster: TPanel;
    gbxLink: TGroupBox;
    edtLink: TEdit;
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

    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnDisplayMessageClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnDisplayHistoryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtLinkChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }

    procedure OnOffOptions;
  public
    { Public declarations }
    Downloads : TDownloads;
  end;

var
  fMaster: TfMaster;
  bLinkInformation: Boolean;
  bInProgress: Boolean;
  bMessage: Boolean;

implementation

uses uDM, uFunctions, uHistory;

{$R *.dfm}

procedure TfMaster.FormCreate(Sender: TObject);
begin
  pnlProgressBar.Visible := False;

  bLinkInformation := False;
  bInProgress := False;
  bMessage := False;

  OnOffOptions;
end;

procedure TfMaster.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then btnCloseClick(Sender);
end;

procedure TfMaster.btnStartClick(Sender: TObject);
begin
  // TIdAntiFreeze: esse componente impede o congelamento da aplicação,enquanto aguardamos o fi nal do download.

  bInProgress := True;

  OnOffOptions;
end;

procedure TfMaster.btnDisplayMessageClick(Sender: TObject);
begin
  bMessage := bMessage = False;

  OnOffOptions;
end;

procedure TfMaster.btnStopClick(Sender: TObject);
begin
  bInProgress := False;

  IdHTTP.Disconnect;

  OnOffOptions;
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

procedure TfMaster.edtLinkChange(Sender: TObject);
begin
  bLinkInformation := edtLink.Text <> EmptyStr;

  OnOffOptions;
end;

procedure TfMaster.OnOffOptions;
begin
  gbxLink.Enabled           := not bInProgress;

  btnStart.Enabled          := bLinkInformation and (not bInProgress);
  btnDisplayMessage.Enabled := bInProgress;
  btnStop.Enabled           := bInProgress;
  //btnDisplayHistory.Enabled := not bInProgress;

  lblPercentage.Visible     := bInProgress and bMessage;

  pnlProgressBar.Visible    := bLinkInformation and bInProgress;
end;

end.
