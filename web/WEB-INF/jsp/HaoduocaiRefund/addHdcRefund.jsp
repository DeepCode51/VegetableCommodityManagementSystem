<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>填写售后原因</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/reev.css">
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
<div class="wrapper">
    <div class="user-info">
        <c:choose>
            <c:when test="${haveRefund != null}">
                <td>${haveRefund}</td>
            </c:when>
            <c:otherwise>
                <form action="${pageContext.request.contextPath}/refund/addHaoDuoCaiRefund" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="yoid" value="${yoid}">

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
                display: block;">评价：
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
                        <select name="yrtype"  class="input-text">
                            <option value="申请退款">申请售后</option>
                            <option value="换货">换货</option>
                            <option value="更改地址">更改地址</option>
                        </select>
                    </div>

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
                display: block;">内容：
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
                        <textarea name="yrreason" class="input-text"></textarea>
                    </div>

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
                display: block;">图片：
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
                        <input style="margin-top: 20px;margin-bottom: 20px;" name="musicRsc" type="file" class="input-text">
                    </div>

                    <div class="group">
                        <input class="submit" name="submit" type="submit" value="提交"/>
                    </div>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
