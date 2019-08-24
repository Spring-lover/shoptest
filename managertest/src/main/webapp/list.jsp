<%@ page import="main.domain.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="main.domain.PageBean" %>
<%@ page import="java.util.Map" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html>
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
    <title>商品信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deleteGoods(id) {
            if(confirm("您确定要删除吗")){
                location.href="${pageContext.request.contextPath}/delGoodsServlet?ID="+id;
            }
        }
        window.onload=function () {
            document.getElementById("delSelected").onclick=function() {
                if(confirm("您确定要删除吗")){
                    var flag=false;
                    var count=0;
                    var cbs=document.getElementsByName("gid");
                    for(var i=0;i<cbs.length;i++) {
                        if (cbs[i].checked) {
                            count++;
                            flag = true;
                            break;
                        }
                    }
                    if(flag){//有信息被选中
                        //判断是否有选中的信息
                        document.getElementById("forms").submit();
                    }
                }
            };
            document.getElementById("firstCb").onclick=function (ev) {
                var cbs=document.getElementsByName("gid");
                for(var i=0;i<cbs.length;i++){
                    cbs[i].checked=this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">商品信息列表</h3>

    <div style="float: left">
        <form class="form-inline" action="${pageContext.request.contextPath}/findGoodsByPageServlet" method="post">
            <div class="form-group">
                <label for="goodsName">商品名称</label>
                <input type="text" name="goodsName" value="" class="form-control" id="goodsName">
            </div>
            <div class="form-group">
                <label for="nowPrice">商品价格</label>
                <input type="text" name="nowPrice" class="form-control" id="nowPrice">
            </div>
            <div class="form-group">
                <label for="sale">商品销量</label>
                <input type="text"  name="sale" class="form-control" id="sale">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>
    <div style="float: right;margin: 5px">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/add.jsp">添加商品</a>
        <a class="btn btn-primary" href="javascript:void(0);"id="delSelected">删除选中</a>
    </div>

    <form id="forms" action="${pageContext.request.contextPath}/delSelectedServlet" method="post">
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>编号</th>
            <th>商品名称</th>
            <th>商品类别</th>
            <th>商品图片</th>
            <th>发货地址</th>
            <th>商品销售量</th>
            <th>商品价格</th>
            <th>商品折后价</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pb.list}" var="good" varStatus="s">
        <tr>
            <td><input type="checkbox" name="gid" value="${good.ID}"></td>
            <td>${good.ID}</td>
            <td>${good.goodsName}</td>
            <td>${good.typeID}</td>
            <td>${good.picture}</td>
            <td>${good.address}</td>
            <td>${good.sale}</td>
            <td>${good.price}</td>
            <td>${good.nowPrice}</td>
            <td><a class="btn btn-default btn-sm" href="/managertest/findGoodsServlet?ID=${good.ID}">修改</a>&nbsp;
                <a class="btn btn-default btn-sm" href="javascript:deleteGoods(${good.ID}">删除</a>
            </td>
        </tr>
        </c:forEach>
    </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                    <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                    </c:if>

                    <c:if test="${pb.currentPage != 1}">
                    <li>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/findGoodsByPageServlet?currentPage=${pb.currentPage - 1}&rows=5&goodsName=${condition.goodsName[0]}&nowPrice=${condition.nowPrice[0]}&sale=${condition.sale[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>

                    <c:forEach begin="1" end="${pb.totalPage}" var="i" >
                    <c:if test="${pb.currentPage == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/findGoodsByPageServlet?currentPage=${i}&rows=5&goodsName=${condition.goodsName[0]}&nowPrice=${condition.nowPrice[0]}&sale=${condition.sale[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${pb.currentPage != i}">
                        <li><a href="${pageContext.request.contextPath}/findGoodsByPageServlet?currentPage=${i}&rows=5&goodsName=${condition.goodsName[0]}&nowPrice=${condition.nowPrice[0]}&sale=${condition.sale[0]}">${i}</a></li>
                    </c:if>
                    <!--每次都将页面的参数保存下来，防止返回时进行错误-->
                    </c:forEach>

                <li>
                    <a href="${pageContext.request.contextPath}/findGoodsByPageServlet?currentPage=${pb.currentPage + 1}&rows=5&goodsName=${condition.goodsName[0]}&nowPrice=${condition.nowPrice[0]}&sale=${condition.sale[0]}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
