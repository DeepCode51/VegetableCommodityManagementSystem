<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>确认订单页面</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/cart_2.css">
    <link rel="stylesheet" type="text/css" href="/statics/cssin/cart_3.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        // JavaScript 代码
        $(function() {
            // 选择优惠卷的下拉框
            var $couponSelect = $('#coupon-select');

            // 总价元素
            var $totalPrice = $('#total-price');

            // 计算总价的函数
            function calculateTotalPrice() {
                var totalPrice = ${sum}; // 假设原价为 100

                // 根据用户选择的优惠卷计算新的总价
                var couponValue = parseInt($couponSelect.val());
                if (couponValue === 1) {
                    totalPrice -= 10;
                } else if (couponValue === 2) {
                    totalPrice -= 5;
                } else if (couponValue === 3) {
                    totalPrice -= 1;
                }

                return totalPrice;
            }

            // 当用户选择优惠卷时更新总价
            $couponSelect.on('change', function() {
                var totalPrice = calculateTotalPrice();
                $totalPrice.text(totalPrice);
            });
        });
    </script>
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

<div class="header-wrapper">
    <h2 class="header-title">我的收银台</h2>
</div>
<div class="main-container">
    <table class="table">
        <form  action="${pageContext.request.contextPath}/order/orderPay" method="post">
            <input type="hidden" value="${orderInfo.nname}" name="yausername">
            <input type="hidden" value="${orderInfo.uaddress}" name="yaaddress">
            <input type="hidden" value="${orderInfo.uphone}" name="yaphone">
            <div>
                <label for="coupon-select" style="text-align: center;">选择优惠卷</label>
                <select id="coupon-select">
                    <option type="radio" value="0" name="0">不使用
            <c:forEach var="useindiscount" items="${requestScope.get('useindiscount')}">
                <option type="radio" value="${useindiscount.getDisid()}" name="disid">${useindiscount.getIndiscount().getDiscontext()}
            </c:forEach>
                </select>
            </div>
            <div>
            <tr>
                <td><label for="total-price">需要支付：</label></td>
                <td><input name="yasum" type="hidden" value="${sum}" class="input" id="sum" />
                    <div class="order-real-amount">
                        <em id="total-price" style="    -webkit-text-size-adjust: 100%;
    font: 12px/1.5 tahoma,arial,Hiragino Sans GB,\5b8b\4f53;
    line-height: 1.8em;
    text-align: right;
    font-style: normal;
    color: #ff8208;
    font-weight: 700;
    font-size: 22px;">${sum}元</em>
                    </div>
                </td>
            </tr>
            </div>
            <tr>
                <td>付款方式：</td>
                <td>
                    <select class="input" name="yafunction" >
                        <option value="支付宝">支付宝</option>
                        <option value="微信">微信</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <div >
                        <img src="/statics/haoDuoCaiEvaluate/cart.jpg" alt="收款码">
                    </div>
                </td>
            </tr>
            <tr>
                <td><input class="ui-button" type="submit" name="action" value="确认支付" /></td></tr>

        </form>
    </table>
<%--    <a  href="${pageContext.request.contextPath}/order/toText1">测试</a>--%>
</div>
</body>
</html>
