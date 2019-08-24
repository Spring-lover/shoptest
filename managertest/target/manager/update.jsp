<%@ page import="main.domain.Goods" %><%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/7
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery-2.1.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
<%
    Goods good= (Goods) request.getAttribute("good");
%>
<div class="container" style="width: 400px;">
    <h3 style="text-align: center;">修改商品信息</h3>
    <form action="/managertest/updateGoodsServlet" method="post">
        <!--  隐藏域 提交id-->
        <input type="hidden" name="ID" value="<%=good.getID()%>">

        <div class="form-group">
            <label >商品名称：</label>
            <input type="text" class="form-control" id="goodsName" name="goodsName"  value="<%=good.getGoodsName()%>" readonly="readonly" placeholder="请输入商品的名称" />
        </div>

        <div class="form-group">
            <label >商品类别：</label>
            <input type="text" class="form-control" value="<%=good.getTypeID()%>" id="typeID"  name="typeID" placeholder="请输入商品的类别" />
        </div>

        <div class="form-group">
            <label>商品的销售量：</label>
            <input type="text" id="sale" class="form-control" value="<%=good.getSale()%>" name="sale" placeholder="请输入商品的销售量"/>
        </div>
        <div class="form-group">
            <label>商品价格：</label>
            <input type="text" id="price" class="form-control" value="<%=good.getPrice()%>" name="price" placeholder="请输入商品的价格"/>
        </div>
        <div class="form-group">
            <label>商品折后价：</label>
            <input type="text" id="NowPrice" class="form-control" value="<%=good.getNowPrice()%>" name="nowPrice" placeholder="请输入商品的折后价"/>
        </div>
        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" type="reset"  value="重置"/>
            <input class="btn btn-default" type="button" value="返回"/>
        </div>
    </form>
</div>
</body>
</html>