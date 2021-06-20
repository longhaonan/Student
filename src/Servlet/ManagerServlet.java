package Servlet;

import Service.ManagerService;
import Service.QueryCourseService;
import entity.MessageModel;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/Manager")
public class ManagerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if ("student".equals(method)) this.Mstudent(req,resp);
        else if ("instructor".equals(method)) this.Minstructor(req,resp);
        else if ("course".equals(method)) this.Mcourse(req,resp);
        else if ("deleteS".equals(method)) this.Msdelete(req,resp);
        else if ("deleteI".equals(method)) this.Midelete(req,resp);
        else if ("deleteC".equals(method)) this.Mcdelete(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if ("qs".equals(method)) this.Mqs(req,resp);
        else if ("sc".equals(method)) this.Msc(req,resp);
        else if ("add_s".equals(method)) this.Msadd(req,resp);
        else if ("qi".equals(method)) this.Mqi(req,resp);
        else if ("ic".equals(method)) this.Mic(req,resp);
        else if ("add_i".equals(method)) this.Miadd(req,resp);
        else if ("qc".equals(method)) this.Mqc(req,resp);
        else if ("cc".equals(method)) this.Mcc(req,resp);
        else if ("add_c".equals(method)) this.Mcadd(req,resp);
    }

    protected void Mstudent(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MessageModel messageModel = ManagerService.showStudent();
        req.getSession().removeAttribute("studentname");
        req.getSession().setAttribute("showStudent",messageModel.getObject());
        resp.sendRedirect("m_main1.jsp");
    }
    // 修改学生信息
    protected void Msc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID");
        String pwd = req.getParameter("password");
        String name = req.getParameter("name");
        String dept_name = req.getParameter("deptname");
        String studentname = (String) req.getSession().getAttribute("studentname");

        ManagerService.updateStudent(ID,pwd,name,dept_name);

        MessageModel messageModel = ManagerService.showStudentBYname(studentname);
        req.getSession().setAttribute("showStudent",messageModel.getObject());

        resp.sendRedirect("m_main1.jsp");
    }
    //添加学生
    protected void Msadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID_add");
        String pwd = req.getParameter("password_add");
        String name = req.getParameter("name_add");
        String dept_name = req.getParameter("deptname_add");
        // 确认数据库中已存在该学号
        MessageModel confirm = ManagerService.confirm(ID,"student");
        req.getSession().removeAttribute("studentname");
        if (confirm.getCode()==0){
            resp.sendRedirect("m_main1.jsp?error=yes");
        }else {
            ManagerService.addStudent(ID,pwd,name,dept_name);

            MessageModel messageModel = ManagerService.showStudent();
            req.getSession().setAttribute("showStudent",messageModel.getObject());
            resp.sendRedirect("m_main1.jsp?error=no");
        }
    }
    // 删除学生
    protected void Msdelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        String ID = req.getParameter("ID");

        ManagerService.deleteS(ID);
        MessageModel messageModel = ManagerService.showStudent();
        req.getSession().removeAttribute("studentname");
        req.getSession().setAttribute("showStudent",messageModel.getObject());
        resp.sendRedirect("m_main1.jsp");


    }
    // 显示教师数据
    protected void Minstructor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MessageModel messageModel = ManagerService.showInstructor();
        req.getSession().removeAttribute("instructorname");
        req.getSession().setAttribute("showinstructor",messageModel.getObject());
        resp.sendRedirect("m_main2.jsp");
    }
    // 修改教师信息
    protected void Mic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID");
        String pwd = req.getParameter("password");
        String name = req.getParameter("name");
        String dept_name = req.getParameter("deptname");
        String instructorname = (String) req.getSession().getAttribute("instructorname");

        ManagerService.updateInstructor(ID,pwd,name,dept_name);

        MessageModel messageModel = ManagerService.showInstructorBYname(instructorname);

        req.getSession().setAttribute("showinstructor",messageModel.getObject());
        resp.sendRedirect("m_main2.jsp");
    }
    // 添加教师
    protected void Miadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID_add");
        String pwd = req.getParameter("password_add");
        String name = req.getParameter("name_add");
        String dept_name = req.getParameter("deptname_add");
        // 确认数据库中已存在该学号
        MessageModel confirm = ManagerService.confirm(ID,"instructor");
        req.getSession().removeAttribute("instructorname");
        if (confirm.getCode()==0){
            resp.sendRedirect("m_main2.jsp?error=yes");
        }else {
            ManagerService.addInstructor(ID,pwd,name,dept_name);

            MessageModel messageModel = ManagerService.showInstructor();
            req.getSession().setAttribute("showinstructor",messageModel.getObject());
            resp.sendRedirect("m_main2.jsp?error=no");
        }
    }
    // 删除教师
    protected void Midelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        String ID = req.getParameter("ID");

        ManagerService.deleteI(ID);
        MessageModel messageModel = ManagerService.showInstructor();
        req.getSession().removeAttribute("instructorname");
        req.getSession().setAttribute("showinstructor",messageModel.getObject());
        resp.sendRedirect("m_main2.jsp");


    }
    // 显示课程信息
    protected void Mcourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MessageModel messageModel = ManagerService.showCourse();
        req.getSession().removeAttribute("coursename");
        req.getSession().setAttribute("showCourse",messageModel.getObject());
        resp.sendRedirect("m_main3.jsp");
    }
    // 修改课程信息
    protected void Mcc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID");
        String title = req.getParameter("title");
        String credits = req.getParameter("credits");
        String dept_name = req.getParameter("deptname");
        String coursename = (String) req.getSession().getAttribute("coursename");
        ManagerService.updateCourse(ID,title,dept_name,credits);

        MessageModel messageModel = ManagerService.showCourseBYname(coursename);

        req.getSession().setAttribute("showCourse",messageModel.getObject());
        resp.sendRedirect("m_main3.jsp");
    }
    // 添加课程
    protected void Mcadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String ID = req.getParameter("ID_add");
        String title = req.getParameter("title_add");
        String credits = req.getParameter("credits_add");
        String dept_name = req.getParameter("deptname_add");
        // 确认数据库中已存在该学号
        MessageModel confirm = ManagerService.confirm(ID,"course");
        req.getSession().removeAttribute("coursename");
        if (confirm.getCode()==0){
            resp.sendRedirect("m_main3.jsp?error=yes");
        }else {
            ManagerService.addCourse(ID,title,dept_name,credits);

            MessageModel messageModel = ManagerService.showCourse();
            req.getSession().setAttribute("showCourse",messageModel.getObject());
            resp.sendRedirect("m_main3.jsp?error=no");
        }
    }
    // 删除课程
    protected void Mcdelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        String ID = req.getParameter("ID");

        ManagerService.deleteC(ID);
        MessageModel messageModel = ManagerService.showCourse();
        req.getSession().removeAttribute("coursename");
        req.getSession().setAttribute("showCourse",messageModel.getObject());
        resp.sendRedirect("m_main3.jsp");


    }
    // 通过学生姓名查询
    protected void Mqs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String studentname = req.getParameter("studentname");
        if (studentname == "") {
            req.getSession().setAttribute("studentname",studentname);
            this.Mstudent(req,resp);
        }
        else {
            req.getSession().removeAttribute("studentname");
            req.getSession().removeAttribute("showStudent");
            MessageModel messageModel = ManagerService.showStudentBYname(studentname);
            req.getSession().setAttribute("showStudent",messageModel.getObject());
            req.getSession().setAttribute("studentname",studentname);
            resp.sendRedirect("m_main1.jsp");

        }
    }
// 通过教师姓名查找教师
    protected void Mqi(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("instructorname");
        if (name == "") {
            req.getSession().setAttribute("instructorname",name);
            this.Minstructor(req,resp);
        }
        else {
            req.getSession().removeAttribute("instructorname");
            req.getSession().removeAttribute("showinstructor");
            MessageModel messageModel = ManagerService.showInstructorBYname(name);
            req.getSession().setAttribute("showinstructor",messageModel.getObject());
            req.getSession().setAttribute("instructorname",name);
            resp.sendRedirect("m_main2.jsp");

        }
    }

    protected void Mqc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("coursename");
        if (name == "") {
            req.getSession().setAttribute("coursename",name);
            this.Mcourse(req,resp);
        }
        else {
            req.getSession().removeAttribute("coursename");
            req.getSession().removeAttribute("showCourse");
            MessageModel messageModel = ManagerService.showCourseBYname(name);
            req.getSession().setAttribute("showCourse",messageModel.getObject());
            req.getSession().setAttribute("coursename",name);
            resp.sendRedirect("m_main3.jsp");

        }
    }


}
