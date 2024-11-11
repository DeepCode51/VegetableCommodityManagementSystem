<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看用户评论</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
</head>
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

    <div class="user-info">
        <div style="float:left;width: 80%;margin-left: 10%;background: #f7f7f7">
            <c:if test="${haoDuoCaiEvaluate != null}">
                <p>${haoDuoCaiEvaluate.getYequality()}</p>
                <c:if test="${haoDuoCaiEvaluate.getYeimage()!=null}">
                    <p><img src="${haoDuoCaiEvaluate.getYeimage()}" height="100" width="100" /></p>
                </c:if>
                <p>评论内容:${haoDuoCaiEvaluate.getYecontent()}</p>
                <a class="J_LinkAdd" href="${pageContext.request.contextPath}/evaluate/deleteUserEvaluate/${haoDuoCaiEvaluate.getYoid()}">删除评价</a>
                <c:if test="${haoDuoCaiEvaluate.getYequality() eq '差评'}">

                </c:if>
            </c:if>
            <c:if test="${haoDuoCaiEvaluate eq null}">
                <h1 style="text-align: center;">评论已删除</h1>
            </c:if>

        </div>



    </div>




</div>

</body>
</html>
