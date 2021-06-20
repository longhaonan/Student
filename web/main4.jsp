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



</head>
<body>
    <div class="location">
        <i class="fa fa-home">
            选 课 结 果
        </i>
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
            <c:forEach var="section" items="${section_result}" step="1">
                <tr>
                    <td>${section.course_id}</td>
                    <td>${section.title}</td>
                    <td>${section.i_name}</td>
                    <td>${section.building} ${section.room_number}</td>
                    <td>${section.day}&nbsp${section.start_hr}:${section.start_min}-${section.end_hr}:${section.end_min}</td>
                    <td>
                        <button class="btn btn-danger" id="deletecourse" type="button" onclick="confirmDel('${section.course_id}','${section.sec_id}')">
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


<script src="<%=basePath%>js/jquery-3.6.0.min.js"></script>
<script>
    function confirmDel(course_id,sec_id){

        var path =  "QueryCourse?method=delete&course_id="+course_id+"&sec_id="+sec_id+"&year=2021&semester=spring"

        if (window.confirm("确定删除课程？")){
            window.location.href=path;
        }
    }
</script>
</body>
</html>

