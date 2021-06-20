<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/30
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page pageEncoding="UTF-8" language="java" %>

<%@ include file="header.jsp" %>
    <title>Title</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

<style>
    .list-group-item{
        width: 400px;
        font-size: 25px;
    }

</style>

</head>
<body>
    <div class="location">
        <i class="fa fa-home">
            首 页
        </i>
    </div>

    <ul class="list-group">
        <li class="list-group-item">
            <i class="fa fa-user"></i>
            管理员：${manager.m_id}
        </li>
    </ul>
</body>
</html>
