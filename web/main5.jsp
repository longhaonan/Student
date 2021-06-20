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
        margin-bottom: 2px;
    }

</style>
<script type="text/javascript">
    function setCookie(name, value) {
        var exp = new Date();
        exp.setTime(exp.getTime() + 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }
    function getCookie(name)
    {
        var regExp = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        var arr = document.cookie.match(regExp);
        if (arr == null) {
            return null;
        }
        return unescape(arr[2]);
    }

</script>
</head>
<body>
    <div class="location">
        <i class="fa fa-home">
            成 绩 查 询
        </i>
    </div>

    <div>
        <form id="form_grade" method="post" action="QueryGrade">
            学年学期:
            <select id="grade" name="grade" onclick="setCookie('grade',this.selectedIndex)">

            <option value="2020-fall">
                2020秋季学期
            </option>
            <option value="2020-spring">
                2020春季学期
            </option>
        </select>
            <button class="btn btn-info" type="button" id="GradeBtn" name="GradeBtn">
                <i class="fa fa-search-plus"></i>
                查询
            </button>
        </form>
    </div>

    <div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">课程号</th>
                <th scope="col">课程名</th>
                <th scope="col">学分</th>
                <th scope="col">成绩</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="grade" items="${grade}" step="1">
                <tr>
                    <td>${grade.course_id}</td>
                    <td>${grade.title}</td>
                    <td>${grade.credits}</td>
                    <td>${grade.grade}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

<script src="<%=basePath%>js/jquery-3.6.0.min.js"></script>
<script>

    var selectedIndex = getCookie("grade");
    if(selectedIndex != null) {
        document.getElementById("grade").selectedIndex = selectedIndex;
    }


    // 登录验证 账号密码不能为空
    $("#GradeBtn").click(function () {
        $("#form_grade").submit();
    })

</script>
</body>
</html>

