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
    th{
        text-align: center;
    }

    td{
        padding: 0px;
        text-align: center;
        width: 250px;
        height: 105px;
    }

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
            课 表
        </i>
    </div>

    <div>
        <form id="form_take" method="post" action="QueryTimetable">
            学年学期:
            <select id="semester" name="semester" onclick="setCookie('semester',this.selectedIndex)">
            <option value="2021-spring">
                2021春季学期
            </option>
            <option value="2020-fall">
                2020秋季学期
            </option>
            <option value="2020-spring">
                2020春季学期
            </option>
        </select>
            <button class="btn btn-info" type="button" id="TakeBtn" name="TakeBtn">
                <i class="fa fa-search-plus"></i>
                查询
            </button>
        </form>
    </div>

    <div>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">节次</th>
                <th scope="col">星期一</th>
                <th scope="col">星期二</th>
                <th scope="col">星期三</th>
                <th scope="col">星期四</th>
                <th scope="col">星期五</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row" style="width:40px">
                    8:15<br>|<br>9:55
                </th>
<%--                <c:forEach var="schedule" items="${timetable}" begin="0" end="4" step="1"> </c:forEach>--%>
              <%
                  List<Take> schedule = (List<Take>) request.getSession().getAttribute("timetable");
                  for(int i=0;i<5;i++){
                        if (schedule.get(i)!=null){
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getI_name()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
                        }
                        else{
                            out.print("<td>"+"</td>");
                        }
                    }
                %>
            </tr>

            <tr>
                <th scope="row" style="width:40px">
                    10:15<br>|<br>11:55
                </th>
                <%
                    for(int i=5;i<10;i++){
                        if (schedule.get(i)!=null){
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getI_name()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
                        }
                        else{
                            out.print("<td>"+"</td>");
                        }
                    }
                %>
            </tr>

            <tr>
                <th scope="row" style="width:40px">
                    13:50<br>|<br>15:30
                </th>
                <%
                    for(int i=10;i<15;i++){
                        if (schedule.get(i)!=null){
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getI_name()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
                        }
                        else{
                            out.print("<td>"+"</td>");
                        }
                    }
                %>
            </tr>

            <tr>
                <th scope="row" style="width:40px">
                    15:40<br>|<br>17:30
                </th>
                <%
                    for(int i=15;i<20;i++){
                        if (schedule.get(i)!=null){
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getI_name()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
                        }
                        else{
                            out.print("<td>"+"</td>");
                        }
                    }
                %>
            </tr>


            </tbody>
        </table>
    </div>

<script src="<%=basePath%>js/jquery-3.6.0.min.js"></script>
<script>

    var selectedIndex = getCookie("semester");
    if(selectedIndex != null) {
        document.getElementById("semester").selectedIndex = selectedIndex;
    }


    // 登录验证 账号密码不能为空
    $("#TakeBtn").click(function () {
        $("#form_take").submit();
    })

</script>
</body>
</html>

