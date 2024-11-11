<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品管理</title>
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

<table align="center"   class="showthing">
    <tr><th>名称</th><th>图</th><th>大类型</th><th>细类型</th><th width="250px;">介绍</th><th>价格</th><th>库存</th><th>操作</th></tr>
    <c:forEach var="haoDuoCais" items="${requestScope.get('haoDuoCailist')}">
        <tr>
            <td>${haoDuoCais.getYname()}</td>
            <c:choose>
                <c:when test="${haoDuoCais.getYimage1() !=null}">
                    <td><img src="${haoDuoCais.getYimage1()}" width="100" height="100"></td>
                </c:when>
                <c:otherwise>
                    <td>无</td>
                </c:otherwise>
            </c:choose>
            <td>${haoDuoCais.getYrange()}</td>
            <td>${haoDuoCais.getYtype()}</td>
            <td>${haoDuoCais.getYintro()}</td>
            <td>${haoDuoCais.getYprice()}元</td>
            <td>${haoDuoCais.getInventory()}件</td>
            <td><a class="add"  href="${pageContext.request.contextPath}/haoDuoCai/toMHaoDuoCaiUpdate/${haoDuoCais.getYid()}">修改菜品</a></td>
            <td><a class="detelt"  href="${pageContext.request.contextPath}/haoDuoCai/mHaoDuoCaiDelete/${haoDuoCais.getYid()}">删除菜品</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
