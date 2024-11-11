<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员查看所有订单</title>
    <link rel="stylesheet" type="text/css" href="/statics/cssin/m_line.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/mshowthing.css">
</head>
<body>
<div class="left">
    <ul class="nano-content">
         <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/manage/toMHaoDuoCai"><span class="a-type">查看菜品</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toMHaoDuoCaiUpload"><span class="a-type">上传菜品</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/refund/toMRefund"><span class="a-type">售后处理</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/order/toMOrder?startPlace=0"><span class="a-type">订单管理</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/evaluate/toMEvaluate"><span class="a-type">评价管理</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/manage/toUser"><span class="a-type">用户管理</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/manage/toType"><span class="a-type">查看类型</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/type/toAddType"><span class="a-type">增加类型</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/manage/toIndiscount"><span class="a-type">优惠卷管理</span></a></li>
                <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/manage/toRevenuereport"><span class="a-type">销量查看</span></a></li>
    </ul>
</div>

<table align="center" class="showthing">
    <tr><td>订单号</td><td>名称</td><td>正面图</td><td>数量</td><td>电话</td><td>收货地址</td><td>支付方式</td><td>发货状态</td><td>支付时间</td><td>发货处理</td></tr>
<c:forEach var="order" items="${requestScope.get('haoDuoCaiOrders')}">
    <tr>
        <td>${order.getYoid()}</td>
        <td>${order.getHaoDuoCais().getYname()}</td>
        <td><img src="${order.getHaoDuoCais().getYimage1()}" height="100" width="100" /></td>
        <td>${order.getYacount()}</td>
        <td>${order.getYaphone()}</td>
        <td>${order.getYaaddress()}</td>
        <td>${order.getYafunction()}</td>
        <td>${order.getYastatus()}</td>
        <td>${order.getYadate()}</td>
        <td>&nbsp;<a class="add" href="${pageContext.request.contextPath}/order/delieverOrder?yoid=${order.getYoid()}&nowPage=${nowPage}&allPage=${allPage}&pageSize=${pageSize}">确认发货</a></td>
    </tr>
</c:forEach>

</table>
<div style="float:left;margin-left: 30%">
    <a style="color: navajowhite" href="${pageContext.request.contextPath}/order/toMOrder?startPlace=0">首页</a>
    <a style="color: navajowhite" href="${pageContext.request.contextPath}/order/toMOrder?startPlace=${(nowPage-2)*pageSize}">上一页</a>
    当前页${nowPage}/${allPage}
    <a style="color: navajowhite" href="${pageContext.request.contextPath}/order/toMOrder?startPlace=${nowPage*pageSize}">下一页</a>
    <a style="color: navajowhite" href="${pageContext.request.contextPath}/order/toMOrder?startPlace=${(allPage-1)*pageSize}">尾页</a>
</div>
</body>
</html>
