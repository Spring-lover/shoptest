<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Vector"%><%-- 导入Java的向量类 --%>
<%@ page import="main.shop.model.Goodselement"%>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="main.shop.model.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="main.shop.tools.imagePathUtils" %>

<%
    String username = (String) session.getAttribute("username");//获取会员账号
    //如果没有登录，将跳转到登录页面
        if (username == "" || username == null) {
        response.sendRedirect("login.jsp");//重定向页面到会员登录页面
        return;//返回
    } else {
        Vector cart = (Vector) session.getAttribute("cart");//获取购物车对象
        if (cart == null || cart.size() == 0) {//如果购物车为空
            response.sendRedirect("cart_null.jsp");//重定向页面到购物车为空页面
        }else{
%>
<%@ include file="common-header.jsp"%>
<script type="text/javascript">
    window.onload=function () {
        var add_btn=document.getElementById("add_btn");
        var minue_btn=document.getElementById("minus_btn");
        var good_number=document.getElementById("good_number");
        add_btn.onclick=function () {
            good_number.value++;
        }
        minue_btn.onclick=function () {
            if(good_number.value<=0){
                good_number.value=0;
                return ;
            }
            good_number.value--;
        }
    }
</script>
<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Shopping Cart</h2>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End Page title area -->


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Search Products</h2>
                    <form action="/shoptest/searchgoodsServlet" method="post">
                        <input type="text" placeholder="Search products..." name="condition">
                        <input type="submit" value="Search">
                    </form>
                </div>

                <div class="single-sidebar">
                    <h2 class="sidebar-title">Products</h2>
                    <%
                    try{
                        List<Goods> goodslist = (List<Goods>)request.getAttribute("goodslist");
                        if(goodslist.isEmpty()){
                        }
                        else{
                            for(Goods g:goodslist){
                                String picturePath=g.getPicture();
                                String path=imagePathUtils.imagePath(picturePath);
                                g.setPicture(path);
                    %>
                    <div class="thubmnail-recent">
                        <img  width="200px" height="200px" src="<%=g.getPicture()%>" class="recikent-thumb" alt="">
                        <h2><a href="#"><%=g.getGoodsName()%></a></h2>
                        <div class="product-sidebar-price">
                            <ins><%=g.getPrice()%></ins> <del><%=g.getNowPrice()%></del>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Recent Posts</h2>
                    <%
                        if(goodslist.isEmpty()){
                        }else{
                            for(Goods g:goodslist){
                    %>
                    <ul>
                        <li><a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><%=g.getGoodsName()%></a></li>
                    </ul>
                    <%}
                    }
                    }catch (Exception e)
                    {

                    }%>

                </div>
            </div>

            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="woocommerce">
                        <!--所需要加载的购物车信息-->

                        <form method="post" action="#">
                            <table cellspacing="0" class="shop_table cart">
                                <thead>
                                <tr>
                                    <th class="product-remove">&nbsp;</th>
                                    <th class="product-thumbnail">&nbsp;</th>
                                    <th class="product-name">Product</th>
                                    <th class="product-price">Price</th>
                                    <th class="product-quantity">Quantity</th>
                                    <th class="product-subtotal">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                        <%
                            JdbcTemplate template =new JdbcTemplate(JDBCUtils.getDataSource());
                            //显示可能感兴趣的物品
                            String sql1="select * from tb_goods limit ? , ?";
                            List<Goods> goods1 = template.query(sql1, new BeanPropertyRowMapper<Goods>(Goods.class),4,2);


                            //显示购物车的具体商品以及价格
                            float sum=0;

                            int ID=-1;//保存商品的ID
                            String goodsname="";
                            String picture="";
                            float goodsprice=0f;
                            //遍历购物车中的商品
                            for(int i=0;i<cart.size();i++){
                                Goodselement goodsitem=(Goodselement) cart.elementAt(i);
                                System.out.println(goodsitem.ID);
                                sum = sum + goodsitem.number * goodsitem.nowprice;//计算总计金额
                                ID = goodsitem.ID;//获取商品ID
//                                System.out.println(sum);
//                                System.out.println(ID);
                                if(ID>0){
                                    try{
                                        String sql2="select * from tb_goods where ID= ? ";
                                        Goods good = template.queryForObject(sql2, new BeanPropertyRowMapper<Goods>(Goods.class), ID);
                                        goodsname=good.getGoodsName();
                                        String picturePath=good.getPicture();
                                        String path=imagePathUtils.imagePath(picturePath);
                                        good.setPicture(path);
                                        goodsprice=good.getNowPrice();
                                        System.out.println(good.toString());
                        %>
                                <tr class="cart_item">
                                    <td class="product-remove">
                                        <a title="Remove this item" class="remove" id="remove_btn" href="cart_remove.jsp?goodsID=<%=good.getID()%>">×</a>
                                    </td>

                                    <td class="product-thumbnail">
                                        <a href="goodDetail.jsp?goodsID=<%=good.getID()%>"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="<%=good.getPicture()%>"></a>
                                    </td>

                                    <td class="product-name">
                                        <a href="goodDetail.jsp?goodsID=<%=good.getID()%>"><%=goodsname%></a>
                                    </td>

                                    <td class="product-price">
                                        <span class="amount"><%=goodsprice%></span>
                                    </td>

                                    <td class="product-quantity">
                                        <div class="quantity buttons_added">
                                            <input type="button" class="minus" value="-" id="minus_btn">
                                            <input type="text" class="input-text qty text"title="Qty" id="good_number" value="<%=goodsitem.number%>">
                                            <input type="button" class="plus" value="+" id="add_btn">
                                        </div>
                                    </td>

                                    <td class="product-subtotal">
                                        <span class="amount"><%=goodsprice%></span>
                                    </td>
                                </tr>
                        <%
                            }catch (Exception e){
                                System.out.println("商品不存在");
                                }
                            }
                        }
                        %>
                                <tr>
                                    <td class="actions" colspan="6">
                                        <div class="coupon">
                                            <label for="coupon_code">Coupon:</label>
                                            <input type="text" placeholder="Coupon code" value="" id="coupon_code" class="input-text" name="coupon_code">
                                            <input type="submit" value="Apply Coupon" name="apply_coupon" class="button">
                                        </div>
                                        <input type="submit" value="Update Cart" name="update_cart" class="button">
                                        <a class="add_to_cart_button"  rel="nofollow" href="pay.jsp?sum=<%=sum%>">Pay For Me</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>

                        <div class="cart-collaterals">

                            <div class="cross-sells">
                                <h2>You may be interested in...</h2>
                                <ul class="products">
                                    <%
                                        for (Goods g:goods1){
                                    %>
                                        <li class="product">
                                            <a href="goodDetail.jsp?goodsID=<%=g.getID()%>">
                                                <img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/<%=g.getPicture()%>">
                                                <h3><%=g.getGoodsName()%></h3>
                                                <span class="price"><span class="amount"><%=g.getNowPrice()%></span></span>
                                            </a>

                                            <a class="add_to_cart_button" data-quantity="1" data-product_sku="" data-product_id="22" rel="nofollow" href="goodDetail.jsp?goodsID=<%=g.getID()%>">Select options</a>
                                        </li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                            <!--显示购物车的总价钱-->
                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>

                                <table cellspacing="0">
                                    <tbody>
                                    <tr class="cart-subtotal">
                                        <th>Cart Subtotal</th>
                                        <td><span class="amount"><%=sum%></span></td>
                                    </tr>

                                    <tr class="shipping">
                                        <th>Shipping and Handling</th>
                                        <td>Free Shipping</td>
                                    </tr>

                                    <tr class="order-total">
                                        <th>Order Total</th>
                                        <td><strong><span class="amount"><%=sum%></span></strong> </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="common-footer.jsp"%>
<%
        }
    }%>

