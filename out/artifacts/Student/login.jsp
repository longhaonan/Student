<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/4/29
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath%>">
    <link rel="icon" href="<%=basePath%>favicon.ico">
    <link rel="stylesheet" href="css/bootstrap.min.css">
<title>登 录</title>
<style>
    html {
        height: 100%;
    }

    body {
        height: 100%;
        background-image: url("img/background.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
    h2{
        padding-top: 5px;
        text-align: center;
    }
    #login {
        background: rgba(255, 255, 255, .6);
        padding-bottom: 2%;
    }

    #login .input-group {
        margin: 2% auto;
    }
    .btnx{
        text-align: center;
        padding-top: 5px;
    }
    #loginBtn{

        width: 100%;
    }
    .identity{
        text-align: center;
    }
</style>
</head>
<body>
<div class="container">
    <div class="col-lg-4 col-md-6 col-sm-8 col-xs-10 mycenter" id="login">
        <h2>
            登 录
        </h2>
        <form class="form" method="post" id="form" action="login">
            <div class="input-group">
                <label for="id" class="col-form-label">
                    账 号:&nbsp
                </label>
                <input type="text" id="id" name="id" class="form-control"  placeholder="学号\教工号" required autofocus>
            </div>
            <div class="input-group">
                <label for="password" class="col-form-label">
                    密 码:&nbsp
                </label>
                <input type="password" id="password" name="password" class="form-control" placeholder="密码为身份证后六位" required>
            </div>

            <div class="identity">
                <span id="msg" style="font-size:12px;color: red">${messageModel.msg}</span> <br>
                <input type="radio" name="identity" id="student" value="student" checked/><label for="student">学 生</label>
                <input type="radio" name="identity" id="professor" value="professor" /><label for="professor">教 师</label>
                <input type="radio" name="identity" id="manager" value="manager" /><label for="manager">管理员</label>
            </div>
            <div class="btnx">
            <button class="btn btn-success" type="button" id="loginBtn" name="loginBtn">登 录</button>
            </div>
        </form>
    </div>
</div>
<script src="<%=basePath%>js/jquery-3.6.0.min.js"></script>
<script>
    // 登录验证 账号密码不能为空
    $("#loginBtn").click(function () {
        // 获取用户姓名和密码的值
        var id = $("#id").val();
        var password = $("#password").val();

        if (isEmpty(id)){
            $("#msg").html("账号不能为空！");
            return;
        }

        if (isEmpty(password)){
            $("#msg").html("密码不能为空！");
            return;
        }
        $("#form").submit();
    })

    function isEmpty(str){
        if(str == null || str.trim() == ""){
            return true;
        }
        else return false;
    }
    // 回车登录
    $(document).keydown(function(event){
        if(event.keyCode==13){
        document.getElementById("loginBtn").click();
    }
    });

</script>
<script src="<%=basePath%>js/user.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>

</body>
</html>
