unit mockupdate;

{$H+}

interface
function getkeydata():String;

implementation


function getkeydata():String;
var
res:String;
begin
    res := '-----BEGIN PUBLIC KEY-----' + chr(10) +
        'blablabla' + chr(10) +
        '-----END PUBLIC KEY-----' + chr(10);
    getkeydata := res;
end;

begin
end.
