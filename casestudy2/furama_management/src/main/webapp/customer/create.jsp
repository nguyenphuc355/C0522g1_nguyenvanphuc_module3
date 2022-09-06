<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/28/2022
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Add new Customer</title>
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
        body{
            background-image: url("https://html.sammy-codes.com/images/background.jpg");
        }
    </style>
</head>
<body>
<div class="mx-5 px-5 pt-3">
    <h2 class="text-center fw-bold">Add new Customer</h2>
<div class="text-center">
    <c:if test="${mess!=null}">
        <span style="color: red">${mess}</span>
    </c:if>
</div>
    <div class="d-flex justify-content-center text-light">

        <form class="w-50 border border-info p-3" action="/Customer?action=create" method="post">
            <div class="form-group">
                <label for="name" class="h6">Name:</label>
                <input type="text" id="name" class="form-control" placeholder="Input name" name="name">
            </div>

            <div class="mt-3 form-group">
                <label for="dateOfBirth" class="h6">Date of Birth:</label>
                <input type="date" id="dateOfBirth" class="form-control" name="dateOfBirth">
            </div>

            <div class="mt-3 form-group">
                <label class="h6">Gender:</label>
                <label class="d-block">
                    <input type="radio" value="1" name="gender"> Male
                </label>
                <label class="d-block">
                    <input type="radio" value="0" name="gender"> Female
                </label>
            </div>

            <div class="mt-3 form-group">
                <label for="idCard" class="h6">Id card:</label>
                <input type="number" id="idCard" class="form-control" placeholder="Input Id card" name="idCard">
            </div>

            <div class="mt-3 form-group">
                <label for="phone" class="h6">Phone number:</label>
                <input type="text" id="phone" class="form-control" placeholder="Input Phone number" name="phone">
            </div>

            <div class="mt-3 form-group">
                <label for="email" class="h6">Email:</label>
                <input type="text" id="email" class="form-control" placeholder="Input Email" name="email">
            </div>

            <div class="mt-3 form-group">
                <label for="address" class="h6">Address:</label>
                <input type="text" id="address" class="form-control" placeholder="Input Address" name="address">
            </div>

            <div class="mt-3 form-group">
                <label for="customerType">Customer Type:</label>
                <select id="customerType" class="form-control" name="customerType">
                    <c:forEach var="customerType" items="${customerTypeList}">
                        <option value="${customerType.id}">${customerType.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mt-3 text-center">
                <button class="btn btn-info btn-sm">Save</button>
            </div>
        </form>
    </div>

    <p class="text-center">
        <a href="/Customer"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to Customer list</a>
    </p>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>
