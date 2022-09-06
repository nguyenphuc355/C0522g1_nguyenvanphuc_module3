<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/4/2022
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/Employee">Back to Employee list</a>
<fieldset>
    <legend><h3>Info Employee</h3></legend>
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" value="${employee.name}"></td>
        </tr>
        <tr>
            <td>Date Of Birth:</td>
            <td><input type="text" value="${employee.birthday}"></td>
        </tr>
        <tr>
            <td>Id card:</td>
            <td><input type="text" value="${employee.idCard}"></td>
        </tr>
        <tr>
            <td>Salary:</td>
            <td><input type="text" value="${employee.salary}"></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><input type="number" value="${employee.phone}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" value="${employee.email}"></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><input type="text" value="${employee.address}"></td>
        </tr>
        <tr>
            <td>Position:</td>
            <c:forEach items="${positionList}" var="position">
                <c:if test="${position.id == employee.positionId}">
                    <td class="text-center"><input type="text" value="${position.name}"></td>
                </c:if>
            </c:forEach>
        </tr>
        <tr>
            <td>Education Degree:</td>
            <c:forEach var="educationDegree" items="${educationDegreeList}">
                <c:if test="${educationDegree.id==employee.educationDegreeId}">
                    <td class="text-center"><input type="text" value="${educationDegree.name}"></td>
                </c:if>
            </c:forEach>
        </tr>
        <tr>
            <td>Division:</td>
            <c:forEach var="division" items="${divisionList}">
                <c:if test="${division.id==employee.divisionId}">
                    <td class="text-center"><input type="text" value="${division.name}"></td>
                </c:if>
            </c:forEach>
        </tr>
    </table>
</fieldset>
</body>
</html>
