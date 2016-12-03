"Genera el TGF de las conexiones entre
 los usuarios especificados."
shared String conexiones([Usuario*] usuarios) {
    value sb = StringBuilder();
    for (u in usuarios) {
        fetchFollowers(u);
        sb.append(u.id.string).append(" ").append(u.username).appendNewline();
    }
    sb.append("#").appendNewline();
    for (u in usuarios) {
        for (f in u.followers) {
            if (f in usuarios) {
                sb.append(f.id.string).append(" ").append(u.id.string).appendNewline();
            }
        }
    }
    return sb.string.trimmed;
}
