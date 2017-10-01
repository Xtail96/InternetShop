package edu.etu.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Xtail on 01.10.17.
 */
public class ItemCard extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String value = getInitParameter("activeTab");

        out.println(getPageContent(value));
        out.close();
    }

    private String getPageContent(String activeTab) {
        String tab_id = activeTab;
        String content_id = getContentId(tab_id);
        String meta = getMeta();
        String styles = getStyles();
        String scripts = getScripts();
        String head = "<html>" + "<head>" + meta + styles + scripts + "</head>";
        String body  = getBody(content_id, tab_id);
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
                ".container .navigation .language_menu button{background-color: #fff;color: #333;border: 1px solid #dfdfdf;border-radius: 3px;}\n" +
                ".container .navigation .language_menu button:hover{background-color: #eee;color: #333;}\n" +
                ".container .navigation .language_menu button:active{background-color: #dfdfdf;color: #333;}\n" +
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

    private String getBody(String content_id, String tab_id){
        String body = "<body onload=\"show_element('" + content_id + "', '" + tab_id + "')\">" +
                getContainer() +
                "</body>";
        return body;
    }

    private String getContainer(){
        String container = "<div class=\"container\">" +
                getNavigation() +
                getMain() +
                "</container>";
        return container;
    }

    private String getNavigation(){
        String navigation = "<div class=\"navigation\"><div class=\"language_menu\">\n" +
                "        <button>Ru</button>\n" +
                "        <button>En</button>\n" +
                "        <button>Jp</button></div></div>";
        return navigation;
    }

    private String getMain(){
        String mainContent = "<div class=\"main\">" +
                getProductName() +
                getProduct() + "</div>";
        return mainContent;
    }

    private String getProductName(){
        String productName = "<h1>Product Name</h1>";
        return  productName;
    }

    private String getProduct() {
        String product = "<div id='product'>" +
                getProductHeader() +
                getProductTabsHeaders() +
                getProductDescription() +
                getProductInformation() +
                getProductRewiews() + "</div>";
        return product;
    }

    private String getProductHeader(){
        String productHeader = "<div class=\"product_header\">\n" +
                "            <img src=\"img/decor/2.png\" alt=\"Картинка товара\" />\n" +
                "            <div class=\"product_price\">\n" +
                "              <b>Цена: 1000р</b>\n" +
                "              <p>Идейные соображения высшего порядка, а также консультация с широким активом позволяет выполнять важные задания по разработке существенных финансовых и административных условий. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют определения и уточнения систем массового участия.</p>\n" +
                "              <button>В корзину</button></div></div>";
        return productHeader;
    }

    private String getProductTabsHeaders(){
        String productTabsHeaders = "<div class=\"product_tab_menu\">\n" +
                "          <button class=\"product_tab_menu_link\" id='description_tab' onclick=\"show_element('product_description', 'description_tab')\">Описание</button>\n" +
                "          <button class=\"product_tab_menu_link\" id='information_tab' onclick=\"show_element('product_information', 'information_tab')\">Характеристки</button>\n" +
                "          <button class=\"product_tab_menu_link\" id='rewiews_tab' onclick=\"show_element('product_reviews', 'rewiews_tab')\">Отзывы</button></div>";
        return productTabsHeaders;
    }

    private String getProductDescription(){
        String productDescription = "<div class=\"tab_content\" id='product_description'>\n" +
                "          <p>Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Повседневная практика показывает, что новая модель организационной деятельности в значительной степени обуславливает создание модели развития. Значимость этих проблем настолько очевидна, что сложившаяся структура организации позволяет оценить значение дальнейших направлений развития. </p></div>";
        return productDescription;
    }

    private String getProductInformation(){
        String productInformation = "<div class=\"tab_content\" id='product_information'>\n" +
                "          <p>С другой стороны укрепление и развитие структуры позволяет выполнять важные задания по разработке систем массового участия. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий влечет за собой процесс внедрения и модернизации систем массового участия. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий требуют определения и уточнения систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития.</p></div>";
        return productInformation;
    }

    private  String getProductRewiews(){
        String productRewiews = "<div class=\"tab_content\" id='product_reviews'>\n" +
                "          <p>Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения форм развития. Повседневная практика показывает, что консультация с широким активом влечет за собой процесс внедрения и модернизации новых предложений. Равным образом дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки модели развития. Не следует, однако забывать, что дальнейшее развитие различных форм деятельности требуют определения и уточнения существенных финансовых и административных условий.</p></div>";
        return productRewiews;
    }
}