program main;

// nc -v -k -l 8000
uses sockets,errors;

var
s: longint;
addr: TInetSockAddr;
line: String;
sin, sout: Text;
begin
    writeln('okay');
    addr.sin_family := AF_INET;
    addr.sin_port := htons(8000);
    addr.sin_addr.s_addr := ((1 shl 24) or 127);
    s := fpSocket(AF_INET, SOCK_STREAM, 0);
    if not connect (s, addr, sin, sout) then
        begin
            writeln(strerror(SocketError));
            halt(1);
        end;
    rewrite(sout);
    reset(sin);
    writeln(sout, 'test');
    flush(sout);
    //while not eof(sin) do
    //    begin
    //    readln(sin,line);
    //    end;
    fpShutdown(s, 2);
    close(sin);
    close(sout);
end.
