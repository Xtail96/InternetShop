<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 09.11.17
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="edu.etu.web.Database" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>
<c:set var="lang" value="${util:getLang(pageContext.request, pageContext.response)}"/>
<fmt:setLocale value="${lang}"/>
<c:if test="${empty sessionScope.purchaces}">
    <jsp:useBean id="cartMap" class="java.util.HashMap" scope="request"/>
    <c:set var="purchaces" scope="session" value="${cartMap}"/>
</c:if>
<c:set var="itemsMap" value="${Database.getAllItems()}" scope="request"/>
<c:if test="${not empty param.add}">
    <c:if test="${empty sessionScope.purchaces[param.add]}">
        <c:set target="${purchaces}" property="${param.add}" value="${0}"/>
    </c:if>
    <c:set target="${purchaces}" property="${param.add}" value="${sessionScope.purchaces[param.add] + 1}"/>
</c:if>
<c:if test="${not empty param.setcountid && not empty param.setcountq}">
    <c:catch var="parseerror">
        <fmt:parseNumber var="setcountqparsed" integerOnly="false" value="${param.setcountq}"/>
    </c:catch>
    <c:if test="${parseerror == null && setcountqparsed > 0}">
        <c:set target="${purchaces}" property="${param.setcountid}" value="${setcountqparsed}"/>
    </c:if>
</c:if>
<c:if test="${not empty param.remove}">
    <c:set target="${purchaces}" property="${param.remove}" value="${null}"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

    <script type="text/javascript">
    </script>

    <script type="text/javascript">
        function changeLanguage(lang) {
            window.location.href = "?lang=" + lang;
        }

        function removeFromCart(id) {
            window.location.href = "/cart.jsp?remove=" + id;
        }

        function refreshCount(id, count) {
            window.location.href = "/cart.jsp?setcountid=" + id + "&setcountq=" + count;
        }
    </script>
</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container">
    <div class="main">
        <h1>
            <fmt:setBundle basename="strings"/>
            <fmt:message key="cart"/>
        </h1>

        <div class="right">

            <c:set var="totalCost" scope="request" value="0"/>
            <c:forEach var="purchace" items="${sessionScope.purchaces}">
                <c:if test="${requestScope.itemsMap.containsKey(purchace.key)}">
                    <c:set scope="request" var="item" value="${requestScope.itemsMap.get(purchace.key)}"/>
                    <c:set var="totalCost" scope="request"
                           value="${totalCost + requestScope.item.getPrice() * purchace.value}"/>
                </c:if>
            </c:forEach>

            <div class="cart_right_panel">
                <b>
                    <fmt:setBundle basename="strings"/>
                    <fmt:message key="summary"/>
                </b>
                <b>${totalCost}</b>
                <br />
                <button>
                    <fmt:setBundle basename="strings"/>
                    <fmt:message key="checkout"/>
                </button>
            </div>
        </div>

        <div class="items_container">
            <br />
            <div class="separator"></div>

            <c:if test="${not empty sessionScope.purchaces}">
                <c:forEach var="purchace" items="${sessionScope.purchaces}">
                    <c:if test="${requestScope.itemsMap.containsKey(purchace.key)}">
                        <c:set scope="request" var="item" value="${requestScope.itemsMap.get(purchace.key)}"/>

                        <div class="cart_item">
                            <div class="action_bar">
                                <b class="title">
                                    <fmt:setBundle basename="${requestScope.item.getId()}"/>
                                    <fmt:message key="name"/>
                                </b>
                                <b class="price">
                                    <fmt:setBundle basename="${requestScope.item.getId()}"/>
                                    <fmt:message key="price"/>
                                    ${item.getPrice() * purchace.value}
                                </b>
                                <button onclick="removeFromCart('${requestScope.item.getId()}')">
                                    <fmt:setBundle basename="strings"/>
                                    <fmt:message key="delete"/>
                                </button>
                                <!--<button onclick="refreshCount('${requestScope.item.getId()}', document.getElementById('${requestScope.item.getId()}_count').value)">
                                    <%--<fmt:setBundle basename="strings"/>--%>
                                    <%--<fmt:message key="refresh"/>--%>
                                </button>-->
                                <input id="${requestScope.item.getId()}_count" class="quantity_input" type="text" name="quantity" value="${purchace.value}" onchange="refreshCount('${requestScope.item.getId()}', document.getElementById('${requestScope.item.getId()}_count').value)" />
                                <b class="quantity_label">
                                    <fmt:setBundle basename="strings"/>
                                    <fmt:message key="count"/>
                                </b>
                            </div>
                            <img src="${requestScope.item.getUrl()}" />
                            <p>
                                <fmt:setBundle basename="${requestScope.item.getId()}"/>
                                <fmt:message key="description_content"/>
                                <a href="${pageContext.request.contextPath}/item?id=${requestScope.item.getId()}&lang=${lang}">
                                    <fmt:setBundle basename="strings"/>
                                    <fmt:message key="more"/>
                                </a>
                            </p>
                        </div>

                    </c:if>
                </c:forEach>
            </c:if>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

