<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    window.onload=function (ev) {
        alert("购物车已被您清空了,3秒回到主页");
        setTimeout(function () {
            location.href="index.jsp";
        },3000)
    }
</script>
<html>
<head>
    <title>Myshop</title>
</head>
<link href="img/me.ico" rel="icon" type="image/x-icon" />
<body>

</body>
</html>
