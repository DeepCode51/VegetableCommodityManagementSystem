<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员首页</title>
    <link rel="stylesheet" type="text/css" href="/statics/cssin/m_line.css">
</head>
<body>
<div class="left">
    <ul class="nano-content">
        <li class="sub-menu"  onclick = "f('sub_menu_1')">
            <a class="a1"> <span class="a-type">菜品管理</span></a>
            <ul id="sub_menu_1">
                <li><a class="a1" href="${pageContext.request.contextPath}/manage/toMHaoDuoCai"><span class="a-type">查看菜品</span></a></li>
                <li><a class="a1" href="${pageContext.request.contextPath}/haoDuoCai/toMHaoDuoCaiUpload"><span class="a-type">上传菜品</span></a></li>
            </ul>
        </li>
        <li class="sub-menu"><a class="a1" href="${pageContext.request.contextPath}/refund/toMRefund"><span class="a-type">售后处理</span></a></li>
        <li class="sub-menu"><a class="a1" href="${pageContext.request.contextPath}/order/toMOrder?startPlace=0"><span class="a-type">订单管理</span></a></li>
        <li class="sub-menu"><a class="a1" href="${pageContext.request.contextPath}/evaluate/toMEvaluate?startPlace=0"><span class="a-type">评价管理</span></a></li>
        <li class="sub-menu"><a class="a1" href="${pageContext.request.contextPath}/manage/toUser"><span class="a-type">用户管理</span></a></li>

        <li class="sub-menu"  onclick = "f('sub_menu_2')">
            <a class="a1"> <span class="a-type">类型管理</span></a>
            <ul id="sub_menu_2">
                <li><a class="a1" href="${pageContext.request.contextPath}/manage/toType"><span class="a-type">查看类型</span></a></li>
                <li><a class="a1" href="${pageContext.request.contextPath}/type/toAddType"><span class="a-type">增加类型</span></a></li>
            </ul>
        </li>
    </ul>
</div>
</body>
</html>
