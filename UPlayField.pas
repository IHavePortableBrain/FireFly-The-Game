unit UPlayField;

interface

uses
   bass, DateUtils,
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
   System.ImageList, Vcl.ImgList, Vcl.StdCtrls, VCLTee.TeeFilters,
   IdBaseComponent, IdThreadComponent,System.Generics.Collections, Vcl.MPlayer,mmsystem,
   Vcl.ComCtrls, Vcl.Menus, Vcl.AppEvnts;

type
   TDir =  (DLeft,DRight,DUp,DDown,DNone);
   TMissleColor = (clrRed,ClrGreen,ClrBlue,ClrPurple);
   TMPicOrd = 1..7;
   TMissle = class
      Texture: TImage;
      MPicOrd: TMPicOrd;
      DMG: integer;
      Color: TMissleColor;
  	end;
  	TEPicOrd = 1..26;
  	TExplosion = class
      Explose:TImage;
      ePicOrd:TEPicOrd;
   end;
   TSpaceShip = class(TImage)
   public
   	Speed: integer;
      Vulnerable: boolean;
      Dir: TDir;
      FireRate: integer;
      CoolDowned: boolean;
      HP: integer;
      DMG: integer;
      MissleColor: TMissleColor;
      Shooting: Boolean;
      CoolingDown: integer;
      DirTime: integer;
  	end;
	TGameStatus = (GSBegin,GSPlay,GSOver,GSPause);
   TFPlayForm = class(TForm)
      PBFireFlyHP: TProgressBar;
      lblHP: TLabel;
      lblTitleScore: TLabel;
      lblScore: TLabel;
      edtPlayerName: TEdit;
      lblPlayerName: TLabel;
      btnSaveScore: TButton;
      lblLevelTitle: TLabel;
      lblLevel: TLabel;
      lblTop10: TLabel;
      MainMenu: TMainMenu;
      Quit: TMenuItem;
      Pause: TMenuItem;
      AEenemies: TApplicationEvents;
      AEMissleMove: TApplicationEvents;
      AEexplosions: TApplicationEvents;
      AEmoveFirefly: TApplicationEvents;
      AEcd: TApplicationEvents;
      btnRestart: TButton;
      keys: TMenuItem;
   STGameStatus: TLabel;
      procedure FormShow(Sender: TObject);
      procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure GameOver;
      procedure btnSaveScoreClick(Sender: TObject);
      procedure QuitClick(Sender: TObject);
      procedure edtPlayerNameKeyPress(Sender: TObject; var Key: Char);
      procedure PauseClick(Sender: TObject);
      procedure AEenemiesIdle(Sender: TObject; var Done: Boolean);
      procedure AEMissleMoveIdle(Sender: TObject; var Done: Boolean);
      procedure AEexplosionsIdle(Sender: TObject; var Done: Boolean);
      procedure AEmoveFireflyIdle(Sender: TObject; var Done: Boolean);
      procedure AEcdIdle(Sender: TObject; var Done: Boolean);
      procedure btnRestartClick(Sender: TObject);
      procedure keysClick(Sender: TObject);
      procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
   private

   public
      ArrayStar: TObjectList<TImage>;
      ArrayMissle: TObjectList<TMissle>;
      ArrayEnemy: TObjectList<TSpaceShip>;
      ArrayExplose: TObjectList<TExplosion>;
      ArrayMisEn:  TObjectList<TMissle>;
   end;

const
   MissleWidth = 48;
   MissleHeight = 80;

var
   FPlayForm: TFPlayForm;
   FireFly,Enemy: TSpaceShip;
   cdTimer: integer = 0;
   Difficulty: integer = 1;
   SaveZoneY: integer = 300;
   Score: integer = 0;
   EnemyChangeDirTimer: integer = 0;
   GameStatus: TGameStatus;

   procedure CreateMissle(MissleLeft,MissleTop,MissleDmg: integer;MissleColor: TMissleColor); forward;

implementation

uses
	UMainMenu, Model;

const
	pathLeaderBoard = 'fLeaderBoard';
	FireFlyImgPath = 'FireFlyShip.png';

type
  	TBackGround = class
  	public
    	constructor Create;
  	end;

var
   Top10: boolean = False;

   FFMissle: TMissle;
   Explosion: TExplosion;

   PrevTimeII: TDateTime;
   PrevTimeMissle: TDateTime;
   PrevTimeExpl: TDateTime;
   PrevTimeCd:TDateTime;
   PrevTimeMovFF: TDateTime;

   MovementSync: integer = 0;
   SpawnEnemyTime: integer = 1;
   MoveEnTimer: integer = 0;

   BlastStream: HStream;
   BoomStream: HSTREAM;

{$R *.dfm}
{$I View.inc}
{$I Controller.inc}

procedure StartGame;
begin
	with FPlayForm do
   begin
      STGameStatus.Caption := 'Press any key...';
      STGameStatus.Left := (ClientWidth -  STGameStatus.Width) div 2;
      DisableTop10Components;
      Difficulty := 1;
      Score := 0;
      lblScore.Caption := IntToStr(Score);
      lblLevel.Caption := IntToStr(Difficulty);
      FPlayForm.ArrayMissle := TObjectList<TMissle>.Create(True);
      FPlayForm.ArrayEnemy := TObjectList<TSpaceShip>.Create(True);
      FPlayForm.ArrayExplose := TObjectList<TExplosion>.Create(True);
      FPlayForm.ArrayMisEn   := TObjectList<TMissle>.Create(True);
      GameStatus := GSBegin;
      STGameStatus.Visible := true;
      TBackGround.Create;
      SpawnShip(FireFly,FireFlyImgPath,300,850,10,300,30,100,ClrREd);
      FireFly.BringToFront;
      PBFireFlyHP.Position := 100;
      Top10 := False;
   end;
end;

procedure TFPlayForm.FormShow(Sender: TObject);
begin
	BASS_Init(-1, 44100, 0, Handle, nil);
   StartGame
end;

function ClrChar(Color: TMissleColor): char;
begin
  case Color of
     ClrRed:
    	  result := 'R';
     ClrGreen:
    	  result := 'G';
     ClrBlue:
    	  result := 'B';
     ClrPurple:
    	  result := 'P';
  end;
end;

procedure CreateMissle(MissleLeft,MissleTop,MissleDmg: integer;MissleColor: TMissleColor);
var
   EnemyMissle: TMissle;
begin
   with FPlayForm do
      with EnemyMissle do
      begin
         EnemyMissle := TMissle.Create;
         Texture := TImage.Create(FPlayForm);
         Texture.Visible := True;
         Texture.Parent :=  FPlayForm;
         DMG := MissleDmg;
         Texture.AutoSize := True;
         Color :=  MissleColor;
         Texture.Picture.LoadFromFile(ClrChar(MissleColor) + 'EF1.png');
         Texture.Left := MissleLeft;
         Texture.Top := MissleTop;
         MPicOrd := 1;
         FPlayForm.ArrayMisEn.Add(EnemyMissle);
      end;
end;

procedure TFplayForm.GameOver;
var
	i, j: Integer;
   Temp : TPlayer;
begin
   GameStatus := GSOver;
   with FPlayForm do
   begin
      STGameStatus.Caption := 'Game over!!!';
      STGameStatus.Left := (ClientWidth - STGameStatus.Width) div 2;
      STGameStatus.Visible := True;
      btnRestart.Visible := True;
      CleanScreen;
      reset(LeaderBoardFile);
      I := 0;
      while I < FileSize(LeaderBoardFile)  do
      begin
      	read(LeaderBoardFile,Temp);
         if Score > Temp.Score then
               Top10 := True;
      	inc(i)
      end;
      if i < MaxNumTopList then
      	Top10 := True;
      if Top10 then
      begin
         lblPlayerName.Caption := 'Enter Name: ';
         Top10ComponentEnable;
         sndPlaySound('Win.wav',SND_ASYNC or SND_PURGE or SND_NOWait)
      end
      else
      	sndPlaySound('GameOver.wav',SND_ASYNC or SND_PURGE or SND_NOWait)
   end;
end;

procedure TFPlayForm.keysClick(Sender: TObject);
begin
	Application.MessageBox('Use "WASD" or arrows for movement; "e" for stop; "f" or SPACE for shooting; F1 to view keys, F4 for pause, F7 goto main.','Keys')
end;

procedure TFPlayForm.AEmoveFireflyIdle(Sender: TObject; var Done: Boolean);
const
   MinTimeMoveFireFle = 20;
var
	DeltaTime: integer;
begin
   DeltaTime :=  MilliSecondOf(Now - PrevTimeMovFF);
	if GameStatus = GSPlay then
      if DeltaTime >= MinTimeMoveFireFle  then
      begin
         with FireFly do
         begin
            case Dir of
              DLeft:
                if Left > 0  then
                  Left := Left - Speed;
              DRight:
                if Left < FPlayForm.Width - FireFly.Width then
                  Left := Left + Speed;
              DUp:
                if Top > 0 then
                  Top := Top - Speed;
              DDown:
                if Top < FPlayForm.Height - FireFly.Height then
                  Top := Top + Speed
            end;
            CheckShipCrash;
         end;
         PrevTimeMovFF := Now
      end;
   Done := False
end;

procedure TFPlayForm.btnRestartClick(Sender: TObject);
begin
   StartGame
end;

procedure TFPlayForm.AEcdIdle(Sender: TObject; var Done: Boolean);
var
	DeltaTime : word;
begin
	DeltaTime := MilliSecondOf(Now - PrevTimeCd);
	if GameStatus = GSPlay then
      if DeltaTime > FireFly.FireRate then
      begin
         FireFly.CoolDowned := True;
         PrevTimeCd := Now
      end;
end;

procedure TFPlayForm.AEenemiesIdle(Sender: TObject; var Done: Boolean);
const
	SpawnenemyInterval = 3000;
   MinTimeMoveEn = 20;
   MaxEnemiesCount = 4;
   MaxMisslesCount = 30;
var
	i: Integer;
   DeltaTimeII: Integer;
begin
   if GameStatus = GSPlay then
   begin
      DeltaTimeII := 0;
      DeltaTimeII :=	MilliSecondsBetween(PrevTimeII, Now);
      Inc(SpawnEnemyTime, DeltaTimeII);
      Inc(EnemyChangeDirTimer, DeltaTimeII);
      Inc(cdTimer, DeltaTimeII);
      Inc(MoveEnTimer, DeltaTimeII);
      PrevTimeII := Now;
      if (ArrayEnemy.Count <= MaxEnemiesCount) then
         if SpawnEnemyTime > SpawnenemyInterval then
         begin
            for i := 0 to Difficulty div 3 do
            	SpawnRandEnemy;
            SpawnEnemyTime := 0;
         end;
      if MoveEnTimer > MinTimeMoveEn then
      begin
         MoveEnemies;
         MoveEnTimer := 0
      end;
      if (ArrayMisEn.Count <= MaxMisslesCount) then
      	EnemiesFire
   end;
   Done := False;
end;

procedure TFPlayForm.AEMissleMoveIdle(Sender: TObject; var Done: Boolean);
const
	MisSpeed = 6;
   MinMisMoveTime = 5;
   HitDelay = 3;
var
	i, j: Integer;
   DeltaTime: Integer;
   EnIsHit: Boolean;
begin
   if GameStatus = GSPlay then
   begin
   	DeltaTime := MilliSecondsBetween(PrevTimeMissle, Now);
   	if DeltaTime > MinMisMoveTime then
   	begin
      	i:= ArrayMisEn.Count - 1;
      	while (i >= 0) and (GameStatus = GSPlay) do
      		with  ArrayMisEn[i] do
      		begin
        			if (Texture.Top > FPlayForm.Height + Texture.Height) then
          			FPlayForm.ArrayMisEn.Delete(i)
        			else
        			begin
          			if MPicOrd < High(TMPicOrd) then
            			Inc(MPicOrd)
          			else
            			MPicOrd :=  Low(TMPicOrd);
          			Texture.picture.LoadFromFile(ClrChar(Color) + 'EF' + IntToStr(MPicOrd)+'.png');
          			Texture.Top := Texture.Top + MisSpeed;
          			if HitEnOccurred(i) then
          			begin
            			if FireFly.Vulnerable then
            			begin
              				Dec(FireFly.HP,ArrayMisEn[i].DMG);
              				PBFireFlyHP.Position := FireFly.HP
            			end;
            			ArrayMisEn[i].Texture.Free;
            			ArrayMisEn.Delete(i);
                     BoomStream :=  BASS_StreamCreateFile(False, pchar('Взрыв.mp3'), 0, 0, 0 {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});
                     BASS_ChannelPlay(BoomStream, True);
                     CreateBoom;
                     Explosion.Explose.Left := FireFly.Left + Random(FireFly.Width);
                     Explosion.Explose.Top := FireFly.Top + Random(FireFly.Height);
                     if FireFly.HP < 1 then
                     	GameOver
          			end;
        			end;
        			Dec(i)
      		end;
         i := ArrayMissle.Count - 1;
         while i >= 0 do
            with  ArrayMissle[i] do
            begin
               EnIsHit := False;
               if (ArrayMissle[i].Texture.Top < 0 - Texture.Height) then
                  ArrayMissle.Delete(i)
               else
               begin
                  if MPicOrd < High(TMPicOrd) then
                     Inc(MPicOrd)
                  else
                     MPicOrd :=  Low(TMPicOrd);
                  Texture.picture.LoadFromFile(ClrChar(FireFly.MissleColor) + 'EF'+IntToStr(MPicOrd)+'.png');
                  Texture.Top := Texture.Top - MisSpeed;
                  if  DeltaTime mod HitDelay < 1 then
                  begin
                     j := ArrayEnemy.Count - 1;
                     while  (j >= 0) and not EnIsHit do
                     begin
                        if HitOccurred(i,j) then
                        begin
                           EnIsHit := True;
                           if FireFly.HP < 96 then
                              FireFly.HP := FireFly.Hp + 5
                           else
                              FireFly.HP := 100;
                           PBFireFlyHP.Position := FireFly.HP;
                           CreateBoom;
                           Explosion.Explose.Left := ArrayEnemy[j].Left + Random(ArrayEnemy[j].Width);
                           Explosion.Explose.Top :=  ArrayEnemy[j].Top + Random(ArrayEnemy[j].Height);
                           ArrayMissle[i].Texture.Free;
                           ArrayMissle.Delete(i);
                           Dec(ArrayEnemy[j].HP,FireFly.DMG);
                           if ArrayEnemy[j].HP < 1 then
                              ArrayEnemy.Delete(j)
                        end;
                        Dec(j)
                     end;
                  end;
               end;
               Dec(i);
            end;
      	PrevTimeMissle := Now;
    	end;
   end;
   Done := False
end;

procedure TFPlayForm.AEexplosionsIdle(Sender: TObject; var Done: Boolean);
const
	ExplPicChngTime = 40;
var
	i : integer;
   DeltaTime: integer;
begin
	if GameStatus = GSPlay then
   begin
      DeltaTime := MilliSecondsBetween(PrevTimeExpl,Now);
      if DeltaTime > ExplPicChngTime then
      begin
         i := ArrayExplose.Count - 1;
         while i >= 0 do
         begin
            if ArrayExplose[i].ePicOrd  < High(TEPicOrd) then
            begin
               Inc(ArrayExplose[i].ePicOrd);
               ArrayExplose[i].Explose.Picture.LoadFromFile('e'+IntToStr(ArrayExplose[i].ePicOrd) + '.png');
            end
            else
            	ArrayExplose.Delete(i);
            Dec(i);
         end;
         PrevTimeExpl := Now;
      end;
   end;
   Done := False;
end;

procedure TFPlayForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
const
	KeyMoveLeft = ['a', 'A', 'Ы', 'ы', #37];
  	KeyMoveRight = ['d', 'D', 'в', 'В', #39];
  	KeyMoveUp = ['w', 'W', 'Ц', 'ц', #38];
  	KeyMoveDown = ['s', 'S', 'ы', 'Ы', #40];
  	KeyStop = ['e', 'E', 'У', 'у'];
  	KeyFire = ['f', 'F',' ','а', 'А'];
begin
	if GameStatus = GSBegin then
   begin
   	GameStatus := GSPlay;
      STGameStatus.Visible := False;
    	SpawnRandEnemy;
    	PrevTimeMissle := Now;
    	PrevTimeCd := Now;
    	PrevTimeMovFF := Now;
    	PrevTimeExpl := Now;
   	PrevTimeII := Now;
  	end;
   if Char(Key) in KeyMoveLeft then
   	FireFly.Dir := DLeft
   else
   	if Char(Key) in KeyMoveRight then
   		FireFly.Dir := DRight
   	else
         if Char(Key) in KeyMoveUp then
            FireFly.Dir := DUp
         else
            if Char(Key) in KeyMoveDown then
            	FireFly.Dir := DDown
            else
   				if Char(Key) in KeyStop then
   					FireFly.Dir := DNone;
   if (Char(Key) in KeyFire) and (FireFly.CoolDowned) and (GameStatus = GSPlay) then
   begin
      BlastStream := BASS_StreamCreateFile(False, pchar('BlastFFCut.mp3'), 0, 0, 0 {$IFDEF UNICODE} or BASS_UNICODE {$ENDIF});
      if BlastStream <> 0 then
      	BASS_ChannelPlay(BlastStream, False);
      FireFly.CoolDowned := False;
      FFMissle := TMissle.Create;
      FFMissle.Texture :=  TImage.Create(FPlayForm);
      FFMissle.Texture.Parent := FPlayForm;
      FFMissle.Texture.AutoSize := True;
      FFMissle.Texture.Left := FireFly.Left + MissleWidth div 2;
      FFMissle.Texture.Top := FireFly.top - MissleHeight;
      FFMissle.Texture.Picture.LoadFromFile('REF1.png');
      FFMissle.MPicOrd := 1;
      ArrayMissle.Add(FFMissle);
   end;
end;

procedure TFPlayForm.FormKeyUp(Sender: TObject; var Key: Word;Shift: TShiftState);
const
	F1 = 112;
   F7 = 118;
   F4 = 115;
begin
   if key = F1 then
   	keysClick(Self)
   else
      if key = F7 then
         QuitClick(Self)
      else
         if key = F4 then
            PauseClick(Self);
end;

end.
