package Servlet;


import Service.QueryCourseService;
import entity.MessageModel;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/QueryCourse")
public class QueryCourseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String method = req.getParameter("method");
        if ("query".equals(method)) this.query(req,resp);
        else if ("add".equals(method)) this.add(req,resp);
        else if ("result".equals(method)) this.result(req,resp);
        else if ("delete".equals(method)) this.delete(req,resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String coursename = req.getParameter("coursename");
        if (coursename == "") {
            req.getSession().setAttribute("coursename",coursename);
            this.query(req,resp);
        }
        else {
            req.getSession().removeAttribute("coursename");
            req.getSession().removeAttribute("course_section");
            MessageModel messageModel = QueryCourseService.QCBYID(coursename);
            req.getSession().setAttribute("coursename",coursename);
            req.getSession().setAttribute("course_section", messageModel.getObject());
            resp.sendRedirect("main3.jsp");
        }
    }

    protected void query(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        MessageModel messageModel = QueryCourseService.QC();
        req.getSession().removeAttribute("coursename");
        req.getSession().setAttribute("course_section", messageModel.getObject());
        resp.sendRedirect("main3.jsp");
    }
// 添加选课
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        User u= (User)req.getSession().getAttribute("user");
        String ID = u.getID();
        String course_id = req.getParameter("course_id");
        String sec_id = req.getParameter("sec_id");
        String semester = req.getParameter("semester");
        String year = req.getParameter("year");
        String time_slot_id = req.getParameter("time_slot_id");

        MessageModel messageModel = QueryCourseService.QCBYTIME(ID,time_slot_id);
        if (messageModel.getCode()==0){// 该时段已有课程
            resp.sendRedirect("main3.jsp?error=yes");
        }else{// 该时段没有课程
            // 添加选课
            QueryCourseService.add_course(ID, course_id, sec_id, semester, year);
            // 选课成功 刷新页面
            MessageModel course_section = QueryCourseService.QC();
            req.getSession().removeAttribute("coursename");
            req.getSession().setAttribute("course_section", course_section.getObject());
            resp.sendRedirect("main3.jsp?error=no");
        }


    }

    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        User u= (User)req.getSession().getAttribute("user");
        String ID = u.getID();
        String course_id = req.getParameter("course_id");
        String sec_id = req.getParameter("sec_id");
        String semester = req.getParameter("semester");
        String year = req.getParameter("year");
        System.out.println(course_id);
        System.out.println(sec_id);

        QueryCourseService.delete_course(ID, course_id, sec_id, semester, year);
        this.result(req,resp);


    }

    protected void result(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        User u= (User)req.getSession().getAttribute("user");
        String ID = u.getID();
        MessageModel messageModel = QueryCourseService.QCR(ID);

        req.getSession().setAttribute("section_result", messageModel.getObject());
        resp.sendRedirect("main4.jsp");
    }

}
