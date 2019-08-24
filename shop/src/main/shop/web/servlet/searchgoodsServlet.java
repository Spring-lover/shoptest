package main.shop.web.servlet;

import com.fasterxml.jackson.databind.ObjectMapper;
import main.shop.model.Goods;
import main.shop.service.GoodsService;
import main.shop.service.impl.GoodsServiceImpl;
import org.springframework.jdbc.support.xml.SqlXmlObjectMappingHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/searchgoodsServlet")
public class searchgoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String condition;
        condition=request.getParameter("condition");
        if(condition.equals("")){
            condition="tv";
        }
        GoodsService service=new GoodsServiceImpl();
        List<Goods> list=service.findGoodsBySearch(condition);
        for(Goods g:list){
            System.out.println(g.toString());
        }
        request.setAttribute("goodslist",list);
        request.getRequestDispatcher("cart_see.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
