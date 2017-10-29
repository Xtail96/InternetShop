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
        <input type="text" style="width: 100px" name="" oninput="cost_input(this)">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="" oninput="cost_input(this)">
    </p>

    <p>
        <b><%=shopResources.getString("frequency")%></b>
        <br />
        <input type="text" style="width: 100px" name="" oninput="cost_input(this)">
        <b><%=shopResources.getString("til")%></b>
        <input type="text" style="width: 100px" name="" oninput="cost_input(this)">
    </p>

    <p>
        <b><%=shopResources.getString("vendor")%></b>
        <br />
        <input type="checkbox" name="Vendor" onclick="setCheckParam(this)"><%=shopResources.getString("raspberrypi")%>
        <br />
        <input type="checkbox" name="Vendor" onclick="setCheckParam(this)"><%=shopResources.getString("arduino")%>
    </p>

    <button type="submit"><%=shopResources.getString("apply")%></button>
</form>
