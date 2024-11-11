<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>确认购物车信息</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/cart_2.css">
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

<div class="ta">
    <h2>确认订单信息</h2>
</div>
<table class="table" border="1" border="0" align="center" cellspacing="0px">
    <tr><th>物品</th><th style="width: 200px;">物品价格</th><th style="width: 100px">数量</th><th style="width: 100px">小计</th></tr>
    <c:forEach items="${cart}" var="item">
        <input type="hidden" name="cid" value="${item.haoDuoCais.yid }" />
        <tr>
            <td>
                <img style="margin-top: 15px;margin-left: 20px" src="${item.haoDuoCais.yimage1}" height="75" width="50" />
                <div style="float:right;line-height: 130px;height: 100%;">${item.haoDuoCais.yname}</div>
            </td>
            <td><p style="text-align: center">${item.haoDuoCais.yprice}</p></td>
            <td><p style="text-align: center">${item.quantity}</p></td>
            <td><p style="    -webkit-text-size-adjust: 100%;
    font: 12px/1.5 tahoma, arial, 'Hiragino Sans GB', '\5b8b\4f53', sans-serif;
    -webkit-font-smoothing: antialiased;
    line-height: 1.5;
    font-family: verdana,-apple-system,BlinkMacSystemFont,Helvetica Neue,Helvetica,Tahoma,PingFang SC,Hiragino Sans GB,Microsoft YaHei,sans-serif;
    text-align: center;
    box-sizing: border-box;
    font-weight: bold;
    font-style: normal;
    text-decoration: none;
    color: rgb(255, 0, 54);
    font-size: 14px;
    min-width: 100px;">${item.quantity*item.haoDuoCais.yprice}</p></td>
        </tr>
    </c:forEach>
</table>
<form action="${pageContext.request.contextPath}/order/toOrderPay">
    <input type="hidden" name="uid" value="${user.uid}">
    <table width="300" border="0" align="center">
        <tr>
            <td class="ui-label">收货人：</td>
            <td><input class="input" name="nname" type="text"  value="${user.nname}" class="ipt-t" id="nname" /></td>
        </tr>
        <tr>
            <td class="ui-label">收货地址：</td>
            <td><input class="input" name="uaddress" type="text" value="${user.uaddress}" class="ipt-t" id="uaddress" /></td>
        </tr>
        <tr>
            <td class="ui-label">手机号：</td>
            <td>
                <input class="input" name="uphone" type="text" value="${user.uphone}" class="ipt-t" id=uphone" />
            </td>
        </tr>
    </table>
    <div style="text-align:center;">
    <tr> <td></td><td><input name="sum" type="hidden" class="ipt-t" id="sum" value="${sum}"/> </td></tr>
    <tr><td></td><td><input class="input-submit" type="submit" name="Submit" value="提交订单"></td></tr>
    <tr><td><a class="go-back" target="_self" role="button" href="${pageContext.request.contextPath}/cart/toCart">返回购物车</a></td></tr>
    </div>
</form>
</body>
</html>
