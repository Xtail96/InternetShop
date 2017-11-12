<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 12.11.17
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>
<fmt:setLocale value="${util:getLang(pageContext.request, pageContext.response)}"/>
<!DOCTYPE html>
<html>
<head>
    <title>Авторизация</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/styles.css">
    <script>
        function changeLanguage(lang) {
            window.location.href = "?lang=" + lang;
        }
</head>
<body>
    <div class="container">
        <jsp:include page="navigation.jsp"></jsp:include>
        <div class="main">
            <h1>Auth</h1>
            <form action="j_security_check" method="post" name="loginForm" class="auth-form">
                <input name="j_username" type="text" placeholder="Username" />
                <br />
                <input name="j_password" type="password" placeholder="Password" />
                <br />
                <button type="submit">Submit</button>
            </form>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
