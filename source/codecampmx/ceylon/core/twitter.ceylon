import java.lang { JString=String }
import twitter4j.conf {
    ConfigurationBuilder
}
import twitter4j {
    TwitterFactory
}
import java.util.concurrent.atomic {
    AtomicLong
}

shared object twitter {
    print("Conectando a twitter...");
    value config=ConfigurationBuilder()
        .build();
    value client=TwitterFactory(config).instance;
    print("Listo...");
    value counter = AtomicLong();

    shared Usuario? findUser(String username) {
        if (username.empty) {
            return null;
        }
        return Usuario(counter.incrementAndGet(), username, "Iventado", "");
        /*if (exists u = client.users().showUser(username)) {
            return Usuario(u.id, username, u.name, u.miniProfileImageURL);
        }
        return null;*/
    }
}
