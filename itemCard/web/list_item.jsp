<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 23.10.17
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="item">
    <button class="buy"><%=shopResources.getString("to_cart")%></button>
    <img src="<%=url%>" alt="<%=product_name%>"/>
    <h3><%=product_name%></h3>
    <b class="price"><%=shopResources.getString("price")%><%=productPrice%></b>
    <br />
    <p>
        <%=shopResources.getString("frequency")%> <%=frequency%>
        <br />
        <%=shopResources.getString("ram")%> <%=ram_size%> <%=ram_type%>
        <br />
        <a href="${pageContext.request.contextPath}/item?id=<%=item.getId()%>&lang=<%=lang%>">
            <%=shopResources.getString("more")%>
        </a>
    </p>
</div>
