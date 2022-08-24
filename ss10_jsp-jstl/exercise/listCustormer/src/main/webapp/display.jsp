<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/24/2022
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div style="text-align: center"><h1>Danh sách khách hàng</h1></div>
    <table class="table table-striped">
        <tr>
            <th scope="col">Tên</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Ảnh</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td>${customer.name}</td>
                <td>${customer.dateOfBirth}</td>
                <td>${customer.address}</td>
                <td><img height="60" width="100" src=${customer.picture}</td>
            </tr>
        </c:forEach>

    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>
</html>
