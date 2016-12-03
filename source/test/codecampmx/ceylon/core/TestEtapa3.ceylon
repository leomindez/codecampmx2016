import ceylon.test {
    test,
    assertEquals
}
import codecampmx.ceylon.core {
    Usuario,
    conexiones
}
shared test void testConexiones() {
    value users = [Usuario(1, "uno", "UNO", ""),
        Usuario(2, "dos", "DOS", ""), Usuario(3, "tres", "TRES", "")];
    value u = Usuario(4,"cuatro","","");
    u.followers.add(users[0]);
    u.followers.add(users[1]);
    users[1].followers.add(u);
    users[0].followers.add(users[1]);
    users[1].followers.add(users[2]);
    users[2].followers.add(users[0]);
    users[0].followers.add(u);
    value conns = conexiones(users);
    print(conns);
    assertEquals("1 uno
                  2 dos
                  3 tres
                  #
                  2 1
                  3 2
                  1 3", conns);
}
