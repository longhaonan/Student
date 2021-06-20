package entity;

public class Instructor {
    private String I_ID;
    private String password;
    private String I_name;
    private String dept_name;

    public String getI_ID() {
        return I_ID;
    }

    public void setI_ID(String i_ID) {
        I_ID = i_ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getI_name() {
        return I_name;
    }

    public void setI_name(String i_name) {
        I_name = i_name;
    }

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }
}
