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
            课程详情 ${info}
        </i>
    </div>

    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">学号</th>
                <th scope="col">姓名</th>
                <th scope="col">学院</th>
                <th scope="col">成绩</th>
                <th scope="col">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="check" items="${check_result}" step="1">
                <tr>
                    <td>${check.ID}</td>
                    <td>${check.name}</td>
                    <td>${check.dept_name}</td>
                    <td>${check.grade}</td>
                    <td>
                        <button class="btn btn-primary" id="changeGrade" type="button" data-toggle="modal" data-target="#exampleModal"  data-name='${check.name}' data-checkid='${check.ID}' data-deptname='${check.dept_name}' data-grade='${check.grade}'>
                            修改成绩
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">修改成绩</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form_change" method="post" action="QueryInstructor?info=${info}">
                        <div class="form-group">
                            <label for="ID" class="col-form-label">学号:</label>
                            <input type="text" class="form-control" id="ID" name="ID" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="name" class="col-form-label">姓名:</label>
                            <input type="text" class="form-control" id="name" name="name" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="deptname" class="col-form-label">学院:</label>
                            <input type="text" class="form-control" id="deptname" name="deptname" readonly="readonly">
                        </div>

                        <div class="form-group">
                            <label for="select_grade" class="col-form-label">成绩:</label>
                            <select id="select_grade" name="select_grade">
                                <option value="" selected="selected">--请选择--</option>
                                <option value="4.0">4.0</option>
                                <option value="3.7">3.7</option>
                                <option value="3.4">3.4</option>
                                <option value="3.0">3.0</option>
                                <option value="2.7">2.7</option>
                                <option value="2.4">2.4</option>
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

    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>

    <!-- 用于弹窗、提示、下拉菜单，包含了 popper.min.js -->
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>

    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var ID = button.data('checkid') // Extract info from data-* attributes
            var name = button.data('name')
            var dept_name = button.data('deptname')
            var grade = button.data('grade')

            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-title').text('修改成绩:'+name)
            modal.find('#ID').val(ID)
            modal.find('#name').val(name)
            modal.find('#deptname').val(dept_name)
            modal.find('#select_grade').val(grade)

        })

        $("#changeBtn").click(function () {
            if ($("#select_grade").val()==''){
                alert("请选择成绩。");
                return;
            }
            $("#form_change").submit();
        })
    </script>
</body>
</html>
