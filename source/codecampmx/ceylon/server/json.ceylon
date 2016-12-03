import ceylon.http.server {
    Response
}
import ceylon.json { JsonObject,
    JsonArray }
import ceylon.http.common {
    contentType,
    contentLength
}
import ceylon.buffer.charset {
    utf8
}

void writeJson(Response resp, JsonObject|JsonArray data) {
    value content = data.string;
    resp.addHeader(contentType("application/json", utf8));
    resp.addHeader(contentLength(content.size.string));
    resp.writeString(content);
    resp.flush();
}
