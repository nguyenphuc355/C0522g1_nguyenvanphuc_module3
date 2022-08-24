<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/24/2022
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1> Simple Calculator</h1>
<form action="/CalculatorServlet" method="get">
    <fieldset>
        <legend>Calculator</legend>

        <table>
            <tr>
                <td><label>Fist operand: </label></td>
                <td><input name="fistOperand" placeholder="input"><br></td>
            </tr>
            <tr>
                <td> <label>Operator</label></td>
                <td> <select name="operator">
                    <option value="+">addition(+)</option>
                    <option value="-">subtraction(-)</option>
                    <option value="*">multiplication(*)</option>
                    <option value="/">division(/)</option>
                </select><br>
                </td>
            </tr>
            <tr>
                <td><label>Second Operator: </label></td>
                <td> <input name="secondOperand" placeholder="input"><br></td>
            </tr>
            <tr>
                <td></td>
                <td><button type="submit">Result</button></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
