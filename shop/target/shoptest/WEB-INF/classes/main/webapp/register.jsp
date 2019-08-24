<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/4
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Myshop</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/materialize.min.css">
    <link rel="stylesheet" href="css/tooplate.css">
    <link href="img/me.ico" rel="icon" type="image/x-icon" />
</head>

<body id="register">
<div class="container">
    <div class="row tm-register-row">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-register-col-l">
            <form action="register_deal.jsp" method="post" onsubmit="return regis();">
                <div class="input-field">
                    <input placeholder="Username" id="username" name="username" type="text" class="validate">
                </div>
                <div class="input-field">
                    <input placeholder="Password" id="pwd" name="password" type="password" class="validate">
                </div>
                <div class="input-field">
                    <input placeholder="再次输入密码" id="pwd2" name="R_password" type="password" class="validate">
                </div>
                <div class="input-field">
                    <input placeholder="Tel" id="tel" name="tel" type="text" class="validate">
                </div>
                <div class="input-field">
                    <input placeholder="Eamil" id="eamil" name="eamil" type="text" class="validate">
                </div>
                <div class="text-right mt-4">
                    <button type="submit" class="waves-effect btn-large btn-large-white px-4 black-text">SUBMIT</button>
                </div>
            </form>
        </div>
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-register-col-r">
            <header class="mb-5">
                <h3 class="mt-0 text-white">REGISTER Yourself</h3>
                <p class="grey-text">Aenean tincidunt, enim nec blandit lobortis, ante enim ultrices eros, et laoreet augue libero id nunc.
                    Proin semper feugiat ultrices.</p>
                <p class="grey-text">Aenean a efficitur magna, sed dignissim odio. Praesent pretium lectus ac nunc ultrices, ac volutpat orci
                    viverra.
                </p>
            </header>

        </div>
    </div>
    <footer class="row tm-mt-big mb-3">

    </footer>
</div>

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script src="js/materialize.min.js"></script>
<%--<script>--%>
<%--    $(document).ready(function () {--%>
<%--        $('select').formSelect();--%>
<%--    });--%>
<%--</script>--%>
<script>
    function regis() {
        /* ----------- 验证输入的账户是否合法 ------------------------- */
        if (/^[\u4e00-\u9fa5]+$/.test($('#username').val())) {
            alert("账户不能输入汉字！");
            return false;
        }
        /* ----------- 验证输入的联系电话是否合法 --------------------- */
        if (isNaN($('#tel').val())) {
            alert("联系电话请输入数字");
            return false;
        }
        /* ----------- 验证两次输入的密码是否一致 --------------------- */
        var pwd = document.getElementById("pwd").value;
        var pwd2 = document.getElementById("pwd2").value;
        if (pwd !== pwd2) {
            alert('密码前后不一致！');
            return false;
        }
        return true;
    }
</script>
</body>

</html>