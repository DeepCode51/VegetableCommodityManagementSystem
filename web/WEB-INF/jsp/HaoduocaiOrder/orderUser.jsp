<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户订单页面</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
</head>
<style>
    table {
        border-collapse: collapse;
        width: 100%;
        margin: 20px auto;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
        color: #333;
        font-weight: bold;
    }

    tr:hover {
        background-color: #f5f5f5;
    }

    .uorl th {
        background-color: #4CAF50;
        color: white;
    }

    .dealtime, .allpay, .uoinf, .uoma, .uopl {
        width: 20%;
    }

    .uoinf {
        position: relative;
    }
    .a-link {
        display: inline-block;
        margin: 10px;
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        text-decoration: none;
        border-radius: 5px;
    }

    .a-link:hover {
        background-color: #333;
    }
    .chance {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    .chance1 {
        padding: 8px 16px;
        margin-right: 10px;
        background-color: #ffffff;
        color: #333333;
        border-radius: 5px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
        text-decoration: none;
        font-weight: bold;
        font-size: 16px;
        transition: all 0.3s ease;
    }

    .chance1:hover {
        background-color: #333333;
        color: #ffffff;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.2);
    }
</style>
<body>


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

<div class="chance">
    <a class="chance1"  href="${pageContext.request.contextPath}/order/toUserOrder">取消筛选</a>
    <a class="chance1"  href="${pageContext.request.contextPath}/order/toUserOrder?vcheck=1">待收货</a>
    <a class="chance1"  href="${pageContext.request.contextPath}/order/toUserOrder?vcheck=2">待评价</a>
    <a class="chance1"  href="${pageContext.request.contextPath}/order/toUserOrder?vcheck=3">已评价</a>
</div>
<table align="center"  width="1000px" cellspacing="0px">
    <tr class="uorl"><th>订单详情</th><th>总价</th><th>收货人信息</th><th>发货状态</th><th>操作</th></tr>
    <c:forEach var="order" items="${requestScope.get('haoDuoCaiOrders')}">
        <tr>
            <td class="dealtime" title="2022-03-20 14:12:19">${order.getYadate()}</td>
            <td class="dealtime" title="2022-03-20 14:12:19">订单号:${order.getYoid()}</td>
        </tr>
        <tr>

            <td class="ut">
                <div class="uoimg">
                    <img src="${order.getHaoDuoCais().getYimage1()}" height="100" width="100" />
                </div>
                <div class="ouname">
                    <p>${order.getHaoDuoCais().getYname()}</p>
                </div>
                <div class="uop">
                    <p>单价:${order.getHaoDuoCais().getYprice()}</p>
                </div>
                <div class="uon">
                    <p>x${order.getYacount()}</p>
                </div>

            </td>
            <td class="allpay">
                <div style="text-align: center">
                    <strong >总付</strong><br>
                    <strong>¥${order.getYasum()}</strong><br>
                    <span>${order.getYafunction()}</span>

                </div>
            </td>
            <td class="uoinf">

                    <div class="pc">
                        <strong>${order.getYausername()}</strong>
                        <p>${order.getYaaddress()}</p>
                        <p>${order.getYaphone()}</p>
                    </div>

                </div>
            </td>
            <td class="uoma">
                <div style="text-align: center">
            <span>${order.getYastatus()}</span>
                </div>
            </td>

            <td class="uopl">
                <div style="text-align: center">
                    <c:choose>
                        <c:when test="${order.getIsreceive() eq 'false'}">
                            <a class="a-link" href="${pageContext.request.contextPath}/order/receiveMakeSure/${order.getYoid()}" target="_blank" >确认收货</a>
                        </c:when>
                        <c:when test="${order.getIsreceive() eq 'true' and order.getIsevaluate() eq 'false' }">
                            <a class="a-link" href="${pageContext.request.contextPath}/evaluate/toHaoDuoCaiOrderEvaluate/${order.getYoid()}" target="_blank" >评价</a>
                        </c:when>
                        <c:when test="${order.getIsreceive() eq 'true' and order.getIsevaluate() eq 'true' }">
                        <a class="a-link" href="${pageContext.request.contextPath}/evaluate/showUserEvaluate/${order.getYoid()}" target="_blank" >查看评价</a>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${order.getIsrefundprocess() eq 'false'}">
                            <a class="a-link" href="${pageContext.request.contextPath}/refund/toAddHaoDuoCaiRefund/${order.getYoid()}" target="_blank" >申请处理</a>
                        </c:when>
                        <c:otherwise>
                            <p>已处理</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
