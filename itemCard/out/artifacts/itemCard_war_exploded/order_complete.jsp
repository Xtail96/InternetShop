<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 19.11.17
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="edu.etu.web.HistoryEntry" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${empty sessionScope.purchaces || empty sessionScope.username ||empty param.address || empty param.delivery}">
    <c:redirect url="/"/>
</c:if>

<jsp:useBean class="edu.etu.web.HistoryEntry" id="historyEntry"/>
<jsp:setProperty name="historyEntry" property="user" value="${sessionScope.username}"/>
<jsp:setProperty name="historyEntry" property="address" value="${param.address}"/>
<jsp:setProperty name="historyEntry" property="delivery" value="${param.delivery}"/>
<jsp:setProperty name="historyEntry" property="items" value="${HistoryEntry.encodeItemsString(sessionScope.purchaces)}"/>
<jsp:useBean id="now" class="java.util.Date"/>
<jsp:setProperty name="historyEntry" property="date" value="${now}"/>

<util:saveOrder value="${historyEntry}"/>
<c:remove var="purchaces"/>
<!DOCTYPE html>
<html>
<head>
    <title>
        <fmt:setBundle basename="strings"/>
        <fmt:message key="title"/>
    </title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/styles.css">
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <script type="text/javascript">
        function changeLanguage(lang) {
            window.location.href = "?lang=" + lang;
        }
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="/navigation.jsp"/>
    <div class="main">
        <fmt:setBundle basename="strings"/>
        <fmt:message key="order_complete"/>
    </div>
    <jsp:include page="/footer.jsp"/>
</body>
</html>
