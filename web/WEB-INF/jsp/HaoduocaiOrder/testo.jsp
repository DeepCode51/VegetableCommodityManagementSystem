<%--
  Created by IntelliJ IDEA.
  User: sakura
  Date: 2023/4/9
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Title</title>
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
        var totalPrice = 100; // 假设原价为 100

        // 根据用户选择的优惠卷计算新的总价
        var couponValue = parseInt($couponSelect.val());
        if (couponValue === 1) {
          totalPrice -= 10;
        } else if (couponValue === 2) {
          totalPrice -= 20;
        } else if (couponValue === 3) {
          totalPrice -= 30;
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
<div>
  <label for="coupon-select">选择优惠卷:</label>
  <select id="coupon-select">
    <option value="0">无优惠</option>
    <option value="1">减 10</option>
    <option value="2">减 20</option>
    <option value="3">减 30</option>
  </select>
</div>

<div>
  <label for="total-price">总价:</label>
  <span id="total-price">100</span>
</div>
</body>
</html>
