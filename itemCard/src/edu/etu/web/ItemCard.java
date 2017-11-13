package edu.etu.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.xml.crypto.Data;
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
        final Map<String, Cookie> cookieMap = Util.mapCookiesByName(request.getCookies());

        String language = "undefined";
        if(!params.containsKey("lang"))
        {
            if(cookieMap.containsKey("lang"))
            {
                language = cookieMap.get("lang").getValue();
            }
            else {
                language = "ru";
            }
        } else {
            language = params.get("lang")[0];
        }
        Cookie cookie = new Cookie("lang", language);
        response.addCookie(cookie);

        String item_id = params.getOrDefault("id", new String[]{null})[0];
        Item item = Database.getAllItems().get(item_id);
        Locale locale = new Locale.Builder().setLanguage(language).build();

        ResourceBundle storeResources = ResourceBundle.getBundle("strings", locale);
        ResourceBundle itemResources = ResourceBundle.getBundle(item.getId(), locale);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String meta = getMeta();
        String styles = "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/static/css/styles.css\">" + getStyles();
        String scripts = getScripts(item_id);
        String head = "<!DOCTYPE html> <html>" + "<head>" + meta + styles + scripts + "</head> <body onload=\"show_element('"+ getServletContext().getInitParameter("activeContainer") +"', '" + getServletContext().getInitParameter("activeTab") + "')\">";
        out.print(head);
        request.getRequestDispatcher("/navigation.jsp").include(request, response);

        String body = getContainer(request, item, language, storeResources, itemResources);
        out.print(body);

        request.getRequestDispatcher("/footer.jsp").include(request, response);

        String endOfPage = "</body></html>";
        out.print(endOfPage);

        out.close();
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
        String meta = "<meta charset=\"utf-8\" /><title>Интернет магазин</title>";
        return  meta;
    }

    private String getStyles(){
        String styles = "<style type=\"text/css\">" +
                ".container h1{text-align:left} \n" +
                ".container .main .product_header{max-height: 700px; padding: 25px; margin-bottom: 25px;}\n" +
                ".container .main .product_header img{max-width: 50%; max-height: 500px; height: auto; width: auto;}\n" +
                ".container .main .product_header .product_price{float: right; width: 35%; font-size: 150%; border-radius: 5px; padding: 25px; text-align: center; background-color: #eee;}\n" +
                ".container .main .product_price button{background-color: #007769;color: #fff;border: 1px solid transparent;border-radius: 5px;padding: 10px;font-size: 150%;text-align: center;width: 70%;}\n" +
                ".container .main .product_price button:hover{background-color: #48a697;}\n" +
                ".container .main .product_price button:active{background-color: #004a3f;}\n" +
                ".container .main .product_tab_menu{padding-left: 5px;overflow: hidden;background-color: #fff;border-top-left-radius: 10px;border-top-right-radius: 10px;}\n" +
                ".container .main .product_tab_menu button{float: left;outline: none;cursor: pointer;padding: 10px;border: 1px solid #eee;border-bottom: none;border-top-left-radius: 5px;border-top-right-radius: 5px;font-size: 100%;margin-right: 5px;}\n" +
                ".container .main .product_tab_menu button:hover{text-decoration: underline;}\n" +
                ".container .main .product_tab_menu .product_tab_menu_link{background-color: #eee;}\n" +
                ".container .main .product_tab_menu .product_tab_menu_link_active{background-color: #fff;}\n" +
                ".container .main .tab_content{display: none;height: auto;padding: 5px 15px;border: 1px solid #dfdfdf;background-color: #fff;margin-top: -1px;font-size: 150%;}\n" +
                ".container .main .tab_content ul{font-size: 100%;list-style: none;padding-right: 50px;}\n" +
                ".container .main .tab_content ul li{border-bottom: 1px solid #dfdfdf;}\n" +
                ".container .main .tab_content .rewiews_list li{border: 1px solid transparent;border-radius: 10px;background-color: #eee;padding: 25px;margin-top: 25px;}\n" +
                "</style>";
        return styles;
    }

    private String getScripts(String item_id){
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
                "function changeLanguage(lang) {\n" +
                "    href = \"/item?id=" + item_id + "&lang=\" + lang;\n" +
                "    window.location.href = href; \n" +
                "}\n" +
                "  </script>";
        return scripts;
    }

    private String getContainer(HttpServletRequest request, Item item, String lang, ResourceBundle storeResources, ResourceBundle itemResources){
        String container = "<div class=\"container\">" +
                getMain(request, item, lang, storeResources, itemResources) +
                "</container>";
        return container;
    }

    private String getMain(HttpServletRequest request, Item item, String lang, ResourceBundle storeResources, ResourceBundle itemResources){
        String price = item.getPrice().toString();
        String frequency = item.getFrequency().toString();
        String ram_size = item.getRam_size().toString();
        String ram_type = item.getRam_type();
        String vendor = item.getVendor();
        String voltage = item.getVoltage().toString();

        String mainContent = "<div class=\"main\">" +
                "<h1>" + itemResources.getString("name") + "</h1>" +
                "<div id='product'>" +
                "<div class=\"product_header\">\n" +
                "            <img src=\"" + request.getContextPath() + "/static/img/microcontrollers/" + itemResources.getString("img_name") +"\" alt=\"Картинка товара\" />\n" +
                "            <div class=\"product_price\">\n" +
                "              <b>" + itemResources.getString("price") + price + "</b>\n <br />" +
                "              <button onclick=\"window.location.href='/cart.jsp?add=" + item.getId() + "&lang=" + lang + "'\">" + storeResources.getString("to_cart") + "</button></div></div>" +
                "<div class=\"product_tab_menu\">\n" +
                "          <button class=\"product_tab_menu_link\" id='description_tab' onclick=\"show_element('product_description', 'description_tab')\">" + itemResources.getString("description_tab_header") + "</button>\n" +
                "          <button class=\"product_tab_menu_link\" id='information_tab' onclick=\"show_element('product_information', 'information_tab')\">" + itemResources.getString("information_tab_header") + "</button>\n" +
                "          <button class=\"product_tab_menu_link\" id='rewiews_tab' onclick=\"show_element('product_reviews', 'rewiews_tab')\">" + itemResources.getString("reviews_tab_header") + "</button></div>" +
                "<div class=\"tab_content\" id='product_description'>\n" +
                "          <p>" + itemResources.getString("description_content") + "</p></div>" +
                "<div class=\"tab_content\" id='product_information'>\n" +
                "          <ul>\n" +
                "                <li>" + itemResources.getString("vendor") + " " + vendor + "</li>\n" +
                "                <li>" + itemResources.getString("frequency") + " " + frequency + "</li>\n" +
                "                <li>" + itemResources.getString("ram") + " " + ram_size + " " + ram_type + "</li>\n" +
                "                <li>" + itemResources.getString("voltage") + " " + voltage + "</li>\n" +
                "           </ul></div>" +
                "<div class=\"tab_content\" id='product_reviews'>\n" +
                "          <ul class=\"rewiews_list\">\n" +
                "                <li>\n" +
                "                    <h4>" + itemResources.getString("reviews_tab_review1_name") + "</h4>\n" +
                "                    <b>" + itemResources.getString("reviews_tab_review1_rate") + "</b>\n" +
                "                    <p>"+ itemResources.getString("reviews_tab_review1_content") + "</p>\n" +
                "                </li>\n" +
                "                <li>\n" +
                "                    <h4>" + itemResources.getString("reviews_tab_review2_name") + "</h4>\n" +
                "                    <b>" + itemResources.getString("reviews_tab_review2_rate") + "</b>\n" +
                "                    <p>"+ itemResources.getString("reviews_tab_review2_content") + "</p>\n" +
                "                </li>\n" +
                "                <li>\n" +
                "                    <h4>" + itemResources.getString("reviews_tab_review3_name") + "</h4>\n" +
                "                    <b>" + itemResources.getString("reviews_tab_review3_rate") + "</b>\n" +
                "                    <p>"+ itemResources.getString("reviews_tab_review3_content") + "</p>\n" +
                "                </li>\n" +
                "            </ul></div></div>" +
                "</div>";
        return mainContent;
    }
}