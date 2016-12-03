import java.lang { JString=String }
import twitter4j.conf {
    ConfigurationBuilder
}
import twitter4j {
    TwitterFactory
}

shared object twitter {
    value config=ConfigurationBuilder()
        .setUser("codecamp_ceylon").setPassword("code.camp.ceylon")
        .build();
    value client=TwitterFactory(config).instance;

    shared Usuario? findUser(String username) {
        if (exists u = client.users().showUser(username)) {
            return Usuario(u.id, username, u.name, u.miniProfileImageURL);
        }
        return null;
    }
}
