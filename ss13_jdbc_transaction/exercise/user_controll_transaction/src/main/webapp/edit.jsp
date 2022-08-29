<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/27/2022
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit User</h1>
<c:if test="${mess!=null}">
    <p style="color: blue">${mess}</p>
</c:if>
<a href="/userServlet">Back to list</a>
<form method="post">
<table>
    <tr>
        <td>Name:</td>
        <td> <input value="${user.getName()}" type="text" name="name"></td>
    </tr>
    <tr>
        <td>Email:</td>
        <td><input value="${user.getEmail()}" type="text" name="email"></td>
    </tr>
    <tr>
        <td>Country</td>
        <td> <input value="${user.getCountry()}" type="text" name="country"></td>
    </tr>
    <tr>
        <td></td>
        <td><button>Edit</button></td>
    </tr>
</table>
</form>
</body>
</html>
