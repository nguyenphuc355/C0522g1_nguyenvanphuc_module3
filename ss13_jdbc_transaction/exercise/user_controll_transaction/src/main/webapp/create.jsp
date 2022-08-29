<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/27/2022
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang Thêm Mới</h1>
<c:if test="${mess!=null}">
    <span style="color: red">${mess}</span>
</c:if>
<a href="/userServlet">Back to list</a>
<form action="/userServlet?action=create" method="post">
    <pre>Name:             <input type="text" name="name"></pre>
    <pre>Email:            <input type="text" name="email"></pre>
    <pre>Country:          <input type="text" name="country"></pre>
    <pre>                  <button style="background-color: #67dc6a">Save</button></pre>
</form>
</body>
</html>
