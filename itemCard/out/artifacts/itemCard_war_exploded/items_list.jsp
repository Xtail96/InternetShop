<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %><%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 22.10.17
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Cookie[] cookies = request.getCookies();
    String lang = "ru";
    if (cookies!=null){
        for (Cookie c : cookies) {
            String name = c.getName();
            if (name.equals("lang")){
                lang = c.getValue();
                break;
            }
        }
    }
    Locale locale = new Locale.Builder().setLanguage(lang.substring(0,2)).setRegion(lang.substring(2,4)).build();
    ResourceBundle res = ResourceBundle.getBundle("langs", locale);
%>
<html>
<head>
    <title>Stpre Name</title>
</head>
<body>
    <div id="container">
        <jsp:include page="navigation.jsp"></jsp:include>

        <div id="main">


        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
