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
    Image: TImage;
    pnlMaster: TPanel;
    gbxLink: TGroupBox;
    Edit1: TEdit;
    gbxOptions: TGroupBox;
    btnStart: TBitBtn;
    btnDisplayMessage: TBitBtn;
    btnStop: TBitBtn;
    btnClose: TBitBtn;
    btnDisplayHistory: TBitBtn;
    pnlProgressBar: TPanel;
    ProgressBar: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMaster: TfMaster;

implementation

uses uDM;

{$R *.dfm}

procedure TfMaster.BitBtn1Click(Sender: TObject);
begin
  // fdQueryLogs.SQL.Clear;
  // fdQueryLogs.SQL.Add('select * from logdonwload');
  // fdQueryLogs.Open();
end;

procedure TfMaster.FormCreate(Sender: TObject);
begin
  pnlProgressBar.Visible := False;
end;

procedure TfMaster.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Self.Close;
end;

end.
