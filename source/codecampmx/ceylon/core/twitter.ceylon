import java.lang { JString=String }
import twitter4j.conf {
    ConfigurationBuilder
}
import twitter4j {
    TwitterFactory
}

shared object twitter {
    print("Conectando a twitter...");
    value config=ConfigurationBuilder()
        .build();
    value client=TwitterFactory(config).instance;
    print("Listo...");

    shared Usuario? findUser(String username) {
        return Usuario(system.milliseconds, username, "Iventado", "");
        /*if (exists u = client.users().showUser(username)) {
            return Usuario(u.id, username, u.name, u.miniProfileImageURL);
        }
        return null;*/
    }
}
