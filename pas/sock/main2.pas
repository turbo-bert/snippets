uses Sockets;

procedure TForm2.hot(cmd: String);
var
  Sock: LongInt;
  Addr: TInetSockAddr;
  Msg: AnsiString;
begin
  Sock := fpSocket(AF_INET, SOCK_STREAM, 0);
  if Sock < 0 then
    raise Exception.Create('Socket konnte nicht erstellt werden');

  try
     FillChar(Addr, SizeOf(Addr), 0);
     Addr.sin_family := AF_INET;
     Addr.sin_port := htons(9999);
     Addr.sin_addr := StrToNetAddr('127.0.0.1');

     if fpConnect(Sock, @Addr, SizeOf(Addr)) <> 0 then
       raise Exception.Create('Connect fehlgeschlagen');

     Msg := cmd + LineEnding;

     if fpSend(Sock, @Msg[1], Length(Msg), 0) < 0 then
       raise Exception.Create('Senden fehlgeschlagen');

   finally
     CloseSocket(Sock);
   end;
