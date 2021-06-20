package Service;

import Util.GetSqlSession;
import entity.*;
import mapper.SectionMapper;
import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ManagerService {
    public static MessageModel showStudent() {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<User> students = userMapper.showStudent();

        messageModel.setObject(students);
        return messageModel;
    }

    public static MessageModel showStudentBYname(String name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<User> students = userMapper.showStudentBYname(name);

        messageModel.setObject(students);
        return messageModel;
    }

    public static MessageModel showInstructor() {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<Instructor> instructors = userMapper.showInstructor();

        messageModel.setObject(instructors);
        return messageModel;
    }

    public static MessageModel showInstructorBYname(String name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<Instructor> instructors = userMapper.showInstructorBYname(name);

        messageModel.setObject(instructors);
        return messageModel;
    }

    public static MessageModel showCourse() {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<MCourse> courses = userMapper.showCourse();

        messageModel.setObject(courses);
        return messageModel;
    }

    public static MessageModel showCourseBYname(String name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<MCourse> courses = userMapper.showCourseBYname(name);

        messageModel.setObject(courses);
        return messageModel;
    }

    public static void updateStudent(String ID, String pwd, String name, String dept_name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        UserMapper.updateStudent(ID,pwd,name,dept_name);

        session.commit();
        session.close();
    }

    public static void addStudent(String ID, String pwd, String name, String dept_name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        UserMapper.addStudent(ID,pwd,name,dept_name);

        session.commit();
        session.close();
    }
    // 删除学生
    public static void deleteS(String ID){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        userMapper.deleteS(ID);
        session.commit();
        session.close();
    }

    public static void updateInstructor(String ID, String pwd, String name, String dept_name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        UserMapper.updateInstructor(ID,pwd,name,dept_name);

        session.commit();
        session.close();
    }

    public static void addInstructor(String ID, String pwd, String name, String dept_name) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        UserMapper.addInstructor(ID,pwd,name,dept_name);

        session.commit();
        session.close();
    }

    public static void deleteI(String ID){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        userMapper.deleteI(ID);
        session.commit();
        session.close();
    }

    public static void updateCourse(String ID, String title, String dept_name, String credits) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        UserMapper.updateCourse(ID,title,dept_name,credits);

        session.commit();
        session.close();
    }

    public static void addCourse(String ID, String title, String dept_name, String credits) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        // 调用dao层的查询方法
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        UserMapper.addCourse(ID,title,dept_name,credits);

        session.commit();
        session.close();
    }

    public static void deleteC(String ID){
        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        userMapper.deleteC(ID);
        session.commit();
        session.close();
    }
    // 删除确认函数
    public static MessageModel confirm(String ID, String identity){
        MessageModel messageModel = new MessageModel();

        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper UserMapper = session.getMapper(UserMapper.class);

        if ("student".equals(identity)){
            User user = UserMapper.queryStudent(ID);
            messageModel.setObject(user);
            if (user!=null){
                messageModel.setCode(0);
                messageModel.setMsg("学号已存在！");
            }
        }
        else if ("instructor".equals(identity)){
            Instructor instructor = UserMapper.queryProfessor(ID);
            messageModel.setObject(instructor);
            if (instructor!=null){
                messageModel.setCode(0);
                messageModel.setMsg("教工号已存在！");
            }
        }
        else if ("course".equals(identity)){
            MCourse course = UserMapper.queryMCourse(ID);
            messageModel.setObject(course);
            if (course!=null){
                messageModel.setCode(0);
                messageModel.setMsg("课程号已存在！");
            }
        }

        return messageModel;
    }
}
