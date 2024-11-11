<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
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
<table class="showthing">
    <tr><td>头像</td><td>昵称</td><td>用户id</td><td>用户账号</td><td>用户电话</td><td>地址</td><td>操作</td></tr>
    <c:forEach var="user" items="${requestScope.get('userlist')}">
        <tr>
            <td><img src="${user.getUheadphoto()}" width="100px" height="100px"></td>

            <c:choose>
                <c:when test="${user.getNname() !=null}">
                    <td>${user.getNname()}</td>
                </c:when>
                <c:otherwise>
                    <td>未填写</td>
                </c:otherwise>
            </c:choose>
            <td>${user.getUaccount()}</td>
            <td>${user.getUphone()}</td>
            <td>${user.getUemail()}</td>
            <c:choose>
                <c:when test="${user.getUaddress() !=null and user.getUaddress()!=''}">
                    <td>${user.getUaddress()}</td>
                </c:when>
                <c:otherwise>
                    <td>未设置地址</td>
                </c:otherwise>
            </c:choose>

            <td><a class="detelt" href="${pageContext.request.contextPath}/user/deleteUserById/${user.getUid()}">删除用户</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
