<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 15.11.17
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="points" value="${['8общага', 'ЛЭТИ', '5общага']}" />
<!DOCTYPE html>
<html>

<head>
    <title>Maps</title>
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">
    <script src="https://api-maps.yandex.ru/2.0-stable/?load=package.full&lang=ru-RU" type="text/javascript"></script>
    <script>
            var myMap;
            ymaps.ready(function () {
                myMap = new ymaps.Map("YMapsID", {
                    center: [59.96, 30.18],
                    zoom: 10,
                    type: 'yandex#map'
                });

                myPlacemarkCollection = new ymaps.GeoObjectCollection(),
                    lastOpenedBalloon = false;

                var firstPoint = new ymaps.Placemark([59.99, 30.31], { iconContent: '${points[0]}', balloonContent: '${points[0]}', myId: 'firstPoint' }, {preset: 'twirl#blueStretchyIcon'});
                var secondPoint = new ymaps.Placemark([59.97, 30.32], { iconContent: '${points[1]}', balloonContent: '${points[1]}', myId: 'secondPoint' }, {preset: 'twirl#blueStretchyIcon'});
                var thirdPoint = new ymaps.Placemark([59.87, 30.30], { iconContent: '${points[2]}', balloonContent: '${points[2]}', myId: 'thirdPoint' }, {preset: 'twirl#blueStretchyIcon'});

                myMap.controls
                    .add('typeSelector')
                    .add('smallZoomControl');

                //myMap.events.add(['balloonclose'], setLocationHash);

                // Обработка событий открытия балуна для любого элемента
                // коллекции.
                // В данном случае на карте находятся только метки одной коллекции.
                // Чтобы обработать события любых геообъектов карты можно использовать
                // myMap.geoObjects.events.add(['balloonopen'],function (e) { ...


                if(deliveryType() == 'from_here') {
                    myPlacemarkCollection
                        .add(firstPoint)
                        .add(secondPoint)
                        .add(thirdPoint);
                    myMap.geoObjects.add(myPlacemarkCollection);
                    myPlacemarkCollection.events.add(['balloonopen'], function (e) {
                        lastOpenedBalloon = e.get('target').properties.get('myId');
                        setLocationHash();
                    });
                    setMapStateByHash();

                    document.getElementById('delivery_from_here_radio_button').checked = true;
                    show_shops_addresses();
                } else {
                    myMap.controls.add('searchControl');
                    document.getElementById('delivery_by_courier_radio_button').checked = true;
                    hide_shops_addresses();

                    myMap.events.add(['balloonopen'], function (e) {
                        var t = document.getElementsByClassName("ymaps-b-balloon__content-body")[0];
                        lastOpenedBalloon = t.getElementsByTagName("h3")[0].innerHTML;
                        setLocationHash();
                    });

                    /*var searchControl = myMap.controls.get('searchControl');
                    searchControl.events.add(['resultSelect'], function (e) {

                    })*/

                    //self.searchControl.search('Россия, Санкт-Петербург '+search_query+'').then(function(){
                        //myMap.geoObjectsArray = self.searchControl.getResultsArray();


                    //myMap.geoObjects.events.add(['balloonopen'],function (e) {
                        //alert("opened");
                        // t = document.getElementsByClassName("ymaps-b-balloon__content-body")[0];
                        // t.getElementsByTagName("h3")[0]
                    //});

                }
            });


            function deliveryType() {
                //window.location.hash = [];

                //var window_href = window.location.href;
                //alert(window_href);
                //var res = window_href.match(new RegExp('[?&]' + 'delivery_type' + '=([^&]*)', 'i'));
                //alert(res);
                //return (res && res[1] ? res[1] : false);

                if(window.location.href.includes('courier')) {
                    return 'courier';
                } else {
                    return 'from_here';
                }
            }

            function show_shops_addresses() {
                document.getElementById('delivery_address_form').style.display = 'block';
            }

            function hide_shops_addresses() {
                document.getElementById('delivery_address_form').style.display = 'none';
            }

            // Получение значение параметра name из адресной строки
            // браузера.
            function getParam (name, location) {
                location = location || window.location.hash;
                var res = location.match(new RegExp('[#&]' + name + '=([^&]*)', 'i'));
                return (res && res[1] ? res[1] : false);
            }


            // Передача параметров, описывающих состояние карты,
            // в адресную строку браузера.
            function setLocationHash () {
                var params = [];
                if (myMap.balloon.isOpen()) {
                    params.push('open=' + lastOpenedBalloon);
                    show_list_item(lastOpenedBalloon);
                }
                window.location.hash = params.join('&');
            }

            function setMapStateByHash () {
                var open = getParam('open');
                if (open) {
                    myPlacemarkCollection.each(function (geoObj) {
                        var id = geoObj.properties.get('myId');
                        if (id == open) {
                            geoObj.balloon.open();
                        }
                    });
                }
            }



            function show_list_item(lastOpenedBalloon) {
                myPlacemarkCollection.each(function (geoObj) {
                    var id = geoObj.properties.get('myId');
                    if (id == lastOpenedBalloon) {
                        var adresses = document.getElementById('addresses');
                        var current_address = geoObj.properties.get('balloonContent');
                        adresses.value = current_address;
                    }
                });
            }


            function show_balloon() {
                var addresses = document.getElementById('addresses');
                var current_address = addresses.value;
                myPlacemarkCollection.each(function (geoObj) {
                    var content = geoObj.properties.get('balloonContent');
                    if (content == current_address) {
                        var current_id = geoObj.properties.get('myId');
                        lastOpenedBalloon = current_id;
                        params = [];
                        params.push('open=' + lastOpenedBalloon);
                        window.location.hash = params.join('&');
                        setMapStateByHash();
                    }
                });
            }
    </script>
</head>
<body>
    <div class="container">
        <jsp:include page="navigation.jsp" />
        <div class="main">
            <h1>Maps</h1>
            <div class="right">
                <button class="next_step">Next Step</button>
            </div>
            <div class="left">

                <form id="delivery_type_form" method="get">
                    <h3>Выберите вариант доставки</h3>
                    <input type="radio" name="delivery_type" value="from_here"  id="delivery_from_here_radio_button" /> Самовывоз
                    <input type="radio" name="delivery_type" value="courier" id="delivery_by_courier_radio_button" /> Доставка Курьером

                    <br />

                    <button onclick="show_shops_addresses()">
                        Next
                    </button>
                </form>

                <form id="delivery_address_form">
                    <h3>Выберите адрес доставки</h3>
                    <select id="addresses">
                        <option value="${points[0]}" >${points[0]}</option>
                        <option value="${points[1]}">${points[1]}</option>
                        <option value="${points[2]}">${points[2]}</option>
                    </select>

                    <br />

                    <button onclick="show_balloon()">
                        Next
                    </button>
                </form>
            </div>
            <div id="YMapsID" style="width: 100%; height: 750px"></div>
        </div>
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
