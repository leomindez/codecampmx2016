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

"Llena la lista de seguidores de un usuario de twitter"
shared void fetchFollowers(Usuario user) {
    //Por ahorita es pura mamada para probar
    user.followers.add(Usuario(100, "juan", "Juan", ""));
    user.followers.add(Usuario(101, "pedro", "Pedro", ""));
    if (user.id.even) {
        user.followers.add(Usuario(102, "pablo", "x", ""));
        user.followers.add(Usuario(103, "maicol", "x", ""));
    } else {
        user.followers.add(Usuario(104, "brayan", "x", ""));
        user.followers.add(Usuario(105, "yony", "x", ""));
    }
}


