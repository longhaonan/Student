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
            课 程 安 排
        </i>
    </div>

    <div>
        <form id="form_querycourse" method="post" action="Arrangement?method=QC">
            课程查询:
            <input type="text" id="coursename" name="coursename" value="${coursename}" placeholder="输入课程名" required autofocus>
            <button class="btn btn-info" type="button" id="QCBtn" name="QCBtn">
                <i class="fa fa-search-plus"></i>
                查询
            </button>
            <button class="btn btn-info" type="button" id="addSectionBtn" name="addSectionBtn" data-toggle="modal" data-target="#sectionModaladd">
                <i class="fa fa-plus-square"></i>
                添加选课
            </button>
        </form>
    </div>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">课程号</th>
                <th scope="col">课程名</th>
                <th scope="col">课段号</th>
                <th scope="col">教工号</th>
                <th scope="col">教师</th>
                <th scope="col">教学楼</th>
                <th scope="col">教室</th>
                <th scope="col">上课时间</th>
                <th scope="col">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="section" items="${course_section}" step="1">
                <tr>
                    <td>${section.course_id}</td>
                    <td>${section.title}</td>
                    <td>${section.sec_id}</td>
                    <td>${section.i_ID}</td>
                    <td>${section.i_name}</td>
                    <td>${section.building}</td>
                    <td>${section.room_number}</td>
                    <td>${section.time_slot_id}</td>
                    <td>
                        <button class="btn btn-success" id="changeInfo" type="button" data-toggle="modal" data-target="#sectionModalchange"  data-course_id='${section.course_id}' data-title='${section.title}' data-sec_id='${section.sec_id}' data-i_id='${section.i_ID}' data-building='${section.building}' data-room_number='${section.room_number}' data-time='${section.time_slot_id}'>
                            修改信息
                        </button>
                        <button class="btn btn-danger" id="deleteSection" type="button" onclick="confirmDel('${section.course_id}','${section.sec_id}')">
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <div class="modal fade" id="sectionModalchange" tabindex="-1" aria-labelledby="changeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changeModalLabel">修改信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="form_section" method="post" action="Arrangement?method=SC">
                        <div class="form-group">
                            <label for="ID" class="col-form-label">课程号:</label>
                            <input type="text" class="form-control" id="ID" name="ID" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-form-label">课程名:</label>
                            <input type="text" class="form-control" id="title" name="title" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="sec_id" class="col-form-label">课段号:</label>
                            <input type="text" class="form-control" id="sec_id" name="sec_id" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="i_id" class="col-form-label">教师:</label>
                            <select id="i_id" name="i_id">
                                <c:forEach var="ins" items="${showinstructor}" step="1">
                                    <option value="${ins.i_ID}">${ins.i_ID}: ${ins.i_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="building" class="col-form-label">教学楼:</label>
                            <select id="building" name="building">
                                <option value="一教A">一教A</option>
                                <option value="一教B">一教B</option>
                                <option value="一教C">一教C</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="room_number" class="col-form-label">教室:</label>
                            <select id="room_number" name="room_number">
                                <option value="101">101</option>
                                <option value="102">102</option>
                                <option value="103">103</option>
                                <option value="104">104</option>
                                <option value="105">105</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="time" class="col-form-label">时间:</label>
                            <select id="time" name="time">
                                <option value="1">星期一第一大节</option>
                                <option value="6">星期一第二大节</option>
                                <option value="11">星期一第三大节</option>
                                <option value="16">星期一第四大节</option>
                                <option value="2">星期二第一大节</option>
                                <option value="7">星期二第二大节</option>
                                <option value="12">星期二第三大节</option>
                                <option value="17">星期二第四大节</option>
                                <option value="3">星期三第一大节</option>
                                <option value="8">星期三第二大节</option>
                                <option value="13">星期三第三大节</option>
                                <option value="18">星期三第四大节</option>
                                <option value="4">星期四第一大节</option>
                                <option value="9">星期四第二大节</option>
                                <option value="14">星期四第三大节</option>
                                <option value="19">星期四第四大节</option>
                                <option value="5">星期五第一大节</option>
                                <option value="10">星期五第二大节</option>
                                <option value="15">星期五第三大节</option>
                                <option value="20">星期五第四大节</option>
                            </select>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button id="changeBtn" type="button" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="sectionModaladd" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">添加选课</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="form_addsection" method="post" action="Arrangement?method=Sadd">
                        <div class="form-group">
                            <label for="ID_add" class="col-form-label">课程:</label>
                            <span id="msg1" style="font-size:12px;color: red"></span>
                            <select id="ID_add" name="ID_add">
                                <option value="" selected="selected">---请选择---</option>
                                <c:forEach var="course" items="${showCourse}" step="1">
                                    <option value="${course.course_id}">${course.course_id}: ${course.title}--${course.dept_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sec_id_add" class="col-form-label">课段号:</label>
                            <span id="msg2" style="font-size:12px;color: red"></span>
                            <select id="sec_id_add" name="sec_id_add">
                                <option value="" selected="selected">---请选择---</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="i_id_add" class="col-form-label">教师:</label>
                            <span id="msg3" style="font-size:12px;color: red"></span>
                            <select id="i_id_add" name="i_id_add">
                                <option value="" selected="selected">---请选择---</option>
                                <c:forEach var="ins" items="${showinstructor}" step="1">
                                    <option value="${ins.i_ID}">${ins.i_ID}: ${ins.i_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="building_add" class="col-form-label">教学楼:</label>
                            <span id="msg4" style="font-size:12px;color: red"></span>
                            <select id="building_add" name="building_add">
                                <option value="" selected="selected">---请选择---</option>
                                <option value="一教A">一教A</option>
                                <option value="一教B">一教B</option>
                                <option value="一教C">一教C</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="room_number_add" class="col-form-label">教室:</label>
                            <span id="msg5" style="font-size:12px;color: red"></span>
                            <select id="room_number_add" name="room_number_add">
                                <option value="" selected="selected">---请选择---</option>
                                <option value="101">101</option>
                                <option value="102">102</option>
                                <option value="103">103</option>
                                <option value="104">104</option>
                                <option value="105">105</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="time_add" class="col-form-label">时间:</label>
                            <span id="msg6" style="font-size:12px;color: red"></span>
                            <select id="time_add" name="time_add">
                                <option value="" selected="selected">---请选择---</option>
                                <option value="1">星期一第一大节</option>
                                <option value="6">星期一第二大节</option>
                                <option value="11">星期一第三大节</option>
                                <option value="16">星期一第四大节</option>
                                <option value="2">星期二第一大节</option>
                                <option value="7">星期二第二大节</option>
                                <option value="12">星期二第三大节</option>
                                <option value="17">星期二第四大节</option>
                                <option value="3">星期三第一大节</option>
                                <option value="8">星期三第二大节</option>
                                <option value="13">星期三第三大节</option>
                                <option value="18">星期三第四大节</option>
                                <option value="4">星期四第一大节</option>
                                <option value="9">星期四第二大节</option>
                                <option value="14">星期四第三大节</option>
                                <option value="19">星期四第四大节</option>
                                <option value="5">星期五第一大节</option>
                                <option value="10">星期五第二大节</option>
                                <option value="15">星期五第三大节</option>
                                <option value="20">星期五第四大节</option>
                            </select>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button id="addBtn" type="button" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>


    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>

    <!-- 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $("#QCBtn").click(function () {
            $("#form_querycourse").submit();
        })

        $('#sectionModalchange').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget)

            var course_id = button.data('course_id')
            var title = button.data('title')
            var sec_id=button.data('sec_id')
            var i_id=button.data('i_id')
            var building=button.data('building')
            var room_number=button.data('room_number')
            var time=button.data('time')

            var modal = $(this)
            modal.find('.modal-title').text('修改信息:'+course_id+'-'+title+'-'+sec_id)
            modal.find('#ID').val(course_id)
            modal.find('#title').val(title)
            modal.find('#sec_id').val(sec_id)
            modal.find('#i_id').val(i_id)
            modal.find('#building').val(building)
            modal.find('#room_number').val(room_number)
            modal.find('#time').val(time)

        })
        // 添加课程的模态框初始化
        $('#sectionModaladd').on('show.bs.modal', function (event) {
            $("#msg1").html("");
            $("#msg2").html("");
            $("#msg3").html("");
            $("#msg4").html("");
            $("#msg5").html("");
            $("#msg6").html("");

            var modal = $(this)
            modal.find('#ID_add').val("")
            modal.find('#sec_id_add').val("")
            modal.find('#i_id_add').val("")
            modal.find('#time_add').val("")
            modal.find('#building_add').val("")
            modal.find('#room_number_add').val("")
        })


        $("#QcBtn").click(function () {
            $("#form_querycourse").submit();
        })
        // 更改课程信息时检验输入不为空
        $("#changeBtn").click(function () {
            $("#form_section").submit();
        })
        // 添加课程时检验输入
        $("#addBtn").click(function () {
            // 获取用户姓名和密码的值
            var course_id = $("#ID_add").val();
            var sec_id = $("#sec_id_add").val();
            var i_id = $('#i_id_add').val();
            var time = $('#time_add').val();
            var building = $('#building_add').val();
            var room_number = $('#room_number_add').val();


            $("#msg1").html("");
            $("#msg2").html("");
            $("#msg3").html("");
            $("#msg4").html("");
            $("#msg5").html("");
            $("#msg6").html("");
            if (isEmpty(course_id)){
                $("#msg1").html("请选择课程！");
                return;
            }

            if (isEmpty(sec_id)){
                $("#msg2").html("请选择课段号！");
                return;
            }

            if (isEmpty(i_id)){
                $("#msg3").html("请选择教师！");
                return;
            }
            if (isEmpty(building)){
                $("#msg4").html("请选择教学楼！");
                return;
            }
            if (isEmpty(room_number)){
                $("#msg5").html("请选择教室！");
                return;
            }
            if (isEmpty(time)){
                $("#msg6").html("请选择时间！");
                return;
            }


            $("#form_addsection").submit();
        })

        var errori = '<%=request.getParameter("error")%>'
        var msg = '<%=request.getParameter("msg")%>'
        if (errori=='yes') alert(msg);
        else if (errori=='no') alert(msg);

        // 删除学生
        function confirmDel(course_id,sec_id){

            var path =  "Arrangement?method=deleteS&course_id="+ course_id + "&sec_id="+sec_id
            console.log(path);
            if (window.confirm("确定删除该选课？")){
                window.location.href=path;
            }
        }
        function isEmpty(str){
            if(str == null || str.trim() == ""){
                return true;
            }
            else return false;
        }

    </script>
</body>
</html>

