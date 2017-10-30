<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.util.Map" %>
<%@ page import="edu.etu.web.Item" %>
<%@ page import="edu.etu.web.Database" %>
<%@ page import="edu.etu.web.Util" %>
<%@ page import="edu.etu.web.ItemFilter" %>
<%@ page import="java.net.CookieHandler" %><%--
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

    final Cookie DEFAULT_VENDOR_RASPBERRYPI_COOKIE = new Cookie("vendors", "raspberrypi");
    final Cookie DEFAULT_VENDOR_ARDUINO_COOKIE = new Cookie("vendors", "arduino");

    final Map<String, String[]> params = request.getParameterMap();
    final Map<String, Cookie> cookies = Util.mapCookiesByName(request.getCookies());

    String lang = "";
    if(!params.containsKey("lang")) {
        if(cookies.containsKey("lang")) {
            lang = cookies.get("lang").getValue();
        }
        else {
            lang = "ru";
        }
    } else {
        lang = params.get("lang")[0];
    }
    response.addCookie(new Cookie("lang", lang));

    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle shopResources = ResourceBundle.getBundle("strings", locale);

    ItemFilter filter = new ItemFilter(params);


    for (Map.Entry<String, Cookie> entry : Util.cookiesFromFilters(filter).entrySet()) {
        Cookie cookie = entry.getValue();
        response.addCookie(cookie);
    }
%>
<html>
<head>
    <title>Store Name</title>

    <jsp:useBean id="raspberrypi" class="edu.etu.web.Item" scope="session" />
    <jsp:setProperty name="raspberrypi" property="product_name" value="Raspberry Pi"/>
    <jsp:setProperty name="raspberrypi" property="id" value="raspberrypi"/>
    <jsp:setProperty name="raspberrypi" property="frequency" value="1.2"/>
    <jsp:setProperty name="raspberrypi" property="microcontroller" value="Broadcom BCM2837"/>
    <jsp:setProperty name="raspberrypi" property="price" value="1000"/>
    <jsp:setProperty name="raspberrypi" property="ram_size" value="1.0"/>
    <jsp:setProperty name="raspberrypi" property="ram_type" value="LPDDR2"/>
    <jsp:setProperty name="raspberrypi" property="url" value="/static/img/microcontrollers/raspberryPi.jpg"/>
    <jsp:setProperty name="raspberrypi" property="vendor" value="Raspberrypi"/>
    <jsp:setProperty name="raspberrypi" property="voltage" value="5.0"/>

    <jsp:useBean id="raspberrypi2" class="edu.etu.web.Item" scope="session" />
    <jsp:setProperty name="raspberrypi2" property="product_name" value="Raspberry Pi 2"/>
    <jsp:setProperty name="raspberrypi2" property="id" value="raspberrypi2"/>
    <jsp:setProperty name="raspberrypi2" property="frequency" value="2.2"/>
    <jsp:setProperty name="raspberrypi2" property="microcontroller" value="Broadcom BCM2837"/>
    <jsp:setProperty name="raspberrypi2" property="price" value="2000"/>
    <jsp:setProperty name="raspberrypi2" property="ram_size" value="1.0"/>
    <jsp:setProperty name="raspberrypi2" property="ram_type" value="LPDDR2"/>
    <jsp:setProperty name="raspberrypi2" property="url" value="/static/img/microcontrollers/raspberryPi.jpg"/>
    <jsp:setProperty name="raspberrypi2" property="vendor" value="Raspberrypi"/>
    <jsp:setProperty name="raspberrypi2" property="voltage" value="5.0"/>

    <jsp:useBean id="raspberrypi3" class="edu.etu.web.Item" scope="session" />
    <jsp:setProperty name="raspberrypi3" property="product_name" value="Raspberry Pi 3"/>
    <jsp:setProperty name="raspberrypi3" property="id" value="raspberrypi3"/>
    <jsp:setProperty name="raspberrypi3" property="frequency" value="3.2"/>
    <jsp:setProperty name="raspberrypi3" property="microcontroller" value="Broadcom BCM2837"/>
    <jsp:setProperty name="raspberrypi3" property="price" value="1000"/>
    <jsp:setProperty name="raspberrypi3" property="ram_size" value="1.0"/>
    <jsp:setProperty name="raspberrypi3" property="ram_type" value="LPDDR2"/>
    <jsp:setProperty name="raspberrypi3" property="url" value="/static/img/microcontrollers/raspberryPi.jpg"/>
    <jsp:setProperty name="raspberrypi3" property="vendor" value="Raspberrypi"/>
    <jsp:setProperty name="raspberrypi3" property="voltage" value="5.0"/>

    <jsp:useBean id="arduinouno" class="edu.etu.web.Item" scope="session" />
    <jsp:setProperty name="arduinouno" property="product_name" value="Arduino Uno"/>
    <jsp:setProperty name="arduinouno" property="id" value="arduinouno"/>
    <jsp:setProperty name="arduinouno" property="frequency" value="0.26"/>
    <jsp:setProperty name="arduinouno" property="microcontroller" value="ATmega328p"/>
    <jsp:setProperty name="arduinouno" property="price" value="500"/>
    <jsp:setProperty name="arduinouno" property="ram_size" value="0.2"/>
    <jsp:setProperty name="arduinouno" property="ram_type" value="LPDDR2"/>
    <jsp:setProperty name="arduinouno" property="url" value="/static/img/microcontrollers/arduino_uno.jpg"/>
    <jsp:setProperty name="arduinouno" property="vendor" value="Arduino"/>
    <jsp:setProperty name="arduinouno" property="voltage" value="7.0"/>

    <jsp:useBean id="arduinonano" class="edu.etu.web.Item" scope="session" />
    <jsp:setProperty name="arduinouno" property="product_name" value="Arduino Nano"/>
    <jsp:setProperty name="arduinouno" property="id" value="arduinonano"/>
    <jsp:setProperty name="arduinouno" property="frequency" value="0.16"/>
    <jsp:setProperty name="arduinouno" property="microcontroller" value="ATmega328p"/>
    <jsp:setProperty name="arduinouno" property="price" value="100"/>
    <jsp:setProperty name="arduinouno" property="ram_size" value="0.2"/>
    <jsp:setProperty name="arduinouno" property="ram_type" value="LPDDR2"/>
    <jsp:setProperty name="arduinouno" property="url" value="/static/img/microcontrollers/arduino_nano.jpg"/>
    <jsp:setProperty name="arduinouno" property="vendor" value="Arduino"/>
    <jsp:setProperty name="arduinouno" property="voltage" value="7.0"/>

    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

    <script type="text/javascript">

        function applyFilters(params = "?") {
            /*if (document.getElementById("vendor_raspberrypi").checked) {
                document.getElementById("vendor_raspberrypi").disabled = true
                document.
            }
            if (document.getElementById("vendor_arduino").checked) {
                document.getElementById("vendor_arduino").disabled = true
            }
            document.getElementById("filter_form").submit();*/

            let price_low = document.getElementById("price_low").value;
            let price_high = document.getElementById("price_high").value;

            let frequency_low = document.getElementById("frequency_low").value;
            let frequency_high = document.getElementById("frequency_high").value;

            let vendor_raspberrypi = document.getElementById("vendor_raspberrypi").checked;
            let vendor_arduino = document.getElementById("vendor_arduino").checked;

            params += "&price_low=" + price_low +
                "&price_high=" + price_high +
                "&frequency_low=" + frequency_low + "&frequency_high=" + frequency_high;

            if(vendor_raspberrypi || vendor_arduino) {
                if (vendor_raspberrypi)
                    params += "&vendors=raspberrypi";
                if (vendor_arduino)
                    params += "&vendors=arduino";
            }
            else {
                params += "&vendors=";
            }


            //alert(params);

            window.location.href = params;
        }

        function changeLanguage(lang) {
            applyFilters("?lang=" + lang);
            window.location.href = href;
        }

    </script>

</head>
<body>
<%
    Database database = new Database();
    database.getItemslist().add(raspberrypi);
    database.getItemslist().add(raspberrypi2);
    database.getItemslist().add(raspberrypi3);
    database.getItemslist().add(arduinouno);
    database.getItemslist().add(arduinonano);
%>
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
