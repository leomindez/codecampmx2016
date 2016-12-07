import ceylon.test { test,
    assertTrue,
    assertNotNull }

import codecampmx.ceylon.core {
    Usuario,
    commonFollowers,
    fetchFollowers,
    twitter,
    getCommonFollowers

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

shared test void testGetFollowers(){
    value followers = twitter.getFollowers("0xtejatero");
    assertNotNull(followers);
    assertTrue(followers.size > 0);
}

shared test void testGetCommonFollowers(){
    value common = getCommonFollowers("0xtejatero", "silmood");
    assertTrue(!common.empty);
}