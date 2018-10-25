procedure SpawnShip(var Ship: TSpaceShip;FilePath: string;x,y,NFS,FRate,Damage,HealthPoints : integer;LClr:TMissleColor);
begin
	with ship do
  begin
    Ship := TSpaceShip.Create(FPlayForm);
    Parent := FPlayForm;
    AutoSize := True;
    Picture.LoadFromFile(FilePath);
    Visible := True;
    Left := x ;
    Top := y;

    if Ship = FireFly then
    	Dir := DNone
    else
     	Dir := DDown;
    DirTime := (Random(1500) + 500 div Difficulty);
    Vulnerable := True;
    Speed := NFS;
    FireRate := FRate;
    Hp := HealthPoints;
    DMG := Damage;
    MissleColor := LClr;
    Shooting := False;
    CoolDowned := True;
    Coolingdown := 0;
  end;
end;

procedure SpawnRandEnemy();
const
	EnemyCount = 10;
begin
  Randomize;
  case random(EnemyCount) + 1 of
    1:
      begin
        SpawnShip(Enemy,'Enemy1.png',Random(FPlayForm.Width-100)+50,-200,1*Difficulty,500,25,100,ClrPurple); //x,y,speed,FR,DMG
        FPlayForm.ArrayEnemy.Add(Enemy);
      end;
    2:
      begin
        SpawnShip(Enemy,'speedship.png',Random(FPlayForm.Width-100)+50,-200,3*Difficulty,300,25,30,ClrGreen);
        FPlayForm.ArrayEnemy.Add(Enemy);
      end;
    3:
      begin
        SpawnShip(Enemy,'blueship2.png',Random(FPlayForm.Width-100)+50,-200,1*Difficulty,400,20,100,ClrBlue);
        FPlayForm.ArrayEnemy.Add(Enemy);
      end;
    4:
     begin
       SpawnShip(Enemy,'bgspeedship.png',Random(FPlayForm.Width-100)+50,-200,5*Difficulty,500,10,30,ClrGreen);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
    5:
     begin
       SpawnShip(Enemy,'bluecargoship.png',Random(FPlayForm.Width-100)+50,-200,2*Difficulty,400,25,70,ClrBlue);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
    6:
     begin
       SpawnShip(Enemy,'blueship1.png',Random(FPlayForm.Width-100)+50,-200,2*Difficulty,700,40,80,ClrBlue);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
    7:
     begin
       SpawnShip(Enemy,'alien2.png',Random(FPlayForm.Width-100)+50,-200,3*Difficulty,600,30,30,ClrPurple);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
    8:
     begin
       SpawnShip(Enemy,'blueshuttlenoweps.png',Random(FPlayForm.Width-100)+50,-200,4*Difficulty,300,25,50,ClrBlue);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
    9:
     begin
       SpawnShip(Enemy,'greenship4.png',Random(FPlayForm.Width-100)+50,-200,2*Difficulty,700,50,120,ClrGreen);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
    10:
     begin
       SpawnShip(Enemy,'alien3.png',Random(FPlayForm.Width-100)+50,-200,3*Difficulty,600,25,70,ClrPurple);
       FPlayForm.ArrayEnemy.Add(Enemy);
     end;
  end;
end;

function HitEnOccurred(i: integer): boolean;
const
	XAprox = 15;
  YAprox = 17;
begin
    with FPlayForm do
  HitEnOccurred :=
  (-FireFly.Top + FPlayForm.ArrayMisEn[i].Texture.Top + FPlayForm.ArrayMisEn[i].Texture.Height>= YAprox)
  and
  (FPlayForm.ArrayMisEn[i].Texture.Top  <= FireFly.Height+FireFly.Top-YAprox)
  and
  (FPlayForm.ArrayMisEn[i].Texture.Left >= FireFly.Left -  ArrayMisEn[i].Texture.Width + xAprox)
  and
  (FPlayForm.ArrayMisEn[i].Texture.Left <= FireFly.Left  + FireFly.Width- XAprox)
end;

function HitOccurred(i,j: integer): boolean;
const
	enemyBaseWidth = 500;
  lvlUpPoint = 50;
begin
  with FPlayForm do
  HitOccurred :=
  (abs(FPlayForm.ArrayEnemy[j].Top - FPlayForm.ArrayMissle[i].Texture.Top)  <= FPlayForm.ArrayEnemy[j].Height)
  and
  (ArrayMissle[i].Texture.Left - ArrayEnemy[j].Left  < ArrayEnemy[j].Width + ArrayMissle[i].Texture.Width div 2-30)
  and
  (-ArrayMissle[i].Texture.Left + ArrayEnemy[j].Left  < ArrayMissle[i].Texture.Width div 2);
  if Result then
  	inc(Score);
  if Score > Difficulty*lvlUpPoint then
  begin
    inc(Difficulty);
     SpawnShip(Enemy,'mainbase.png',(FPlayForm.Width - enemyBaseWidth) div 2,0,0,700 div Difficulty,5+5*Difficulty,150 + 30*Difficulty,ClrGreen);
     FPlayForm.ArrayEnemy.Add(Enemy);
    FPlayForm.lblLevel.Caption := IntToStr(Difficulty);
  end;
  FPlayForm.lblScore.Caption := IntToStr(Score);
end;

procedure CheckShipCrash();
var
	i: integer;
begin
	i := FPlayForm.ArrayEnemy.Count-1;
	while i >= 0 do
  begin
    with FPlayForm do
    if (abs(FPlayForm.ArrayEnemy[i].Top - FireFly.Top)  <= FPlayForm.ArrayEnemy[i].Height)
    and
    (FireFly.Left - ArrayEnemy[i].Left  < ArrayEnemy[i].Width)
    and
    (-FireFly.Left + ArrayEnemy[i].Left  < FireFly.Width div 2)
    then
    begin
    	FireFly.HP := 0;
      PBFireFlyHP.Position := 0;
    	GameOver;
      exit
    end;
    Dec(i);
  end;
end;



procedure MoveEnemies();
const
	MaxValue = 10000;
var
	i : integer;
begin
	with FPlayForm do
	for I := 0 to ArrayEnemy.Count - 1  do
  with ArrayEnemy[i] do
  begin
  	if EnemyChangeDirTimer mod DirTime < 1  then
  		Dir := TDir(Random(5));                       //
    begin
      case Dir of
        DLeft:
          if Left > 0  then
            Left := Left - Speed
          else
            Dir := DRight;
        DRight:
          if Left <FPlayForm.Width - ArrayEnemy[i].Width then
            Left := Left + Speed
          else
            Dir := DLeft;
        DUp:
          if Top > 0 then
            Top := Top - Speed
          else
            Dir := DDown;
        DDown:
          if Top < FPlayForm.Height - ArrayEnemy[i].Height - SaveZoneY then
            Top := Top + Speed
          else
            Dir :=  DUp;
        DNone:
      end;
    end;
  end;
  if  EnemyChangeDirTimer > MaxValue then    //во избежание преполнения
  	EnemyChangeDirTimer := 0;
end;

procedure RatFire();
const
	RatDMG = 10;
begin
  if (FireFly.Left = 0)
  	or (FireFly.Left > FPlayForm.ClientWidth - FireFly.Width)
    or (FireFly.Top >= FPlayForm.Height - FireFly.Height)
    or (FireFly.dir = DNone)  then
  	CreateMissle(FireFly.Left + FireFly.Width div 2,0,RatDMG,clrGreen);
end;

procedure EnemiesFire();
const
	MissleWidth = 48;
  RatFireRate = 100;
var
	i: integer;
begin
  if (cdTimer mod RatFireRate < 1) then
  	RatFire;
  for i := 0 to FPlayForm.ArrayEnemy.Count - 1 do
    with FPlayForm.ArrayEnemy[i] do
      if cdTimer mod (FireRate div Difficulty) = 0 then
      begin
       	CreateMissle(Left + Random(Width -  MissleWidth),Top + Height,DMG,MissleColor);
      end;
  if cdTimer > 1000 then
 	  cdTimer := 0;
end;


