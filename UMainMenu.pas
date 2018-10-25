unit UMainMenu;

interface

uses
   UPlayField,ULeaderBoard,
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.MPlayer, Vcl.ExtCtrls,
   Vcl.Imaging.pngimage, Vcl.Menus;

type
  TFMainMenu = class(TForm)
     btnPlay: TButton;
     btnQuit: TButton;
     STGameLogo: TStaticText;
     MediaPlayer: TMediaPlayer;
     PanelVideo: TPanel;
     SoundHandle: TImage;
     SoundPanel: TPanel;
     TimerVid: TTimer;
     MainMenuBar: TMainMenu;
     About: TMenuItem;
     Author: TMenuItem;
     Game: TMenuItem;
     FireFlyshow: TMenuItem;
     LeaderBoard: TMenuItem;
     Help: TMenuItem;
     procedure btnPlayClick(Sender: TObject);
     procedure btnQuitClick(Sender: TObject);
     procedure SoundHandleClick(Sender: TObject);
     procedure TimerVidTimer(Sender: TObject);
     procedure FormActivate(Sender: TObject);
     procedure AuthorClick(Sender: TObject);
     procedure GameClick(Sender: TObject);
     procedure FireFlyshowClick(Sender: TObject);
     procedure LeaderBoardClick(Sender: TObject);
     procedure btnPlayKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
     procedure HelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TPlayer = record
  	  Name: string[40];
     Score: integer;
  end;
  TLeaderBoardFile = file of TPlayer;

const
	MaxNumTopList = 10;

var
  FMainMenu: TFMainMenu;
  SoundMode: (smMuted,smUnmuted) = smUnmuted;
  LeaderBoardFile: TLeaderBoardFile;

implementation
const
	pathLeaderBoard = 'fLeaderBoard';


{$R *.dfm}

procedure ChangeVidStat();
begin
	with FMainMenu do
  	if SoundMode = smUnmuted then
   begin
      SoundMode :=  smMuted;
      MediaPlayer.Pause;
   	SoundHandle.Picture.LoadFromFile('muted.png');
   end
   else
      if SoundMode = smMuted then
      begin
         SoundMode :=  smUnMuted;
         MediaPlayer.Play;
         SoundHandle.Picture.LoadFromFile('unmuted.png');
      end;
end;

procedure TFMainMenu.btnPlayClick(Sender: TObject);
begin
  	if SoundMode = smUnmuted then
     	ChangeVidStat;
  	FPlayForm.ShowModal;
end;

procedure TFMainMenu.btnPlayKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
	F1 = 112;
   F7 = 118;
   F8 = 119;
   F9 = 120;
begin
	if Key = F1 then
		HelpClick(Self)
   else
      if Key = F7 then
         btnQuitClick(Self)
      else
         if Key = F8 then
            LeaderBoardClick(Self)
         else
            if Key = F9 then
               SoundHandleClick(Self);
end;

procedure TFMainMenu.btnQuitClick(Sender: TObject);
begin
	FMainMenu.Close
end;

procedure TFMainMenu.FireFlyshowClick(Sender: TObject);
begin
 	Application.MessageBox('Firefly is an American space Western drama television series which ran from 2002–2003. The series is set in the year 2517, after the arrival of humans in a new star system and follows the adventures of the renegade crew of Serenity.','FireFly');
end;

procedure TFMainMenu.FormActivate(Sender: TObject);
begin
	AssignFile(LeaderBoardFile, pathLeaderBoard);
  	MediaPlayer.DeviceType := dtAutoSelect;
  	MediaPlayer.FileName := 'MainVideo.mp4' ;
  	MediaPlayer.Display := PanelVideo;
  	MediaPlayer.Open;
  	MediaPlayer.Play;
end;

procedure TFMainMenu.GameClick(Sender: TObject);
begin
	Application.MessageBox('The game was written in 2018.It is based on space western "FireFly".Space ships were taken from web resourse MillionthVector.Sounds were taken from web resourse wav-library.net.Song in title - Sonny Rhodes - The Ballad Of Serenity','About game')
end;

procedure TFMainMenu.HelpClick(Sender: TObject);
begin
   Application.MessageBox('Use hotkeys: F1 for help, F7 for quit, F8 for calling leaderboard, F9 to change title video status.','About author')
end;

procedure TFMainMenu.LeaderBoardClick(Sender: TObject);
begin
  	FLeaderBoard.ShowModal
end;

procedure TFMainMenu.SoundHandleClick(Sender: TObject);
begin
  	ChangeVidStat;
end;

procedure TFMainMenu.TimerVidTimer(Sender: TObject);
begin
  if MediaPlayer.Position = MediaPlayer.Length then
  begin
    MediaPlayer.Play;
    PanelVideo.SendToBack;
  end;
end;

procedure TFMainMenu.AuthorClick(Sender: TObject);
begin
   Application.MessageBox('Krestinin Vladislav Olegovich,BSUIR gr. 751001','About author')
end;

end.
