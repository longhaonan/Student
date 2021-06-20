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
        padding-top: 1px;
        margin-top: 0px;
        margin-bottom: 4px;
    }

</style>

</head>
<body>
    <div class="location">
        <i class="fa fa-home">
            课 程 管 理
        </i>
    </div>
    <div>
        <form id="form_querycourse" method="post" action="Manager?method=qc"><%--        qc=query_course--%>
            课程查询:
            <input type="text" id="coursename" name="coursename" value="${coursename}" placeholder="输入课程名称" required autofocus>
            <button class="btn btn-info" type="button" id="QcBtn" name="QcBtn">
                <i class="fa fa-search-plus"></i>
                查询
            </button>
            <button class="btn btn-info" type="button" id="addCourseBtn" name="addCourseBtn" data-toggle="modal" data-target="#courseModaladd">
                <i class="fa fa-plus-square"></i>
                添加课程
            </button>
        </form>



    </div>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">课程号</th>
                <th scope="col">课程名称</th>
                <th scope="col">开设学院</th>
                <th scope="col">学分</th>
                <th scope="col">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${showCourse}" step="1">
                <tr>
                    <td>${course.course_id}</td>
                    <td>${course.title}</td>
                    <td>${course.dept_name}</td>
                    <td>${course.credits}</td>
                    <td>
                        <button class="btn btn-success" id="changeInfo" type="button" data-toggle="modal" data-target="#courseModalchange"  data-id='${course.course_id}' data-title='${course.title}' data-credits='${course.credits}' data-deptname='${course.dept_name}'>
                            修改信息
                        </button>
                        <button class="btn btn-danger" id="deleteCourse" type="button" onclick="confirmDel('${course.course_id}')">
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="courseModalchange" tabindex="-1" aria-labelledby="changeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changeModalLabel">修改信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="form_course" method="post" action="Manager?method=cc"><%--cc=course_change--%>
                        <div class="form-group">
                            <label for="ID" class="col-form-label">课程号:</label>
                            <span id="msg1" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="ID" name="ID" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="title" class="col-form-label">课程名:</label>
                            <span id="msg2" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                        <div class="form-group">
                            <label for="deptname" class="col-form-label">开设学院:</label>
                            <select id="deptname" name="deptname">
                                <c:forEach var="dept" items="${department}" step="1">
                                    <option value="${dept.dept_name}">${dept.dept_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="credits" class="col-form-label">学分:</label>
                            <span id="msg3" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="credits" name="credits">
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

    <div class="modal fade" id="courseModaladd" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">添加课程</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="form_addcourse" method="post" action="Manager?method=add_c">
                        <div class="form-group">
                            <label for="ID_add" class="col-form-label">课程号:</label>
                            <span id="msg4" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="ID_add" name="ID_add">
                        </div>
                        <div class="form-group">
                            <label for="title_add" class="col-form-label">课程名称:</label>
                            <span id="msg5" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="title_add" name="title_add">
                        </div>
                        <div class="form-group">
                            <label for="deptname_add" class="col-form-label">开设学院:</label>
                            <span id="msg7" style="font-size:12px;color: red"></span>
                            <select id="deptname_add" name="deptname_add">
                                <option value="">--请选择--</option>
                                <c:forEach var="dept" items="${department}" begin="0" step="1">
                                    <option value="${dept.dept_name}">${dept.dept_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="credits_add" class="col-form-label">学分:</label>
                            <span id="msg6" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="credits_add" name="credits_add">
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
        $('#courseModalchange').on('show.bs.modal', function (event) {
            $("#msg1").html("");
            $("#msg2").html("");
            $("#msg3").html("");
            var button = $(event.relatedTarget) // Button that triggered the modal
            var ID = button.data('id') // Extract info from data-* attributes
            var title = button.data('title')
            var credits = button.data('credits')
            var dept_name = button.data('deptname')

            var modal = $(this)
            modal.find('.modal-title').text('修改信息:'+ID+'-'+title)
            modal.find('#ID').val(ID)
            modal.find('#title').val(title)
            modal.find('#credits').val(credits)
            modal.find('#deptname').val(dept_name)

        })
        // 添加课程的模态框初始化
        $('#courseModaladd').on('show.bs.modal', function (event) {
            $("#msg4").html("");
            $("#msg5").html("");
            $("#msg7").html("");
            $("#msg6").html("");

            var modal = $(this)
            modal.find('#ID_add').val("")
            modal.find('#title_add').val("")
            modal.find('#credits_add').val("")
            modal.find('#deptname_add').val("")
        })


        $("#QcBtn").click(function () {
            $("#form_querycourse").submit();
        })
        // 更改课程信息时检验输入不为空
        $("#changeBtn").click(function () {
            // 获取用户姓名和密码的值
            var id = $("#ID").val();
            var title = $("#title").val();
            var credits = $('#credits').val();
            var dept_name = $('#deptname').val();
            var credits_test = /^[1-5]$/
            $("#msg1").html("");
            $("#msg2").html("");
            $("#msg3").html("");
            if (isEmpty(id)){
                $("#msg1").html("课程号不能为空！");
                return;
            }

            if (isEmpty(title)){
                $("#msg2").html("课程名不能为空！");
                return;
            }

            if (isEmpty(credits)){
                $("#msg3").html("学分不能为空！");
                return;
            }
            if (!credits_test.test(credits)){
                $("#msg3").html("学分只能是1-5的整数！");
                return;
            }

            $("#form_course").submit();
        })
        // 添加课程时检验输入
        $("#addBtn").click(function () {
            // 获取用户姓名和密码的值
            var id = $("#ID_add").val();
            var title = $("#title_add").val();
            var credits = $('#credits_add').val();
            var dept_name = $('#deptname_add').val();

            $("#msg4").html("");
            $("#msg5").html("");
            $("#msg6").html("");
            $("#msg7").html("");
            if (isEmpty(id)){
                $("#msg4").html("课程号不能为空！");
                return;
            }

            if (isEmpty(title)){
                $("#msg5").html("课程名称不能为空！");
                return;
            }

            if (isEmpty(dept_name)){
                $("#msg7").html("学院不能为空！");
                return;
            }

            if (isEmpty(credits)){
                $("#msg6").html("学分不能为空！");
                return;
            }



            var id_test = /^\d{3,3}$/;
            var credits_test = /^[1-5]$/
            if (!id_test.test(id)){
                $("#msg4").html("课程号只能是3位数字！");
                return;
            }
            if (!credits_test.test(credits)){
                $("#msg6").html("学分只能是1-5的整数！");
                return;
            }

            $("#form_addcourse").submit();
        })

        var errori = '<%=request.getParameter("error")%>'
        if (errori=='yes'){
            alert("该课程号已存在！");
        }
        else if(errori=='no'){
            alert("添加成功！")
        }
// 删除学生
        function confirmDel(ID){

            var path =  "Manager?method=deleteC&ID="+ID

            if (window.confirm("确定删除该课程？")){
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