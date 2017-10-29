package edu.etu.web;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Xtail on 23.10.17.
 */
public class Database {
    private final static Map<String, Item> items;

    static {
        items = new HashMap<>();
        Item item;

        item = new Item();
        item.setId("raspberrypi3");
        item.setProduct_name("Raspberry Pi 3");
        item.setUrl("/static/img/microcontrollers/raspberryPi.jpg");
        item.setFrequency(1.2);
        item.setMicrocontroller("Broadcom BCM2837");
        item.setRam_size(1.0);
        item.setRam_type("LPDDR2");
        item.setVendor("Raspberrypi");
        item.setVoltage(5.0);
        item.setPrice(5000);
        items.put(item.getId(), item);

        item = new Item();
        item.setId("raspberrypi2");
        item.setProduct_name("Raspberry Pi 2");
        item.setUrl("/static/img/microcontrollers/raspberryPi.jpg");
        item.setFrequency(1.2);
        item.setMicrocontroller("Broadcom BCM2837");
        item.setRam_size(1.0);
        item.setRam_type("LPDDR2");
        item.setVendor("Raspberrypi");
        item.setVoltage(5.0);
        item.setPrice(5000);
        items.put(item.getId(), item);

        item = new Item();
        item.setId("raspberrypi");
        item.setProduct_name("Raspberry Pi");
        item.setUrl("/static/img/microcontrollers/raspberryPi.jpg");
        item.setFrequency(1.2);
        item.setMicrocontroller("Broadcom BCM2837");
        item.setRam_size(1.0);
        item.setRam_type("LPDDR2");
        item.setVendor("Raspberrypi");
        item.setVoltage(5.0);
        item.setPrice(5000);
        items.put(item.getId(), item);

        item = new Item();
        item.setId("arduinouno");
        item.setProduct_name("Arduino Uno");
        item.setUrl("/static/img/microcontrollers/arduino.jpg");
        item.setFrequency(0.16);
        item.setMicrocontroller("ATmega328p");
        item.setRam_size(0.2);
        item.setRam_type("LDDR2");
        item.setVendor("Arduino");
        item.setVoltage(7.0);
        item.setPrice(500);
        items.put(item.getId(), item);

        item = new Item();
        item.setId("arduinonano");
        item.setProduct_name("Arduino Nano");
        item.setUrl("/static/img/microcontrollers/arduino.jpg");
        item.setFrequency(0.16);
        item.setMicrocontroller("ATmega328p");
        item.setRam_size(0.2);
        item.setRam_type("LDDR2");
        item.setVendor("Arduino");
        item.setVoltage(7.0);
        item.setPrice(500);
        items.put(item.getId(), item);
    }
    public static Map<String, Item> getAllItems(){ return  items; }
}
