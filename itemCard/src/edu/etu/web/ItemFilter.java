package edu.etu.web;

import java.util.*;

/**
 * Created by Xtail on 29.10.17.
 */
public class ItemFilter {
    private Integer price_low = 0;
    private Integer price_high = 100000;
    private Double frequency_low = 0.0;
    private Double frequency_high = 100.0;
    private List<String> vendors = Arrays.asList("arduino", "raspberrypi");
    //private List<String> vendors = new ArrayList<>();

    public Integer getPrice_low() {
        return price_low;
    }

    public Integer getPrice_high() {
        return price_high;
    }

    public Double getFrequency_low() {
        return frequency_low;
    }

    public Double getFrequency_high() {
        return frequency_high;
    }

    public List<String> getVendors() {
        return vendors;
    }

    public ItemFilter(Map<String, String[]> params) {
        if (params.containsKey("price_low")) {
            for (String s : params.get("price_low")) {
                try {
                    price_low = Integer.parseInt(s);
                } catch (NumberFormatException e) {
                    price_low = 0;
                }
            }
        }

        if (params.containsKey("price_high")) {
            for (String s : params.get("price_high")) {
                try {
                    price_high = Integer.parseInt(s);
                } catch (NumberFormatException e) {
                    price_high = 100000;
                }
            }
        }

        if (params.containsKey("frequency_low")) {
            for (String s : params.get("frequency_low")) {
                try {
                    frequency_low = Double.parseDouble(s);
                } catch (NumberFormatException e) {
                    frequency_low = 0.0;
                }
            }
        }

        if (params.containsKey("frequency_high")) {
            for (String s : params.get("frequency_high")) {
                try {
                    frequency_high = Double.parseDouble(s);
                } catch (NumberFormatException e) {
                    frequency_high = 100.0;
                }
            }
        }

        if (params.containsKey("vendors")) {
            vendors = new ArrayList<>();
            for (String s : params.get("vendors")) {
                switch (s) {
                    case "raspberrypi":
                        vendors.add(s);
                        break;
                    case "arduino":
                        vendors.add(s);
                        break;
                    default:
                        break;
                }
            }
        }
    }

    public Map<String, Item> getFilteredItems() {
        Map<String, Item> items = Database.getAllItems();
        Map<String, Item> filteredItems = new HashMap<>();
        for (Map.Entry<String, Item> itemEntry : items.entrySet()) {
            Item item = itemEntry.getValue();

            if ((item.getPrice() >= price_low) && (item.getPrice() <= price_high) &&
                    (item.getFrequency() >= frequency_low) && (item.getFrequency() <= frequency_high) && vendors.contains(item.getVendor().toLowerCase())) {
                // matching item, add to result
                filteredItems.put(item.getId(), item);
            }
        }

        return filteredItems;
    }

}
