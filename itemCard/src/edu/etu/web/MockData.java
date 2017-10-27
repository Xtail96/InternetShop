package edu.etu.web;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by Xtail on 22.10.17.
 */
public class MockData {

    private final static List<Item> itemsPages;

    static {
        itemsPages = new ArrayList<>();

        Item item;

        item = new Item();
        item.setProduct_name("Name1");
        itemsPages.add(item);


        item = new Item();
        item.setProduct_name("Name2");
        itemsPages.add(item);
    }

    public static int itemsCount() {
        return itemsPages.size();
    }

    public static Item getItemPage(int index) {
        return itemsPages.get(index);
    }
}
