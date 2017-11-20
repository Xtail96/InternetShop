<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 15.11.17
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<%@ taglib prefix='util' uri='/WEB-INF/tld/util' %>

<c:set var="lang" value="${util:getLang(pageContext.request, pageContext.response)}"/>
<fmt:setLocale value="${lang}"/>
<c:choose>
    <c:when test="${lang eq 'ru'}">
        <c:set var="points" value="${['Первый магазин', 'Второй магазин', 'Третий магазин']}"/>
    </c:when>
    <c:when test="${lang eq 'nl'}">
        <c:set var="points" value="${['Eerste winkel', 'Tweede winkel', 'Derde winkel']}"/>
    </c:when>
    <c:otherwise>
        <c:set var="points" value="${['First store', 'Second store', 'Third store']}"/>
    </c:otherwise>
</c:choose>

<c:if test="${empty sessionScope.purchaces}">
    <c:redirect url="/"/>
</c:if>
<c:if test="${empty sessionScope.username}">
    <c:redirect url="/login"/>
</c:if>


<!DOCTYPE html>
<html>

<head>
    <title>Maps</title>
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">
    <!--<script src="https://api-maps.yandex.ru/2.0-stable/?load=package.full&lang=ru-RU" type="text/javascript"></script>-->
    <script src="https://api-maps.yandex.ru/2.1/?lang=ru" type="text/javascript"></script>
    <script type="text/javascript">
            let myMap;
            let myPlacemarkCollection;
            let mySearchControl;
            let mySearchResults;
            let deliveryType = "undefined";
            let courierAddress;
            
            
            function initializeMap() {
                myMap = new ymaps.Map("YMapsID", {
                    center: [59.96, 30.18],
                    zoom: 10,
                    type: 'yandex#map',
                    controls: ['typeSelector', 'zoomControl'],
                    behaviors: ["drag", "dblClickZoom", "rightMouseButtonMagnifier", "multiTouch"]
                });
                myPlacemarkCollection = new ymaps.GeoObjectCollection();
                mySearchControl = new ymaps.control.SearchControl();
                mySearchResults = new ymaps.GeoObjectCollection();

                let firstStore = new ymaps.Placemark(
                    [60.07, 30.33],
                    { iconContent: '${points[0]}', balloonContent: '${points[0]}', myId: 'firstStore' },
                    {preset: 'islands#greenStretchyIcon'});

                let secondStore = new ymaps.Placemark(
                    [59.91, 30.47],
                    { iconContent: '${points[1]}', balloonContent: '${points[1]}', myId: 'secondStore' },
                    {preset: 'islands#greenStretchyIcon'});

                let thirdStore = new ymaps.Placemark(
                    [59.87, 30.30],
                    { iconContent: '${points[2]}', balloonContent: '${points[2]}', myId: 'thirdStore' },
                    {preset: 'islands#greenStretchyIcon'});


                myPlacemarkCollection
                    .add(firstStore)
                    .add(secondStore)
                    .add(thirdStore);
                myPlacemarkCollection.each(geoObj => {
                    geoObj.balloon.events.add('open', storeBalloonOpenEvent);
                    geoObj.balloon.events.add('close', storeBalloonCloseEvent);
                });
                function storeBalloonOpenEvent(e) {
                    document.getElementById('addresses').value = e.get('target').properties.get('balloonContent');
                }
                function storeBalloonCloseEvent(e) {
                    document.getElementById('addresses').value = "noselect";
                }


                mySearchControl.events.add('resultselect', e => {
                    mySearchControl.getResult(e.get('index')).then(res => {
                        res.balloon.events.add('open', courierBalloonOpenEvent);
                        res.balloon.events.add('close', courierBalloonCloseEvent);
                    })
                });
                function courierBalloonOpenEvent(e) {
                    courierAddress = e.get('target').properties.get('name');
                }
                function courierBalloonCloseEvent(e) {
                    courierAddress = "";
                }

                myMap.displayDeliveryFromStore = function () {
                    if(deliveryType === "from_store") {
                        return;
                    } else {
                        deliveryType = "from_store";
                        myMap.controls.remove(mySearchControl);
                        myMap.geoObjects.add(myPlacemarkCollection);
                    }
                };

                myMap.displayDeliveryByCourier = function () {
                    if(deliveryType === "courier") {
                        return;
                    } else {
                        deliveryType = "courier";
                        document.getElementById("addresses").value = "noselect";
                        myMap.geoObjects.removeAll();
                        myMap.controls.add(mySearchControl);
                        hideStoreAddresses();
                    }
                };

                /*console.log(deliveryType);
                if(deliveryType === "undefined") {
                    myMap.displayDeliveryFromStore();
                }*/

                switch (document.querySelector('input[name="delivery_type"]:checked').value) {
                    case "from_store":
                        myMap.displayDeliveryFromStore();
                        break;
                    case "courier":
                        myMap.displayDeliveryByCourier();
                        break;
                }
            }


            function showStoreAddresses() {
                document.getElementById("delivery_address_form").style.display = "block";
            }

            function hideStoreAddresses() {
                document.getElementById("delivery_address_form").style.display = "none";
            }

            function onAddressChangeAction() {
                let addressesForm = document.getElementById("addresses");
                let currentAddress = addressesForm.value;
                if (currentAddress === "noselect") {
                    myMap.balloon.close();
                } else {
                    myPlacemarkCollection.each(geoObj => {
                        let content = geoObj.properties.get("balloonContent");
                        if (content === currentAddress) {
                            geoObj.balloon.open();
                        }
                    });
                }
            }

            function checkoutRequest() {
                let address;

                switch (deliveryType) {
                    case "from_store":
                        let value = document.getElementById('addresses').value;
                        address = value === "noselect" ? false : value;
                        break;
                    case "courier":
                        address = courierAddress === "" ? false : courierAddress;
                        break;
                }
                if (address === false) {
                    alert('<fmt:setBundle basename="strings"/><fmt:message key="no_address"/>');
                } else {
                    let hr = "/order_complete.jsp?address=" + address + "&delivery=" + (deliveryType === "courier");
                    hr = encodeURI(hr);
                    window.location.href = hr;
                }
            }

            function changeLanguage(lang) {
                window.location.href = "?lang=" + lang;
            }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="navigation.jsp" />
        <div class="main">
            <h1>
                <fmt:setBundle basename="strings"/>
                <fmt:message key="order_title"/>
            </h1>
            <div class="right">
                <button class="next_step" onclick="checkoutRequest()">
                    <fmt:setBundle basename="strings"/>
                    <fmt:message key="next"/>
                </button>
            </div>
            <div class="left">

                <form id="delivery_type_form" method="get">
                    <h3>
                        <fmt:setBundle basename="strings"/>
                        <fmt:message key="choose_order_type"/>
                    </h3>
                    <input type="radio"
                           name="delivery_type"
                           value="from_store"
                           id="delivery_from_here_radio_button"
                           checked
                           onclick="myMap.displayDeliveryFromStore()"
                    /><fmt:setBundle basename="strings"/><fmt:message key="from_here"/>
                    <input type="radio"
                           name="delivery_type"
                           value="courier"
                           id="delivery_by_courier_radio_button"
                           onclick="myMap.displayDeliveryByCourier()"
                    /><fmt:setBundle basename="strings"/><fmt:message key="courier"/>
                </form>
                <form id="delivery_address_form">
                    <h3>
                        <fmt:setBundle basename="strings"/>
                        <fmt:message key="choose_address"/>
                    </h3>
                    <select id="addresses" onchange="onAddressChangeAction(); return false;">
                        <option value="noselect"></option>
                        <option value="${points[0]}">${points[0]}</option>
                        <option value="${points[1]}">${points[1]}</option>
                        <option value="${points[2]}">${points[2]}</option>
                    </select>
                </form>
            </div>
            <script type="text/javascript">
                ymaps.ready(initializeMap);
            </script>
            <div id="YMapsID" style="width: 100%; height: 750px"></div>
        </div>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
