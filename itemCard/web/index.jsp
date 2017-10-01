<%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 01.10.17
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <!--<head>
    <title>$Title$</title>
  </head>
  <body>
  $Body$
  </body>-->
  <title>$Title$</title>
  <head>
    <meta charset="utf-8" />
    <style type="text/css">

      .container{
        margin-bottom: 50px;
        max-width: 1920px;
        min-width: 1366px;
        margin-left: auto;
        margin-right: auto;
      }

      .main{
        width: 90%;
        margin-left: auto;
        margin-right: auto;
        margin-top: 5%;
        background-color: #fff;
        padding: 5px;
      }

      .container .main h1{
        text-align:left;
        font-size: 250%;
      }

      .container .main .product_header{
        max-height: 700px;
        padding: 25px;
        margin-bottom: 25px;
      }

      .container .main .product_header img{
        max-width: 50%;
        max-height: 500px;
        height: auto;
        width: auto;
      }


      .container .main .product_header .product_price{
        float: right;
        width: 35%;
        font-size: 150%;
        border-radius: 5px;
        padding: 25px;
        text-align: center;
        background-color: #eee;
      }

      .container .main .product_price button{
        background-color: #a52a2a;
        color: #fff;
        border: 1px solid transparent;
        border-radius: 5px;
        padding: 10px;
        font-size: 150%;
        text-align: center;
        width: 70%;
      }
      .container .main .product_price button:hover{
        background-color: #fa8072;
      }
      .container .main .product_price button:active{
        background-color: #a52a2a;
      }

      .container .main .product_tab_menu{
        padding-left: 5px;
        overflow: hidden;
        background-color: #fff;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
      }

      .container .main .product_tab_menu button{
        float: left;
        outline: none;
        cursor: pointer;
        padding: 10px;
        border: 1px solid #eee;
        border-bottom: none;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
        font-size: 100%;
        padding-right: 5px;
      }


      .container .main .product_tab_menu button:hover{
        text-decoration: underline;
      }

      .container .main .product_tab_menu .product_tab_menu_link
      {
        background-color: #eee;
      }

      .container .main .product_tab_menu .product_tab_menu_link_active
      {
        background-color: #fff;
      }

      .container .main .tab_content{
        display: none;
        height: auto;
        padding: 5px 15px;
        border: 1px solid #dfdfdf;
        background-color: #fff;
        margin-top: -3px;
        font-size: 150%;
      }
    </style>

    <script type="text/javascript">
        function hide_all()
        {
            var to_hide = document.getElementsByClassName('tab_content');
            for(var i = 0; i < to_hide.length; i++)
            {
                to_hide[i].style.display = 'none';
            }

            var tabsContainer = document.getElementsByClassName('product_tab_menu');
            for(var i = 0; i < tabsContainer.length; i++)
            {
                var tabs = tabsContainer[i].getElementsByTagName('button');
                for(var j = 0; j< tabs.length; j++)
                {
                    tabs[j].className = 'product_tab_menu_link';
                }
            }
        }

        function show_element(element, tab)
        {
            hide_all();
            document.getElementById(element).style.display = 'block';

            var tab_name = document.getElementById(tab);
            tab_name.className = 'product_tab_menu_link_active';
        }
    </script>

  </head>
  <body onload="show_element('product_description', 'description_tab')">
  <div class="container">
    <div class="main">
      <h1>Product Name</h1>
      <div id='product'>
        <div class="product_header">
          <img src="img/decor/2.png" alt="Картинка товара" />
          <div class="product_price">
            <b>Цена: 1000р</b>
            <p>Идейные соображения высшего порядка, а также консультация с широким активом позволяет выполнять важные задания по разработке существенных финансовых и административных условий. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют определения и уточнения систем массового участия.</p>
            <button>В корзину</button>
          </div>
        </div>

        <div class="product_tab_menu">
          <button class="product_tab_menu_link" id='description_tab' onclick="show_element('product_description', 'description_tab')">Описание</button>

          <button class="product_tab_menu_link" id='information_tab' onclick="show_element('product_information', 'information_tab')">Характеристки</button>

          <button class="product_tab_menu_link" id='rewiews_tab' onclick="show_element('product_reviews', 'rewiews_tab')">Отзывы</button>
        </div>

        <div class="tab_content" id='product_description'>
          <p>Не следует, однако забывать, что постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке форм развития. Повседневная практика показывает, что новая модель организационной деятельности в значительной степени обуславливает создание модели развития. Значимость этих проблем настолько очевидна, что сложившаяся структура организации позволяет оценить значение дальнейших направлений развития. </p>
        </div>

        <div class="tab_content" id='product_information'>
          <p>С другой стороны укрепление и развитие структуры позволяет выполнять важные задания по разработке систем массового участия. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий влечет за собой процесс внедрения и модернизации систем массового участия. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности требуют определения и уточнения направлений прогрессивного развития. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий требуют определения и уточнения систем массового участия. Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности представляет собой интересный эксперимент проверки направлений прогрессивного развития. </p>
        </div>

        <div class="tab_content" id='product_reviews'>
          <p>Задача организации, в особенности же новая модель организационной деятельности требуют определения и уточнения форм развития. Повседневная практика показывает, что консультация с широким активом влечет за собой процесс внедрения и модернизации новых предложений. Равным образом дальнейшее развитие различных форм деятельности представляет собой интересный эксперимент проверки модели развития. Не следует, однако забывать, что дальнейшее развитие различных форм деятельности требуют определения и уточнения существенных финансовых и административных условий. </p>
        </div>

      </div>
    </div>
  </div>
  </body>
</html>
