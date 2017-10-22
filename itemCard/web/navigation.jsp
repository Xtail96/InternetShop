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
<div id="navigation">
    <div class="language_menu">
        <a href="?lang=ru" title="Русская версия страницы">Ru</a>
        <a href="?lang=en" title="English version">En</a>
        <a href="?lang=ru" title="Русская версия страницы">Jp</a>
    </div>
</div>
