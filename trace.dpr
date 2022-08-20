program trace;
uses
  Vcl.Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  uFunctions in 'GenericFunctions\uFunctions.pas',
  uClassConnection in 'ClassConnection\uClassConnection.pas',
  uMaster in 'uMaster.pas' {fMaster},
  uHistory in 'uHistory.pas' {fHistory},
  ClassDonwload in 'ClassDowloads\ClassDonwload.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMaster, fMaster);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
