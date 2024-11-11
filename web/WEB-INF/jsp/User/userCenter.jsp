<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <<link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">>
    <style>
        .wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }

        .wrapper a {
            text-decoration: none;
            color: #333;
        }

        .wrapper img {
            margin-right: 20px;
        }

        .wrapper ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .wrapper ul li {
            margin-bottom: 10px;
            font-size: 18px;
        }

        .wrapper ul li p {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }
    </style>
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

<div class="wrapper">


    <a-row>
        <div>
        <img style="border-radius: 50px;text-align: center;" src="${user.uheadphoto}" height="100" width="100" />
         </div>
    </a-row>
        <ul>

            <li> <p>用户昵称:${user.nname}&nbsp;<a href="${pageContext.request.contextPath}"></a></p></li>
            <li><a  href="${pageContext.request.contextPath}/user/toAlterNname">修改昵称</a></li>
            <li><a  href="${pageContext.request.contextPath}/user/toAlterUserInfo">修改个人信息</a></li>
            <li><a  href="${pageContext.request.contextPath}/order/toUserOrder">我的订单</a></li>
            <li><a  href="${pageContext.request.contextPath}/collect/toUserCollect">我的收藏</a></li>
            <li><a href="${pageContext.request.contextPath}/user/toAllIndiscount">领取优惠卷</a></li>
<%--            <li><a  href="${pageContext.request.contextPath}/user/toDiscountUserOwn">优惠卷</a></li>--%>
            <li><a href="${pageContext.request.contextPath}/user/userLogOut">退出登入</a></li>
        </ul>
    </div>
</div>
</body>
</html>
