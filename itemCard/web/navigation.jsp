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
<script>
    function goHome() {
        window.location.href = "/";
    }
</script>
<%
    final Map<String, String[]> params = request.getParameterMap();

    String lang = "";
    if(!params.containsKey("lang")) {
        lang = "ru";
    } else {
        lang = params.get("lang")[0];
    }
    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle navigationResources = ResourceBundle.getBundle("strings", locale);
%>

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
            <a>Ru</a>
            <a>En</a>
            <a>Jp</a>
        </div>

        <h1 class="title">
            <%=navigationResources.getString("title")%>
        </h1>
    </div>
</div>
