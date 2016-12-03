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
import java.io { JFile=File }
import ceylon.http.common {
    contentType
}
import ceylon.file {
    File,
    parsePath
}
import ceylon.io {
    newOpenFile
}

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
                    if (f!= u && f in usuarios) {
                        print("``f`` sigue a ``u``");
                        g.node(Factory.node(f.username).link(Factory.node(u.username)));
                    }
                }
            }
            value output = JFile("/tmp/caca.png");
            output.delete();
            Graphviz.fromGraph(g).renderToFile(output);
            resp.addHeader(contentType("image/png"));
            value file = newOpenFile(parsePath(output.absolutePath).resource);
            resp.transferFile(file);
        } else {
            error(resp, "Al menos uno de los usuarios no existe.");
        }
    } else {
        error(resp, "Debes indicar dos usuarios de twitter.");
    }
}
