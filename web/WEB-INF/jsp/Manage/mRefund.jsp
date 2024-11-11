<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户售后申请</title>
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
    <tr><td>物品名</td><td>图片</td><td>用户名</td><td>处理类型</td><td>原因</td><td>附带图片</td><td>时间</td><td>操作</td></tr>
    <c:forEach var="refund" items="${requestScope.get('yasairefunds')}">
        <tr>
            <td>${refund.getHaoDuoCaiOrder().getHaoDuoCais().getYname()}</td>
            <td><img src="${refund.getHaoDuoCaiOrder().getHaoDuoCais().getYimage1()}" width="100px" height="100px"></td>
            <td>${refund.getHaoDuoCaiOrder().getUser().getNname()}</td>
            <td>${refund.getYrtype()}</td>
            <td>${refund.getYrreason()}</td>
            <c:if test="${refund.getYrimage()!=null}">
                <td><img src="${refund.getYrimage()}" width="100px" height="100px"></td>
            </c:if>
            <c:if test="${refund.getYrimage() eq null}">
                <td>无图片</td>
            </c:if>
            <td>${refund.getYrdate()}</td>
            <td><a class="detelt" href="${pageContext.request.contextPath}/refund/agreeRefund/${refund.getYoid()}">同意处理</a></td>
            <td><a class="add" href="${pageContext.request.contextPath}/refund/disagreeRefund/${refund.getYoid()}">取消处理</a> </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
