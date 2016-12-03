shared {Usuario*} commondFriends(Usuario uno, Usuario dos, Set<Usuario> followers)

    => { for (u in followers) if (uno.follows(u)&&dos.follows(u)) u };