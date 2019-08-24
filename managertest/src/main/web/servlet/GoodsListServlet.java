package main.web.servlet;

import main.domain.Goods;
import main.service.GoodsService;
import main.service.impl.GoodsServiceImmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/goodsListServlet")
public class GoodsListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //调用goodListServlet完成查询
        GoodsService service =new GoodsServiceImmpl();
        List<Goods> goods=service.findAll();
        System.out.println(goods);
        request.setAttribute("goods",goods);
        //转发到List.jsp上
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
