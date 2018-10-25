procedure TFPlayForm.PauseClick(Sender: TObject);
begin
	if GameStatus = GSPlay  then
  	begin
		GameStatus :=  GSPause;
    	Pause.Caption := 'Resume'
  	end
  	else
    	if GameStatus = GSPause  then
    	begin
      	GameStatus :=  GSPlay;
      	Pause.Caption := 'Pause'
    	end;
end;

procedure TFPlayForm.QuitClick(Sender: TObject);
begin
	GameStatus := GSover;
	FPlayForm.Close
end;

procedure TFPlayForm.btnSaveScoreClick(Sender: TObject);
const
  	EmptyRec: TPlayer = (Name:' '; Score: 0);
var
	i,j: integer;
	Temp: TPlayer;
	IsWriteln: boolean;
begin
   i := 0;
   IsWriteln := False;
   if FileSize(LeaderBoardFile) = 0 then
   begin
      Rewrite(LeaderBoardFile);
      write(LeaderBoardFile, EmptyRec);
   end;
   Reset(LeaderBoardFile);
   while (I < FileSize(LeaderBoardFile)) and not IsWriteln  do
   begin
      read(LeaderBoardFile,Temp);
      if Score > Temp.Score then
      begin
         for j := FileSize(LeaderBoardFile) - 1 downto i do
         begin
            if j = MaxNumTopList then
            	Continue;
            Seek(LeaderBoardFile,j);
            Read(LeaderBoardFile,temp);
            write(LeaderBoardFile,temp)
      	end;
         Seek(LeaderBoardFile,i);
         Temp.Name := edtPlayerName.Text;
         Temp.Score := score;
         Write(LeaderBoardFile, Temp);
         IsWriteln := True;
    	end;
      inc(i)
   end;
   if (FileSize(LeaderBoardFile) < MaxNumTopList) and not IsWriteln then
   begin
      i := FileSize(LeaderBoardFile) + 1;
      Temp.Name := edtPlayerName.Text;
      Temp.Score := score;
      write(LeaderBoardFile,Temp);
   end;
   btnSaveScore.Visible := False;
   lblPlayerName.Caption := 'You wont be forget...';
   edtPlayerName.Visible := False;
   CloseFile(LeaderBoardFile)
end;

procedure TFPlayForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   i: integer;
begin
	GameStatus := GSover;
  	DisableTop10Components;
  	CleanScreen;
  	Difficulty := 1;
  	Score := 0;
end;

procedure TFPlayForm.edtPlayerNameKeyPress(Sender: TObject; var Key: Char);
begin
	if (Length(edtPlayerName.Text) > 39) and not (Key in [#8]) then
  		Key := #0;
end;
