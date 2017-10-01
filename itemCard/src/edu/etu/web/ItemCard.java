package edu.etu.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

/**
 * Created by Xtail on 01.10.17.
 */
public class ItemCard extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        final Map<String, String[]> params = request.getParameterMap();

        Cookie langCookie = null;
        if(params.containsKey("lang"))
        {
            langCookie = new Cookie("lang", params.get("lang")[0]);
        } else {
            langCookie = new Cookie("lang", "ru");
        }
        response.addCookie(langCookie);

        Locale locale = new Locale.Builder().setLanguage(langCookie.getValue()).build();
        ResourceBundle resources = ResourceBundle.getBundle("strings", locale);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String value = getInitParameter("activeTab");

        out.println(getPageContent(value, resources));
        out.close();
    }

    private String getPageContent(String activeTab, ResourceBundle resources) {
        String tab_id = activeTab;
        String content_id = getContentId(tab_id);
        String meta = getMeta();
        String styles = getStyles();
        String scripts = getScripts();
        String head = "<html>" + "<head>" + meta + styles + scripts + "</head>";
        String body  = getBody(content_id, tab_id, resources);
        String html = head + body;
        return html;
    }

    private String getContentId(String tab_id) {
        String content_id = "Unknown";
        if(tab_id.equalsIgnoreCase("description_tab"))
        {
            content_id = "product_description";
        }
        else
        {
            if(tab_id.equalsIgnoreCase("information_tab"))
            {
                content_id = "product_information";
            }
            else
            {
                if(tab_id.equalsIgnoreCase("rewiews_tab"))
                {
                    content_id = "product_reviews";
                }
            }
        }
        return  content_id;
    }

    private String getMeta() {
        String meta = "<meta charset=\"utf-8\" />";
        return  meta;
    }

    private String getStyles(){
        String styles = "<style type=\"text/css\">" +
                ".container{margin-bottom: 50px; max-width: 1920px; min-width: 1366px; margin-left: auto; margin-right: auto;}\n" +
                ".main{width: 90%; margin-left: auto; margin-right: auto; margin-top: 5%; background-color: #fff; padding: 5px;}\n" +
                ".container .main h1{text-align:left; font-size: 250%;}\n" +
                ".container .main .product_header{max-height: 700px; padding: 25px; margin-bottom: 25px;}\n" +
                ".container .main .product_header img{max-width: 50%; max-height: 500px; height: auto; width: auto;}\n" +
                ".container .main .product_header .product_price{float: right; width: 35%; font-size: 150%; border-radius: 5px; padding: 25px; text-align: center; background-color: #eee;}\n" +
                ".container .main .product_price button{background-color: #a52a2a;color: #fff;border: 1px solid transparent;border-radius: 5px;padding: 10px;font-size: 150%;text-align: center;width: 70%;}\n" +
                ".container .main .product_price button:hover{background-color: #fa8072;}\n" +
                ".container .main .product_price button:active{background-color: #a52a2a;}\n" +
                ".container .main .product_tab_menu{padding-left: 5px;overflow: hidden;background-color: #fff;border-top-left-radius: 10px;border-top-right-radius: 10px;}\n" +
                ".container .main .product_tab_menu button{float: left;outline: none;cursor: pointer;padding: 10px;border: 1px solid #eee;border-bottom: none;border-top-left-radius: 5px;border-top-right-radius: 5px;font-size: 100%;padding-right: 5px;}\n" +
                ".container .main .product_tab_menu button:hover{text-decoration: underline;}\n" +
                ".container .main .product_tab_menu .product_tab_menu_link{background-color: #eee;}\n" +
                ".container .main .product_tab_menu .product_tab_menu_link_active{background-color: #fff;}\n" +
                ".container .main .tab_content{display: none;height: auto;padding: 5px 15px;border: 1px solid #dfdfdf;background-color: #fff;margin-top: -3px;font-size: 150%;}\n" +
                ".container .navigation{height: 5%;}\n" +
                ".container .navigation .language_menu{float: right;height: 100%;}\n" +
                ".container .navigation .language_menu a{background-color: #fff;color: #333;border: 1px solid #dfdfdf;border-radius: 3px;padding: 5px;text-decoration: none;}\n" +
                ".container .navigation .language_menu a:hover{background-color: #eee;color: #333;}\n" +
                ".container .navigation .language_menu a:active{background-color: #dfdfdf;color: #333;}\n" +
                "</style>";
        return styles;
    }

    private String getScripts(){
        String scripts = "<script type=\"text/javascript\">\n" +
                "    function hide_all(){var to_hide = document.getElementsByClassName('tab_content');\n" +
                "      for(var i = 0; i < to_hide.length; i++){\n" +
                "        to_hide[i].style.display = 'none';\n" +
                "      }\n" +
                "      var tabsContainer = document.getElementsByClassName('product_tab_menu');\n" +
                "      for(var i = 0; i < tabsContainer.length; i++){\n" +
                "        var tabs = tabsContainer[i].getElementsByTagName('button');\n" +
                "        for(var j = 0; j< tabs.length; j++){\n" +
                "            tabs[j].className = 'product_tab_menu_link';\n" +
                "        }\n" +
                "      }\n" +
                "    }\n" +
                "\n" +
                "    function show_element(element, tab){\n" +
                "      hide_all();\n" +
                "      document.getElementById(element).style.display = 'block';\n" +
                "      \n" +
                "      var tab_name = document.getElementById(tab);\n" +
                "      tab_name.className = 'product_tab_menu_link_active';\n" +
                "    }\n" +
                "  </script>";
        return scripts;
    }

    private String getBody(String content_id, String tab_id, ResourceBundle resources){
        String body = "<body onload=\"show_element('" + content_id + "', '" + tab_id + "')\">" +
                getContainer(resources) +
                "</body>";
        return body;
    }

    private String getContainer(ResourceBundle resources){
        String container = "<div class=\"container\">" +
                getNavigation() +
                getMain(resources) +
                "</container>";
        return container;
    }

    private String getNavigation(){
        String navigation = "<div class=\"navigation\"><div class=\"language_menu\">\n" +
                "        <a href=\"?lang=ru\" title=\"Русская версия страницы\">Ru</a>\n" +
                "        <a href=\"?lang=en\" title=\"English version\">En</a>\n" +
                "        <a href=\"?lang=ru\" title=\"Русская версия страницы\">Jp</a></div></div>";
        return navigation;
    }

    private String getMain(ResourceBundle resources){
        String mainContent = "<div class=\"main\">" +
                getProductName(resources) +
                getProduct(resources) + "</div>";
        return mainContent;
    }

    private String getProductName(ResourceBundle resources){
        String productName = resources.getString("product_name");
        String productHeader = "<h1>" + productName + "</h1>";
        return  productHeader;
    }

    private String getProduct(ResourceBundle resources) {
        String product = "<div id='product'>" +
                getProductHeader(resources) +
                getProductTabsHeaders(resources) +
                getProductDescription(resources) +
                getProductInformation(resources) +
                getProductRewiews(resources) + "</div>";
        return product;
    }

    private String getProductHeader(ResourceBundle resources){
        String productPrice = resources.getString("product_price");
        String productShortDescription = resources.getString("product_short_description");
        String toCart = resources.getString("to_cart");
        String productHeader = "<div class=\"product_header\">\n" +
                "            <img src=\"https://s199f.storage.yandex.net/rdisk/855451bbb49d382d48629e06945257a2c842dbd50d0014bd21af5048bd25b19a/59d18b96/WonbNbs60kDoqDWsBC6cYYSQuQhgzXuWmI7IUNjBg8qBFSwacwSFmG6p8GawtGC67PjWnsLTgXGGO3F3u_zZlw==?uid=0&filename=2.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&fsize=707492&hid=e961642f6ea3731978e46ddf197bfb63&media_type=image&tknv=v2&etag=e23e1954bba72a71e6087c87cf082c2a&rtoken=oalE6NII3KTB&force_default=no&ycrid=na-9495da2d654dcb77bf9ffbca0af8be3e-downloader17h&ts=55a85a8299180&s=5c232135116b0d3ae9ad9cbc2dd1ba91344882ea696e9585c1f66fa7618c3799&pb=U2FsdGVkX1_iNz5yWibjmWZ5q6BFqKyvSSYGlKo1TImZ7DWixR89xM5xJByPS0nVnEuuVX7BWw3PNTBS3NGQR9H1idNCpL92q-kvK9qtQzU=\" alt=\"Картинка товара\" />\n" +
                "            <div class=\"product_price\">\n" +
                "              <b>" + productPrice + "</b>\n" +
                "              <p>" + productShortDescription + "</p>\n" +
                "              <button>" + toCart + "</button></div></div>";
        return productHeader;
    }

    private String getProductTabsHeaders(ResourceBundle resources){

        String descriptionTabHeader = resources.getString("description_tab_header");
        String informationTabHeader = resources.getString("information_tab_header");
        String rewiewsTabHeader = resources.getString("rewiews_tab_header");

        String productTabsHeaders = "<div class=\"product_tab_menu\">\n" +
                "          <button class=\"product_tab_menu_link\" id='description_tab' onclick=\"show_element('product_description', 'description_tab')\">" + descriptionTabHeader + "</button>\n" +
                "          <button class=\"product_tab_menu_link\" id='information_tab' onclick=\"show_element('product_information', 'information_tab')\">" + informationTabHeader + "</button>\n" +
                "          <button class=\"product_tab_menu_link\" id='rewiews_tab' onclick=\"show_element('product_reviews', 'rewiews_tab')\">" + rewiewsTabHeader + "</button></div>";
        return productTabsHeaders;
    }

    private String getProductDescription(ResourceBundle resources){
        String descriptionTabContent = resources.getString("description_tab_content");
        String productDescription = "<div class=\"tab_content\" id='product_description'>\n" +
                "          <p>" + descriptionTabContent + "</p></div>";
        return productDescription;
    }

    private String getProductInformation(ResourceBundle resources){
        String informationTabContent = resources.getString("information_tab_content");
        String productInformation = "<div class=\"tab_content\" id='product_information'>\n" +
                "          <p>" + informationTabContent + "</p></div>";
        return productInformation;
    }

    private  String getProductRewiews(ResourceBundle resources){
        String rewiewstabContent = resources.getString("rewiews_tab_content");
        String productRewiews = "<div class=\"tab_content\" id='product_reviews'>\n" +
                "          <p>" + rewiewstabContent + "</p></div>";
        return productRewiews;
    }
}