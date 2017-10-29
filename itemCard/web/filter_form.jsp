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
        <input type="text" style="width: 100px" name="price_low" oninput="">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="price_high" oninput="">
    </p>

    <p>
        <b><%=shopResources.getString("frequency")%></b>
        <br />
        <input type="text" style="width: 100px" name="frequency_low" oninput="">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="frequency_high" oninput="">
    </p>

    <p>
        <b><%=shopResources.getString("vendor")%></b>
        <br />
        <input type="checkbox" name="vendor_raspberrypi" onclick="setCheckParam(this)"><%=shopResources.getString("raspberrypi")%>
        <br />
        <input type="checkbox" name="vendor_arduino" onclick="setCheckParam(this)"><%=shopResources.getString("arduino")%>
    </p>

    <button type="submit" onclick="applyFilters()"><%=shopResources.getString("apply")%></button>
</form>
