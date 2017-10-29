<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 29.10.17
  Time: 15:35
  To change this template use File | Settings | File Templates.
--%>
<form method="GET" id="filter">
    <h3><%=shopResources.getString("params")%></h3>
    <p>
        <b><%=shopResources.getString("price")%></b>
        <br />
        <input type="text" style="width: 100px" name="price_low" oninput="" id="price_low" value="<%=filter.getPrice_low()%>">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="price_high" oninput="" id="price_high" value="<%=filter.getPrice_high()%>">
    </p>

    <p>
        <b><%=shopResources.getString("frequency")%></b>
        <br />
        <input type="text" style="width: 100px" name="frequency_low" oninput="" id="frequency_low" value="<%=filter.getFrequency_low()%>">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="frequency_high" oninput="" id="frequency_high" value="<%=filter.getFrequency_high()%>">
    </p>

    <p>
        <%
            Boolean isRaspberrypi = filter.getVendors().contains("raspberrypi");
            Boolean isArduino = filter.getVendors().contains("arduino");
        %>
        <!--<script>
            alert(<%=isRaspberrypi%>);
            alert(<%=isArduino%>);
        </script>-->
        <b><%=shopResources.getString("vendor")%></b>
        <br />
        <%
            if(isRaspberrypi) {
        %>
                <input type="checkbox" name="vendor_raspberrypi" id="vendor_raspberrypi" checked="checked"><%=shopResources.getString("raspberrypi")%>
        <%
            }
            else {
        %>
                <input type="checkbox" name="vendor_raspberrypi" id="vendor_raspberrypi"><%=shopResources.getString("raspberrypi")%>
        <%
            }
        %>

        <br />

        <%
            if(isArduino) {
        %>
                <input type="checkbox" name="vendor_arduino" id="vendor_arduino" checked="checked"><%=shopResources.getString("arduino")%>
        <%
        }
        else {
        %>
                <input type="checkbox" name="vendor_arduino" id="vendor_arduino"><%=shopResources.getString("arduino")%>
        <%
            }
        %>


    </p>

    <button type="button" onclick="applyFilters()"><%=shopResources.getString("apply")%></button>
</form>
