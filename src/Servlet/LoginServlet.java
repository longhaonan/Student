package Servlet;


import Service.LoginService;
import Service.ManagerService;
import entity.MessageModel;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String identity = req.getParameter("identity");
        System.out.println("name:"+id);
        System.out.println("password:"+password);
        System.out.println("identity:"+identity);

        MessageModel messageModel = LoginService.login(id, password, identity);

        if (messageModel.getCode() == 1){// 登录成功
            if (identity.equals("student")){
                req.getSession().setAttribute("user", messageModel.getObject());
                resp.sendRedirect("index.jsp");
            }
            else if (identity.equals("professor")){
                req.getSession().setAttribute("instructor",messageModel.getObject());
                resp.sendRedirect("index01.jsp");
            }
            else if (identity.equals("manager")){
                MessageModel department = LoginService.dept();
                MessageModel instructor = ManagerService.showInstructor();
                MessageModel course = ManagerService.showCourse();
                req.getSession().setAttribute("showCourse",course.getObject());
                req.getSession().setAttribute("showinstructor",instructor.getObject());
                req.getSession().setAttribute("department",department.getObject());
                req.getSession().setAttribute("manager",messageModel.getObject());
                resp.sendRedirect("index02.jsp");
            }

        }else{// 登录失败
            req.setAttribute("messageModel", messageModel);
            req.getRequestDispatcher("login.jsp").forward(req,resp);
        }


        //else if (identity.equals("professor")){

        //}
        //else{

        //}
        //根据用户名查询数据库，如果没有，说明用户不存在
        //如果查询到了，验证密码，密码错误，返回错误提示
        //密码正确，跳转到主页

    }
}
