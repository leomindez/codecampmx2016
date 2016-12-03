"Obtiene los seguidores comunes de dos usuarios de twitter"
shared Set<Usuario> commonFollowers(Usuario uno, Usuario dos) {
    fetchFollowers(uno);
    fetchFollowers(dos);
    value common =  uno.followers & dos.followers;
    common.each((u){
        u.following.add(uno);
        u.following.add(dos);
    })
    return common;
}

"Llena la lista de seguidores de un usuario de twitter"
shared void fetchFollowers(Usuario user) {
    
}


