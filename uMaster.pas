unit uMaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  System.Threading, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

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
    procedure FormCreate(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnDisplayMessageClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnDisplayHistoryClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtLinkChange(Sender: TObject);

  private
    { Private declarations }

    procedure OnOffOptions;
  public
    { Public declarations }
  end;

var
  fMaster: TfMaster;
  bLinkInformation: Boolean;
  bInProgress: Boolean;
  bMessage: Boolean;

implementation

uses uDM;

{$R *.dfm}

procedure TfMaster.FormCreate(Sender: TObject);
begin
  pnlProgressBar.Visible := False;

  bLinkInformation := False;
  bInProgress := False;
  bMessage := False;

  OnOffOptions;
end;

procedure TfMaster.btnStartClick(Sender: TObject);
begin
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

  OnOffOptions;
end;

procedure TfMaster.btnDisplayHistoryClick(Sender: TObject);
begin
  // 4
end;

procedure TfMaster.btnCloseClick(Sender: TObject);
begin
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
  btnDisplayHistory.Enabled := not bInProgress;

  pnlProgressBar.Visible    := bInProgress and bMessage;
end;


end.
