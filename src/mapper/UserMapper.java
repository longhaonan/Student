package mapper;
import entity.*;

import java.util.List;

public interface UserMapper {
    public User queryStudent(String ID);

    public Instructor queryProfessor(String ID);

    public Manager queryManager(String ID);

    public MCourse queryMCourse(String ID);

    public List<User> showStudent();

    public List<User> showStudentBYname(String name);

    public void updateStudent(String ID, String pwd, String name, String dept_name);

    public void addStudent(String ID, String pwd, String name, String dept_name);

    public void deleteS(String ID);

    public List<Instructor> showInstructor();

    public List<Instructor> showInstructorBYname(String name);

    public void updateInstructor(String ID, String pwd, String name, String dept_name);

    public void addInstructor(String ID, String pwd, String name, String dept_name);

    public void deleteI(String ID);

    public List<MCourse> showCourse();

    public List<MCourse> showCourseBYname(String name);

    public void updateCourse(String ID, String title, String dept_name, String credits);

    public void addCourse(String ID, String title, String dept_name, String credits);

    public void deleteC(String ID);


    public List<Department> queryDept();
}
