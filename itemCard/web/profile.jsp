<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 13.11.17
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="edu.etu.web.HistoryEntry" %>
<%@ page import="edu.etu.web.Database" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>

<c:set var="itemsMap" value="${Database.getAllItems()}" scope="request"/>
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

        function loadComments() {
            let xhr = new XMLHttpRequest();

            xhr.onreadystatechange = () => {
                if (xhr.readyState === 4) {
                    document.getElementsByClassName("comments_container")[0].innerHTML = xhr.responseText;
                }
            };

            xhr.open("GET", "/comments", true);
            xhr.send();
        }

        function postComment() {
            let xhr = new XMLHttpRequest();

            xhr.onreadystatechange = () => {
                if (xhr.readyState === 4) {
                    document.getElementsByName("comment_text")[0].value = "";
                    loadComments();
                }
            };

            xhr.open("POST", "/comments", true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send("text=" + encodeURIComponent(document.getElementsByName("comment_text")[0].value));
        }

        onload = () => {
            loadComments();
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
            <h2>
                <fmt:setBundle basename="strings"/>
                <fmt:message key="orders"/>:
            </h2>
            <div class="items_container">
                <c:forEach var="order" items="${HistoryEntry.getAll()}">
                    <c:if test="${order.user eq sessionScope.username}">
                        <div class="order_item">
                            <ul>
                                <li>
                                    <b>
                                        <fmt:setBundle basename="strings"/>
                                        <fmt:message key="username"/> ${order.user}
                                    </b>
                                </li>
                                <li>
                                    <b>
                                        <fmt:setBundle basename="strings"/>
                                        <fmt:message key="delivery_type"/>:
                                        <c:choose>
                                            <c:when test="${order.delivery}">
                                                <fmt:setBundle basename="strings"/>
                                                <fmt:message key="courier"/>
                                            </c:when>
                                            <c:otherwise>
                                                <fmt:setBundle basename="strings"/>
                                                <fmt:message key="from_here"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </b>
                                </li>
                                <li>
                                    <b>
                                        <fmt:setBundle basename="strings"/>
                                        <fmt:message key="delivery_address"/>: ${order.address}
                                    </b>
                                </li>
                                <li>
                                    <b>
                                        <fmt:setBundle basename="strings"/>
                                        <fmt:message key="order_time"/>:
                                        <fmt:formatDate value="${order.date}" type="both"/>
                                    </b>
                                </li>
                                <li>
                                    <b>
                                        <fmt:setBundle basename="strings"/>
                                        <fmt:message key="order_items"/>:
                                    </b>
                                    <ul style="list-style: square;">

                                        <c:forEach var="itemsMapEntry" items="${HistoryEntry.decodeItemsString(order.items)}">
                                            <c:if test="${itemsMap.containsKey(itemsMapEntry.key)}">
                                                <c:set var="orderItem"
                                                       value="${requestScope.itemsMap.get(itemsMapEntry.key)}"/>
                                                <li>
                                                    <b>
                                                        <a href="/item?id=${orderItem.id}">
                                                            <fmt:setBundle basename="${orderItem.id}"/>
                                                            <fmt:message key="name"/>
                                                        </a>
                                                        <fmt:setBundle basename="strings"/>
                                                        <fmt:message key="count"/>
                                                        ${itemsMapEntry.value}
                                                    </b>
                                                </li>
                                            </c:if>
                                        </c:forEach>

                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <br>
                    </c:if>
                </c:forEach>
            </div>

                <fmt:setBundle basename="strings"/>
                <fmt:message key="comments"/>: <br />
                <br />
                <div class="comments_container">

                </div>

                <textarea style="width:400px; height:300px" name="comment_text"></textarea>
                <br>
                <button onclick="postComment()">
                    Post comment
                </button>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>
