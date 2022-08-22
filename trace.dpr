program trace;
uses
  Vcl.Forms,
  Windows,
  uDM in 'uDM.pas' {DM: TDataModule},
  uFunctions in 'GenericFunctions\uFunctions.pas',
  uClassConnection in 'ClassConnection\uClassConnection.pas',
  uMaster in 'uMaster.pas' {fMaster},
  uHistory in 'uHistory.pas' {fHistory},
  ClassDonwload in 'ClassDowloads\ClassDonwload.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'Trace Donwloads';
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMaster, fMaster);
  Application.CreateForm(TDM, DM);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
