<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评论页面</title>

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

<table align="center"  width="1000px" class="showthing">
    <tr><td>菜品</td><td>菜品图片</td><td>用户昵称</td><td>评价结果</td><td>评价内容</td><td>图片</td><td>评价时间</td><td>操作</td></tr>
<c:forEach var="evaluate" items="${requestScope.get('haoDuoCaiEvaluates')}">
    <tr>
        <td>${evaluate.getHaoDuoCaiOrder().getHaoDuoCais().getYname()}</td>
        <td><img src="${evaluate.getHaoDuoCaiOrder().getHaoDuoCais().getYimage1()}" width="100px" height="100px"></td>
        <td>${evaluate.getHaoDuoCaiOrder().getUser().getNname()}</td>
        <td>${evaluate.getYequality()}</td>
        <td>${evaluate.getYecontent()}</td>
        <c:if test="${evaluate.getYeimage()!=null}">
            <td><img src="${evaluate.getYeimage()}" width="100px" height="100px"></td>
        </c:if>
        <c:if test="${evaluate.getYeimage() eq null}">
            <td>无图片</td>
        </c:if>
        <td>${evaluate.getYedate()}</td>
        <td><a class="detelt" href="${pageContext.request.contextPath}/evaluate/mDeleteUserEvaluate?yoid=${evaluate.getYoid()}">删除评价</a> </td>
    </tr>
</c:forEach>
</table>

</body>
</html>
