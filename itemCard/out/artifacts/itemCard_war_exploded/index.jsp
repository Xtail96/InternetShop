<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Map" %>
<%@ page import="edu.etu.web.Item" %>
<%@ page import="edu.etu.web.Database" %>
<%@ page import="edu.etu.web.Util" %><%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 22.10.17
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final Map<String, String[]> params = request.getParameterMap();

    String lang = "";
    if(!params.containsKey("lang")) {
        lang = "ru";
    } else {
        lang = params.get("lang")[0];
    }

    Map<String, Integer> itemFilter = Util.parseCookies(request.getCookies());
    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle shopResources = ResourceBundle.getBundle("strings", locale);
%>
<html>
<head>
    <title>Store Name</title>
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">
</head>
<body>
    <div class="container">
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="main">
            <div class="right">
                <div class="filter-form">
                    <%@include file="filter_form.jsp"%>
                </div>
            </div>

            <div class="left">

                <div class="items_container">
                    <%
                        for(Map.Entry<String, Item> itemPageEntry : Database.filteredItems(itemFilter).entrySet()) {
                            Item item = itemPageEntry.getValue();
                            String item_id = item.getId();
                            int productPrice = item.getPrice();
                            String product_name = item.getProduct_name();
                            String url = item.getUrl();
                            Double frequency = item.getFrequency();
                            String ram_type = item.getRam_type();
                            Double ram_size = item.getRam_size();
                    %>
                            <%@include file="list_item.jsp"%>
                    <%
                        }
                    %>
                </div>
            </div>

        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
