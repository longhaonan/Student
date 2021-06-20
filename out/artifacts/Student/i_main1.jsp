<%@ page import="java.util.List" %>
<%@ page import="entity.Take" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2021/5/30
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page pageEncoding="UTF-8" language="java" %>

<%@ include file="header.jsp" %>
    <title>Title</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">

<style>
    .btn-info{
        height: 24px;
        padding-top: 2px;
        margin-top: 0px;
        margin-bottom: 4px;
    }

</style>

</head>
<body>
    <div class="location">
        <i class="fa fa-home">
            查 看 课 程
        </i>
    </div>

    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">课程号</th>
                <th scope="col">课程名</th>
                <th scope="col">课程段</th>
                <th scope="col">学期</th>
                <th scope="col">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${course}" step="1">
                <tr>
                    <td>${course.course_id}</td>
                    <td>${course.title}</td>
                    <td>${course.sec_id}</td>
                    <td>${course.year}-${course.semester}</td>
                    <td>
                        <button class="btn btn-secondary" id="addcourse" type="button" onclick="window.location.href='QueryInstructor?method=check&course_id=${course.course_id}&title=${course.title}&sec_id=${course.sec_id}&year=${course.year}&semester=${course.semester}'">
                            查看详情
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


<script src="<%=basePath%>js/jquery-3.6.0.min.js"></script>
<script>


    <%--function add_course(){--%>
    <%--    var gnl=confirm("确定选这门课吗?");--%>
    <%--    if (gnl==true){--%>
    <%--        window.location.href="QueryCourse?method=add&course_id=${section.course_id}";--%>
    <%--    }else{--%>
    <%--        return false;--%>
    <%--    }--%>
    <%--}--%>

</script>
</body>
</html>

