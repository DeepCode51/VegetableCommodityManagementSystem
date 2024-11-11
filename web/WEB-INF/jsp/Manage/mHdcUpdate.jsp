<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜品更新</title>

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
<form action="${pageContext.request.contextPath}/haoDuoCai/mHaoDuoCaiUpdate" method="post" enctype="multipart/form-data">
    <input class="input-text"  type="hidden" name="yid" value="${haoDuoCais.getYid()}">
    <div class="container">
        <h2>修改菜品</h2>

        <div>
            <label>名称：
                </label>
            <input class="input-text"  type="text" name="yname" value="${haoDuoCais.getYname()}">
        </div>

        <div>
            <label>价格：
               </label>
            <input class="input-text"  type="text" name="yprice" value="${haoDuoCais.getYprice()}">
        </div>

        <div>
            <label>介绍：
                </label>
            <textarea class="input-text"  name="yintro">${haoDuoCais.getYintro()}</textarea>
        </div>
        <div>
            <label>库存：
            </label>
            <textarea class="input-text"  name="inventory">${haoDuoCais.getInventory()}</textarea>
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
            display: block;">图片1：
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
            <img class="input-text"  src="${haoDuoCais.getYimage1()}" width="100" height="100" alt="无">
            <input class="input-text"  type="file" name="image1">
            <c:if test="${haoDuoCais.getYimage1()!=null}">
                <input class="input-text"  type="hidden" name="yimage1" value="${haoDuoCais.getYimage1()}" >
            </c:if>
        </div>

        <div>
            <label>上架：
                </label>
            <select class="input-text"  name="ymanage">
                <option value="上架" <c:if test="${haoDuoCais.getYmanage()=='上架'}">selected="selected"</c:if>>上架</option>
                <option value="下架" <c:if test="${haoDuoCais.getYmanage()=='下架'}">selected="selected"</c:if>>下架</option>
            </select>
        </div>
        <div>
            <label>所属：
               </label>
            <select class="input-text"  name="yrange">
                <option value="肉类" <c:if test="${haoDuoCais.getYrange()=='肉类'}">selected="selected"</c:if>>肉类</option>
                <option value="蔬菜" <c:if test="${haoDuoCais.getYrange()=='蔬菜'}">selected="selected"</c:if>>蔬菜</option>
                <option value="水果" <c:if test="${haoDuoCais.getYrange()=='水果'}">selected="selected"</c:if>>水果</option>
            </select>
        </div>
        <div>
            <label>类型：
                </label>
            <select class="input-text"  name="ytype">
                <c:forEach var="type" items="${requestScope.get('haoDuoCaiType')}">
                    <option value="${type.getTname()}" <c:if test="${haoDuoCais.getYtype()==type.getTname()}">selected="selected"</c:if>>${type.getTname()}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <input class="submit" name="submit" type="submit" value="提交"/>
        </div>
    </div>
</form>
</body>
</html>
