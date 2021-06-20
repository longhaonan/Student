package Service;

import Util.GetSqlSession;
import entity.*;
import mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;


public class LoginService {

    public static MessageModel login(String ID, String password, String identity) {

        MessageModel messageModel = new MessageModel();
        // 回显数据

        if (identity.equals("student")){
            User u = new User();
            u.setID(ID);
            u.setPassword(password);
            messageModel.setObject(u);

            // 调用dao层的查询方法，通过用户名查询用户对象
            SqlSession session = GetSqlSession.createSqlSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            User user = null;

            user = userMapper.queryStudent(ID);
            //判断用户对象是否为空
            if (user == null){
                messageModel.setCode(0);
                messageModel.setMsg("账号不存在！");
                return messageModel;
            }
            // 验证密码
            if (!password.equals(user.getPassword())){
                messageModel.setCode(0);
                messageModel.setMsg("密码错误！");
                return messageModel;
            }

            messageModel.setObject(user);
            return messageModel;
        }

        else if (identity.equals("professor")){
            Instructor i_u = new Instructor();
            i_u.setI_ID(ID);
            i_u.setPassword(password);
            messageModel.setObject(i_u);

            // 调用dao层的查询方法，通过用户名查询用户对象
            SqlSession session = GetSqlSession.createSqlSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            Instructor instructor = null;
            instructor = userMapper.queryProfessor(ID);
            //判断用户对象是否为空
            if (instructor == null){
                messageModel.setCode(0);
                messageModel.setMsg("账号不存在！");
                return messageModel;
            }
            // 验证密码
            if (!password.equals(instructor.getPassword())){
                messageModel.setCode(0);
                messageModel.setMsg("密码错误！");
                return messageModel;
            }

            messageModel.setObject(instructor);
            return messageModel;
        }

        else if (identity.equals("manager")){
            Manager admin = new Manager();
            admin.setM_id(ID);
            admin.setPassword(password);
            messageModel.setObject(admin);

            // 调用dao层的查询方法，通过用户名查询用户对象
            SqlSession session = GetSqlSession.createSqlSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            Manager manager = null;
            manager = userMapper.queryManager(ID);
            //判断用户对象是否为空
            if (manager == null){
                messageModel.setCode(0);
                messageModel.setMsg("账号不存在！");
                return messageModel;
            }
            // 验证密码
            if (!password.equals(manager.getPassword())){
                messageModel.setCode(0);
                messageModel.setMsg("密码错误！");
                return messageModel;
            }

            messageModel.setObject(manager);
            return messageModel;
        }

        messageModel.setCode(0);
        messageModel.setMsg("未知错误！");
        return messageModel;
    }

    public static MessageModel dept(){
        MessageModel messageModel = new MessageModel();

        SqlSession session = GetSqlSession.createSqlSession();
        UserMapper userMapper = session.getMapper(UserMapper.class);

        List<Department> departments = userMapper.queryDept();
        messageModel.setObject(departments);
        return messageModel;

    }
}
