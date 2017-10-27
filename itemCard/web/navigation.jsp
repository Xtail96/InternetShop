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
<script>
    function goHome() {
        window.location.href = "/";
    }
</script>

<div class="navigation">
    <div class="navigation_container">
        <button onclick="goHome()">
            Каталог
        </button>

        <button>
            История покупок
        </button>
        <button class="card">
            Корзина
        </button>

        <div class="language_menu">
            <a>Ru</a>
            <a>En</a>
            <a>Jp</a>
        </div>

        <h1 class="title">Microcontrollers Shop</h1>
    </div>
</div>
