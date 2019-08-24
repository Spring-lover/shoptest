<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="main.shop.model.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="main.shop.tools.imagePathUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 创建com.tools.ConnDB类的对象 --%>
<%@ include file="common-header.jsp"%>

<div class="product-big-title-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="product-bit-title text-center">
                    <h2>Shop</h2>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Search Products</h2>
                    <form action="">
                        <input type="text" placeholder="Search products...">
                        <input type="submit" value="Search">
                    </form>
                </div>
                <!--左边商品的展示-->
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Products</h2>
                    <div class="thubmnail-recent">
                        <img src="img/product-thumb-1.jpg" class="recent-thumb" alt="">
                        <h2><a href="">Sony Smart TV - 2015</a></h2>
                        <div class="product-sidebar-price">
                            <ins>$700.00</ins> <del>$800.00</del>
                        </div>
                    </div>
                </div>
                <div class="single-sidebar">
                    <h2 class="sidebar-title">Recent Posts</h2>
                    <ul>
                        <li><a href="">Sony Smart TV - 2015</a></li>
                    </ul>
                </div>
            </div>
            <!--detail goods-->
            <div class="col-md-8">
                <div class="product-content-right">
                    <div class="product-breadcroumb">
                        <a href="">Home</a>
                        <a href="">Category Name</a>
                        <a href="">Sony Smart TV - 2015</a>
                    </div>
                    <!--具体的商品的展示-->
                    <%
                        request.setCharacterEncoding("utf-8");
                        JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

                        //int typeSystem = 0;//保存商品类型ID的变量
                        int ID = Integer.parseInt(request.getParameter("goodsID"));//获取商品ID
                        if (ID > 0) {
                            try{
                                String sql="select * from tb_goods where ID= ? ";
                                Goods good = template.queryForObject(sql, new BeanPropertyRowMapper<Goods>(Goods.class), ID);
                                String picturePath=good.getPicture();
                                String path=imagePathUtils.imagePath(picturePath);
                                good.setPicture(path);
                    %>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="product-images">
                                <div class="product-main-img">
                                    <img src="<%=good.getPicture()%>" alt="">
                                </div>
                                <div class="product-gallery">
                                    <img src="img/product-thumb-1.jpg" alt="">
                                    <img src="img/product-thumb-2.jpg" alt="">
                                    <img src="img/product-thumb-3.jpg" alt="">
                                    <img src="img/product-thumb-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="product-inner">
                                <h2 class="product-name"><%=good.getGoodsName()%></h2>
                                <div class="product-inner-price">
                                    <ins><%=good.getPrice()%></ins> <del><%=good.getNowPrice()%></del>
                                </div>

                                <form action="" class="cart">
                                    <div class="quantity">
                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="num" min="1" step="1">
                                    </div>
                                    <a href="cart_add.jsp?goodsID=<%=good.getID()%>&num=1" class="add_to_cart_button">Add To Cart</a>
                                </form>
                                <div class="product-inner-category">
                                    <p>Category: <a href="">Summer</a>. Tags: <a href="">awesome</a>, <a href="">best</a>, <a href="">sale</a>, <a href="">shoes</a>. </p>
                                </div>

                                <div role="tabpanel">
                                    <ul class="product-tab" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" id="Description">Description</a></li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" id="Reviews">Reviews</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade in active" id="home">
                                            <h2>Product Description</h2>
                                            <p><%=good.getIntroduce()%></p>
                                        </div>
                                        <form action="/managertest/reviewServlet" method="post" id="Review">
                                            <div class="submit-review" id="home_view">
                                                <p><label>Your review</label> <textarea name="review" id="Your_review" cols="30" rows="10"></textarea></p>
                                                <p><input type="submit" value="Submit" id="review_btn"></p>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%
                        }catch (Exception e){
                            System.out.println("商品ID错误");
                        }
                    }
                    %>
                    <!--下面的商品的信息-->
                    <%
                        String sql="select * from tb_goods order by hit limit ?";
                        List<Goods> goods = template.query(sql, new BeanPropertyRowMapper<Goods>(Goods.class), 2);
                    %>
                    <div class="related-products-wrapper">
                        <h2 class="related-products-title">Related Products</h2>
                        <div class="related-products-carousel">
                            <!--单件商品的介绍-->
                            <%
                                for(Goods g:goods){
                                    String Imagepath=imagePathUtils.imagePath(g.getPicture());
                                    g.setPicture(Imagepath);
                            %>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="<%=g.getPicture()%>" alt="">
                                    <div class="product-hover">
                                        <a href="goodDetail.jsp?goodsID=<%=g.getID()%>" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>

                                <h2><a href=""><%=g.getGoodsName()%></a></h2>

                                <div class="product-carousel-price">
                                    <ins><%=g.getPrice()%></ins> <del><%=g.getNowPrice()%></del>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="common-footer.jsp"%>
