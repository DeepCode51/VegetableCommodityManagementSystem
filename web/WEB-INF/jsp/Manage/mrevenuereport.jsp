<%--
  Created by IntelliJ IDEA.
  User: sakura
  Date: 2023/3/23
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看表单</title>
    <link rel="stylesheet" type="text/css" href="/statics/cssin/m_line.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/mshowthing.css">
</head>
<body>
<div class="left">
    <ul class="nano-content">
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
    </ul>
</div>
<table align="center" class="showthing">
    <tr><td>菜品名称</td><th>图</th><td>是否在售</td><td>销售量</td><td>销售额</td>
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
    <td>${haoDuoCais.getYmanage()}</td>
    <td>${haoDuoCais.getYsale()}件</td>
    <td>${haoDuoCais.getYsale()*haoDuoCais.getYprice()}</td>
    </c:forEach>
</table>
</body>
</html>
