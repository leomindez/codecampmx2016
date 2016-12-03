import ceylon.http.server {
    Request,
    Response
}
import codecampmx.ceylon.core { twitter, commonFollowers,
    Usuario }
import ceylon.json {
    Json=Object, JsonArray=Array
}
void followers(Request req, Response resp) {
    if (exists uno = req.pathParameter("uno"),
        exists dos = req.pathParameter("dos")) {
        if (exists u1 = twitter.findUser(uno),
            exists u2 = twitter.findUser(dos)) {
            value arr = JsonArray {
                for (u in commonFollowers(u1, u2))
                    userToJson(u)
            };
            writeJson(resp, arr);
        }
    }
}

Json userToJson(Usuario u) =>
    Json{ "id"->u.id, "username"->u.username };
