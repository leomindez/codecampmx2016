import ceylon.test { test,
    assertTrue }

import codecampmx.ceylon.core {
    Usuario,
    commonFollowers,
    fetchFollowers
}

shared test void testFetchFollowers() {
    value uno = Usuario(1, "uno", "One", "");
    fetchFollowers(uno);
    assertTrue(uno.followers.size > 0);
}

shared test void testCommonFollowers() {
    value uno = Usuario(1, "uno", "One", "");
    value dos = Usuario(2, "dos", "Dos", "");
    value common = commonFollowers(uno, dos);
    assertTrue(uno.followers.size > 0);
    assertTrue(dos.followers.size > 0);
    assertTrue(uno.following.size > 1);
    assertTrue(dos.following.size > 1);
    assertTrue(common.size > 0);
    assertTrue(every { for (u in common) u.follows(uno) && u.follows(dos) });
}
