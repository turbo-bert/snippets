import socketserver
import queue
import threading

theQ = queue.Queue()


class DebugHandler(socketserver.BaseRequestHandler):

    def handle(self) -> None:
        print("DATA")
        self.data = self.request.recv(8192).strip()
        theQ.put(""+self.data.decode())
        #self.request.sendall(self.data)
        return super().handle()


def rrun():
    with socketserver.TCPServer(("127.0.0.1", 25000), DebugHandler) as server:
        server.serve_forever()


if __name__ == "__main__":
    #echo OK | nc -v 127.0.0.1 25000
    t = threading.Thread(target=rrun)
    t.start()
    while True:
        print("info: empty=%s" % str(theQ.empty()))
        x = input("# ")
        if x == "p":
            theQ.get()
