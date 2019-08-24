<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector"%> <%-- 导入Java的向量类 --%>
<%@ page import="main.shop.model.Goodselement"%>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="com.mysql.cj.jdbc.JdbcConnection" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="main.shop.model.Goods" %> <%-- 导入购物车商品模型类 --%>
<%-- 创建ConnDB类的对象 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Myshop</title>
</head>
<body>
<%
    String username=(String)session.getAttribute("username");//获取会员账号
    String num = (String) request.getParameter("num");//获取商品数量
    //如果没有登录，将跳转到登录页面
    if (username == null || username == "") {
        response.sendRedirect("login.jsp");//重定向页面到会员登录页面
        return;//返回
    }
    int ID = Integer.parseInt(request.getParameter("goodsID"));//获取商品ID
    System.out.println(ID);
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    String sql = "select * from tb_goods where ID= ? ";
    try{
        Goods good = template.queryForObject(sql, new BeanPropertyRowMapper<Goods>(Goods.class), ID);
        float nowprice = 0;//定义保存商品价格的变量
        nowprice=good.getNowPrice();
        Goodselement mygoodselement = new Goodselement();//创建保存购物车内商品信息的模型类的对象mygoodselement
        mygoodselement.ID = ID;//将商品ID保存到mygoodselement对象中
        mygoodselement.nowprice = nowprice;//将商品价格保存到mygoodselement对象中
        mygoodselement.number = Integer.parseInt(num);//将购买数量保存到mygoodselement对象中
        boolean Flag = true;//记录购物车内是否已经存在所要添加的商品
        Vector cart = (Vector) session.getAttribute("cart");//获取购物车对象
        if (cart == null) {//如果购物车对象为空
            cart = new Vector();//创建一个购物车对象
            System.out.println("hello cart");
        } else {
            //判断购物车内是否已经存在所购买的商品
            for (int i = 0; i < cart.size(); i++) {
                Goodselement goodsitem = (Goodselement) cart.elementAt(i);//获取购物车内的一个商品
                if (goodsitem.ID == mygoodselement.ID) {//如果当前要添加的商品已经在购物车中
                    goodsitem.number = goodsitem.number + mygoodselement.number;//直接改变购物数量
                    cart.setElementAt(goodsitem, i);//重新保存到购物车中
                    Flag = false;//设置标记变量Flag为false，代表购物车中存在该商品
                }
            }
        }
        if (Flag)//如果购物车内不存在该商品
            cart.addElement(mygoodselement);//将要购买的商品保存到购物车中
            session.setAttribute("cart", cart);//将购物车对象添加到Session中
            response.sendRedirect("cart_see.jsp");//重定向页面到查看购物车页面
    }catch (Exception e){
        System.out.println("操作失败，请重试");
    }
%>
</body>
</html>
