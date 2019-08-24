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

@WebServlet("/findGoodsServlet")
public class FindGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String id=request.getParameter("ID");

        GoodsService service=new GoodsServiceImmpl();

        Goods good=service.findGoodByid(id);

        //将good存入request
        request.setAttribute("good",good);

        //转发update.jsp
        request.getRequestDispatcher("/update.jsp").forward(request,response);//主要是商品信息的回显
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
