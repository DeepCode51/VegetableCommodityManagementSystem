<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>类型更新</title>
    <link rel="stylesheet" type="text/css" href="/statics/cssin/m_line.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/updl.css">
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

<form action="${pageContext.request.contextPath}/type/updateType" method="post">
    <div class="container">
        <input type="hidden" name="tname" value="${haoDuoCaiType.getTname()}">
        <input type="hidden" name="tid" value="${haoDuoCaiType.getTid()}">
        <h2 align="center">修改类型</h2>
        <c:if test="${failAddType!=null}">
            <p>${failAddType}</p>
        </c:if>
        <div class="group">
            <label>名称：
                </label>
            <input class="input-text" type="text" name="tnameupdate" value="${haoDuoCaiType.getTname()}">
        </div>
        <div class="group" >
            <input class="submit" name="submit" type="submit" value="提交"/>
        </div>
    </div>
</form>

</body>
</html>
