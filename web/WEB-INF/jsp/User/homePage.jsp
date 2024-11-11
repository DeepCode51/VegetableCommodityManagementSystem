<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商城主页</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/hcd.css">
</head>
<body>

<div class="search">
    <form action="${pageContext.request.contextPath}/haoDuoCai/searchHaoDuoCais" method="post">
        <input class="searchtab" type="text" name="yname"/>
        <input class="searchtab2" name="submit" type="submit" id="submit" value="搜索" />
    </form>
</div>
<li><a href="${pageContext.request.contextPath}/user/toLogin">登入</a></li>
<div>
    <ul class="u1">
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/user/toHomePage">首页</a></li>
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiRange/肉类">肉类</a></li>
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiRange/蔬菜">蔬菜</a></li>
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiRange/水果">水果</a></li>
        <li class="l2"><a  class="lia1"  href="${pageContext.request.contextPath}/user/toUserCenter">个人中心</a></li>
        <li class="l2"><a  class="lia1" href="${pageContext.request.contextPath}/cart/toCart">购物车</a></li>
    </ul>
</div>

<h2 align="center">好菜推荐</h2>
<div>
<div>
    <ul id="menu">
    <c:forEach var="haoDuoCai" items="${requestScope.get('haoDuoCaisList')}">
        <a href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiInfo/${haoDuoCai.getYid()}">
            <li style=" height:420px;border:1px solid #ccc;margin-left: 20px;margin-top: 10px;border-radius: 30px;">
                <div style="float: left"><img style="margin-top: 15px;margin-left: 20px" src="${haoDuoCai.getYimage1()}"  height="330" width="240" /></div>
            </li>
        </a>
    </c:forEach>
    </ul>
</div>
</div>
</body>
</html>
