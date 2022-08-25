<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/25/2022
  Time: 7:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<h2 style="text-align: center">Quản lý sản phẩm</h2>
<p style="text-align: center">
    <a href="/product?action=create"></i> Thêm mới sản phẩm</a>
</p>
<form class="d-flex justify-content-end" action="/product?action=Search">
    <input type="text" name="nameSearch" placeholder="Nhập tên">
    <input type="submit" name="action" value="Search" >
</form>
<table class="table table-striped">
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Status</th>
        <th>Producer</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescribe()}</td>
            <td>${product.getProducer()}</td>
            <td><a href="/product?action=update&id=${product.getId()}">edit</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
