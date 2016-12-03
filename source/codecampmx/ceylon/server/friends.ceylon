import ceylon.http.server {
    Request,
    Response
}
import codecampmx.ceylon.core {
    twitter,
    commonFollowers,
    commondFriends
}
import ceylon.json {
    Json=Object,
    JsonArray=Array
}
void friends(Request req, Response resp) {
    if (exists uno = req.pathParameter("uno"),
        exists dos = req.pathParameter("dos")) {
        print("Buscando a ``uno`` y ``dos``");
        if (exists u1 = twitter.findUser(uno),
            exists u2 = twitter.findUser(dos)) {
            value arr = JsonArray {
                    for (u in commondFriends(u1,u2,commonFollowers(u1, u2)))
                    userToJson(u)
            };
            writeJson(resp, Json{"friends"->arr});
        } else {
            error(resp, "Al menos uno de los usuarios no existe.");
        }
    } else {
        error(resp, "Debes indicar dos usuarios de twitter.");
    }
}

