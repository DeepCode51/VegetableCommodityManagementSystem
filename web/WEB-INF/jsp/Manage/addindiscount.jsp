<%--
  Created by IntelliJ IDEA.
  User: sakura
  Date: 2023/3/24
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改优惠卷数量</title>
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
<div class="user-info">
    <form action="${pageContext.request.contextPath}/manage/toalterIndiscountByid" method="post">
        <input type="hidden" name="disid" value="${indiscount.getDisid()}">
        <div class="container">
            <div class="group">
                <label style="    font: 12px/1.5 tahoma,arial,\5b8b\4f53,sans-serif;
            word-break: break-all;
            word-wrap: break-word;
            width: 6em;
            color: #333;
            vertical-align: middle;
            left: 0;
            height: 26px;
            line-height: 26px;
            display: block;">数量：
                    <em style="    font: 12px/1.5 tahoma,arial,\5b8b\4f53,sans-serif;
            word-break: break-all;
            word-wrap: break-word;
            line-height: 26px;
            font-weight: 400;
            font-style: normal;
            color: #999;
            position: absolute;
            left: -12px;
            top: 4px;">*</em></label>
                <input class="input-text"  type="text" name="disnumber" value="${indiscount.getDisnumber()}">
            </div>

            <div class="group">
                <input class="submit" name="submit" type="submit" value="提交"/>
            </div>
        </div>
    </form>

</div>
</div>
</body>
</html>
