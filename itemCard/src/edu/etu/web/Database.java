package edu.etu.web;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Xtail on 23.10.17.
 */
public class Database implements Serializable {

    private static Map<String, Item> items = new HashMap<>();

    public static void addItem(Item item) {
        items.put(item.getId(), item);
    }

    public static Map<String, Item> getAllItems(){ return  items; }
}
