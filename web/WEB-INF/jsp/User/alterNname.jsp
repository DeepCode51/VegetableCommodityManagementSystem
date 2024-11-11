<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <style>
        .user-info {
            max-width: 500px;
            margin: 0 auto;
        }

        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }

        .group {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            width: 100%;
        }

        label {
            font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif;
            word-break: break-all;
            word-wrap: break-word;
            width: 6em;
            color: #333;
            vertical-align: middle;
            left: 0;
            height: 26px;
            line-height: 26px;
            display: block;
            margin-right: 20px;
        }

        input[type="text"],
        input[type="password"],
        input[type="file"] {
            width: 100%;
            height: 30px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 0 10px;
            font-size: 14px;
            line-height: 30px;
            box-sizing: border-box;
        }

        input[type="file"] {
            margin-top: 10px;
        }

        .submit {
            background-color: #1E90FF;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit:hover {
            background-color: #0d64b5;
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

    <div class="user-info">
        <form action="${pageContext.request.contextPath}/user/alterNname" method="post">
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
            display: block;">昵称：
                        </label>
                        <input class="input-text"  type="text" name="nname" value="${user.nname}">
                </div>

                <div class="group">
                    <input class="submit" name="submit" type="submit" value="提交"/>
                </div>
            </div>
        </form>

    </div>



</body>
</html>
