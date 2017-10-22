package edu.etu.web;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by Xtail on 22.10.17.
 */
public class MockData {

    private final static List<ItemPage> itemsPages;

    static {
        itemsPages = new ArrayList<>();

        ItemPage itemPage;

        itemPage = new ItemPage();
        itemPage.setName("Name1");
        itemsPages.add(itemPage);


        itemPage = new ItemPage();
        itemPage.setName("Name2");
        itemsPages.add(itemPage);
    }

    public static int itemsCount() {
        return itemsPages.size();
    }

    public static ItemPage getItemPage(int index) {
        return itemsPages.get(index);
    }
}
