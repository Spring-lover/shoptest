<%@ page import="com.mysql.cj.Session" %>
<%@ page import="java.util.Vector" %>
<%@ page import="main.shop.model.Goodselement" %><%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Myshop</title>
</head>
<body>
<%
    Vector cart = (Vector) session.getAttribute("cart");//获取购物车对象

    int ID=Integer.parseInt(request.getParameter("goodsID"));
    Goodselement goodselement=new Goodselement();
    for(int i=0;i<cart.size();i++){
        goodselement=(Goodselement)cart.get(i);
        if(goodselement.ID==ID){
            cart.remove(goodselement);
        }
    }
    if(cart.size()==0){
        response.sendRedirect("cart_null.jsp");
        return ;
    }
    response.sendRedirect("cart_see.jsp");

%>

</body>
</html>
