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
            教师管理
        </i>
    </div>
    <div>
        <form id="form_queryinstructor" method="post" action="Manager?method=qi"><%--        qi=query_instructor--%>
            教师查询:
            <input type="text" id="instructorname" name="instructorname" value="${instructorname}" placeholder="输入教师姓名" required autofocus>
            <button class="btn btn-info" type="button" id="QiBtn" name="QiBtn">
                <i class="fa fa-search-plus"></i>
                查询
            </button>
            <button class="btn btn-info" type="button" id="addinstructorBtn" name="addinstructorBtn" data-toggle="modal" data-target="#instructorModaladd">
                <i class="fa fa-plus-square"></i>
                添加教师
            </button>
        </form>



    </div>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">教工号</th>
                <th scope="col">密码</th>
                <th scope="col">姓名</th>
                <th scope="col">学院</th>
                <th scope="col">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="instructor" items="${showinstructor}" step="1">
                <tr>
                    <td>${instructor.i_ID}</td>
                    <td>${instructor.password}</td>
                    <td>${instructor.i_name}</td>
                    <td>${instructor.dept_name}</td>
                    <td>
                        <button class="btn btn-success" id="changeInfo" type="button" data-toggle="modal" data-target="#instructorModalchange"  data-id='${instructor.i_ID}' data-pwd='${instructor.password}' data-name='${instructor.i_name}' data-deptname='${instructor.dept_name}'>
                            修改信息
                        </button>
                        <button class="btn btn-danger" id="deleteinstructor" type="button" onclick="confirmDel('${instructor.i_ID}')">
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="instructorModalchange" tabindex="-1" aria-labelledby="changeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="changeModalLabel">修改信息</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="form_instructor" method="post" action="Manager?method=ic"><%--ic=instructor_change--%>
                        <div class="form-group">
                            <label for="ID" class="col-form-label">教工号:</label>
                            <span id="msg1" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="ID" name="ID" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-form-label">密码:</label>
                            <span id="msg2" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="password" name="password">
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-form-label">姓名:</label>
                            <span id="msg3" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="name" name="name">
                        </div>
                        <div class="form-group">
                            <label for="deptname" class="col-form-label">学院:</label>
                            <select id="deptname" name="deptname">
                                <c:forEach var="dept" items="${department}" step="1">
                                    <option value="${dept.dept_name}">${dept.dept_name}</option>
                                </c:forEach>
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

    <div class="modal fade" id="instructorModaladd" tabindex="-1" aria-labelledby="addModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModalLabel">添加教师</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form id="form_addinstructor" method="post" action="Manager?method=add_i">
                        <div class="form-group">
                            <label for="ID_add" class="col-form-label">教工号:</label>
                            <span id="msg4" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="ID_add" name="ID_add">
                        </div>
                        <div class="form-group">
                            <label for="password_add" class="col-form-label">密码:</label>
                            <span id="msg5" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="password_add" name="password_add">
                        </div>
                        <div class="form-group">
                            <label for="name_add" class="col-form-label">姓名:</label>
                            <span id="msg6" style="font-size:12px;color: red"></span>
                            <input type="text" class="form-control" id="name_add" name="name_add">
                        </div>
                        <div class="form-group">
                            <label for="deptname_add" class="col-form-label">学院:</label>
                            <span id="msg7" style="font-size:12px;color: red"></span>
                            <select id="deptname_add" name="deptname_add">
                                <option value="">--请选择--</option>
                                <c:forEach var="dept" items="${department}" begin="0" step="1">
                                    <option value="${dept.dept_name}">${dept.dept_name}</option>
                                </c:forEach>
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
        $('#instructorModalchange').on('show.bs.modal', function (event) {
            $("#msg1").html("");
            $("#msg2").html("");
            $("#msg3").html("");
            var button = $(event.relatedTarget) // Button that triggered the modal
            var ID = button.data('id') // Extract info from data-* attributes
            var pwd = button.data('pwd')
            var name = button.data('name')
            var dept_name = button.data('deptname')

            var modal = $(this)
            modal.find('.modal-title').text('修改信息:'+ID+'-'+name)
            modal.find('#ID').val(ID)
            modal.find('#password').val(pwd)
            modal.find('#name').val(name)
            modal.find('#deptname').val(dept_name)

        })

        $('#instructorModaladd').on('show.bs.modal', function (event) {
            $("#msg4").html("");
            $("#msg5").html("");
            $("#msg6").html("");
            $("#msg7").html("");
            var modal = $(this)
            modal.find('#ID_add').val("")
            modal.find('#password_add').val("")
            modal.find('#name_add').val("")
            modal.find('#deptname_add').val("")
        })


        $("#QiBtn").click(function () {
            $("#form_queryinstructor").submit();
        })
        $("#changeBtn").click(function () {
            // 获取用户姓名和密码的值
            var id = $("#ID").val();
            var password = $("#password").val();
            var name = $('#name').val();
            var dept_name = $('#deptname').val();
            $("#msg1").html("");
            $("#msg2").html("");
            $("#msg3").html("");
            if (isEmpty(id)){
                $("#msg1").html("教工号不能为空！");
                return;
            }

            if (isEmpty(password)){
                $("#msg2").html("密码不能为空！");
                return;
            }

            if (isEmpty(name)){
                $("#msg3").html("姓名不能为空！");
                return;
            }

            $("#form_instructor").submit();
        })
// 添加教师检验
        $("#addBtn").click(function () {
            // 获取用户姓名和密码的值
            var id = $("#ID_add").val();
            var password = $("#password_add").val();
            var name = $('#name_add').val();
            var dept_name = $('#deptname_add').val();
            $("#msg4").html("");
            $("#msg5").html("");
            $("#msg6").html("");
            $("#msg7").html("");
            if (isEmpty(id)){
                $("#msg4").html("教工号不能为空！");
                return;
            }

            if (isEmpty(password)){
                $("#msg5").html("密码不能为空！");
                return;
            }

            if (isEmpty(name)){
                $("#msg6").html("姓名不能为空！");
                return;
            }

            if (isEmpty(dept_name)){
                $("#msg7").html("学院不能为空！");
                return;
            }

            var id_test = /^\d{4,4}$/;
            var pwd_test = /^\d{6,6}$/
            if (!id_test.test(id)){
                $("#msg4").html("教工号只能是4位数字！");
                return;
            }
            if (!pwd_test.test(password)){
                $("#msg5").html("密码只能是6位数字！");
                return;
            }

            $("#form_addinstructor").submit();
        })
// 检验数据库是否存在该值
        var errori = '<%=request.getParameter("error")%>'
        if (errori=='yes'){
            alert("该教工号已存在！");
        }
        else if(errori=='no'){
            alert("添加成功！")
        }
// 删除教师
        function confirmDel(ID){

            var path =  "Manager?method=deleteI&ID="+ID

            if (window.confirm("确定删除该教师？")){
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