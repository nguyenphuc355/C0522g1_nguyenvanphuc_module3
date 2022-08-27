<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/23/2022
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Input</title>
    <style>
        body {
            background-color: antiquewhite;
        }
    </style>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="/display-discount" method="post">
    <label>Product Description</label><br>
    <input type="text" name="productDescription" placeholder="ProductDescription"><br>
    <label>List Price</label><br>
    <input name="listPrice" placeholder="ListPrice"><br>
    <label>Discount Percent(%)</label><br>
    <input name="discountPercent" placeholder="Discount Percent"><br>
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
