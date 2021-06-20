package entity;

public class User {
    private String ID;
    private String password;
    private String name;
    private String dept_name;
    private Integer tot_cred;
    private Double GPA;

    public String getDept_name() {
        return dept_name;
    }

    public void setDept_name(String dept_name) {
        this.dept_name = dept_name;
    }

    public Integer getTot_cred() {
        return tot_cred;
    }

    public void setTot_cred(Integer tot_cred) {
        this.tot_cred = tot_cred;
    }

    public Double getGPA() {
        return GPA;
    }

    public void setGPA(Double GPA) {
        this.GPA = GPA;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
