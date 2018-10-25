function Pow(arg,grade:integer): integer;
var
	I: integer;
begin
  for I := 2 to grade do
    arg := arg *arg;
  result := arg;
end;
