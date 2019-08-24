<%--
  Created by IntelliJ IDEA.
  User: Misser
  Date: 2019/7/4
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MyshopLogin</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/materialize.min.css">
    <link rel="stylesheet" href="css/tooplate.css">
    <link href="img/me.ico" rel="icon" type="image/x-icon" />
</head>

<body id="login">
<div class="container">
    <div class="row tm-register-row tm-mb-35">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-l">
            <form action="login_check.jsp" method="post" class="tm-bg-black p-5 h-100">
                <div class="input-field">
                    <input placeholder="Username" id="username" name="username" type="text" class="validate">
                </div>
                <div class="input-field mb-5">
                    <input placeholder="Password" id="password" name="password" type="password" class="validate">
                </div>
                <div class="tm-flex-lr">
                    <a href="#" class="white-text small">Forgot Password?</a>
                    <button type="submit" class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">Login</button>
                </div>
            </form>
        </div>
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-r">
            <header class="font-weight-light tm-bg-black p-5 h-100">
                <h3 class="mt-0 text-white font-weight-light">Your Login</h3>
                <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p>
                <p class="mb-0">Vestibulum neque neque, porttitor quis lacinia eu, iaculis id dui. Mauris quis velit lectus.</p>
            </header>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 ml-auto mr-0 text-center">
            <a href="register.jsp" class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">Create New Account</a>
        </div>
    </div>
    <footer class="row tm-mt-big mb-3">
        <div class="col-xl-12 text-center">
        </div>
    </footer>
</div>

<script src="js/jquery-3.2.1.slim.min.js"></script>
<script src="js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('select').formSelect();
    });
</script>
</body>

</html>