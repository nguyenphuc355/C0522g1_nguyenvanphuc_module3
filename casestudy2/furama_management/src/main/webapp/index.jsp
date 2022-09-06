<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/28/2022
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <title> Furama Resort</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Home</title>
    <style>
        .myCSS {

            background-color: bisque;

        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        nav {
            background-color: white;
        }

        .col-2:hover {
            overflow: scroll;
            height: 520px;
        }

        .col-2 {
            overflow: auto;
        }

    </style>
</head>
<body>
<%@include file="/header.jsp" %>


<div class="container-fluid" style="height: 520px;background-color: #06f389;padding: 0">
    <div class="row" style="width: 100%;margin-left: 10px">
        <div class="col-2" style="height: 520px">
            <p class="row mt-3" style="height: 155px">
                <iframe src="https://www.youtube.com/embed/8rKRo0UYfTg" title="Furama Resort Danang" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 155px">
                <iframe src="https://www.youtube.com/embed/h4kKPiiIuv4"
                        title="Villa Đà Nẵng #7-Biệt Thự  Đẳng  Cấp Furama Đà Nẵng Liệu Có Đáng Để Nghỉ Dưỡng? - Ovui Travel"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/aUAtzGGAN7c"
                        title="InterContinental® Danang Sun Peninsula Resort - Nơi Huyền Thoại Và Đẳng Cấp Giao Thoa"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/L5B05GaZsy4"
                        title="Biệt thự nghỉ dưỡng FURAMA RESORT DANANG - Ngũ Hành Sơn, Đà Nẵng" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/0YT3hj2TLb8"
                        title="Furama Resort Danang" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/qiag-dKL--Y"
                        title="Furama Resort Danang, Biệt thự nghỉ dưỡng FURAMA RESORT DANANG - Ngũ Hành Sơn, Đà Nẵng"
                        frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/PgvSSl4jm1U"
                        title="Furama Resort Đà Nẵng" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/Zhb7ciwyZ5o"
                        title="Furama Resort Đà Nẵng" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
            <p class="row " style="height: 152px">
                <iframe src="https://www.youtube.com/embed/NYgCEn8Q3AE"
                        title="Abogo Furama Resort Villas Luxury Đà Nẵng" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </p>
        </div>
        <div class="col-10">
            <img width="100%" height="520" id="img" onclick="changeImage()"
                 src="https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night.jpg"
                 alt="">
        </div>
        <script>
            var index = 1;
            changeImage = function () {
                var imgs = ["https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-Night.jpg",
                    "https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior-Lobby.jpg",
                    "https://furamavietnam.com/wp-content/uploads/2018/11/Vietnam_Danang_Furama_Resort_Exterior-Lagoon-Pool.jpg"];
                document.getElementById('img').src = imgs[index];
                index++;
                if (index == 3) {
                    index = 0;
                }
            }
            setInterval(changeImage, 3000);
        </script>
    </div>
</div>

<%@include file="/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>

</html>
