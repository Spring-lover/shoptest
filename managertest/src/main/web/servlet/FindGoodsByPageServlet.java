package main.web.servlet;

import main.domain.Goods;
import main.domain.PageBean;
import main.service.GoodsService;
import main.service.impl.GoodsServiceImmpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet("/findGoodsByPageServlet")
public class FindGoodsByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取参数
        request.setCharacterEncoding("utf-8");
        String currentPage = request.getParameter("currentPage");
        String rows=request.getParameter("rows");
        if(currentPage == null || "".equals(currentPage)){
            currentPage = "1";
        }
        if(rows == null ||"".equals(rows)){
            rows="5";
        }
        System.out.println(currentPage);
        System.out.println(rows);
        //获取条件的参数
        Map<String,String[]> condition=request.getParameterMap();
        GoodsService service=new GoodsServiceImmpl();
        PageBean<Goods>pb=service.findGoodByPage(currentPage,rows,condition);

        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);//将查询条件存入request，将查询的条件依然保存在输入栏中
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
