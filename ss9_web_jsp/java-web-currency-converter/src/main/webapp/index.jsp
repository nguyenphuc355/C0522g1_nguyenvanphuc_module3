<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/23/2022
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form method="post" action="/convert">
    <label> Rate: </label><br>
    <input type="text" name="rate" placeholder="RATE" value="22000"/><br>
    <label>USD</label><br>
    <input type="text" name="usd" placeholder="USD" value="0"><br>
    <input type="submit" value="converter" id="submit">
  </form>
  </body>
</html>
