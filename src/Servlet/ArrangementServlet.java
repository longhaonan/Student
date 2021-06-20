package Servlet;

import Service.ArrangementService;
import Service.ManagerService;
import Service.QueryCourseService;
import com.mysql.cj.util.DnsSrv;
import entity.MessageModel;
import entity.Section;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.xpath.XPath;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/Arrangement")
public class ArrangementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if ("query".equals(method)) this.query(req,resp);
        else if ("deleteS".equals(method)) this.deleteS(req,resp);
        else if ("classroom".equals(method)) this.QClassroom1(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String method = req.getParameter("method");
        if ("QC".equals(method)) this.QC(req,resp);
        else if ("SC".equals(method)) this.SC(req,resp);
        else if ("Sadd".equals(method)) this.Sadd(req,resp);
        else if ("classroom".equals(method)) this.QClassroom2(req,resp);
    }

    protected void query(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        MessageModel messageModel = QueryCourseService.QC();
        MessageModel showcourse = ManagerService.showCourse();
        MessageModel showinstructor = ManagerService.showInstructor();
        req.getSession().removeAttribute("coursename");
        req.getSession().setAttribute("showCourse",showcourse.getObject());
        req.getSession().setAttribute("showinstructor",showinstructor.getObject());
        req.getSession().setAttribute("course_section", messageModel.getObject());
        resp.sendRedirect("m_main4.jsp");
    }

    protected void deleteS(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String course_id = req.getParameter("course_id");
        String sec_id = req.getParameter("sec_id");


        ArrangementService.deleteS(course_id,sec_id);
        this.query(req, resp);

    }

    protected void QC(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
            resp.sendRedirect("m_main4.jsp");
        }
    }

    protected void SC(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Section section = new Section();
        section.setCourse_id(req.getParameter("ID"));
        section.setTitle(req.getParameter("title"));
        section.setSec_id(req.getParameter("sec_id"));
        section.setI_ID(req.getParameter("i_id"));
        section.setBuilding(req.getParameter("building"));
        section.setRoom_number(req.getParameter("room_number"));
        section.setTime_slot_id(Integer.valueOf(req.getParameter("time")));
        String coursename = (String) req.getSession().getAttribute("coursename");

        MessageModel confirm = ArrangementService.confirm(section);
        String msg = URLEncoder.encode(confirm.getMsg(), "UTF-8");

        if(confirm.getCode()==0){
            resp.sendRedirect("m_main4.jsp?error=yes&msg=" + msg);
            return;
        }
        MessageModel messageModel = QueryCourseService.QCBYID(coursename);

        req.getSession().setAttribute("course_section", messageModel.getObject());
        resp.sendRedirect("m_main4.jsp?error=no&msg=" + msg);
    }

    protected void Sadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Section section = new Section();
        section.setCourse_id(req.getParameter("ID_add"));
        section.setSec_id(req.getParameter("sec_id_add"));
        section.setI_ID(req.getParameter("i_id_add"));
        section.setBuilding(req.getParameter("building_add"));
        section.setRoom_number(req.getParameter("room_number_add"));
        section.setTime_slot_id(Integer.valueOf(req.getParameter("time_add")));

        MessageModel confirm = ArrangementService.confirm_add(section);
        String msg = URLEncoder.encode(confirm.getMsg(), "UTF-8");
        req.getSession().removeAttribute("coursename");
        if(confirm.getCode()==0){
            resp.sendRedirect("m_main4.jsp?error=yes&msg=" + msg);
            return;
        }
        MessageModel messageModel = QueryCourseService.QC();

        req.getSession().setAttribute("course_section", messageModel.getObject());
        resp.sendRedirect("m_main4.jsp?error=no&msg=" + msg);
    }

    protected void QClassroom1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        MessageModel messageModel = ArrangementService.QClassroom("一教A", "101");
        req.getSession().setAttribute("ClassArrange",messageModel.getObject());
        resp.sendRedirect("m_main5.jsp");
    }

    protected void QClassroom2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String building = req.getParameter("building");
        String room_number = req.getParameter("room_number");

        MessageModel messageModel = ArrangementService.QClassroom(building, room_number);
        req.getSession().setAttribute("ClassArrange",messageModel.getObject());
        resp.sendRedirect("m_main5.jsp");
    }
}
