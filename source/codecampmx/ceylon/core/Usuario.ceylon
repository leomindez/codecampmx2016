import ceylon.collection {
    MutableSet, HashSet
}

"Representa un usuario de Twitter."
shared class Usuario(id, username, nombre, imagen) {
    "El identificador único de usuario"
    shared Integer id;
    "El nickname"
    shared String username;
    "El nombre completo"
    shared String nombre;
    "URL hacia la imagen"
    shared String imagen;
    "El conjunto de usuarios que siguen a este usuario"
    shared MutableSet<Usuario> followers = HashSet<Usuario>();
    "El conjunto de usuarios a los que sigue este usuario"
    shared MutableSet<Usuario> following = HashSet<Usuario>();

    shared Boolean follows(Usuario other) => other in following;
    shared Boolean followedBy(Usuario other) => other in followers;
}
