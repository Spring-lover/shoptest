<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/6
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="common-header.jsp"%>
<%
    String sum=request.getParameter("sum");
    System.out.println(sum);
%>
<style>
    .pay{
        /*设置外边距*/
        text-align: center;	/*设置居中对齐*/
        left: 200px;
    }
</style>
<script>
    alert("Pay For Me"+<%=sum%>);
</script>
<div class="pay"><img src="img/payme.jpg" width="500" href="500px"><div>
<%@ include file="common-footer.jsp"%>