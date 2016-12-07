"El módulo con la funcionalidad principal para el proyecto."
by("chochos", "leomindez", "carlogilmar")
native("jvm")
module codecampmx.ceylon.core "1.0.0" {
    shared import ceylon.collection "1.3.1";
    shared import maven:"org.twitter4j:twitter4j-core" "4.0.5";
    shared import java.base "8";
}
