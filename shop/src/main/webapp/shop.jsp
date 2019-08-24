<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="main.shop.model.PageBean" %>
<%@ page import="main.shop.service.GoodsService" %>
<%@ page import="main.shop.service.impl.GoodsServiceImpl" %>
<%@ page import="main.shop.model.Goods" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common-header.jsp"%>
<%@ page isELIgnored="false" %>
<%@ page import="main.shop.tools.imagePathUtils" %>
<%
    request.setCharacterEncoding("utf-8");
    //1.获取参数
    String currentPage = request.getParameter("currentPage");//当前页码
    System.out.println(currentPage);
    String rows = request.getParameter("rows");//每页显示条数

    if(currentPage == null || "".equals(currentPage)||currentPage=="0"){
        currentPage = "1";
    }
    if(rows == null || "".equals(rows)){
        rows = "4";
    }
    GoodsService service=new GoodsServiceImpl();
    PageBean pb=service.findGoodsByPage(currentPage,rows);

    List<Goods> list=pb.getList();
    for(Goods g:list){
        String imagepath=g.getPicture();
        System.out.println(imagepath);
        imagepath=imagePathUtils.imagePath(imagepath);
        System.out.println(imagepath);
        g.setPicture(imagepath);
        System.out.println(imagepath.length());
    }
    int totalPage=pb.getTotalPage();
    int currentpage=Integer.parseInt(currentPage);
%>
<div class="single-product-area">
    <div class="zigzag-bottom"></div>
    <div class="container">
        <div class="row">
        <%
            for(Goods good:list){
        %>
            <div class="col-md-3 col-sm-6">
                <div class="single-shop-product">
                    <div class="product-upper">
                        <img src="<%=good.getPicture()%>" alt="" width="430px" height="550px">
                    </div>
                    <h2><a href="goodDetail.jsp?goodsID=<%=good.getID()%>"><%=good.getGoodsName()%></a></h2>
                    <div class="product-carousel-price">
                        <ins><%=good.getPrice()%></ins> <del><%=good.getNowPrice()%></del>
                    </div>
                    <div class="product-option-shop">
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product-pagination text-center">
                    <nav>
                        <ul class="pagination">
                            <%
                                if(currentpage==1){
                            %>
                            <li class="disabled">
                                <a href="shop.jsp?currentPage=<%=Integer.parseInt(currentPage)-1%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%
                                }else{
                            %>
                            <li>
                                <a href="shop.jsp?currentPage=<%=Integer.parseInt(currentPage)-1%>" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <%
                                }%>

                            <%
                                for(int i=1;i<=totalPage;i++){
                            %>
                                <li><a href="shop.jsp?currentPage=<%=i%>"><%=i%></a></li>
                            <%
                                }
                            %>
                            <%
                                if(currentpage==totalPage){
                            %>
                            <li class="disabled">
                                <a href="shop.jsp?currentPage=<%=Integer.parseInt(currentPage)+1%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <%
                                }else{
                            %>
                            <li>
                                <a href="shop.jsp?currentPage=<%=Integer.parseInt(currentPage)+1%>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="common-footer.jsp"%>


