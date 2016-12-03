import ceylon.test {
    assertTrue, test
}
import codecampmx.ceylon.core {
    twitter
}
shared test void testFindUser() {
    if (exists u = twitter.findUser("chochosmx")) {
        assertTrue(true);
    } else {
        assertTrue(false);
    }
}
