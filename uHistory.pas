unit uHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfHistory = class(TForm)
    dbgHistory: TDBGrid;
    dbnHistory: TDBNavigator;
    stbMessage: TStatusBar;
    FDQuery: TFDQuery;
    DataSource: TDataSource;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FDQueryAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fHistory: TfHistory;

implementation

uses uDM, uFunctions, ClassDonwload;

{$R *.dfm}

procedure TfHistory.FormCreate(Sender: TObject);
begin
  FDQuery.Active := True;
end;

procedure TfHistory.FDQueryAfterScroll(DataSet: TDataSet);
begin
  stbMessage.Panels[1].Text := 'Downloads: ' + IntToStr(FDQuery.RecNo) + '/' + IntToStr(FDQuery.RecordCount);
  stbMessage.Repaint;
end;

procedure TfHistory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQuery.Active := False;
end;

procedure TfHistory.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key = VK_ESCAPE then Self.Close;
end;

end.
