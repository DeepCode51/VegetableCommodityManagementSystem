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
    <title>优惠卷</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
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
    <tr style="    font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,sans-serif;
    -webkit-font-smoothing: antialiased;
    color: #666;
    line-height: 20px;
    border-collapse: collapse;"><th>优惠券简介</th><th>减少金额</th><th>剩余总数</th><th>领取</th></tr>
    <c:forEach var="indiscount" items="${requestScope.get('indiscount')}">
        <tr>
            <td style="border-bottom: 20px solid #e0e5ec;">
                <div style="text-align: center">
                    <strong style="    font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,sans-serif;
                -webkit-font-smoothing: antialiased;
                line-height: 20px;
                border-collapse: collapse;
                text-align: center;
                margin: 0;
                padding: 0;
                font-family: verdana;
                color: #333;">${indiscount.getDiscontext()}元</strong><br>
                </div>
            </td>
            <td style="border-bottom: 20px solid #e0e5ec;">
                <div style="text-align: center">
                    <strong style="    font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,sans-serif;
                -webkit-font-smoothing: antialiased;
                line-height: 20px;
                border-collapse: collapse;
                text-align: center;
                margin: 0;
                padding: 0;
                font-family: verdana;
                color: #333;">${indiscount.getQuota()}元</strong><br>
                </div>
            </td>
            <td style="border-bottom: 20px solid #e0e5ec;">
                <div style="text-align: center">
                    <strong style="    font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,sans-serif;
                -webkit-font-smoothing: antialiased;
                line-height: 20px;
                border-collapse: collapse;
                text-align: center;
                margin: 0;
                padding: 0;
                font-family: verdana;
                color: #333;">
                        <c:if test="${indiscount.getDisnumber() eq 0}">
                            <i>已经领完了</i>
                        </c:if>
                        <c:if test="${indiscount.getDisnumber() !=0}">
                            还剩<i>${indiscount.getDisnumber()}张</i>
                        </c:if>

                    </strong><br>
                </div>
            </td>

            <td style="border-bottom: 20px solid #e0e5ec;">
                <div style="text-align: center">
                    <a class="a-link" href="${pageContext.request.contextPath}/user/addDiscountUserFirst/${indiscount.getDisid()}">使用</a>
                </div>
            </td>

        </tr>
    </c:forEach>
    <li><a class="a-left" href="${pageContext.request.contextPath}/user/toUserCenter">个人信息</a></li>
</table>
</body>
</html>
