import java.lang { JString=String }

import twitter4j.conf {
    ConfigurationBuilder
}
import twitter4j {
    TwitterFactory,
    Twitter,
    CursorSupport
}
import java.util.concurrent.atomic {
    AtomicLong
}
import java.util.concurrent {
    CompletableFuture
}
import ceylon.collection {
    HashSet
}

shared object twitter {
    print("Conectando a twitter...");
    value followerLimit = 150;
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


   shared HashSet<Usuario> getFollowers(String screename) {
        value followers = HashSet<Usuario>();
        twitterClient().instance.getFollowersList(screename, CursorSupport.start,followerLimit).forEach((user) => followers.add(Usuario(user.id, user.screenName, user.name, user.miniProfileImageURL)));
        return CompletableFuture.supplyAsync(() => followers).get();
    }


    TwitterFactory twitterClient(){
        value configTwitter = ConfigurationBuilder();
        configTwitter.setDebugEnabled(true);
        configTwitter.setOAuthAccessToken("775830589895282688-tRxU2OSAC6ueP5LsCnLea5KDhwy26lY");
        configTwitter.setOAuthAccessTokenSecret("uX4rnxfeddGDginsxldxLs22yaxPxl7ioSNZd4tvv33oT");
        configTwitter.setOAuthConsumerKey("4HYRXxciO0MR47OVuyc6rF343");
        configTwitter.setOAuthConsumerSecret("0mzJqmNARYkOxVdtR83Y92ovTG292n59KLlfIO7bEU72gon6JW");
        return TwitterFactory(configTwitter.build());
    }
}
