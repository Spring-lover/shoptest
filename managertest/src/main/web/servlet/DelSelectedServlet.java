package main.web.servlet;

import main.service.GoodsService;
import main.service.impl.GoodsServiceImmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delSelectedServlet")
public class DelSelectedServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] gids = request.getParameterValues("gid");
        System.out.println(gids);
        GoodsService service=new GoodsServiceImmpl();

        service.delSelectedGoods(gids);

        response.sendRedirect(request.getContextPath()+"/findGoodsByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
