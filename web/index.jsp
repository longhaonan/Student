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
        ${user.name}
        <ul>
          <li>
            <i class="fa fa-home"></i>
            <a href="main1.jsp" target="iframe">首页</a>
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
        <i class="fa fa-user"></i>
        个人管理
        <i class="fa fa-angle-down point"></i>
      </p>
      <ul>
        <li>
          <a href="QueryTimetable?year=2021&semester=spring" target="iframe">查看课表</a>
        </li>
        <li>
          <a href="QueryGrade?year=2020&semester=fall" target="iframe">成绩查询</a>
        </li>
      </ul>

      <p>
        <i class="fa fa-shopping-cart"></i>
        选课管理
        <i class="fa fa-angle-down point"></i>
      </p>
      <ul>
        <li>
          <a href="QueryCourse?method=query" target="iframe">选课界面</a>
        </li>
        <li>
          <a href="QueryCourse?method=result" target="iframe">选课结果</a>
        </li>
      </ul>

    </div>
  </div>

  <div class="main">
    <iframe src="main1.jsp" width="100%" height="100%" frameborder="0px" name="iframe"></iframe>
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