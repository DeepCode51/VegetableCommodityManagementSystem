<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品上传页面</title>
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

<form action="${pageContext.request.contextPath}/haoDuoCai/mHaoDuoCaiUpload" method="post" enctype="multipart/form-data">
    <div class="container">
        <h2 >上传菜品</h2>

        <div>
            <label>名称：
                </label>
            <input class="input-text" type="text" name="yname" required>
        </div>

        <div class="group">
            <label>价格：
                </label>
            <input class="input-text" type="text" name="yprice" required>
        </div>

        <div class="group">
            <label>介绍：
                </label>
            <textarea name="yintro" class="input-text" cols="20" rows="8" required></textarea>
        </div>
        <div>
            <label>库存：
            </label>
            <textarea class="input-text"  name="inventory"></textarea>
        </div>
        <div class="group">
            <label>图片：
               </label>
            <input class="input-text" type="file" name="image" multiple="multiple">
        </div>

        <div class="group">
            <label>上架：
                </label>
            <select name="ymanage" class="input-text">
                <option value="上架">上架</option>
                <option value="下架">下架</option>
            </select>
        </div>
        <div class="group">
            <label>所属：
                </label>
            <select name="yrange" class="input-text">
                <option value="肉类">肉类</option>
                <option value="蔬菜">蔬菜</option>
                <option value="水果">水果</option>
            </select>
        </div>
        <div class="group">
            <label>类型：
                </label>
            <select name="ytype" class="input-text" >
                <c:forEach var="type" items="${requestScope.get('haoDuoCaiType')}">
                    <option value="${type.getTname()}">${type.getTname()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="group" >
            <input class="submit" name="submit" type="submit" value="提交"/>
        </div>
        </table>
    </div>
</form>
</body>
</html>
