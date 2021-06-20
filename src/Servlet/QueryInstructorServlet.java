package Servlet;

import Service.InstructorService;
import Service.LoginService;
import Service.QueryTimetableService;
import entity.Instructor;
import entity.MessageModel;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/QueryInstructor")
public class QueryInstructorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if ("course".equals(method)) this.queryCourse(req,resp);
        else if ("check".equals(method)) this.queryCheck(req,resp);
        else if ("TT".equals(method)) this.TT(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String info = req.getParameter("info");
        String grade = req.getParameter("select_grade");
        String ID = req.getParameter("ID");

        InstructorService.update(ID,info,grade);
        String[] timeArray = info.split("-");

        req.getSession().removeAttribute("info");
        req.getSession().setAttribute("info",info);

        MessageModel messageModel = InstructorService.queryBYCheck(timeArray[1],timeArray[2],timeArray[3],timeArray[4]);

        req.getSession().setAttribute("check_result",messageModel.getObject());
        resp.sendRedirect("i_main2.jsp");
    }

    protected void queryCourse(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Instructor inst = (Instructor) req.getSession().getAttribute("instructor");
        String I_ID = inst.getI_ID();
        MessageModel messageModel = InstructorService.queryBYID(I_ID);

        req.getSession().setAttribute("course",messageModel.getObject());
        resp.sendRedirect("i_main1.jsp");
    }

    protected void queryCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String course_id= req.getParameter("course_id");
        String title = req.getParameter("title");
        String sec_id = req.getParameter("sec_id");
        String year = req.getParameter("year");
        String semester = req.getParameter("semester");

        String info = title + "-" + course_id + "-" + sec_id + "-" + year + "-" + semester;
        req.getSession().removeAttribute("info");
        req.getSession().setAttribute("info",info);

        MessageModel messageModel = InstructorService.queryBYCheck(course_id,sec_id,year,semester);

        req.getSession().setAttribute("check_result",messageModel.getObject());
        resp.sendRedirect("i_main2.jsp");
    }

    protected void TT(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("timetable");
        Instructor ins = (Instructor) req.getSession().getAttribute("instructor");

        String ID = ins.getI_ID();

        MessageModel messageModel = InstructorService.QTT(ID);

        req.getSession().setAttribute("timetable", messageModel.getObject());
        resp.sendRedirect("i_main3.jsp");
    }
}
