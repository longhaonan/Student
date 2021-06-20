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

</head>
<body>
    <div class="location">
        <i class="fa fa-home">
            课 表
        </i>
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
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getSec_id()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
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
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getSec_id()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
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
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getSec_id()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
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
                            out.print("<td>"+schedule.get(i).getTitle()+"<br>"+schedule.get(i).getSec_id()+"<br>"+schedule.get(i).getBuilding()+"<br>"+schedule.get(i).getRoom_number()+"</td>");
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

</body>
</html>

