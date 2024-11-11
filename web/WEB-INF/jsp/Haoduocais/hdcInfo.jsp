<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品详情页</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/hcdinfo.css">
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

<div class="shang">
    <div id="slideshow">
        <ul style="list-style-type: none;">
            <li><img class="imginfo" src="${haoDuoCais.getYimage1()}"  /></li>
        </ul>

    </div>
    <div class="xinxi">
        <tr>
            <h1>${haoDuoCais.getYname()}</h1>
            <p class="price">价格:¥${haoDuoCais.getYprice()}元</p>
            <p><td>库存:${haoDuoCais.getInventory()}</td></p>
        </tr>
        <div class="choose-btns clearfix"><a class="btn-lg" href="${pageContext.request.contextPath}/cart/addToCart/${haoDuoCais.getYid()}">加入购物车</a></div>
        <div class="choose-btns clearfix"><a class="btn-lg" href="${pageContext.request.contextPath}/collect/addHaoDuoCaiCollect/${haoDuoCais.getYid()}">收藏</a></div>
    </div>

</div>
<div class="jieshao">
    <p><td>菜品介绍:${haoDuoCais.getYintro()}</td></p>
</div>
<div class="container">
<div class="pj">

</div>

<div class="pjj">
    <h3>商品评价</h3>
    <ul>
        <c:forEach var="evaluate" items="${requestScope.get('haoDuoCaiEvaluates')}">
            <li class="lipj">
                <div>
                    <img src="${evaluate.getUser().getUheadphoto()}" height="50" width="50" />
                    <p>${evaluate.getUser().getNname()}</p>
                </div>
                <div>
                    <img class="pjimg" src="${evaluate.getYeimage()}" height="50" width="50" /></div>
                <div>
                    <p>${evaluate.getYequality()}</p>
                    <p>${evaluate.getYecontent()}</p>
                    <span>${evaluate.getYedate()}</span>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
</div>
<hr>
<div class="mt">
    <h3>菜品推荐</h3>
</div>
<div class="recomment">
    <ul id="menu">
        <c:forEach var="haoDuoCaisList" items="${requestScope.get('haoDuoCaisList')}">
            <a href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiInfo/${haoDuoCaisList.getYid()}">
                <li>
                    <div><img src="${haoDuoCaisList.getYimage1()}" height="330" width="240" /></div>
                    <div> ${haoDuoCaisList.getYname()}<br>
                        <p>¥${haoDuoCaisList.getYprice()}元</p><br></div>
                </li>
            </a>
        </c:forEach>
    </ul>
</div>

</div>

</body>

</html>
