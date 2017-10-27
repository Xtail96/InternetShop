package edu.etu.web;

/**
 * Created by Xtail on 22.10.17.
 */
public class Item {

    private String id;

    private String product_name;

    private String vendor;

    private String microcontroller;

    private Double frequency;

    private Double ram_size;

    private String ram_type;

    private Double voltage;

    private String additional;

    private Integer price;

    private String url;


    public void setProduct_name(String _name)
    {
        product_name = _name;
    }

    public String getProduct_name()
    {
        return product_name;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getMicrocontroller() {
        return microcontroller;
    }

    public void setMicrocontroller(String microcontroller) {
        this.microcontroller = microcontroller;
    }

    public Double getFrequency() {
        return frequency;
    }

    public void setFrequency(Double frequency) {
        this.frequency = frequency;
    }

    public Double getRam_size() {
        return ram_size;
    }

    public void setRam_size(Double ram_size) {
        this.ram_size = ram_size;
    }

    public String getRam_type() {
        return ram_type;
    }

    public void setRam_type(String ram_type) {
        this.ram_type = ram_type;
    }

    public Double getVoltage() {
        return voltage;
    }

    public void setVoltage(Double voltage) {
        this.voltage = voltage;
    }

    public String getAdditional() {
        return additional;
    }

    public void setAdditional(String additional) {
        this.additional = additional;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
