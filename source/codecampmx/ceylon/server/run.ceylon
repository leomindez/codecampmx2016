import java.lang {
    System
}
import ceylon.http.server {
    newServer,
    Endpoint,
    equals,
    Options
}
import ceylon.io {
    SocketAddress
}
shared void run() {
    "You must specify a port through the server.port system property"
    assert(is Integer port = Integer.parse(System.getProperty("server.port", "8080")));
    value server = newServer {
        Endpoint {
            path = equals("/followers/{uno}/{dos}");
            followers;
        },
        Endpoint {
            path = equals("/friends/{uno}/{dos}");
            friends;
        },
        Endpoint {
            path = equals("/conexiones/{uno}/{dos}");
            conns;
        }
    };
    server.start(SocketAddress("localhost", port),
        Options { sessionId = "codecampmx-ceylon"; });}
