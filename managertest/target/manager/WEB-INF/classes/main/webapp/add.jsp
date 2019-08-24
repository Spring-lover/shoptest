<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/7
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!-- HTML5文档-->
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>添加用户</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    function validForm(fm){
        fm.action = fm.action + "?goodsName=" + fm['goodsName'].value+ "&typeID=" + fm['typeID'].value
            + "&sale=" + fm['sale'].value+ "&address=" + fm['address'].value+ "&price=" + fm['price'].value
            + "&nowPrice=" + fm['nowPrice'].value;
        console.log(fm.action);
        return true;
    }
</script>
</head>
<body>
<div class="container">
    <center><h3>添加商品页面</h3></center>
    <form action="${pageContext.request.contextPath}/addGoodsServlet" method="post" enctype="multipart/form-data"
          onsubmit="return validForm(this)">
        <div class="form-group">
            <label for="name">商品名称：</label>
            <input type="text" class="form-control" id="name" name="goodsName" placeholder="请输入商品名称">
        </div>
        <div class="form-group">
            <label>商品类别：</label>
            <input type="text" class="form-control" id="subtype" name="typeID" placeholder="请输入商品类别">
        </div>
        <div class="form-group">
            <label>商品图片资源：</label>
            <input type="file" class="form-control" id="picture" name="picture" placeholder="请输入商品图片路径">
        </div>
        <div class="form-group">
            <label>商品销售量：</label>
            <input type="text" class="form-control" id="sale" name="sale" placeholder="请输入商品销售量">
        </div>

        <div class="form-group">
        <label for="address">发货地址：</label>
        <select name="address" class="form-control" id="address">
            <option value="陕西">陕西</option>
            <option value="北京">北京</option>
            <option value="安徽">安徽</option>
            <option value="四川">四川</option>
            <option value="湖南">湖南</option>
            <option value="西藏">西藏</option>
            <option value="天津">天津</option>
            <option value="浙江">浙江</option>
        </select>
        </div>

        <div class="form-group">
            <label >商品价格：</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="请输入商品价格"/>
        </div>

        <div class="form-group">
            <label >商品打折后的价格：</label>
            <input type="text" class="form-control" id="nowPrice" name="nowPrice" placeholder="请输入商品价格"/>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交"/>
            <input class="btn btn-default" type="reset" value="重置" />
            <input class="btn btn-default" type="button" value="返回" />
        </div>
    </form>
</div>
</body>
</html>