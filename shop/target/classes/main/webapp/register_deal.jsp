<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/4
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %>
<%@ page import="org.springframework.jdbc.core.BeanPropertyRowMapper" %>
<%@ page import="main.shop.dao.MemberDao" %>
<%@ page import="main.shop.dao.impl.Memberimpl" %>
<%@ page import="main.shop.model.Member" %>
<%@ page import="java.util.List" %>
<%-- 创建ConnDB类的对象 --%>
<%-- 创建MemberDaoImpl类的对象 --%>
<%-- 创建Member类的对象，并对Member类的所有属性进行赋值 --%>
<jsp:useBean id="member" scope="request" class="main.shop.model.Member">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>register_deal</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");//设置请求的编码为UTF-8
    String username = member.getUsername();//获取会员账号

    System.out.println(username);
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    MemberDao ins_member=new Memberimpl();
    String sql="select * from tb_Member where username = ?";
    Member m;
    try{
        m=template.queryForObject(sql,new BeanPropertyRowMapper<Member>(Member.class), username);
    }catch (Exception e){
        m=null;
    }
    if (m!=null) {//如果结果集中有数据
        out.println("<script language='javascript'>alert('该账号已经存在，请重新注册！');"
                + "window.location.href='register.jsp';</script>");
    }
    else {
        int ret = 0;//记录更新记录条数的变量
        ret = ins_member.insert(member);//将填写的会员信息保存到数据库
        if (ret != 0) {
            session.setAttribute("username", username);//将会员账号保存到Session中
            out.println("<script language='javascript'>alert('会员注册成功！');"
                    + "window.location.href='login.jsp';</script>");
        } else {
            out.println("<script language='javascript'>alert('会员注册失败！');"
                    + "window.location.href='register.jsp';</script>");
        }
    }
%>
</body>
</html>