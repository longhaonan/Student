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
            查询教室安排
        </i>
    </div>

    <div>
        <form id="form_class" method="post" action="Arrangement?method=classroom">
            教学楼:
            <select id="building" name="building" onclick="setCookie('building',this.selectedIndex)">
            <option value="一教A">一教A</option>
            <option value="一教B">一教B</option>
            <option value="一教C">一教C</option>
            </select>
            教室:
            <select id="room_number" name="room_number" onclick="setCookie('room_number',this.selectedIndex)">
                <option value="101">101</option>
                <option value="102">102</option>
                <option value="103">103</option>
                <option value="104">104</option>
                <option value="105">105</option>
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
                  List<Take> schedule = (List<Take>) request.getSession().getAttribute("ClassArrange");
                  for(int i=0;i<5;i++){
                        if (schedule.get(i)!=null){
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getSec_id()+"<br>"+schedule.get(i).getI_ID()+"</td>");
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
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getSec_id()+"<br>"+schedule.get(i).getI_ID()+"</td>");
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
                        if (schedule.get(i)!=null) {
                            out.print("<td>" + schedule.get(i).getTitle() + "<br>" + schedule.get(i).getSec_id() + "<br>" + schedule.get(i).getI_ID() + "</td>");
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
                        if (schedule.get(i)!=null) {
                            out.print("<td>" + schedule.get(i).getTitle() + "<br>" + schedule.get(i).getSec_id() + "<br>" + schedule.get(i).getI_ID() + "</td>");
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

    var building = getCookie("building");
    var room_number = getCookie("room_number");
    if(building != null) {
        document.getElementById("building").selectedIndex = building;
    }
    if(room_number != null) {
        document.getElementById("room_number").selectedIndex = room_number;
    }


    // 登录验证 账号密码不能为空
    $("#TakeBtn").click(function () {
        $("#form_class").submit();
    })

</script>
</body>
</html>

