program trace;
uses
  Vcl.Forms,
  uDM in 'uDM.pas' {DM: TDataModule},
  uFunctions in 'GenericFunctions\uFunctions.pas',
  uClassConnection in 'ClassConnection\uClassConnection.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
