package edu.etu.web;

import javax.servlet.http.Cookie;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Xtail on 22.10.17.
 */
public class Util {
    public static Map<String, Integer> parseCookies(Cookie[] cookies) {
        Map<String, Cookie> requestCookies = Util.mapCookiesByName(cookies);
        Map<String, Cookie> defaultCookies = Util.getDefaultCookies();
        Map<String, Integer> filters = new HashMap<>();

        for (Map.Entry<String, Cookie> defaultCookie : defaultCookies.entrySet()) {
            String key = defaultCookie.getKey();
            String defaultValue = defaultCookie.getValue().getValue();
            String cookieValue = (requestCookies.containsKey(key) ? requestCookies.get(key) : defaultCookie.getValue()).getValue();
            Integer filter;

            if ("true".equals(cookieValue)) {
                filter = 1;
            } else {
                if ("false".equals(cookieValue)) {
                    filter = 0;
                } else {
                    try {
                        filter = Integer.parseInt(cookieValue);
                    } catch (NumberFormatException e) {
                        filter = Integer.parseInt(defaultValue);
                    }
                }
            }

            filters.put(key, filter);
        }

        return filters;
    }

    public static Map<String, Cookie> getDefaultCookies() {
        HashMap<String, Cookie> defaultCookies = new HashMap<>();

        // filters
        defaultCookies.put("min_price", new Cookie("min_price", "0"));
        defaultCookies.put("max_price", new Cookie("max_price", "1000000"));

        defaultCookies.put("type_electro", new Cookie("type_electro", "1"));
        defaultCookies.put("type_bass", new Cookie("type_bass", "1"));
        defaultCookies.put("type_semiacoustic", new Cookie("type_semiacoustic", "1"));

        defaultCookies.put("string_number_6", new Cookie("string_number_6", "1"));
        defaultCookies.put("string_number_7", new Cookie("string_number_7", "1"));
        defaultCookies.put("string_number_4", new Cookie("string_number_4", "1"));

        defaultCookies.put("lefthanded", new Cookie("lefthanded", "0"));

        return defaultCookies;
    }

    public static Map<String, Cookie> mapCookiesByName(Cookie[] cookies) {
        final HashMap<String, Cookie> cookiesMap = new HashMap<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookiesMap.put(cookie.getName(), cookie);
            }
        }
        return cookiesMap;
    }
}
