<%@ page import="org.springframework.jdbc.core.JdbcTemplate" %>
<%@ page import="main.shop.tools.JDBCUtils" %><%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/6
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username=request.getParameter("username");
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    String sql="update tb_member set status ='N' WHERE userName = ?";
    int update = template.update(sql, username);
    System.out.println(update);
    session.removeAttribute("username");//移除Session
    response.sendRedirect("login.jsp");//转到登陆
%>
<html>
<head>
    <title>Exit</title>
</head>
<body>

</body>
</html>
