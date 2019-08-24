<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="main.shop.model.Goods" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 创建com.tools.ConnDB类的对象 --%>

    <%

        JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
        String sql1="select * from tb_goods limit ? ";
        List<Goods> goods1 = template.query(sql1, new BeanPropertyRowMapper<Goods>(Goods.class), 5);

        String sql2="select * from tb_goods limit ? ";
        List<Goods> goods2 = template.query(sql2, new BeanPropertyRowMapper<Goods>(Goods.class), 3);

        String sql3="select * from tb_goods limit ? , ? ";
        List<Goods> goods3 = template.query(sql3, new BeanPropertyRowMapper<Goods>(Goods.class), 4,3);

        String sql4="select * from tb_goods limit ? ,?";
        List<Goods> goods4 = template.query(sql4, new BeanPropertyRowMapper<Goods>(Goods.class), 7,3);
    %>
<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common-header.jsp"%>

<div class="slider-area">
    <div class="zigzag-bottom"></div>
    <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">

        <div class="slide-bulletz">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ol class="carousel-indicators slide-indicators">
                            <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                            <li data-target="#slide-list" data-slide-to="1"></li>
                            <li data-target="#slide-list" data-slide-to="2"></li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="single-slide">
                    <div class="slide-bg slide-one"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are awesome</h2>
                                            <p>Welcome To HJL's Shopping online mall</p>
                                            <a href="" class="readmore">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-two"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are great</h2>
                                            <p>Welcome To HJL's Shopping online mall</p>
                                            <a href="" class="readmore">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="single-slide">
                    <div class="slide-bg slide-three"></div>
                    <div class="slide-text-wrapper">
                        <div class="slide-text">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <div class="slide-content">
                                            <h2>We are superb</h2>
                                            <p>Welcome To HJL's Shopping online mall</p>
                                            <a href="" class="readmore">Learn more</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div> <!-- End slider area -->

<div class="promo-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-refresh"></i>
                    <p>30 Days return</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-truck"></i>
                    <p>Free shipping</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-lock"></i>
                    <p>Secure payments</p>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="single-promo">
                    <i class="fa fa-gift"></i>
                    <p>New products</p>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End promo area -->

<div class="maincontent-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="latest-product">
                    <h2 class="section-title">Latest Products</h2>
                    <div class="product-carousel">
                        <!--Single-product-->
                        <%
                            for(Goods g:goods1){
                        %>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="./img/<%=g.getPicture()%>" alt="照片<%=g.getID()%>" width="430px" height="550px">
                                    <div class="product-hover">
                                        <a href="cart_add.jsp?goodsID=<%=g.getID()%>&num=1" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i> Add to cart</a>
                                        <a href="goodDetail.jsp?goodsID=<%=g.getID()%>" class="view-details-link"><i class="fa fa-link"></i>See details</a>
                                    </div>
                                </div>
                                <h2><a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><%=g.getGoodsName()%></a></h2>
                                <div class="product-carousel-price">
                                    <ins>$<%=g.getNowPrice()%></ins><del>$<%=g.getPrice()%></del>
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
</div> <!-- End main content area -->

<div class="brands-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="brand-wrapper">
                    <h2 class="section-title">Brands</h2>
                    <div class="brand-list">
                        <img src="img/services_logo__1.jpg" alt="">
                        <img src="img/services_logo__2.jpg" alt="">
                        <img src="img/services_logo__3.jpg" alt="">
                        <img src="img/services_logo__4.jpg" alt="">
                        <img src="img/services_logo__1.jpg" alt="">
                        <img src="img/services_logo__2.jpg" alt="">
                        <img src="img/services_logo__3.jpg" alt="">
                        <img src="img/services_logo__4.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> <!-- End brands area -->

<div class="product-widget-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <!--Top-Sellers-->

                <div class="single-product-widget">
                    <h2 class="product-wid-title">Top Sellers</h2>
                    <a href="" class="wid-view-more">View All</a>
                    <%
                        for(Goods g:goods2){
                    %>
                    <div class="single-wid-product">
                        <a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><img src="img/<%=g.getPicture()%>" width="100px" height="90px" alt="" class="product-thumb"></a>
                        <h2><a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><%=g.getGoodsName()%></a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
                            <ins><%=g.getPrice()%></ins> <del><%=g.getNowPrice()%></del>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget">
                    <!--Recently-Viewed-->
                    <h2 class="product-wid-title">Recently Viewed</h2>
                    <a href="#" class="wid-view-more">View All</a>
                    <%
                        for(Goods g:goods3){
                    %>
                    <div class="single-wid-product">
                        <a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><img src="img/<%=g.getPicture()%>" alt="" class="product-thumb"></a>
                        <h2><a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><%=g.getGoodsName()%></a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <a class="fa fa-star"></a>
                        </div>
                        <div class="product-wid-price">
                            <ins><%=g.getPrice()%></ins> <del><%=g.getNowPrice()%></del>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-md-4">
                <div class="single-product-widget">

                    <h2 class="product-wid-title">Top New</h2>
                    <a href="#" class="wid-view-more">View All</a>
                    <%
                        for(Goods g:goods4){
                    %>
                    <div class="single-wid-product">
                        <a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><img src="img/<%=g.getPicture()%>" alt="" class="product-thumb"></a>
                        <h2><a href="goodDetail.jsp?goodsID=<%=g.getID()%>"><%=g.getGoodsName()%></a></h2>
                        <div class="product-wid-rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                        </div>
                        <div class="product-wid-price">
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
</div> <!-- End product widget area -->
<%@ include file="common-footer.jsp"%>
