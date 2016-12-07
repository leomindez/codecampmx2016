import ceylon.collection {
    HashSet
}

"Obtiene los seguidores comunes de dos usuarios de twitter"
shared Set<Usuario> commonFollowers(Usuario uno, Usuario dos) {
    fetchFollowers(uno);
    fetchFollowers(dos);
    value common =  uno.followers & dos.followers;
    common.each((u){
        u.following.add(uno);
        u.following.add(dos);
    });
    return common;
}

shared Set<Usuario> getCommonFollowers(String userOne, String userTwo) {
    value followersUserOne = getUserFollowers(userOne);
    value followersUserTwo = getUserFollowers(userTwo);
    return followersUserOne & followersUserTwo;
}

"Llena la lista de seguidores de un usuario de twitter"
shared void fetchFollowers(Usuario user) {

    //Por ahorita es pura mamada para probar
    value juan = Usuario(100, "juan", "Juan", "");
    user.followers.add(juan);
    user.followers.add(Usuario(101, "pedro", "Pedro", ""));
    user.following.add(juan);

    value jose = Usuario(201, "jose", "Jose","");
    user.followers.add(jose);
    user.followers.add(Usuario(202, "pepito", "pepito", ""));
    user.following.add(jose);

    juan.followers.add(jose);
    jose.following.add(juan);

    value juanita=Usuario(301,"juanita","Juanita","");
    user.followers.add(juanita);
    user.following.add(juanita);
    juanita.following.add(juan);
    juanita.following.add(jose);
    juan.followers.add(juanita);

    if (user.id.even) {
        value x = Usuario(102, "pablo", "x", "");
        user.followers.add(x);
        user.followers.add(Usuario(103, "maicol", "x", ""));
        user.following.add(x);
    } else {
        value x = Usuario(104, "brayan", "x", "");
        user.followers.add(x);
        user.followers.add(Usuario(105, "yony", "x", ""));
        user.following.add(x);
    }

}

     HashSet<Usuario> getUserFollowers(String screename) {
    return twitter.getFollowers(screename);
}
