    procedure TForm1.bash_window(cmd_actual: String);
    var
      res: String;
    begin
      RunCommand('/bin/bash', ['-l', '-c', 'osascript -e ''tell application "Terminal" to set position of front window to {0, 0}'''], res);
      Sleep(500);
      RunCommand('/bin/bash', ['-l', '-c', 'osascript -e ''tell app "Terminal" to do script "'+cmd_actual+'"'''], res);
      Sleep(500);
      RunCommand('/bin/bash', ['-l', '-c', 'osascript -e ''tell app "Terminal" to activate'''], res);
    
    end;
    