<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 22.10.17
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ResourceBundle"%>
<%@page import="java.util.Locale"%>
<%@ page import="java.util.Map" %>
<%@ page import="edu.etu.web.Util" %>
<%
    final Map<String, String[]> params = request.getParameterMap();
    final Map<String, Cookie> navigationCookies = Util.mapCookiesByName(request.getCookies());

    String lang = "";
    if(!params.containsKey("lang")) {
        if(navigationCookies.containsKey("lang")) {
            lang = navigationCookies.get("lang").getValue();
        }
        else {
            lang = "ru";
        }
    } else {
        lang = params.get("lang")[0];
    }
    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle navigationResources = ResourceBundle.getBundle("strings", locale);


%>
<script>
    function goHome() {
        window.location.href = "/";
    }
</script>

<div class="navigation">
    <div class="navigation_container">
        <button onclick="goHome()">
            <%=navigationResources.getString("catalog")%>
        </button>

        <button>
            <%=navigationResources.getString("history")%>
        </button>
        <button class="card">
            <%=navigationResources.getString("cart")%>
        </button>

        <div class="language_menu">
            <a onclick="changeLanguage('ru')">Ru</a>
            <a onclick="changeLanguage('en')">En</a>
            <a onclick="changeLanguage('nl')">Nl</a>
        </div>

        <h1 class="title">
            <%=navigationResources.getString("title")%>
        </h1>
    </div>
</div>
