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
            选 课 界 面
        </i>
    </div>

    <div>
        <form id="form_querycourse" method="post" action="QueryCourse">
            课程查询:
            <input type="text" id="coursename" name="coursename" value="${coursename}" placeholder="输入课程名" required autofocus>
            <button class="btn btn-info" type="button" id="SectionBtn" name="SectionBtn">
                <i class="fa fa-search-plus"></i>
                查询
            </button>
        </form>
    </div>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">课程号</th>
                <th scope="col">课程名</th>
                <th scope="col">教师</th>
                <th scope="col">上课地点</th>
                <th scope="col">上课时间</th>
                <th scope="col">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="section" items="${course_section}" step="1">
                <tr>
                    <td>${section.course_id}</td>
                    <td>${section.title}</td>
                    <td>${section.i_name}</td>
                    <td>${section.building} ${section.room_number}</td>
                    <td>${section.day}&nbsp${section.start_hr}:${section.start_min}-${section.end_hr}:${section.end_min}</td>
                    <td>
                        <button class="btn btn-success" id="addcourse" type="button" onclick="window.location.href='QueryCourse?method=add&course_id=${section.course_id}&sec_id=${section.sec_id}&time_slot_id=${section.time_slot_id}&year=2021&semester=spring'">
                            选课
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


<script src="<%=basePath%>js/jquery-3.6.0.min.js"></script>
<script>

    var errori = '<%=request.getParameter("error")%>'
    if (errori=='yes'){
        alert("该课程段已有课程。");
    }
    else if(errori=='no'){
        alert("选课成功！")
    }

    $("#SectionBtn").click(function () {
        $("#form_querycourse").submit();
    })

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

