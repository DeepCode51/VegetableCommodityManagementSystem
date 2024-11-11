<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户收藏</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/hcd.css">
</head>
<body>

<div class="search">
    <form action="${pageContext.request.contextPath}/haoDuoCai/searchHaoDuoCais" method="post">
        <input class="searchtab" type="text" name="yname"/>
        <input class="searchtab2" name="submit" type="submit" id="submit" value="搜索" />
    </form>
</div>

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
<ul id="menu">
    <c:forEach var="collect" items="${haoDuoCaiCollect.getHaoDuoCais()}">
        <a href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiInfo/${collect.getYid()}">
            <li style=" height:420px;border:1px solid #ccc;margin-left: 20px;margin-top: 10px;border-radius: 30px;">
                <div style="float: left"><img style="margin-top: 15px;margin-left: 20px" src="${collect.getYimage1()}" height="330" width="240" /></div>
                <div style="margin-left: 10px;margin-top:10px;float: left;font-size: 18px;color: royalblue"> ${collect.getYname()}<br>
                    <p style="color:#e1251b;float:left;">¥${collect.getYprice()}元</p>
                </div>

                <a class="op-item" style="position: absolute;margin-left: -70px;margin-top: 390px" href="${pageContext.request.contextPath}/collect/deleteHaoDuoCaiCollect/${collect.getYid()}">删除宝贝</a>
            </li>
        </a>
    </c:forEach>
</ul>




</body>
</html>
