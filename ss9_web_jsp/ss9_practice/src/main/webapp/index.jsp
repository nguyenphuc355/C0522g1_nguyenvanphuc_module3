<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/23/2022
  Time: 9:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<style type="text/css">
  .login {
    height:180px;
    margin:0;
    padding:10px;
    border:1px #CCC solid;
    width:300px;
    background: aqua;
  }
  .login input {
    padding:5px; margin:5px
  }
</style>
<body>
<form  method="get" action="/login">
  <div class="login">
    <h2>Login</h2>
    <input type="text" name="username" size="30"  placeholder="username" />
    <input type="password" name="password" size="30" placeholder="password" />
    <input type="submit" value="Sign in"/>
  </div>
</form>
</body>
</html>
