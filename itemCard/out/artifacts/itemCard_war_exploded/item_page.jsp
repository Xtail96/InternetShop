<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="edu.etu.web.Util" %>
<%@ page import="edu.etu.web.MockData" %>
<%@ page import="edu.etu.web.ItemPage" %><%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 22.10.17
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final Map<String, Cookie> cookies = Util.cookiesArrayToMap(request.getCookies());
    final Map<String, String[]> params = request.getParameterMap();

    Cookie langCookie;

    if (params.containsKey("langs")){
       langCookie = new Cookie("lang", params.get("lang")[0]);
       response.addCookie(langCookie);
    } else if (!cookies.containsKey("langs")){
        langCookie = Util.DEFAULT_LANG_COOKIE;
        response.addCookie(Util.DEFAULT_LANG_COOKIE);
    } else {
        langCookie = cookies.get("langs");
    }

    Locale locale = new Locale.Builder().setLanguage(langCookie.getValue()).build();

    int itemId = -1;
    if (params.containsKey("id")) {
        try {
            itemId = Integer.parseInt(params.get("id")[0]);
        } catch (NumberFormatException ex) {
            itemId = -1;
        }
    }
    if (itemId >= MockData.itemsCount()) {
        itemId = -1;
    }
    if (itemId < 0) {
        response.sendRedirect("/");
        return;
    }

    ItemPage itemPage = MockData.getItemPage(itemId);

%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8" />

</head>
<body> <!--onload="show_element('product_description', 'description_tab')"-->
<div class='container'>
    <div class='main'>
        <!--<h1>Какой-нибудь магазин</h1>
        <div id='product'>
            <h2 class='product_name'>Product Name</h2>

            <div class='product_tab_menu'>
                <button class='product_tab_menu_link' id='description_tab' onclick="show_element('product_description', 'description_tab')">Описание</button>

                <button class='product_tab_menu_link' id='information_tab' onclick="show_element('product_information', 'information_tab')">Характеристки</button>

                <button class='product_tab_menu_link' id='rewiews_tab' onclick="show_element('product_reviews', 'rewiews_tab')">Отзывы</button>
            </div>

            <div class='tab_content' id='product_description'>
                <p>Какое-то описание товара</p>
            </div>

            <div class='tab_content' id='product_information'>
                <p>Какие-то характеристики</p>
            </div>

            <div class='tab_content' id='product_reviews'>
                <p>Какие-то отзывы</p>
            </div>

        </div>-->
        <%= itemPage.getName()%>
    </div>

</div>
</body>
</html>
