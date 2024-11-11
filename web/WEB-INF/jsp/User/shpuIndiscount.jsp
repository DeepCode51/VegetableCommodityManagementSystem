<%--
  Created by IntelliJ IDEA.
  User: sakura
  Date: 2023/3/24
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <style>
        table{
        border-collapse: collapse;
        margin: auto;
        width: 1000px;
    }
    th, td{
        border: 1px solid black;
        padding: 5px;
        text-align: center;
    }
    </style>
</head>
<body>
<div class="search">
    <form action="${pageContext.request.contextPath}/haoDuoCai/searchHaoDuoCais" method="post">
        <input class="searchtab" type="text" name="yname"/>
        <input class="searchtab2" name="submit" type="submit" id="submit" value="搜索" />
    </form>
</div>

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

<table align="center"  width="1000px" cellspacing="0px">
    <tr><th>优惠卷id</th><th>持有总数</th></tr>
    <c:forEach var="useindiscount" items="${requestScope.get('useindiscount')}">
        <tr>

            <td>
                <div>
                    <strong>${useindiscount.getDisid()}元</strong><br>
                </div>
            </td>
            <td >
                <div>
                    <strong>
                        <c:if test="${useindiscount.getUnumber() eq 0}">
                            <i>已经没了</i>
                        </c:if>
                        <c:if test="${useindiscount.getUnumber() !=0}">
                            还剩<i>${useindiscount.getUnumber()}张</i>
                        </c:if>

                    </strong><br>
                </div>
            </td>
        </tr>

    </c:forEach>

</table>
</body>
</html>
