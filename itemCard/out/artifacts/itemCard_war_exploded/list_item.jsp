<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 23.10.17
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="item">
    <button class="buy">В Корзину</button>
    <img src="<%=url%>" alt="<%=product_name%>"/>
    <h3><%=product_name%></h3>
    <b class="price">Цена:<%=productPrice%></b>
    <br />
    <p>
        Тактовая частота = <%=frequency%> ГГц
        <br />
        RAM = <%=ram_size%> Гб <%=ram_type%>
        <br />
        <a href="${pageContext.request.contextPath}/item?id=<%=item.getId()%>&img=<%=url%>&lang=<%=lang%>">Подробнее</a>
    </p>
</div>
