unit ULeaderBoard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfLeaderBoard = class(TForm)
    SGLeaderBoard: TStringGrid;
    STTitleLeaderBoard: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLeaderBoard: TfLeaderBoard;

implementation

{$R *.dfm}

uses UMainMenu;

procedure TfLeaderBoard.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
   F7 = 118;
begin
   if Key = F7 then
   	fLeaderBoard.Close;
end;

procedure TfLeaderBoard.FormShow(Sender: TObject);
var
   i: Integer;
   Temp: TPlayer;
begin
	Reset(LeaderBoardFile);
	SGLeaderBoard.Cells[0,0] := '¹';
  	SGLeaderBoard.Cells[1,0] := 'Name';
  	SGLeaderBoard.Cells[2,0] := 'Score';
   for i := 0 to FileSize(LeaderBoardFile) - 1 do
   begin
      Read(LeaderBoardFile,temp);
      SGLeaderBoard.Cells[0,i + 1] := IntToStr(i + 1);
      SGLeaderBoard.Cells[1,i + 1] := temp.Name;
      SGLeaderBoard.Cells[2,i + 1] := IntToStr(temp.Score);
   end;
  	CloseFile(LeaderBoardFile);
end;

end.

