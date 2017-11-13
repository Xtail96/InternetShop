<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 13.11.17
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>
<fmt:setLocale value="${util:getLang(pageContext.request, pageContext.response)}"/>
<c:choose>
    <c:when test="${empty sessionScope.username}">
        <c:redirect url="/login"/>
    </c:when>
    <c:otherwise>

    </c:otherwise>
</c:choose>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/styles.css">
    <script>
        function changeLanguage(lang) {
            window.location.href = "?lang=" + lang;
        }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="main">
            <fmt:setBundle basename="strings"/>
            <fmt:message key="username"/>:
            ${sessionScope.username}
            <br>
            <fmt:message key="activeTab"/>:
            <fmt:message key="${initParam.activeTab}"/>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
