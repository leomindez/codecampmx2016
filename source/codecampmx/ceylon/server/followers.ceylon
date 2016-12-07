import ceylon.http.server {
    Request,
    Response
}
import codecampmx.ceylon.core {
    Usuario,
    getCommonFollowers
}
import ceylon.json {
    Json=Object, JsonArray=Array
}
void followers(Request req, Response resp) {
    if (exists uno = req.pathParameter("uno"),
        exists dos = req.pathParameter("dos")) {
        print("Buscando a ``uno`` y ``dos``");
            value arr = JsonArray {
                for (u in getCommonFollowers(uno, dos))
                    userToJson(u)
            };
            writeJson(resp, Json{"followers"->arr});

    } else {
        error(resp, "Debes indicar dos usuarios de twitter.");
    }
}

Json userToJson(Usuario u) =>
    Json{ "id"->u.id, "username"->u.username };
