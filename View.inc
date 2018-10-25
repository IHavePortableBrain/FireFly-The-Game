procedure DisableTop10Components;
begin
	with FPlayForm do
   begin
      edtPlayerName.Visible := False;
      lblPlayerName.Visible := False;
      lblTop10.Visible := False;
      btnSaveScore.Visible := False;
      btnRestart.Visible := False;
   end;
end;

procedure Top10ComponentEnable;
begin
	with FPlayForm do
   begin
      lblPlayerName.Visible := True;
      edtPlayerName.Visible := True;
      lblTop10.Visible := True;
      btnSaveScore.Visible := True;
   end;
end;

constructor TBackGround.Create;
const
	MaxPicWidth = 50;
   MaxPicHeight = 52;
   RandomAccuracy = 1000;
   RandomChance  = 300;
var
	i, k, StarSize: Integer;
   Star: TImage;
begin
	k := 0;
   i := 0;
   FPlayForm.Refresh;
   FPlayForm.Color := 0;
   FPlayForm.ArrayStar := TObjectList<TImage>.Create(True);
   with  FPlayForm do
      while i < FPlayForm.Height do
		begin
  			while k < FPlayForm.Width do
   	   begin
      		if (random(RandomAccuracy) < RandomChance) and (k < FPlayForm.Width)
      			and (i <  FPlayForm.Height) then
      		begin
      			Star := TImage.Create(FPlayForm);
               Star.Parent := FPlayForm;
               Star.SendToBack;
               ArrayStar.Add(Star);
               Star.AutoSize := True;
               Star.Transparent := False;
               StarSize := Random(2) + 1;
               case StarSize of
                  1:
                  	Star.Picture.LoadFromFile('1.png');
                  2:
                  	Star.Picture.LoadFromFile('2.png');
                  3:
                  	Star.Picture.LoadFromFile('3.png');
               end;
        			if  k > FPlayForm.Width - MaxPicWidth then
          			Star.left := k - Star.Width
        			else
          			Star.left := k;
        			if  i > FPlayForm.Height - MaxPicHeight then
          			Star.top := i - Star.Height
        			else
          			Star.top := i;
      		end;
      		inc(k, MaxPicWidth + Random(10));
    		end;
         k := 0;
    		inc(i ,MaxPicHeight + Random(15));
		end;
end;

procedure CleanScreen;
var
	i: integer;
begin
	with FPlayForm do
  	try
   	for i := 0 to ArrayMisEn.Count - 1 do
      	ArrayMisEn[i].Texture.Free;
      for i := 0 to ArrayExplose.Count - 1 do
         ArrayExplose[i].Explose.Free;
      for i := 0 to ArrayMissle.Count - 1 do
         ArrayMissle[i].Texture.Free;
      if ArrayStar <> nil then
         ArrayStar.Destroy;
      if ArrayEnemy <> nil then
         ArrayEnemy.Destroy;
      if ArrayExplose <> nil then
         ArrayExplose.Destroy;
      if ArrayMissle <> nil then
         ArrayMissle.Destroy;
      if ArrayMisEn <> nil then
         ArrayMisEn.Destroy;
      if FireFly <> nil then
         FireFly.Destroy;
   except
  	end;
end;

procedure CreateBoom;
begin
   Explosion := TExplosion.Create;
   Explosion.Explose := TImage.Create(FPlayForm);
   Explosion.Explose.Parent := FPlayForm;
   Explosion.Explose.AutoSize := True;
   Explosion.Explose.Picture.LoadFromFile('e1.png');
   Explosion.ePicOrd := 1;
   FPlayForm.ArrayExplose.Add(Explosion);
end;
