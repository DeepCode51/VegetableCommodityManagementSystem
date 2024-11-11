<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登入</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/Login.css">
</head>
<body>
<div>
<form action="${pageContext.request.contextPath}/manage/login" method="post">
    <h1>管 理 员 登 录</h1>
    <span>账号</span>
    <input type="text" name="gmaccount">
    <span>密码</span>
    <input type="password" name="gmpass">
    <button name="submit">登 录</button>
</form>
<a href="${pageContext.request.contextPath}/user/toLogin">用户登入</a>
</div>
</body>
</html>
