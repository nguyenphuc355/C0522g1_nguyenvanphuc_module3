<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/24/2022
  Time: 2:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Result:</h1>
<c:choose>
    <c:when test="${param.operator =='+'}">
        ${param.fistOperand} + ${param.secondOperand} = ${addition}
    </c:when>

    <c:when test="${param.operator =='-'}">
        ${param.fistOperand} - ${param.secondOperand} = ${subtraction}
    </c:when>

    <c:when test="${param.operator =='*'}">
        ${param.fistOperand} * ${param.secondOperand} = ${multiplication}
    </c:when>

    <c:otherwise>
        ${param.fistOperand} / ${param.secondOperand} = ${division}
    </c:otherwise>

</c:choose>
</body>
</html>
