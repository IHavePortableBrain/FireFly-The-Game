program FireFly;

uses
  Vcl.Forms,
  UMainMenu in 'UMainMenu.pas' {FMainMenu},
  UPlayField in 'UPlayField.pas' {FPlayForm},
  ULeaderBoard in 'ULeaderBoard.pas' {fLeaderBoard},
  Model in 'Model.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMainMenu, FMainMenu);
  Application.CreateForm(TFPlayForm, FPlayForm);
  Application.CreateForm(TfLeaderBoard, fLeaderBoard);
  Application.Run;
end.
