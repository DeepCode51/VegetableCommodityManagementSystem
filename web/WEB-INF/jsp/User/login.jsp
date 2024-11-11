<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>登入页面</title>
    <link rel="stylesheet" type="text/css" href="/statics/cssin/Login.css">

</head>
<body>
<div>
<form action="${pageContext.request.contextPath}/user/loginToHomePage" method="post">
    <h1>登 录</h1>
    <p>

        <input type="text" name="uaccount" id="uaccount" onblur="a1()" required>
        <span id="userInfo"></span>
    </p>
    <p>
    <input type="password" name="upass" id="upass" onblur="a2()" required>
        <span id="pwdInfo"></span>
    </p>
    <button name="submit">登 录</button>
</form>
<a class="first" href="${pageContext.request.contextPath}/user/toReg">注册账号</a>
<a class="last" href="${pageContext.request.contextPath}/manage/toMLogin">管理员登入</a>
</div>
</body>
</html>
