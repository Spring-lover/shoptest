package main.web.servlet;

import main.domain.Member;
import main.service.MemberService;
import main.service.impl.MemberServiceImpl;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");

        //2.获取数据
        //2.1获取用户填写验证码
        String verifycode = request.getParameter("verifycode");

        //3.验证码校验
        HttpSession session = request.getSession();
        String checkcode_server = (String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");//确保验证码一次性
        if(!checkcode_server.equalsIgnoreCase(verifycode)){
            //验证码不正确
            //提示信息
            request.setAttribute("login_msg","验证码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        System.out.println("username"+username);
        System.out.println("password"+password);
        //4.封装Member对象
        Member member=new Member();
        member.setUsername(username);
        member.setPassword(password);
//        System.out.println(member);
        //5.调用Service查询
        MemberService service = new MemberServiceImpl();
        Member loginMember = service.login(member);

        //6.判断是否登录成功
        if(loginMember != null){
            //登录成功
            //将用户存入session
            session.setAttribute("member",loginMember);
            session.setAttribute("username",username);
            //跳转页面
            response.sendRedirect("/managertest/index.jsp");
        }else{
            //登录失败
            //提示信息
            request.setAttribute("login_msg","用户名或密码错误！");
            //跳转登录页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);

        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}

