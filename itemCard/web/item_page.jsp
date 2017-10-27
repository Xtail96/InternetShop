<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="edu.etu.web.Util" %>
<%@ page import="edu.etu.web.MockData" %>
<%@ page import="edu.etu.web.Item" %><%--
  Created by IntelliJ IDEA.
  User: Xtail
  Date: 22.10.17
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final Map<String, String[]> params = request.getParameterMap();

    String lang = "";
    if(!params.containsKey("lang")) {
        lang = "ru";
    } else {
        lang = params.get("lang")[0];
    }

    String id = "";
    if(!params.containsKey("id")) {
        id = "undefined";
    } else {
        id = params.get("id")[0];
    }

    String image_url = "";
    if(params.containsKey("img"))
    {
        image_url = params.get("img")[0];
    }

    Map<String, Integer> itemFilter = Util.parseCookies(request.getCookies());
    Locale locale = new Locale.Builder().setLanguage(lang).build();
    ResourceBundle shopResources = ResourceBundle.getBundle(id, locale);
%>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="/static/css/styles.css">
    <style type="text/css">

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

        .container .main .product_header .product_price b{
            font-size: 150%;
        }

        .container .main .product_price button{
            background-color: #007769;
            color: #fff;
            border: 1px solid transparent;
            border-radius: 5px;
            margin-top: 25px;
            padding: 10px;
            font-size: 150%;
            text-align: center;
            width: 70%;
        }
        .container .main .product_price button:hover{
            background-color: #48a697;
        }
        .container .main .product_price button:active{
            background-color: #004a3f;
        }

        .container .main .product_tab_menu{
            padding-left: 5px;
            overflow: hidden;
            background-color: #fff;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            margin-left: 25px;
        }

        .container .main .product_tab_menu button{
            float: left;
            outline: none;
            cursor: pointer;
            border: 1px solid #eee;
            border-bottom: none;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            font-size: 100%;
            margin-right: 5px;
            padding: 10px;
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
            margin-top: -1px;
            font-size: 150%;
            margin-left: 25px;
            margin-right: 25px;
            margin-bottom: 25px;
        }

        .container .main .tab_content ul{
            font-size: 100%;
            list-style: none;
            padding-right: 50px;
        }

        .container .main .tab_content ul li{
            border-bottom: 1px solid #dfdfdf;
        }

        .container .main .tab_content .rewiews_list li{
            border: 1px solid transparent;
            border-radius: 10px;
            background-color: #eee;
            padding: 25px;
            margin-top: 25px;
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
    <jsp:include page="navigation.jsp"></jsp:include>
    <div class="main">
        <h1><%=shopResources.getString("name")%></h1>
        <div id='product'>
            <div class="product_header">
                <img src="<%=image_url%>" alt="Картинка товара" />
                <div class="product_price">
                    <b><%=shopResources.getString("price")%></b>
                    <br />
                    <p>
                        <%=shopResources.getString("frequency")%>
                        <br />
                        <%=shopResources.getString("ram")%>
                    </p>
                    <button>В корзину</button>
                </div>
            </div>

            <div class="product_tab_menu">
                <button class="product_tab_menu_link" id='description_tab' onclick="show_element('product_description', 'description_tab')">Описание</button>

                <button class="product_tab_menu_link" id='information_tab' onclick="show_element('product_information', 'information_tab')">Характеристки</button>

                <button class="product_tab_menu_link" id='rewiews_tab' onclick="show_element('product_reviews', 'rewiews_tab')">Отзывы</button>
            </div>

            <div class="tab_content" id='product_description'>
                <p><%=shopResources.getString("description")%></p>
            </div>

            <div class="tab_content" id='product_information'>
                <ul>
                    <li><%=shopResources.getString("frequency")%></li>
                    <li><%=shopResources.getString("ram")%></li>
                    <li><%=shopResources.getString("vendor")%></li>
                    <li><%=shopResources.getString("voltage")%></li>
                </ul>
            </div>

            <div class="tab_content" id='product_reviews'>
                <ul class="rewiews_list">
                    <li>
                        <h4><%=shopResources.getString("rewiews_tab_rewiew1_name")%></h4>
                        <b><%=shopResources.getString("rewiews_tab_rewiew1_rate")%></b>
                        <p><%=shopResources.getString("rewiews_tab_rewiew1_content")%></p>
                    </li>

                    <li>
                        <h4><%=shopResources.getString("rewiews_tab_rewiew2_name")%></h4>
                        <b><%=shopResources.getString("rewiews_tab_rewiew2_rate")%></b>
                        <p><%=shopResources.getString("rewiews_tab_rewiew2_content")%></p>
                    </li>

                    <li>
                        <h4><%=shopResources.getString("rewiews_tab_rewiew3_name")%></h4>
                        <b><%=shopResources.getString("rewiews_tab_rewiew3_rate")%></b>
                        <p><%=shopResources.getString("rewiews_tab_rewiew3_content")%></p>
                    </li>
                </ul>

            </div>

        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>

