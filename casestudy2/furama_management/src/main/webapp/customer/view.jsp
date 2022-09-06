
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/Customer">Back to Customer list</a>
<fieldset>
<legend><h3>Info Customer</h3></legend>
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" value="${customer.name}"></td>
        </tr>
        <tr>
            <td>Date Of Birth:</td>
            <td><input type="text" value="${customer.birthday}"></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <c:if test="${customer.gender==1}">
                <td><input type="text" value="male"></td>
            </c:if>
            <c:if test="${customer.gender==0}">
                <td><input type="text" value="female"></td>
            </c:if>
        </tr>
        <tr>
            <td>Id card:</td>
            <td><input type="text" value="${customer.idCard}"></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><input type="number" value="${customer.phone}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" value="${customer.email}"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" value="${customer.address}"></td>
        </tr>
        <tr>
            <td>Customer Type:</td>
            <c:forEach var="customerType" items="${customerTypeList}">
                <c:if test="${customerType.id == customer.customerTypeId}">
                    <td><input type="text" value="${customerType.name}"></td>
                </c:if>
            </c:forEach>

        </tr>

    </table>
</fieldset>
</body>
</html>
