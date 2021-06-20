<%@ page trimDirectiveWhitespaces="true" %>
<%@ page pageEncoding="UTF-8" language="java" %>

<%@ include file="header.jsp" %>
<title>四川大学学生选课系统</title>
<link rel="stylesheet" href="css/index.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
<div class="header">
    <div class="logo">四川大学学生选课系统</div>
    <div class="user">
        <i class="fa fa-caret-down point"></i>
        <i class="fa fa-user"></i>
        ${instructor.i_name}
        <ul>
            <li>
                <i class="fa fa-home"></i>
                <a href="i_main.jsp" target="iframe">首页</a>
            </li>
            <li>
                <i class="fa fa-power-off"></i>
                <a href="logout">退出登录</a>
            </li>
        </ul>
    </div>
</div>
<div class="left">
    <div class="menux">
        <p>
            <i class="fa fa-book"></i>
            课程管理
            <i class="fa fa-angle-down point"></i>
        </p>
        <ul>
            <li>
                <a href="QueryInstructor?method=course" target="iframe">查看课程</a>
            </li>
            <li>
                <a href="QueryInstructor?method=TT" target="iframe">查看课表</a>
            </li>
        </ul>



    </div>
</div>

<div class="main">
    <iframe src="i_main.jsp" width="100%" height="100%" frameborder="0px" name="iframe"></iframe>
</div>
<script src="js/jquery-3.6.0.min.js"></script>
<script>
    $(function (){
        // 导航手风琴效果
        $('.menux').on("click", "p", function (){
            var next = $(this).next();
            next.slideToggle(200);
            $("ul").not(next).slideUp(200);
        });
        // a标签跳转到iframe
        /*$('a').click(function (){
          $('iframe').attr("src",$(this).attr("url"));
        });*/
    })

</script>
</body>
</html>