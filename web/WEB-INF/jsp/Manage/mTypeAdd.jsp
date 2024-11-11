<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增类型</title>
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


<form action="${pageContext.request.contextPath}/type/addType" method="post">
    <div class="container">
        <h3 >新增类型</h3>
        <c:if test="${requestScope.get('type')!=null}">
            <p>${type}</p>
        </c:if>
        <div class="group">
            <label>名称：
               </label>
            <input class="input-text" type="text" name="tname" required>
        </div>
        <div class="group">
            <input class="submit" name="submit" type="submit" value="提交"/>
        </div>
    </div>
</form>

</body>
</html>
