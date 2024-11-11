<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册页面</title>
    <link rel="stylesheet" type="text/css" href="/statics/cssin/Login.css">
    <style>
    body {
        background-color: #f2f2f2;
        font-family: Arial, Helvetica, sans-serif;
    }

    form {
        margin: 0 auto;
        width: 400px;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
    }

    h1 {
        text-align: center;
        font-size: 2em;
        margin-bottom: 20px;
    }

    ul {
        list-style: none;
        margin: 0;
        padding: 0;
    }

    span {
        display: inline-block;
        width: 100px;
        font-weight: bold;
        margin-bottom: 10px;
    }

    input{
        display: block;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 20px;
        width: 100%;
        font-size: 1.2em;
        box-sizing: border-box;
    }

    button{
        background-color: #4CAF50;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 1.2em;
        cursor: pointer;
    }

</style>
</head>
<body>
<div>
<c:if test="${requestScope.get('fail')!=null}">
    <p>${requestScope.get('fail')}</p>
</c:if>
<form action="${pageContext.request.contextPath}/user/reg" method="post">
    <ul>
    <h1>注 册</h1>
    <span>账号</span>
    <input type="text" name="uaccount" required>
    <span>密码</span>
    <input type="password" name="upass" required>
    <span>确认密码</span>
    <input type="password" name="textupass" required>
    <span>邮箱</span>
    <input type="text" name="uemail" required>
    <span>手机号</span>
    <input type="text" name="uphone" required>
        <p style="text-align:center">
    <button name="submit">注 册</button>
        </p>
    </ul>
</form>
<a class="first" href="${pageContext.request.contextPath}/user/toLogin">返回登入</a>
</div>
</body>
</html>
