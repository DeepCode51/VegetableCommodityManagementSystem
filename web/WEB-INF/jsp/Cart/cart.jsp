<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <style>
        /* 购物车表格样式 */
        table {
            border-collapse: collapse;
            margin: 30px auto;
            width: 100%;
            max-width: 800px;
            background-color: #fff4e8;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            vertical-align: middle;
        }

        th {
            background-color: #f8c37f;
        }

        /* 表格内图片大小 */
        img {
            max-height: 150px;
            max-width: 100px;
        }

        /* 表格内商品名称样式 */
        .product-name {
            float: right;
            line-height: 130px;
            height: 100%;
        }

        /* 表格内操作按钮样式 */
        .p-ops-item {
            background-color: #ffbd2a;
            color: #fff;
            border: none;
            padding: 5px 10px;
            margin-right: 10px;
            cursor: pointer;
        }

        .p-ops-item-cancel {
            background-color: #e24f4c;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        /* 清空购物车、继续购物和进入结算按钮样式 */
        .options-box {
            margin: 30px auto;
            width: 100%;
            max-width: 800px;
            display: flex;
            justify-content: center;
        }

        .opt-cleaner {
            background-color: #e24f4c;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-right: 20px;
            cursor: pointer;
        }

        .common-submit-btn {
            background-color: #ffbd2a;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* 购物车为空时的提示样式 */
        .countain {
            text-align: center;
            margin-top: 50px;
            font-size: 20px;
            color: #999;
        }

        .countain a {
            font-size: 24px;
            color: #36C;
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
<div class="options-box">
    <a class="opt-cleaner" href="${pageContext.request.contextPath}/cart/clearCart"><strong>清空购物车</strong></a>
    <a class="opt-cleaner" href="${pageContext.request.contextPath}/user/toHomePage"><strong>继续购物</strong></a>
    <a class="common-submit-btn" href="${pageContext.request.contextPath}/cart/makeSureCart">进入结算</a>
</div>
<c:if test="${!empty cart}">
    <table align="center" border="1" style="margin-top: 30px; background: #fff4e8;" cellpadding="10px" cellspacing="0px">
        <tr><th>商品</th><th>物品价格</th><th>数量</th><th>操作</th></tr>
        <c:forEach items="${cart}" var="item">
            <form action="${pageContext.request.contextPath}/cart/processCart" method="post">
                <input type="hidden" name="yid" value="${item.haoDuoCais.yid}"/>
                <tr>
                    <td>
                        <img style="margin-top: 15px;margin-left: 20px" src="${item.haoDuoCais.yimage1}" height="150" width="100" />
                        <div style="float:right;line-height: 130px;height: 100%;">${item.haoDuoCais.yname}</div>
                    </td>
                    <td>
                            ${item.haoDuoCais.yprice}
                    </td>
                    <td>
                        <input name="quantity" type="text" value="${item.quantity}" size="5" />
                    </td>
                    <td><input class="p-ops-item" type="submit" name="action" value="修改" />
                        <input class="p-ops-item-cancel" type="submit" name="action" value="删除" /></td>
                </tr>
            </form>
        </c:forEach>
    </table>

</c:if>

<c:if test="${empty cart}">
    <h1>购物车中的信息</h1>
    <hr>
    <div class="countain">
        <p>请添加商品</p>
        <a style="    font: 12px/1.5 tahoma, arial, 'Hiragino Sans GB', '\5b8b\4f53', sans-serif;
    list-style: none;
    line-height: 20px;
    text-decoration: none;
    color: #36C;" href="${pageContext.request.contextPath}/user/toHomePage">去购物</a>
    </div>
</c:if>
</body>
</html>
