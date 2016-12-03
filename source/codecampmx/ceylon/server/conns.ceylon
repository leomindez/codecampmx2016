import ceylon.http.server {
    Request,
    Response
}
import codecampmx.ceylon.core {
    twitter,
    commonFollowers,
    commondFriends,
    fetchFollowers
}
import guru.nidi.graphviz.model {
    Factory
}
import guru.nidi.graphviz.engine {
    Graphviz
}
import java.io { File }

void conns(Request req, Response resp) {
    if (exists uno = req.pathParameter("uno"),
        exists dos = req.pathParameter("dos")) {
        print("Buscando a ``uno`` y ``dos``");
        if (exists u1 = twitter.findUser(uno),
            exists u2 = twitter.findUser(dos)) {
            value usuarios=commondFriends(u1, u2, commonFollowers(u1, u2));
            value g=Factory.graph("``uno``-``dos``").directed();
            for (u in usuarios) {
                fetchFollowers(u);
            }
            for (u in usuarios) {
                for (f in u.followers) {
                    if (f in usuarios) {
                        print("``f`` sigue a ``u``");
                        g.node(f.username).link(g.node(u.username));
                    }
                }
            }
            Graphviz.fromGraph(g).renderToFile(File("/tmp/caca.png"));
        } else {
            error(resp, "Al menos uno de los usuarios no existe.");
        }
    } else {
        error(resp, "Debes indicar dos usuarios de twitter.");
    }
}
