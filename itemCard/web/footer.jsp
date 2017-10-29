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

<%
    final Map<String, String[]> params = request.getParameterMap();

    String lang = "";
    if(!params.containsKey("lang")) {
        lang = "ru";
    } else {
        lang = params.get("lang")[0];
    }
    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle footerResources = ResourceBundle.getBundle("strings", locale);
%>

<div class="footer">
    <p>
        <%=footerResources.getString("footer")%>
    </p>
</div>