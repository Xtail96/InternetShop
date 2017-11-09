<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 09.11.17
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">

    <script type="text/javascript">
    </script>

</head>
<body>
<jsp:include page="navigation.jsp"></jsp:include>
<div class="container">
    <div class="main">
        <h1>Корзина</h1>

        <div class="right">
            <div class="cart_right_panel">
                <b>Итого:</b>
                <b class="color_material_green">10000</b>
                <br />
                <button>Оформить заказ</button>
            </div>
        </div>

        <div class="items_container">
            <br />
            <div class="separator"></div>

            <div class="cart_item">
                <div class="action_bar">
                    <b class="title">Название</b>
                    <b class="price">1000</b>
                    <button>Удалить</button>
                    <button>Пересчитать</button>
                    <input class="quantity_input" type="text" name="quantity" placeholder="шт" />
                    <b class="quantity_label">Количество:</b>
                </div>
                <img src="image" />
                <p>Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки дальнейших направлений развития. <a href="#">Подробнее</a></p>
            </div>


            <div class="cart_item">
                <div class="action_bar">
                    <b class="title">Название</b>
                    <b class="price">1000</b>
                    <button>Удалить</button>
                    <button>Пересчитать</button>
                    <input class="quantity_input" type="text" name="quantity" placeholder="шт" />
                    <b class="quantity_label">Количество:</b>
                </div>
                <img src="image" />
                <p>Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки дальнейших направлений развития. <a href="#">Подробнее</a></p>
            </div>

            <div class="cart_item">
                <div class="action_bar">
                    <b class="title">Название</b>
                    <b class="price">1000</b>
                    <button>Удалить</button>
                    <button>Пересчитать</button>
                    <input class="quantity_input" type="text" name="quantity" placeholder="шт" />
                    <b class="quantity_label">Количество:</b>
                </div>
                <img src="image" />
                <p>Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки дальнейших направлений развития. <a href="#">Подробнее</a></p>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

