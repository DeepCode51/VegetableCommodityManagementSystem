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
</head>
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
    .a-link{
        color: white;
        background-color: #11ee36;
        border-radius: 3px;
        padding: 5px 10px;
        text-decoration: none;
    }
    .a-link:hover{
        background-color: #cd7618;
    }
</style>
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
    <tr><th>优惠券简介</th><th>减少金额</th><th>剩余总数</th><th>领取</th></tr>
    <c:forEach var="indiscount" items="${requestScope.get('indiscount')}">
        <tr>
            <td>
                <div>
                    <strong>${indiscount.getDiscontext()}元</strong><br>
                </div>
            </td>
            <td>
                <div>
                    <strong >${indiscount.getQuota()}元</strong><br>
                </div>
            </td>
            <td>
                <div>
                    <strong>
                        <c:if test="${indiscount.getDisnumber() eq 0}">
                            <i>已经领完了</i>
                        </c:if>
                        <c:if test="${indiscount.getDisnumber() !=0}">
                            还剩<i>${indiscount.getDisnumber()}张</i>
                        </c:if>

                    </strong><br>
                </div>
            </td>

            <td>
                <div>
                    <a class="a-link" href="${pageContext.request.contextPath}/user/addDiscountUserFirst/${indiscount.getDisid()}">领取</a>
                </div>
            </td>

        </tr>
    </c:forEach>

</table>
</body>
</html>
