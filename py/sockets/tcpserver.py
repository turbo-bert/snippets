import socketserver

class DebugHandler(socketserver.BaseRequestHandler):

    def handle(self) -> None:
        self.data = self.request.recv(1024).strip()
        self.request.sendall(self.data)
        return super().handle()


if __name__ == "__main__":
    with socketserver.TCPServer(("127.0.0.1", 25000), DebugHandler) as server:
        server.serve_forever()
