package edu.etu.web;

import javax.servlet.Filter;
import javax.servlet.http.Cookie;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Xtail on 22.10.17.
 */
public class Util {
    /*public static Map<String, Integer> parseCookies(Cookie[] cookies) {
        Map<String, Cookie> requestCookies = Util.mapCookiesByName(cookies);
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
    }*/

    public static Map<String, Cookie> mapCookiesByName(Cookie[] cookies) {
        final HashMap<String, Cookie> cookiesMap = new HashMap<>();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookiesMap.put(cookie.getName(), cookie);
            }
        }
        return cookiesMap;
    }

    public static Map<String, Cookie> cookiesFromFilters(ItemFilter filter) {
        final HashMap<String, Cookie> cookieHashMap = new HashMap<>();

        final Integer cookieTime = 300;

        cookieHashMap.put("price_low", new Cookie("price_low", filter.getPrice_low().toString()));
        cookieHashMap.put("price_high", new Cookie("price_high", filter.getPrice_high().toString()));
        cookieHashMap.put("frequency_low", new Cookie("frequency_low", filter.getFrequency_low().toString()));
        cookieHashMap.put("frequency_high", new Cookie("frequency_high", filter.getFrequency_high().toString()));

        List<String> vendors = filter.getVendors();
        Boolean isRaspberrypi = vendors.contains("raspberrypi");
        Boolean isArduino = vendors.contains("arduino");

        cookieHashMap.put("vendor_raspberrypi", new Cookie("vendor_raspberrypi", isRaspberrypi.toString()));
        cookieHashMap.put("vendor_arduino", new Cookie("vendor_arduino", isArduino.toString()));

        for (Map.Entry<String, Cookie> entry : cookieHashMap.entrySet()) {
            entry.getValue().setMaxAge(cookieTime);
        }

        return  cookieHashMap;
    }


}
