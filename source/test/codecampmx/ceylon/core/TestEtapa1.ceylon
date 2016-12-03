import ceylon.test { test,
    assertEquals,
    assertTrue }
import codecampmx.ceylon.core {
    Usuario,
    commonFollowers
}

shared test void testEtapa1() {
    value uno = Usuario(1, "uno", "One", "");
    value dos = Usuario(2, "dos", "Dos", "");
    value common = commonFollowers(uno, dos);
    assertTrue(uno.followers.size > 0);
    assertTrue(dos.followers.size > 0);
    assertTrue(common.size > 0);
    assertTrue(every { for (u in common) u.follows(uno) && u.follows(dos) });
}
