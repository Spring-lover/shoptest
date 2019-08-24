package main.web.servlet;


import main.service.GoodsService;
import main.service.impl.GoodsServiceImmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delGoodsServlet")
public class DelGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("ID");
        //调用service进行删除
        GoodsService service=new GoodsServiceImmpl();
        service.deleteGoods(id);
        //3.跳转到查询所有的goods

        response.sendRedirect("/managertest/findGoodsByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
