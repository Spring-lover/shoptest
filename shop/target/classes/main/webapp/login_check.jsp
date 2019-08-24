<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/5
  Time: 8:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- 导入java.sql.ResultSet类 --%>

<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="main.shop.model.Member" %>
<%-- 创建ConnDB类的对象 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>login_check</title>
    <link href="img/me.ico" rel="icon" type="image/x-icon" />
</head>
<body>
<%

    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    String username = request.getParameter("username");//获取账户

    try {//捕捉异常
        String sql="select * from tb_Member where username = ? ";
        Member m = template.queryForObject(sql, new BeanPropertyRowMapper<Member>(Member.class), username);
        System.out.println(m.toString());
        if (m!=null) {//如果找到相应的账号
            String PWD = request.getParameter("password");//获取密码
            if (PWD.equals(m.getPassword())) {//如果输入的密码和获取的密码一致
                //把当前的账户保存到Session中，实现登录
                session.setAttribute("username", username);//key-value
                request.setAttribute("username",username);
                response.sendRedirect("index.jsp");//跳转到前台首页
            } else {
                out.println(
                        "<script language='javascript'>alert('您输入的用户名或密码错误，请与管理员联系!');"
                        +"window.location.href='login.jsp';</script>");
            }
        } else {
            out.println(
                    "<script language='javascript'>alert('您输入的用户名或密码错误，或您的账户"+
                            "已经被冻结，请与管理员联系!');window.location.href='login.jsp';</script>");
        }
    } catch (Exception e) {//处理异常
        out.println(
                "<script language='javascript'>alert('您的操作有误!');"
                        +"window.location.href='login.jsp';</script>");
    }
%>
</body>
</html>
