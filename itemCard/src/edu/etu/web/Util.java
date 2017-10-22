package edu.etu.web;

import javax.servlet.http.Cookie;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Xtail on 22.10.17.
 */
public class Util {
    public static final Cookie DEFAULT_LANG_COOKIE = new Cookie("lang", "ru");

    public static Map<String, Cookie> cookiesArrayToMap(Cookie[] cookies) {
        final Map<String, Cookie> cookiesHashMap = new HashMap<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookiesHashMap.put(cookie.getName(), cookie);
            }
        }
        return cookiesHashMap;
    }
}
