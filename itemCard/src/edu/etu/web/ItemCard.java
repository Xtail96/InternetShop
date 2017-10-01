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

    private String getPageContent(String value) {
        String button_id = "product_description";
        if(value.equalsIgnoreCase("description_tab"))
        {
            button_id = "product_description";
        }
        else
        {
            if(value.equalsIgnoreCase("information_tab"))
            {
                button_id = "product_information";
            }
            else
            {
                if(value.equalsIgnoreCase("rewiews_tab"))
                {
                    button_id = "product_reviews";
                }
            }
        }

        String html = "<html>\n" +
                    "<head>\n" +
                    "  <meta charset=\"utf-8\" />\n" +
                    "  <style type=\"text/css\">\n" +
                    "\n" +
                    "    .container{\n" +
                    "      margin-bottom: 50px;\n" +
                    "      max-width: 1920px;\n" +
                    "      min-width: 1366px;\n" +
                    "      margin-left: auto;\n" +
                    "      margin-right: auto;\n" +
                    "    }\n" +
                    "\n" +
                    "    .main{\n" +
                    "      width: 90%;\n" +
                    "      margin-left: auto;\n" +
                    "      margin-right: auto;\n" +
                    "      margin-top: 5%;\n" +
                    "      background-color: #fff;\n" +
                    "      padding: 5px;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main h1{\n" +
                    "      text-align:left;\n" +
                    "      font-size: 250%;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_header{\n" +
                    "      max-height: 700px;\n" +
                    "      padding: 25px;\n" +
                    "      margin-bottom: 25px;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_header img{\n" +
                    "      max-width: 50%;\n" +
                    "      max-height: 500px;\n" +
                    "      height: auto;\n" +
                    "      width: auto;\n" +
                    "    }\n" +
                    "\n" +
                    "\n" +
                    "    .container .main .product_header .product_price{\n" +
                    "      float: right;\n" +
                    "      width: 35%;\n" +
                    "      font-size: 150%;\n" +
                    "      border-radius: 5px;\n" +
                    "      padding: 25px;\n" +
                    "      text-align: center;\n" +
                    "      background-color: #eee;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_price button{\n" +
                    "      background-color: #a52a2a;\n" +
                    "      color: #fff;\n" +
                    "      border: 1px solid transparent;\n" +
                    "      border-radius: 5px;\n" +
                    "      padding: 10px;\n" +
                    "      font-size: 150%;\n" +
                    "      text-align: center;\n" +
                    "      width: 70%;\n" +
                    "    }\n" +
                    "    .container .main .product_price button:hover{\n" +
                    "      background-color: #fa8072;\n" +
                    "    }\n" +
                    "    .container .main .product_price button:active{\n" +
                    "      background-color: #a52a2a;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_tab_menu{\n" +
                    "      padding-left: 5px;\n" +
                    "      overflow: hidden;\n" +
                    "      background-color: #fff;\n" +
                    "      border-top-left-radius: 10px; \n" +
                    "      border-top-right-radius: 10px;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_tab_menu button{\n" +
                    "      float: left;\n" +
                    "      outline: none;\n" +
                    "      cursor: pointer;\n" +
                    "      padding: 10px;\n" +
                    "      border: 1px solid #eee;\n" +
                    "      border-bottom: none;\n" +
                    "      border-top-left-radius: 5px;\n" +
                    "      border-top-right-radius: 5px;\n" +
                    "      font-size: 100%;\n" +
                    "      padding-right: 5px;\n" +
                    "    }\n" +
                    "\n" +
                    "    \n" +
                    "    .container .main .product_tab_menu button:hover{\n" +
                    "      text-decoration: underline;\n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_tab_menu .product_tab_menu_link\n" +
                    "    {\n" +
                    "      background-color: #eee;   \n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .product_tab_menu .product_tab_menu_link_active\n" +
                    "    {\n" +
                    "      background-color: #fff;   \n" +
                    "    }\n" +
                    "\n" +
                    "    .container .main .tab_content{\n" +
                    "      display: none;\n" +
                    "      height: auto;\n" +
                    "      padding: 5px 15px;\n" +
                    "      border: 1px solid #dfdfdf; \n" +
                    "      background-color: #fff;\n" +
                    "      margin-top: -3px;\n" +
                    "      font-size: 150%;\n" +
                    "    }\n" +
                    "  </style>\n" +
                    "\n" +
                    "  <script type=\"text/javascript\">\n" +
                    "    function hide_all()\n" +
                    "    {\n" +
                    "      var to_hide = document.getElementsByClassName('tab_content');\n" +
                    "      for(var i = 0; i < to_hide.length; i++)\n" +
                    "      {\n" +
                    "        to_hide[i].style.display = 'none';\n" +
                    "      }\n" +
                    "\n" +
                    "      var tabsContainer = document.getElementsByClassName('product_tab_menu');\n" +
                    "      for(var i = 0; i < tabsContainer.length; i++)\n" +
                    "      {\n" +
                    "        var tabs = tabsContainer[i].getElementsByTagName('button');\n" +
                    "        for(var j = 0; j< tabs.length; j++)\n" +
                    "        {\n" +
                    "            tabs[j].className = 'product_tab_menu_link';\n" +
                    "        }\n" +
                    "      }    \n" +
                    "    }\n" +
                    "\n" +
                    "    function show_element(element, tab)\n" +
                    "    {\n" +
                    "      hide_all();\n" +
                    "      document.getElementById(element).style.display = 'block';\n" +
                    "      \n" +
                    "      var tab_name = document.getElementById(tab);\n" +
                    "      tab_name.className = 'product_tab_menu_link_active';\n" +
                    "    }\n" +
                    "  </script>\n" +
                    "\n" +
                    "</head>\n" +
                    "<body onload=\"show_element('product_description', 'description_tab')\">\n" +
                    "  <div class=\"container\">\n" +
                    "    <div class=\"main\">\n" +
                    "      <h1>Product Name</h1>\n" + button_id + value +
                    "      <div id='product'>\n" +
                    "        <div class=\"product_header\">\n" +
                    "            <img src=\"img/decor/2.png\" alt=\"Картинка товара\" />\n" +
                    "            <div class=\"product_price\">\n" +
                    "              <b>Цена: 1000р</b>\n" +
                    "              <p>Идейные соображения высшего порядка, а также консультация с широким активом позволяет выполнять важные задания по разработке существенных финансовых и административных условий. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют определения и уточнения систем массового участия.</p>\n" +
                    "              <button>В корзину</button>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"product_tab_menu\">\n" +
                    "          <button class=\"product_tab_menu_link\" id='description_tab' onclick=\"show_element('product_description', 'description_tab')\">Описание</button>\n" +
                    "\n" +
                    "          <button class=\"product_tab_menu_link\" id='information_tab' onclick=\"show_element('product_information', 'information_tab')\">Характеристки</button>\n" +
                    "\n" +
                    "          <button class=\"product_tab_menu_link\" id='rewiews_tab' onclick=\"show_element('product_reviews', 'rewiews_tab')\">Отзывы</button>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"tab_content\" id='product_description'>\n" +
                    "          <p>Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Повседневная практика показывает, что новая модель организационной деятельности в значительной степени обуславливает создание модели развития. Значимость этих проблем настолько очевидна, что сложившаяся структура организации позволяет оценить значение дальнейших направлений развития. </p>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"tab_content\" id='product_information'>\n" +
                    "          <p>С другой стороны укрепление и развитие структуры позволяет выполнять важные задания по разработке систем массового участия. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий влечет за собой процесс внедрения и модернизации систем массового участия. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий требуют определения и уточнения систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития. </p>\n" +
                    "        </div>\n" +
                    "\n" +
                    "        <div class=\"tab_content\" id='product_reviews'>\n" +
                    "          <p>Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения форм развития. Повседневная практика показывает, что консультация с широким активом влечет за собой процесс внедрения и модернизации новых предложений. Равным образом дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки модели развития. Не следует, однако забывать, что дальнейшее развитие различных форм деятельности требуют определения и уточнения существенных финансовых и административных условий. </p>\n" +
                    "        </div>\n" +
                    "\n" +
                    "      </div>\n" +
                    "    </div>\n" +
                    "  </div>\n" +
                    "</body>\n" +
                    "</html>\n";
        return html;
    }
}