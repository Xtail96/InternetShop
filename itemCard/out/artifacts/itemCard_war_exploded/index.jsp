<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Map" %>
<%@ page import="edu.etu.web.Item" %>
<%@ page import="edu.etu.web.Database" %>
<%@ page import="edu.etu.web.Util" %>
<%@ page import="edu.etu.web.ItemFilter" %><%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 22.10.17
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final Cookie DEFAULT_MIN_PRICE_COOKIE = new Cookie("min_price", "0");
    final Cookie DEFAULT_MAX_PRICE_COOKIE = new Cookie("max_price", "100000");

    final Cookie DEFAULT_MIN_FREQUENCY_COOKIE = new Cookie("min_frequency", "0");
    final Cookie DEFAULT_MAX_FREQUENCY_COOKIE = new Cookie("max_frequency", "100");

    final Cookie DEFAULT_RASPBERRYPI_COOKIE = new Cookie("vendor_raspberrypi", "true");
    final Cookie DEFAULT_ARDUINO_COOKIE = new Cookie("vendor_arduino", "true");

    final Map<String, String[]> params = request.getParameterMap();
    final Map<String, Cookie> cookies = Util.mapCookiesByName(request.getCookies());

    String lang = "";
    if(!params.containsKey("lang")) {
        lang = "ru";
    } else {
        lang = params.get("lang")[0];
    }

    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle shopResources = ResourceBundle.getBundle("strings", locale);

    ItemFilter filter = new ItemFilter(params);
%>
<html>
<head>
    <title>Store Name</title>
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

    <script type="text/javascript">
        function changeLanguage(lang) {
            window.location.href = "?lang=" + lang;
        }

        function applyFilters() {
            if (document.getElementById("vendor_raspberrypi").checked) {
                document.getElementById("vendor_raspberrypi").disabled = true
            }
            if (document.getElementById("vendor_arduino").checked) {
                document.getElementById("vendor_arduino").disabled = true
            }
            document.getElementById("filter_form").submit();
        }
    </script>

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
                        for(Map.Entry<String, Item> itemPageEntry : filter.getFilteredItems().entrySet()) {
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
