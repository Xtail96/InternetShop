<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 29.10.17
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<%
    String ref = request.getHeader("referer");
    boolean firstVisit = (ref == null);
    final Map<String, Cookie> userCookies = firstVisit ? cookies : Util.cookiesFromFilters(filter);

    Integer price_low = 0;
    Integer price_high = 100000;
    Double frequency_low = 0.0;
    Double frequency_high = 100.0;
    Boolean isRaspberrypi = true;
    Boolean isArduino = true;

    try {
        price_low = Integer.parseInt(userCookies.getOrDefault("price_low", new Cookie("price_low", "0")).getValue());
        price_high = Integer.parseInt(userCookies.getOrDefault("price_high", new Cookie("price_high", "100000")).getValue());
        frequency_low = Double.parseDouble(userCookies.getOrDefault("frequency_low", new Cookie("frequency_low", "0.0")).getValue());
        frequency_high = Double.parseDouble(userCookies.getOrDefault("frequency_high", new Cookie("frequency_high", "100.0")).getValue());
        isRaspberrypi = Boolean.parseBoolean(userCookies.getOrDefault("vendor_raspberrypi", new Cookie("vendor_raspberrypi", "true")).getValue());
        isArduino = Boolean.parseBoolean(userCookies.getOrDefault("vendor_arduino", new Cookie("vendor_arduino", "true")).getValue());
    }catch (NumberFormatException ingnored) {}

%>
<form method="GET" id="filter">
    <h3><%=shopResources.getString("params")%></h3>
    <p>
        <b><%=shopResources.getString("price")%></b>
        <br />
        <input type="text" style="width: 100px" name="price_low" oninput="" id="price_low" value="<%=price_low%>">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="price_high" oninput="" id="price_high" value="<%=price_high%>">
    </p>

    <p>
        <b><%=shopResources.getString("frequency")%></b>
        <br />
        <input type="text" style="width: 100px" name="frequency_low" oninput="" id="frequency_low" value="<%=frequency_low%>">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="frequency_high" oninput="" id="frequency_high" value="<%=frequency_high%>">
    </p>

    <p>
        <b><%=shopResources.getString("vendor")%></b>
        <br />

        <input type="checkbox" name="vendor_raspberrypi" id="vendor_raspberrypi" <%if(isRaspberrypi) {%> checked="checked" <%}%>><%=shopResources.getString("raspberrypi")%>

        <br />
        <input type="checkbox" name="vendor_arduino" id="vendor_arduino" <%if(isArduino) {%> checked="checked" <%}%>><%=shopResources.getString("arduino")%>



    </p>

    <button type="button" onclick="applyFilters()"><%=shopResources.getString("apply")%></button>
</form>
<script>
    if(<%=firstVisit%>) {
        applyFilters();
    }
</script>
