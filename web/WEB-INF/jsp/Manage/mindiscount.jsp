<%--
  Created by IntelliJ IDEA.
  User: sakura
  Date: 2023/3/24
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>优惠卷管理</title>
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
<table align="center" class="showthing"">
    <tr><td>金额说明</td><td>减的金额</td><td>优惠卷数量</td><td>操作</td>
        <c:forEach var="Indiscount" items="${requestScope.get('indiscount')}">
    <tr>
        <td>${Indiscount.getDiscontext()}</td>
        <td>${Indiscount.getQuota()}</td>
        <td>${Indiscount.getDisnumber()}</td>
    <td><a class="detelt" href="${pageContext.request.contextPath}/manage/alterIndiscountByid/${Indiscount.getDisid()}">修改优惠卷数量</a></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
