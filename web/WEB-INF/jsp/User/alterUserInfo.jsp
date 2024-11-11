<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../../statics/cssin/NavigationbarAndSearch.css">
    <style>
        .user-info {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .group {
            margin: 10px 0;
            width: 100%;
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        .input-text {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            width: 100%;
            font-size: 16px;
        }

        .submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            padding: 8px 16px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit:hover {
            background-color: #0069d9;
        }

        img {
            margin-top: 10px;
            border-radius: 50%;
            object-fit: cover;
            object-position: center;
            box-shadow: 0px 0px 3px 1px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>



<div>
    <ul class="u1">
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/user/toHomePage">首页</a></li>
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiRange/肉类">肉类</a>
        </li>
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiRange/蔬菜">蔬菜</a>
        </li>
        <li class="l1"><a class="lia1" href="${pageContext.request.contextPath}/haoDuoCai/toHaoDuoCaiRange/水果">水果</a>
        </li>
        <li class="l2"><a class="lia1" href="${pageContext.request.contextPath}/user/toUserCenter">个人中心</a></li>
        <li class="l2"><a class="lia1" href="${pageContext.request.contextPath}/cart/toCart">购物车</a></li>
    </ul>
</div>


    <div class="user-info">
        <form id="form1" action="${pageContext.request.contextPath}/user/alterUserInfo" method="post"
              enctype="multipart/form-data">
            <input type="hidden" name="uid" value="${user.uid}"><br>
            <input type="hidden" name="uheadphoto" value="${user.uheadphoto}"><br>

            <div class="container">
                <div class="group">
                    <label>密码：
                        </label>
                    <input class="input-text" type="password" name="upass" value="${user.upass}">
                </div>

                <div class="group">
                    <label>电话号码
                        </label>
                    <input type="text" name="uphone" value="${user.uphone}" class="input-text">
                </div>

                <div class="group">
                    <label >邮箱
                        </label>
                    <input type="text" name="uemail" value="${user.uemail}" class="input-text">
                </div>
                <div class="group">
                    <label>地址
                       </label>
                    <input type="text" name="uaddress" value="${user.uaddress}" class="input-text">
                </div>
                <div class="group">
                    <label>头像
                        </label>
                    <img src="${user.uheadphoto}" width="100px" height="100px">
                </div>

                <div class="group">
                    <label >更换头像
                       </label>
                    <input type="file" name="musicRsc" class="input-text">
                </div>

                <div class="group">
                    <input class="submit" name="submit" type="submit" value="提交"/>
                </div>
            </div>
        </form>
    </div>


</body>
</html>
