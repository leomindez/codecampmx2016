import ceylon.test { test, assertTrue }

import codecampmx.ceylon.core {
    Usuario,
    commonFollowers,
    commondFriends
}

shared test void testCommonFriends(){
    value uno = Usuario(1, "uno", "One", "");
    value dos = Usuario(2, "dos", "Dos", "");
    value common = commonFollowers(uno, dos);
    assertTrue(commondFriends(uno,dos,common).size > 0 );
}